
import java.lang.*;
import java.util.*;
import java.sql.*;
import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.FileInputStream;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Date;
/**
 * Created by IntelliJ IDEA.
 * User: rfairfax
 * Date: Feb 16, 2004
 * Time: 2:31:06 PM
 * To change this template use File | Settings | File Templates.
 */
public class DWLoad {
    private static String sDriverName = "com.informix.jdbc.IfxDriver";
    private static String sourceDBURL = "";
    private static String targetDBURL = "";
    private static StringBuffer sErrorMsg = new StringBuffer(128);

    public static void main(String[] args) {
        // First, parse the argument list and come up with a Hashtable of
        // arguments to this load. The only required argument is -load
        // "classname" which specifies which load to run. If we have a
        // -xmlfile argument as the first argument, we have been given an
        // XML file to load which specifies which loads to run and their
        // parameters. So, we need to parse that appropriately. Otherwise,
        // we do a normal, single load
        if (args.length > 1 && args[0].equals("-xmlfile")) {
            runXMLLoad(args[1]);
        } else {
            Hashtable params = parseArgs(args);

            checkDriver();

            if(!doLoad(params))
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
            for (; i < nl.getLength(); i += 2) {
                Node n = nl.item(i);

                // Build new Hashtable for this load
                params = new Hashtable();
                if (sourceDBURL != null)
                    params.put("sourcedb", sourceDBURL);
                if (targetDBURL != null)
                    params.put("targetdb", targetDBURL);

                fillParams(params, n);

                if(!doLoad(params))
                    fatal_error();
            }
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

        sourceDBURL = (String)params.get("sourcedb");
        targetDBURL = (String)params.get("targetdb");

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
            java.sql.Timestamp dtMin;
            Statement s;
            ResultSet rs;
            ResultSet targetrs;
            PreparedStatement ps;
            PreparedStatement targetps;
            Statement targets;

            targets = targetConn.createStatement();
            //component score results first
            targetrs = targets.executeQuery("select timestamp from update_log where log_id = \n" +
                    "(select max(log_id) from update_log where log_type_id = 4)");
            if(targetrs.next())
            {
                 dtMin = targetrs.getTimestamp("timestamp") ;
            }
            else
            {
                 dtMin = null;
            }

            targets.close();
            targets = null;
            targetrs.close();
            targetrs = null;

            String sSQL = "";

            sSQL = "select user_component_score_id, user_id,\n" +
                    "level_id, s.comp_vers_id, s.phase_id, score, processed,\n" +
                    "money,rating,submission_date,place,component_name, cv.component_id, s.mod_date_time from user_component_score s, comp_versions cv, comp_catalog c\n" +
                    "where cv.comp_vers_id = s.comp_vers_id and c.component_id = cv.component_id ";

            if(dtMin != null)
            {
                sSQL += " and mod_date_time > ?";
            }
            ps = sourceConn.prepareStatement(sSQL);
            if(dtMin != null)
            {
                ps.setTimestamp(1,dtMin);
            }

            rs = ps.executeQuery();
            while(rs.next())
            {
                //check if record exists in target db
                targets = targetConn.createStatement();
                targetrs = targets.executeQuery("SELECT user_component_score_id FROM user_component_score WHERE user_component_score_id = " + rs.getObject("user_component_score_id"));
                if(targetrs.next())
                {
                    //update
                    sSQL = "";
                    sSQL = "update user_component_score set user_component_score_id = ? ,user_id = ? ,\n" +
                            "level_id = ? ,comp_vers_id = ? ,phase_id = ? ,score = ?, processed = ?,\n" +
                            "money = ?,rating = ? ,submission_date = ? ,place = ? ,component_name = ? ,component_id = ? ,mod_date_time = ? where user_component_score_id = " + rs.getObject("user_component_score_id");
                    targetps = targetConn.prepareStatement(sSQL);
                    targetps.setObject(1,rs.getObject("user_component_score_id"));
                    targetps.setObject(2,rs.getObject("user_id"));
                    targetps.setObject(3,rs.getObject("level_id"));
                    targetps.setObject(4,rs.getObject("comp_vers_id"));
                    targetps.setObject(5,rs.getObject("phase_id"));
                    targetps.setObject(6,rs.getObject("score"));
                    targetps.setObject(7,rs.getObject("processed"));
                    targetps.setObject(8,rs.getObject("money"));
                    targetps.setObject(9,rs.getObject("rating"));
                    targetps.setObject(10,rs.getObject("submission_date"));
                    targetps.setObject(11,rs.getObject("place"));
                    targetps.setObject(12,rs.getObject("component_name"));
                    targetps.setObject(13,rs.getObject("component_id"));
                    targetps.setObject(14,rs.getObject("mod_date_time"));

                    targetps.executeUpdate();
                    targetps = null;

                }
                else
                {
                    //insert
                    sSQL = "";
                    sSQL = "insert into user_component_Score( user_component_score_id, user_id,\n" +
                            "level_id, comp_vers_id, phase_id, score, processed,\n" +
                            "money,rating,submission_date,place,component_name, component_id, mod_date_time) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    targetps = targetConn.prepareStatement(sSQL);
                    targetps.setObject(1,rs.getObject("user_component_score_id"));
                    targetps.setObject(2,rs.getObject("user_id"));
                    targetps.setObject(3,rs.getObject("level_id"));
                    targetps.setObject(4,rs.getObject("comp_vers_id"));
                    targetps.setObject(5,rs.getObject("phase_id"));
                    targetps.setObject(6,rs.getObject("score"));
                    targetps.setObject(7,rs.getObject("processed"));
                    targetps.setObject(8,rs.getObject("money"));
                    targetps.setObject(9,rs.getObject("rating"));
                    targetps.setObject(10,rs.getObject("submission_date"));
                    targetps.setObject(11,rs.getObject("place"));
                    targetps.setObject(12,rs.getObject("component_name"));
                    targetps.setObject(13,rs.getObject("component_id"));
                    targetps.setObject(14,rs.getObject("mod_date_time"));

                    targetps.executeUpdate();
                    targetps = null;
                }
                targets.close();
                targetrs.close();
                targetrs = null;
                targets = null;

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;

            //update user ratings

            sSQL = "";

            sSQL = "select user_id,rating,phase_id,vol,num_ratings,rating_no_vol, last_component_rated, mod_date_time from user_rating ";

            if(dtMin != null)
            {
                sSQL += " where mod_date_time > ?";
            }
            ps = sourceConn.prepareStatement(sSQL);
            if(dtMin != null)
            {
                ps.setTimestamp(1,dtMin);
            }

            rs = ps.executeQuery();
            while(rs.next())
            {
                //check if record exists in target db
                targets = targetConn.createStatement();
                targetrs = targets.executeQuery("SELECT user_id FROM user_rating WHERE user_id = " + rs.getObject("user_id") + " and phase_id = " + rs.getObject("phase_id"));
                if(targetrs.next())
                {
                    //update
                    sSQL = "";
                    sSQL = "update user_rating set user_id=? ,rating=? ,\n" +
                            "phase_id=? ,vol=? ,num_ratings=? ,rating_no_vol=? ,last_component_rated=? ,\n" +
                            "mod_date_time=? where user_id = " + rs.getObject("user_id") + " and phase_id = " + rs.getObject("phase_id");
                    targetps = targetConn.prepareStatement(sSQL);
                    targetps.setObject(1,rs.getObject("user_id"));
                    targetps.setObject(2,rs.getObject("rating"));
                    targetps.setObject(3,rs.getObject("phase_id"));
                    targetps.setObject(4,rs.getObject("vol"));
                    targetps.setObject(5,rs.getObject("num_ratings"));
                    targetps.setObject(6,rs.getObject("rating_no_vol"));
                    targetps.setObject(7,rs.getObject("last_component_rated"));
                    targetps.setObject(8,rs.getObject("mod_date_time"));

                    targetps.executeUpdate();
                    targetps = null;

                }
                else
                {
                    //insert
                    sSQL = "";
                    sSQL = "insert into user_rating(user_id,rating,phase_id,vol,num_ratings,rating_no_vol, last_component_rated, mod_date_time) \n" +
                            "values (?,?,?,?,?,?,?,?)";
                    targetps = targetConn.prepareStatement(sSQL);
                    targetps.setObject(1,rs.getObject("user_id"));
                    targetps.setObject(2,rs.getObject("rating"));
                    targetps.setObject(3,rs.getObject("phase_id"));
                    targetps.setObject(4,rs.getObject("vol"));
                    targetps.setObject(5,rs.getObject("num_ratings"));
                    targetps.setObject(6,rs.getObject("rating_no_vol"));
                    targetps.setObject(7,rs.getObject("last_component_rated"));
                    targetps.setObject(8,rs.getObject("mod_date_time"));

                    targetps.executeUpdate();
                    targetps = null;
                }
                targets.close();
                targetrs.close();
                targetrs = null;
                targets = null;

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;

            targetps = targetConn.prepareStatement("INSERT INTO update_log (calendar_id,timestamp,log_type_id) VALUES (0,?,4)");
            targetps.setTimestamp(1,new java.sql.Timestamp(System.currentTimeMillis()));
            targetps.execute();

            targetps = null;

        } catch (SQLException e) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("DB Error: ");
            sErrorMsg.append(e.getMessage());
            return false;
        }
        finally
        {
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
