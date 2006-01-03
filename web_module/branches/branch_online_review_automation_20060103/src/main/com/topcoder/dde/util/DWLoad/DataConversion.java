package com.topcoder.dde.util.DWLoad;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.util.idgenerator.sql.SimpleDataSource;
import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Hashtable;

/**
 * Created by IntelliJ IDEA.
 * User: rfairfax
 * Date: Feb 16, 2004
 * Time: 2:31:06 PM
 * To change this template use File | Settings | File Templates.
 */
public class DataConversion {
    private static String sDriverName = "com.informix.jdbc.IfxDriver";
    private static String sourceDBURL = "";
    private static String targetDBURL = "";
    private static StringBuffer sErrorMsg = new StringBuffer(128);

    public static void main(String[] args) {
        if (args.length > 1 && args[0].equals("-xmlfile")) {
            runXMLLoad(args[1]);
        } else {
            Hashtable params = parseArgs(args);

            checkDriver();

            if (!doLoad(params))
                fatal_error();
        }
    }

    protected static Hashtable parseArgs(String[] args) {
        Hashtable hash = new Hashtable();
        for (int i = 0; i < args.length - 1; i += 2) {
            if (!args[i].startsWith("-")) {
                sErrorMsg.setLength(0);
                sErrorMsg.append("Argument " + (i + 1) + " (" + args[i] +
                        ") should start with a -.");
                fatal_error();
            }

            String key = args[i].substring(1);
            String value = args[i + 1];
            hash.put(key, value);
        }

        String tmp;
        tmp = (String) hash.get("driver");
        if (tmp != null) {
            sDriverName = tmp;
        }

        return hash;
    }

    private static void runXMLLoad(String xmlFileName) {
        try {
            FileInputStream f = new FileInputStream(xmlFileName);
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder dombuild = dbf.newDocumentBuilder();
            Document doc = dombuild.parse(f);

            Element root = doc.getDocumentElement();
            NodeList nl = root.getChildNodes();

            String sourceDBURL = null, targetDBURL = null;
            Node node;
            int i = 1;

            // Check to see if we have a sourceDBURL or targetDBURL prior to loadlist
            // NOTE: There is a #text node after every child node in the Document so
            // we need to skip over those to get the right children.
            if (i < nl.getLength()) {
                node = nl.item(i);
                if (node.getNodeName().equals("driver")) {
                    sDriverName = node.getFirstChild().getNodeValue();
                    i += 2;
                }
            }

            if (i < nl.getLength()) {
                node = nl.item(i);
                if (node.getNodeName().equals("sourcedb")) {
                    sourceDBURL = node.getFirstChild().getNodeValue();
                    i += 2;
                }
            }

            if (i < nl.getLength()) {
                node = nl.item(i);
                if (node.getNodeName().equals("targetdb")) {
                    targetDBURL = node.getFirstChild().getNodeValue();
                    i += 2;
                }
            }

            checkDriver();

            Hashtable params = null;

            // Build new Hashtable for this load
            params = new Hashtable();
            if (sourceDBURL != null)
                params.put("sourcedb", sourceDBURL);
            if (targetDBURL != null)
                params.put("targetdb", targetDBURL);

            //fillParams(params, n);

            if (!doLoad(params))
                fatal_error();

        } catch (Exception ex) {
            ex.printStackTrace();
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load of XML file failed:\n");
            sErrorMsg.append(ex.getMessage());
            fatal_error();
        }
    }

    private static boolean doLoad(Hashtable params) {
        Connection sourceConn;
        Connection targetConn;

        sourceDBURL = (String) params.get("sourcedb");
        targetDBURL = (String) params.get("targetdb");

        try {
            Class.forName(sDriverName);

        } catch (ClassNotFoundException e) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("DB driver load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(e.getMessage());
            return false;
        }

        try {
            sourceConn = DriverManager.getConnection(sourceDBURL);
        } catch (SQLException sqle) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Creation of source DB connection failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(sqle.getMessage());
            return false;
        }

