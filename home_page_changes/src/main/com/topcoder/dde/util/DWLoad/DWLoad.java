package com.topcoder.dde.util.DWLoad;

import java.lang.*;
import java.util.*;
import java.sql.*;
import org.w3c.dom.*;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.UnknownNamespaceException;

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
    private static String sourceDBURL;
    private static String targetDBURL;
    private static StringBuffer sErrorMsg = new StringBuffer(128);
    
    public static final String DRIVER_KEY = "DriverClass";
    public static final String SOURCE_DB_KEY = "SourceDB";
    public static final String TARGET_DB_KEY = "TargetDB";
    public static Connection sourceConn;
    public static Connection targetConn;


    public static void main(String[] args) {
        //Load our configuration
        String namespace = DWLoad.class.getName();
        ConfigManager config = ConfigManager.getInstance();
        if (!config.existsNamespace(namespace)) {
            try {
                config.add(namespace, ConfigManager.CONFIG_XML_FORMAT);
            } catch (ConfigManagerException cme) {
                System.err.println("Couldn't add " + namespace.replace('.', '/') + ".xml to namespace");
                return;
            }
        } else {
            try {
                config.refresh(namespace);
            } catch (ConfigManagerException cme) {
                System.err.println("Exception while refreshing namespace: " + namespace);
                return;
            }
        }

        try {
            sDriverName = config.getString(namespace, DRIVER_KEY);
            sourceDBURL = config.getString(namespace, SOURCE_DB_KEY);
            targetDBURL = config.getString(namespace, TARGET_DB_KEY);
            
            if (sDriverName == null) {
                System.err.println("No JDBC Driver specified.  (Config param '" + DRIVER_KEY + "')");
                return;
            }
            if (sourceDBURL == null) {
                System.err.println("No Source Connection URL specified.  (Config param '" + SOURCE_DB_KEY + "')");
                return;
            }
            if (targetDBURL == null) {
                System.err.println("No Target Connection URL specified.  (Config param '" + TARGET_DB_KEY + "')");
                return;
            }
        } catch (UnknownNamespaceException e) {
            System.err.println("Initialized ConfigManager and namespace '" + namespace + "' without trouble but could not retrieve resource bundle");
            return;
        }
        
        checkDriver();
        
        int numArgs = args.length;
        
        //open connections
        try {
            Class.forName(sDriverName);

        } catch (ClassNotFoundException e) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("DB driver load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }

        try {
            sourceConn = DriverManager.getConnection(sourceDBURL);
            
            PreparedStatement ps = sourceConn.prepareStatement("set lock mode to wait 5");
            ps.execute();
            ps.close();
        } catch (SQLException sqle) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Creation of source DB connection failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(sqle.getMessage());
            fatal_error();
        }

        try {
            targetConn = DriverManager.getConnection(targetDBURL);
        } catch (SQLException sqle2) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Creation of target DB connection failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(sqle2.getMessage());
            fatal_error();
        }

        
        try
        {
            if (numArgs == 1 && args[0].equals("ALL"))
            {
                doRunAll();
            }
            else if(numArgs == 1 && args[0].equals("CONTEST"))
            {
                doLoadContests();
            }
            else if(numArgs == 1 && args[0].equals("USER_RATING"))
            {
                doLoadUserRating();
            }
            else if(numArgs == 1 && args[0].equals("USER_RELIABILITY"))
            {
                doLoadUserReliability();
            }
            else if(numArgs == 1 && args[0].equals("ROYALTY"))
            {
                doLoadRoyalty();
            }
            else if (numArgs != 1) {
                System.out.println("SYNTAX: java com.topcoder.dde.util.DWLOAD <project_id>");
                return;
            }
            else
            {
                long project_id = Long.parseLong(args[0]);
                doLoadProject(project_id);
            }
        }
        catch(Exception e)
        {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }
        
        //close
        try {
            sourceConn.close();
            sourceConn = null;
        } catch (SQLException e) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Closing source DB connection failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }
        try {
            targetConn.close();
            targetConn = null;
        } catch (SQLException e) {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Closing target DB connection failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }

    }
    
    public static void doRunAll()
    {
        PreparedStatement ps;
        ResultSet rs;
        
        try {
            String sSQL = "delete from project_result";
            
            /*
            ps = targetConn.prepareStatement(sSQL);
            ps.execute();
            
            ps.close();
            ps = null;
            
            sSQL = "delete from submission_review";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.execute();
            
            ps.close();
            ps = null;
            
            sSQL = "delete from contest_project_xref";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.execute();
            
            ps.close();
            ps = null;
            
            sSQL = "delete from user_contest_prize";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.execute();
            
            ps.close();
            ps = null;
            
            sSQL = "delete from contest";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.execute();
            
            ps.close();
            ps = null;
                       
            sSQL = "delete from project";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.execute();
            
            ps.close();
            ps = null;*/
            
            //load contests
            doLoadContests();
            
            //load project_results / projects / submission_review
        
            sSQL = "select distinct project_id from project_result";

            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();

            while(rs.next())
            {
                doLoadProject(rs.getLong("project_id"));
            }

            rs.close();
            rs = null;
            ps.close();
            ps = null;
            
            doLoadUserRating();
            
            doLoadUserReliability();
            
            doLoadRoyalty();
            
            //fix problems with submission date
            sSQL = "update project_result " +
                   "         set submit_timestamp = (select max(u.submission_date) " +
                   "         from project p, " +
                   "         user_component_score u " +
                   "         where p.project_id = project_result.project_id " +
                   "         and u.component_name = p.component_name " +
                   "         and u.phase_id = p.phase_id " +
                   "         and u.component_id = p.component_id " +
                   "         and u.user_id = project_result.user_id " +
                   "         group by p.project_id) " +
                   " where exists(  " +
                   "         select max(u.submission_date) " +
                   "         from project p, " +
                   "         user_component_score u " +
                   "         where p.project_id = project_result.project_id " +
                   "         and u.component_name = p.component_name " +
                   "         and u.phase_id = p.phase_id " +
                   "         and u.component_id = p.component_id " +
                   "         and u.user_id = project_result.user_id " +
                   "         group by p.project_id " +
                   " )";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.execute();
            ps.close();
            ps = null;
            
        }
        catch(Exception e)
        {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }
        return;
    }
    
    public static void doLoadRoyalty()
    {
        PreparedStatement ps, ps2;
        ResultSet rs;
        
        try {
            String sSQL = "select * from royalty";
            
            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                System.out.println("PROCESSING USER " + rs.getInt("user_id"));
                
                //update record, if 0 rows affected, insert record
                sSQL = "update royalty set amount = ?, description = ?, royalty_date = ? " +
                        " where user_id = ? ";

                ps2 = targetConn.prepareStatement(sSQL);
                ps2.setObject(1, rs.getObject("amount"));
                ps2.setObject(2, rs.getObject("description"));
                ps2.setObject(3, rs.getObject("royalty_date"));
                ps2.setLong(4, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if(retVal == 0)
                {
                    //need to insert
                    sSQL = "insert into royalty (user_id, amount, description, royalty_date) " +
                           "values (?, ?, ?, ?) ";

                    ps2 = targetConn.prepareStatement(sSQL);
                    ps2.setLong(1, rs.getLong("user_id"));
                    ps2.setObject(2, rs.getObject("amount"));
                    ps2.setObject(3, rs.getObject("description"));
                    ps2.setObject(4, rs.getObject("royalty_date"));
                    
                    ps2.execute();
                    
                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            
        }                
        catch(Exception e)
        {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            e.printStackTrace();
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }        
    }
    
    public static void doLoadUserReliability()
    {
        PreparedStatement ps, ps2;
        ResultSet rs;
        
        try {
            String sSQL = "select * from user_reliability";
            
            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                System.out.println("PROCESSING USER " + rs.getInt("user_id"));
                
                //update record, if 0 rows affected, insert record
                sSQL = "update user_reliability set rating = ?, modify_date = CURRENT " +
                        " where user_id = ? ";

                ps2 = targetConn.prepareStatement(sSQL);
                ps2.setObject(1, rs.getObject("rating"));
                ps2.setLong(2, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if(retVal == 0)
                {
                    //need to insert
                    sSQL = "insert into user_reliability (user_id, rating, modify_date, create_date) " +
                           "values (?, ?, CURRENT, CURRENT) ";

                    ps2 = targetConn.prepareStatement(sSQL);
                    ps2.setLong(1, rs.getLong("user_id"));
                    ps2.setObject(2, rs.getObject("rating"));
                    
                    ps2.execute();
                    
                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            
        }                
        catch(Exception e)
        {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            e.printStackTrace();
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }        
    }
    
    public static void doLoadUserRating()
    {
        PreparedStatement ps, ps2;
        ResultSet rs;
        
        try {
            String sSQL = "select * from user_rating";
            
            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                System.out.println("PROCESSING USER " + rs.getInt("user_id"));
                
                //update record, if 0 rows affected, insert record
                sSQL = "update user_rating set rating = ?,  phase_id = ?, vol = ?, rating_no_vol = ?, num_ratings = ?, last_component_rated = ?, mod_date_time = CURRENT " +
                        " where user_id = ? and phase_id = ? ";

                ps2 = targetConn.prepareStatement(sSQL);
                ps2.setObject(1, rs.getObject("rating"));
                ps2.setObject(2, rs.getObject("phase_id"));
                ps2.setObject(3, rs.getObject("vol"));
                ps2.setObject(4, rs.getObject("rating_no_vol"));
                ps2.setObject(5, rs.getObject("num_ratings"));
                ps2.setObject(6, rs.getObject("last_component_rated"));
                ps2.setLong(7, rs.getLong("user_id"));
                ps2.setObject(8, rs.getObject("phase_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if(retVal == 0)
                {
                    //need to insert
                    sSQL = "insert into user_rating (user_id, rating, phase_id, vol, rating_no_vol, num_ratings, last_component_rated, mod_date_time, create_date_time) " +
                           "values (?, ?, ?, ?, ?, ?, ?, CURRENT, CURRENT) ";

                    ps2 = targetConn.prepareStatement(sSQL);
                    ps2.setLong(1, rs.getLong("user_id"));
                    ps2.setObject(2, rs.getObject("rating"));
                    ps2.setObject(3, rs.getObject("phase_id"));
                    ps2.setObject(4, rs.getObject("vol"));
                    ps2.setObject(5, rs.getObject("rating_no_vol"));
                    ps2.setObject(6, rs.getObject("num_ratings"));
                    ps2.setObject(7, rs.getObject("last_component_rated"));
                    
                    ps2.execute();
                    
                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            
        }                
        catch(Exception e)
        {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            e.printStackTrace();
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }        
    }

    
    public static void doLoadContests()
    {
        PreparedStatement ps, ps2;
        ResultSet rs;
        
        try {
            String sSQL = "select c.contest_id, c.contest_name, " +
                            "c.start_date as contest_start_timestamp, " +
                            "c.end_date as contest_end_timestamp, " +
                            "c.contest_type_id, " +
                            "ct.contest_type_desc " +
                            "from contest c, " +
                            "contest_type_lu ct " +
                            "where ct.contest_type_id = c.contest_type_id";
            
            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                System.out.println("PROCESSING CONTEST " + rs.getInt("contest_id"));
                
                //update record, if 0 rows affected, insert record
                sSQL = "update contest set contest_name = ?,  contest_start_timestamp = ?, contest_end_timestamp = ?, contest_type_id = ?, contest_type_desc = ? " +
                        " where contest_id = ? ";

                ps2 = targetConn.prepareStatement(sSQL);
                ps2.setObject(1, rs.getObject("contest_name"));
                ps2.setObject(2, rs.getObject("contest_start_timestamp"));
                ps2.setObject(3, rs.getObject("contest_end_timestamp"));
                ps2.setObject(4, rs.getObject("contest_type_id"));
                ps2.setObject(5, rs.getObject("contest_type_desc"));
                ps2.setLong(6, rs.getLong("contest_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if(retVal == 0)
                {
                    //need to insert
                    sSQL = "insert into contest (contest_id, contest_name, contest_start_timestamp, contest_end_timestamp, contest_type_id, contest_type_desc) " +
                           "values (?, ?, ?, ?, ?, ?) ";

                    ps2 = targetConn.prepareStatement(sSQL);
                    ps2.setLong(1, rs.getLong("contest_id"));
                    ps2.setObject(2, rs.getObject("contest_name"));
                    ps2.setObject(3, rs.getObject("contest_start_timestamp"));
                    ps2.setObject(4, rs.getObject("contest_end_timestamp"));
                    ps2.setObject(5, rs.getObject("contest_type_id"));
                    ps2.setObject(6, rs.getObject("contest_type_desc"));
                    
                    ps2.execute();
                    
                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            
            //load prizes
            sSQL = "select ucp.user_id, " +
                    "cp.contest_id, " +
                    "cp.prize_type_id, " +
                    "pt.prize_type_desc as prize_description, " +
                    "cp.place, " +
                    "cp.prize_amount, " +
                    "ucp.payment as prize_payment " +
                    "from user_contest_prize ucp, " +
                    "contest_prize cp, " +
                    "prize_type_lu pt " +
                    "where cp.contest_prize_id = ucp.contest_prize_id " +
                    "and pt.prize_type_id = cp.prize_type_id;";
        
            ps = sourceConn.prepareStatement(sSQL);
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                //update record, if 0 rows affected, insert record
                sSQL = "update user_contest_prize set prize_type_id = ?,  prize_description = ?, place = ?, prize_amount = ?, prize_payment = ? " +
                        " where contest_id = ? and user_id = ?";

                ps2 = targetConn.prepareStatement(sSQL);
                ps2.setObject(1, rs.getObject("prize_type_id"));
                ps2.setObject(2, rs.getObject("prize_description"));
                ps2.setObject(3, rs.getObject("place"));
                ps2.setObject(4, rs.getObject("prize_amount"));
                ps2.setObject(5, rs.getObject("prize_payment"));
                ps2.setLong(6, rs.getLong("contest_id"));
                ps2.setLong(7, rs.getLong("user_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if(retVal == 0)
                {
                    //need to insert
                    sSQL = "insert into user_contest_prize (contest_id, user_id, prize_type_id, prize_description, place, prize_amount, prize_payment) " +
                           "values (?, ?, ?, ?, ?, ?, ?) ";

                    ps2 = targetConn.prepareStatement(sSQL);
                    ps2.setLong(1, rs.getLong("contest_id"));
                    ps2.setLong(2, rs.getLong("user_id"));
                    ps2.setObject(3, rs.getObject("prize_type_id"));
                    ps2.setObject(4, rs.getObject("prize_description"));
                    ps2.setObject(5, rs.getObject("place"));
                    ps2.setObject(6, rs.getObject("prize_amount"));
                    ps2.setObject(7, rs.getObject("prize_payment"));
                    
                    ps2.execute();
                    
                    ps2.close();
                    ps2 = null;
                }

            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
        }                
        catch(Exception e)
        {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            e.printStackTrace();
            sErrorMsg.append(e.getMessage());
            fatal_error();
        }        
    }
    
    public static void doLoadProject(long project_id)
    {
        PreparedStatement ps, ps2;
        ResultSet rs;
        
        try {
        
            System.out.println("PROCESSING PROJECT " + project_id);

            //get data from source DB
            String sSQL = "select p.project_id, cc.component_id, cc.component_name, " +
                            "(select count(*) from component_inquiry where project_id = p.project_id) as num_registrations, " +
                            "(select count(*) from submission where cur_version = 1 and project_id = p.project_id and submission_type = 1 and is_removed = 0) as num_submissions, " +
                            "(select count(*) from project_result where project_id = p.project_id and valid_submission_ind = 1) as num_valid_submissions, " +
                            "(select avg(case when raw_score is null then 0 else raw_score end) from project_result where project_id = p.project_id) as avg_raw_score, " +
                            "(select avg(case when final_score is null then 0 else final_score end) from project_result where project_id = p.project_id) as avg_final_score, " +
                            "case when p.project_type_id = 1 then 112 else 113 end as phase_id, " +
                            "(select description from phase where phase_id = (case when p.project_type_id = 1 then 112 else 113 end)) as phase_desc, " +
                            "(select category_id from comp_categories where component_id = cc.component_id) as category_id, " +
                            "(select category_name from categories where category_id = (select category_id from comp_categories where component_id = cc.component_id)) as category_desc, " +
                            "(select start_date from phase_instance where phase_id = 1 and cur_version = 1 and project_id = p.project_id) as posting_date, " +
                            "(select end_date from phase_instance where phase_id = 1 and cur_version = 1 and project_id = p.project_id) as submitby_date, " +
                            "p.complete_date  " +
                            "from project p, " +
                            "comp_versions cv, " +
                            "comp_catalog cc " +
                            "where p.project_id = ? " +
                            "and p.cur_version = 1  " +
                            "and p.project_stat_id in (2, 4, 6) " +
                            "and cv.comp_vers_id = p.comp_vers_id " +
                            "and cc.component_id = cv.component_id";

            ps = sourceConn.prepareStatement(sSQL);
            ps.setLong(1, project_id);
            
            rs = ps.executeQuery();
            if(rs.next())
            {
                //update record, if 0 rows affected, insert record
                sSQL = "update project set component_name = ?,  num_registrations = ?, num_submissions = ?, num_valid_submissions = ?, avg_raw_score = ?, avg_final_score = ?, phase_id = ?, " +
                        "phase_desc = ?, category_id = ?, category_desc = ?, posting_date = ?, submitby_date = ?, complete_date = ?, component_id = ? where project_id = ? ";

                ps2 = targetConn.prepareStatement(sSQL);
                ps2.setString(1, rs.getString("component_name"));
                ps2.setInt(2, rs.getInt("num_registrations"));
                ps2.setInt(3, rs.getInt("num_submissions"));
                ps2.setInt(4, rs.getInt("num_valid_submissions"));
                ps2.setDouble(5, rs.getDouble("avg_raw_score"));
                ps2.setDouble(6, rs.getDouble("avg_final_score"));
                ps2.setInt(7, rs.getInt("phase_id"));
                ps2.setString(8, rs.getString("phase_desc"));
                ps2.setInt(9, rs.getInt("category_id"));
                ps2.setString(10, rs.getString("category_desc"));
                ps2.setDate(11, rs.getDate("posting_date"));
                ps2.setDate(12, rs.getDate("submitby_date"));
                ps2.setDate(13, rs.getDate("complete_date"));
                ps2.setLong(14, rs.getLong("component_id"));
                ps2.setLong(15, rs.getLong("project_id"));

                int retVal = ps2.executeUpdate();

                ps2.close();
                ps2 = null;

                if(retVal == 0)
                {
                    //need to insert
                    sSQL = "insert into project (project_id, component_name, num_registrations, num_submissions, num_valid_submissions, avg_raw_score, avg_final_score, phase_id, phase_desc, " +
                           "category_id, category_desc, posting_date, submitby_date, complete_date, component_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

                    ps2 = targetConn.prepareStatement(sSQL);
                    ps2.setLong(1, rs.getLong("project_id"));
                    ps2.setString(2, rs.getString("component_name"));
                    ps2.setInt(3, rs.getInt("num_registrations"));
                    ps2.setInt(4, rs.getInt("num_submissions"));
                    ps2.setInt(5, rs.getInt("num_valid_submissions"));
                    ps2.setDouble(6, rs.getDouble("avg_raw_score"));
                    ps2.setDouble(7, rs.getDouble("avg_final_score"));
                    ps2.setInt(8, rs.getInt("phase_id"));
                    ps2.setString(9, rs.getString("phase_desc"));
                    ps2.setInt(10, rs.getInt("category_id"));
                    ps2.setString(11, rs.getString("category_desc"));
                    ps2.setDate(12, rs.getDate("posting_date"));
                    ps2.setDate(13, rs.getDate("submitby_date"));
                    ps2.setDate(14, rs.getDate("complete_date"));
                    ps2.setLong(15, rs.getLong("component_id"));

                    ps2.execute();

                    ps2.close();
                    ps2 = null;
                }

            }
            else
            {
                sSQL = "delete from project_result where project_id = ?";
            
                ps = targetConn.prepareStatement(sSQL);
                ps.setLong(1, project_id);

                ps.execute();

                ps.close();
                ps = null;
                
                sSQL = "delete from submission_review where project_id = ?";
            
                ps = targetConn.prepareStatement(sSQL);
                ps.setLong(1, project_id);

                ps.execute();

                ps.close();
                ps = null;
                
                sSQL = "delete from contest_project_xref where project_id = ?";
            
                ps = targetConn.prepareStatement(sSQL);
                ps.setLong(1, project_id);

                ps.execute();

                ps.close();
                ps = null;
                
                sSQL = "delete from project where project_id = ?";
            
                ps = targetConn.prepareStatement(sSQL);
                ps.setLong(1, project_id);

                ps.execute();

                ps.close();
                ps = null;
                
                return;
            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            
            sSQL = "delete from project_result where project_id = ?";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.setLong(1, project_id);
            
            ps.execute();
            
            ps.close();
            ps = null;

            //insert project_result records for this project
            sSQL = "select pr.project_id, pr.user_id, " +
                    "case when exists(select * from submission s where s.cur_version = 1 and s.project_id = pr.project_id " +
                    "and s.submitter_id = pr.user_id and submission_type = 1 and is_removed = 0) then 1 " +
                    "else 0 end as submit_ind, " +
                    "pr.valid_submission_ind, " +
                    "pr.raw_score, " +
                    "pr.final_score, " +
                    "(select min(create_time) from component_inquiry where component_id = cc.component_id and tc_user_id = pr.user_id) as inquire_timestamp, " +
                    "(select submission_date from submission s where s.cur_version = 1 and s.project_id = pr.project_id and s.submitter_id = pr.user_id and submission_type = 1 and is_removed = 0) as submit_timestamp, " +
                    "(select max(pm_review_timestamp) from scorecard where scorecard_type = 2 and is_completed = 1 and submission_id = " +
                    "	(select submission_id from submission s where s.cur_version = 1 and s.project_id = pr.project_id and s.submitter_id = pr.user_id and submission_type = 1 and is_removed = 0) " +
                    " and project_id = pr.project_id and cur_version = 1) as review_completed_timestamp, " +
                    "pr.payment, pr.old_rating, pr.new_rating, " +
                    "pr.old_reliability, pr.new_reliability, pr.placed, pr.rating_ind, pr.reliability_ind " +
                    "from project_result pr, " +
                    "project p, " +
                    "comp_versions cv, " +
                    "comp_catalog cc " +
                    "where pr.project_id = ? " +
                    "and p.project_id = pr.project_id " +
                    "and p.cur_version = 1  " +
                    "and p.project_stat_id in (2,  4, 6) " +
                    "and cv.comp_vers_id = p.comp_vers_id " +
                    "and cc.component_id = cv.component_id";
            
            ps = sourceConn.prepareStatement(sSQL);
            ps.setLong(1, project_id);
            
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                 sSQL = "insert into project_result (project_id, user_id, submit_ind, valid_submission_ind, raw_score, final_score, inquire_timestamp," +
                 " submit_timestamp, review_complete_timestamp, payment, old_rating, new_rating, old_reliability, new_reliability, placed, rating_ind, " +
                 "reliability_ind ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                 ps2 = targetConn.prepareStatement(sSQL);

                 ps2.setLong(1, project_id);
                 ps2.setLong(2, rs.getLong("user_id"));
                 ps2.setObject(3, rs.getObject("submit_ind"));
                 ps2.setObject(4, rs.getObject("valid_submission_ind"));
                 ps2.setObject(5, rs.getObject("raw_score"));
                 ps2.setObject(6, rs.getObject("final_score"));
                 ps2.setObject(7, rs.getObject("inquire_timestamp"));
                 ps2.setObject(8, rs.getObject("submit_timestamp"));
                 ps2.setObject(9, rs.getObject("review_completed_timestamp"));
                 ps2.setObject(10, rs.getObject("payment"));
                 ps2.setObject(11, rs.getObject("old_rating"));
                 ps2.setObject(12, rs.getObject("new_rating"));
                 ps2.setObject(13, rs.getObject("old_reliability"));
                 ps2.setObject(14, rs.getObject("new_reliability"));
                 ps2.setObject(15, rs.getObject("placed"));
                 ps2.setObject(16, rs.getObject("rating_ind"));
                 ps2.setObject(17, rs.getObject("reliability_ind"));

                 ps2.execute();

                 ps2.close();
                 ps2 = null;
            }
            
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            //load submission_review
            sSQL = "delete from submission_review where project_id = ?";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.setLong(1, project_id);
            
            ps.execute();
            
            ps.close();
            ps = null;

            //insert project_result records for this project
            sSQL = "select sc.project_id, " +
                    "(select submitter_id from submission where submission_type = 1 and is_removed = 0 and cur_version = 1 and submission_id = sc.submission_id) as user_id, " +
                    "author_id as reviewer_id, " +
                    "sc.raw_score as raw_score, " +
                    "score as final_score, " +
                    "(select count(distinct appeal_id) from appeal where appealer_id = (select submitter_id from submission where submission_type = 1 and is_removed = 0 and cur_version = 1 and submission_id = sc.submission_id) and cur_version = 1 " +
                    "and question_id in (select question_id from scorecard_question where scorecard_id = sc.scorecard_id)) as num_appeals, " +
                    "0 as num_successful_appeals " +
                    "from scorecard sc " +
                    "where sc.project_id = ? " +
                    "and sc.scorecard_type = 2 " +
                    "and sc.cur_version = 1;";
            
            ps = sourceConn.prepareStatement(sSQL);
            ps.setLong(1, project_id);
            
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                 sSQL = "insert into submission_review (project_id, user_id, reviewer_id, raw_score, final_score, num_appeals," +
                 "num_successful_appeals ) values (?, ?, ?, ?, ?, ?, ?)";

                 ps2 = targetConn.prepareStatement(sSQL);

                 ps2.setLong(1, project_id);
                 ps2.setLong(2, rs.getLong("user_id"));
                 ps2.setLong(3, rs.getLong("reviewer_id"));
                 ps2.setObject(4, rs.getObject("raw_score"));
                 ps2.setObject(5, rs.getObject("final_score"));
                 ps2.setObject(6, rs.getObject("num_appeals"));
                 ps2.setObject(7, rs.getObject("num_successful_appeals"));

                 ps2.execute();

                 ps2.close();
                 ps2 = null;
            }
            
            rs.close();
            rs = null;
            ps.close();
            ps = null;
            
          //load contest_project_xref
            sSQL = "delete from contest_project_xref where project_id = ?";
            
            ps = targetConn.prepareStatement(sSQL);
            ps.setLong(1, project_id);
            
            ps.execute();
            
            ps.close();
            ps = null;

            //insert project_result records for this project
            sSQL = "select *  " +
                    "from contest_project_xref " +
                    "where project_id = ?";
            
            ps = sourceConn.prepareStatement(sSQL);
            ps.setLong(1, project_id);
            
            rs = ps.executeQuery();
            
            while(rs.next())
            {
                 sSQL = "insert into contest_project_xref (contest_id, project_id) " +
                 "values (?, ?)";

                 ps2 = targetConn.prepareStatement(sSQL);

                 ps2.setLong(1, rs.getLong("contest_id"));
                 ps2.setLong(2, project_id);
                 
                 ps2.execute();

                 ps2.close();
                 ps2 = null;
            }
            
            rs.close();
            rs = null;
            ps.close();
            ps = null;
        }
        catch(Exception e)
        {
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load failed. ");
            sErrorMsg.append("Cannot continue.\n");
            e.printStackTrace();
            sErrorMsg.append(e.getMessage());
            fatal_error();
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
        
        try {
            if(sourceConn != null)
                sourceConn.close();
        } catch (SQLException e) {
        }
        try {
            if(targetConn != null)
                targetConn.close();
        } catch (SQLException e) {
        }
        
        System.exit(-1);
    }
}
