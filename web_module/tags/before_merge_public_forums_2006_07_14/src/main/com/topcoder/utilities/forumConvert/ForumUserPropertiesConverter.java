/*
 * Created on Apr 28, 2005
 */
package com.topcoder.utilities.forumConvert;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.DateUtil;
import com.topcoder.shared.util.logging.Logger;

import com.jivesoftware.util.StringUtils;

/**
 * @author mtong
 * 
 * Run ForumUserConverter and delete all properties from the jiveuserprop table before
 * running this.
 */
public class ForumUserPropertiesConverter {
	private static Logger log = Logger.getLogger(ForumConverter.class);
	private static String[][] DEFAULT_PROPERTIES =
		{{"jiveSignatureVisible", "false"},
			{"jiveThreadRange", "15"},
			{"jiveMessageRange", "15"},
			{"jiveThreadMode", "flat"},
			{"jiveTimeZoneID", "America/New_York"},
			{"jiveAutoWatchNewTopics", "false"},
			{"jiveAutoWatchReplies", "false"}};
	
	public static void main(String[] args) {
        ForumUserPropertiesConverter converter = new ForumUserPropertiesConverter();
        try {
            converter.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	public void run() throws Exception {
		Class.forName("com.informix.jdbc.IfxDriver");
		//String urlStr = "jdbc:informix-sqli://172.16.20.25:1526/informixoltp:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec";
        //Connection con = DriverManager.getConnection(urlStr);
        String urlStr = "jdbc:informix-sqli://172.16.20.25:1526/jive:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec";
        Connection con = DriverManager.getConnection(urlStr);
            
        String q_userCount = "select count(distinct userid) from jiveuser";
        String q_user = "select distinct userid from jiveuser";
        String q_delete = "delete from jiveuserprop";
        String q_insert = "insert into jiveuserprop (userid, name, propvalue) " +
        	" values (?, ?, ?)";
        
        PreparedStatement ps_userCount = con.prepareStatement(q_userCount);
        PreparedStatement ps_user = con.prepareStatement(q_user);
        PreparedStatement ps_delete = con.prepareStatement(q_delete);
        PreparedStatement ps_insert;
        
        ResultSet rs_userCount = null;
        ResultSet rs_user = null;
        
        int userCount = 0;
        long elapsedTimeMillis, start;
        float elapsedTimeSec;
        
        try {
        	start = System.currentTimeMillis();
        	
        	System.out.print("Acquiring user data... ");
        	rs_userCount = ps_userCount.executeQuery();
        	rs_userCount.next();
        	int totalUserCount = rs_userCount.getInt(1);
        	System.out.println(totalUserCount + " records found");
        	
        	System.out.print("Deleting existing properties... ");
        	int rows_deleted = ps_delete.executeUpdate();
        	System.out.println(rows_deleted + " properties deleted");
        	
        	System.out.println("Inserting user properties... ");
        	rs_user = ps_user.executeQuery();
        	while (rs_user.next()) {
        		ps_insert = con.prepareStatement(q_insert);
        		
        		int userID = rs_user.getInt(1);
        		
        		for (int i=0; i<DEFAULT_PROPERTIES.length; i++) {
                    ps_insert.setInt(1, userID);
                    ps_insert.setString(2, DEFAULT_PROPERTIES[i][0]);
                    ps_insert.setString(3, DEFAULT_PROPERTIES[i][1]);
                    ps_insert.addBatch();
        		}
                
                try {
                	ps_insert.executeBatch();
                	userCount++;
                } catch (SQLException e) {
                	System.out.println("Error: " + e.toString());
                }
                ps_insert.close();
                
                if (userCount % 1000 == 0) {
                	elapsedTimeMillis = System.currentTimeMillis()-start;
                    elapsedTimeSec = elapsedTimeMillis/1000F;
                    System.out.println(userCount + "/" + totalUserCount + " users processed in " + elapsedTimeSec + " seconds");
                }
        	}
        	
        	elapsedTimeMillis = System.currentTimeMillis()-start;
            elapsedTimeSec = elapsedTimeMillis/1000F;
            System.out.println("(Complete) " + userCount + " users processed in " + elapsedTimeSec + " seconds");
        	
        } finally {
        	close(rs_user);
        	close(rs_userCount);
        	close(ps_user);
        	close(ps_userCount);
        	close(ps_delete);
        	close(con);
        }
	}
	
	protected void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                log.error("FAILED to close ResultSet.");
                ignore.printStackTrace();
            }
        }
    }

    protected void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Connection.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Context.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                log.error("FAILED to close PreparedStatement.");
                ignore.printStackTrace();
            }
        }

    }
}