        try {
            targetConn = DriverManager.getConnection(targetDBURL);
        } catch (SQLException sqle2) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Creation of target DB connection failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(sqle2.getMessage());
            return false;
        }

        //run load here
        try {

            //clear out project_result

            String sSQL;

            sSQL = "delete from project_result";
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            SimpleDataSource ds;

            ps = sourceConn.prepareStatement(sSQL);

            ps.execute();
            ps.close();
            ps = null;

            //data with new project creation

            //initialize IdGenerator
            if (!IdGenerator.isInitialized()) {
                try {
                    ds = new SimpleDataSource(sDriverName, sourceDBURL, null, null);

                    IdGenerator.init(new SimpleDB(), ds, "sequence_object", "name", "current_value", 9999999999L, 1, true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            sSQL = "select distinct uc.comp_vers_id, " +
                    "case when exists(select user_id from user_component_score where comp_vers_id = uc.comp_vers_id and " +
                    "   phase_id = uc.phase_id and place <> 0) then " +
                    "       (select user_id from user_component_score where comp_vers_id = uc.comp_vers_id and " +
                    "           phase_id = uc.phase_id and place = 1) " +
                    "else " +
                    "   (select user_id from user_component_score " +
                    "       where comp_vers_id = uc.comp_vers_id and phase_id = uc.phase_id " +
                    "           and score = " +
                    "           ( select max(score) from user_component_score " +
                    "           where comp_vers_id = uc.comp_vers_id and phase_id = uc.phase_id ) " +
                    ") end as winner_id, " +
                    "   case when uc.phase_id = 112 then 1 else 2 end as project_type_id, " +
                    "(select max(submission_date) from user_component_score where comp_vers_id = uc.comp_vers_id and " +
                    "   phase_id = uc.phase_id) as StartDate " +
                    "from user_component_score uc, " +
                    "comp_versions cv, " +
                    "comp_catalog cc " +
                    "where cv.comp_vers_id = uc.comp_vers_id " +
                    "and cc.component_id = cv.component_id " +
                    "and not exists(select project_id from project where comp_vers_id = uc.comp_vers_id and cur_version=1 " +
                    "and project_type_id = (case when uc.phase_id = 112 then 1 else 2 end) " +
                    "and project_stat_id in (2,4,6)) order by 4";

            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();

            while (rs.next()) {
                //create ids
                long project_id;
                long phase_instance_id;

                project_id = IdGenerator.nextId();
                phase_instance_id = IdGenerator.nextId();

                System.out.println("CREATING PROJECT: " + project_id + " PHASE: " + phase_instance_id);


                //create phase_instance
                sSQL = "insert into phase_instance (phase_inst_v_id, phase_instance_id, start_date, end_date, phase_id, project_id, modify_date, modify_user, cur_version) " +
                        "values ( 0, ?, ?, ?, 8, ?, CURRENT, 7267401, 1)";

                ps2 = sourceConn.prepareStatement(sSQL);
                ps2.setLong(1, phase_instance_id);
                ps2.setDate(2, rs.getDate("StartDate"));
                ps2.setDate(3, rs.getDate("StartDate"));
                ps2.setLong(4, project_id);

                ps2.execute();

                ps2.close();
                ps2 = null;

                //create project
                //project fields
                sSQL = "insert into project (project_v_id, project_id, comp_vers_id, phase_instance_id, winner_id, project_type_id, project_stat_id, notification_sent, modify_date, modify_user, cur_version) " +
                        " values ( 0, ?, ?, ?, ?, ?, 4, 0, CURRENT, 7267401, 1)";

                ps2 = sourceConn.prepareStatement(sSQL);
                ps2.setLong(1, project_id);
                ps2.setLong(2, rs.getLong("comp_vers_id"));
                ps2.setLong(3, phase_instance_id);
                ps2.setLong(4, rs.getLong("winner_id"));
                ps2.setLong(5, rs.getLong("project_type_id"));

                ps2.execute();
                ps2.close();
                ps2 = null;
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;

            System.out.println("PROJECT CREATION FINISHED");

            //data with existing projects first
            sSQL = "select distinct p.project_id, uc.user_id, uc.score, uc.money, uc.place, uc.rating " +
                    "from user_component_score uc, " +
                    "comp_versions cv, " +
                    "comp_catalog cc, " +
                    "project p " +
                    "where cv.comp_vers_id = uc.comp_vers_id " +
                    "and cc.component_id = cv.component_id " +
                    "and p.comp_vers_id = uc.comp_vers_id " +
                    "and p.cur_version = 1 " +
                    "and p.project_type_id = (case when uc.phase_id = 112 then 1 else 2 end) " +
                    "and p.project_stat_id in (2,4,6) " +
                    "and round(uc.comp_vers_id)||'-'||round(uc.user_id)||'-'||round(uc.phase_id) not in ( " +
                    "select round(comp_vers_id)||'-'||round(user_id)||'-'||round(phase_id) " +
                    "from user_component_score " +
                    "group by comp_vers_id, user_id, phase_id " +
                    "having count(*) > 1)";

            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();

            while (rs.next()) {
                //process
                sSQL = "insert into project_result (project_id, user_id, old_rating, new_rating, old_reliability, new_reliability, raw_score, final_score, payment, placed, rating_ind, valid_submission_ind, reliability_ind, create_date, modify_date) " +
                        "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT, CURRENT)";

                ps2 = sourceConn.prepareStatement(sSQL);
                ps2.setInt(1, rs.getInt("project_id"));
                ps2.setInt(2, rs.getInt("user_id"));
                ps2.setNull(3, Types.INTEGER);  //old_rating
                ps2.setDouble(4, rs.getDouble("rating"));
                ps2.setNull(5, Types.INTEGER); //old_reliability
                ps2.setNull(6, Types.INTEGER); //new_reliability
                ps2.setNull(7, Types.DECIMAL); //raw_score
                ps2.setDouble(8, rs.getDouble("score"));
                ps2.setDouble(9, rs.getDouble("money"));
                ps2.setInt(10, rs.getInt("place"));
                ps2.setInt(11, 1);
                ps2.setInt(12, 1);
                ps2.setInt(13, 0);

                ps2.execute();
                ps2.close();
                ps2 = null;
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;

            ds = null;

        } catch (SQLException e) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("DB Error: ");
            sErrorMsg.append(e.getMessage());
            return false;
        } finally {
            //close connections
            try {
                sourceConn.close();
            } catch (SQLException e) {
                sErrorMsg.setLength(0);
                sErrorMsg.append("Closing source DB connection failed. ");
                sErrorMsg.append("Cannot continue.\n");
                sErrorMsg.append(e.getMessage());
                return false;
            }
            try {
                targetConn.close();
            } catch (SQLException e) {
                sErrorMsg.setLength(0);
                sErrorMsg.append("Closing target DB connection failed. ");
                sErrorMsg.append("Cannot continue.\n");
                sErrorMsg.append(e.getMessage());
                return false;
            }
        }


        return true;
    }

    private static void fillParams(Hashtable params, Node n) throws Exception {
        NodeList nl = n.getChildNodes();
        Node node;
        int i = 1;

        // Check to see if we have a sourceDBURL or targetDBURL prior to loadlist.
        // Again, we need to skip over the #text nodes to get to the right children
        if (i < nl.getLength()) {
            node = nl.item(i);
            if (node.getNodeName().equals("sourcedb")) {
                params.put("sourcedb", node.getFirstChild().getNodeValue());
                i += 2;
            }
        }

        if (i < nl.getLength()) {
            node = nl.item(i);
            if (node.getNodeName().equals("targetdb")) {
                params.put("targetdb", node.getFirstChild().getNodeValue());
                i += 2;
            }
        }

        if (i < nl.getLength()) {
            node = nl.item(i);
            if (node.getNodeName().equals("classname")) {
                params.put("load", node.getFirstChild().getNodeValue());
                i += 2;
            }
        }

        if (i < nl.getLength()) {
            node = nl.item(i);
            if (node.getNodeName().equals("parameterList")) {
                NodeList nl2 = node.getChildNodes();
                for (int j = 1; j < nl2.getLength(); j += 2) {
                    Node n2 = nl2.item(j);
                    NamedNodeMap nnm = n2.getAttributes();
                    params.put(nnm.getNamedItem("name").getNodeValue(),
                            nnm.getNamedItem("value").getNodeValue());
                }
            }
        }
    }

    private static void checkDriver() {
        try {
            Class.forName(sDriverName);
        } catch (Exception ex) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Unable to load driver ");
            sErrorMsg.append(sDriverName);
            sErrorMsg.append(". Cannot continue.");
            fatal_error();
        }
    }

    private static void fatal_error() {
        System.out.println("*******************************************");
        System.out.println("FAILURE: " + sErrorMsg.toString());
        System.out.println("*******************************************");
        System.exit(-1);
    }
}
