/*
 * Created on Apr 28, 2005
 */
package com.topcoder.utilities.forumConvert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;

import com.topcoder.shared.util.logging.Logger;

import com.jivesoftware.util.StringUtils;

/**
 * @author mtong
 */
public class ForumUserConverter {
	private static Logger log = Logger.getLogger(ForumConverter.class);
	
	public static void main(String[] args) {
        ForumUserConverter converter = new ForumUserConverter();
        try {
            converter.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	public void run() throws Exception {
        //InitialContext ctx = TCContext.getInitial();
        //Connection con = DBMS.getConnection();
		
		Class.forName("com.informix.jdbc.IfxDriver");
		String urlStr = "jdbc:informix-sqli://172.16.20.25:1526/informixoltp:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec";
        Connection con = DriverManager.getConnection(urlStr);
        String urlStrJive = "jdbc:informix-sqli://172.16.20.25:1526/jive:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec";
        Connection conJive = DriverManager.getConnection(urlStrJive);
            
        String q_user = "select u.user_id, u.handle, u.password, u.email, " +
			" c.first_name, c.last_name, c.member_since, u.last_login " +
			" from user u, coder c " +
			" where u.user_id = c.coder_id " +
			" order by u.user_id";
        String q_insert = "insert into jiveuser ( userid, username, passwordhash, " +
			" name, namevisible, email, emailvisible, creationdate, modificationdate )" +
			" values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps_user = con.prepareStatement(q_user);
        PreparedStatement ps_insert;
        
        ResultSet rs_user = null;
        
        int userCount = 0;
        long elapsedTimeMillis, start;
        float elapsedTimeSec;
        
        try {
        	start = System.currentTimeMillis();
        	
        	System.out.println("Acquiring user data... ");
        	rs_user = ps_user.executeQuery();
        	while (rs_user.next()) {
        		ps_insert = conJive.prepareStatement(q_insert);
        		
        		int userID = rs_user.getInt(1);
        		String userName = rs_user.getString(2);
        		String passwordHash = StringUtils.hash(rs_user.getString(3));
        		String email = rs_user.getString(4);
        		String name = rs_user.getString(5) + " " + rs_user.getString(6);
        		if (rs_user.getDate(7) == null) continue;	// member has no account
        		long creationDate = rs_user.getDate(7).getTime();
        		long modificationDate;
        		if (rs_user.getDate(8) != null) {
        			modificationDate = rs_user.getDate(8).getTime();
        		} else {
        			modificationDate = creationDate;
        		}
        		
                ps_insert.setInt(1, userID);
                ps_insert.setString(2, userName);
                ps_insert.setString(3, passwordHash);
                ps_insert.setString(4, name);
                ps_insert.setInt(5, 0);
                ps_insert.setString(6, email);
                ps_insert.setInt(7, 0);
                ps_insert.setLong(8, creationDate);
                ps_insert.setLong(9, modificationDate);
                
                try {
                	ps_insert.executeUpdate();
                	userCount++;
                } catch (SQLException e) {
                	System.out.println("Error: " + e.toString());
                }
                ps_insert.close();
                
                if (userCount % 1000 == 0) {
                	elapsedTimeMillis = System.currentTimeMillis()-start;
                    elapsedTimeSec = elapsedTimeMillis/1000F;
                    System.out.println(userCount + " users processed in " + elapsedTimeSec + " seconds");
                }
        	}
        	
        	elapsedTimeMillis = System.currentTimeMillis()-start;
            elapsedTimeSec = elapsedTimeMillis/1000F;
            System.out.println("(Complete) " + userCount + " users processed in " + elapsedTimeSec + " seconds");
        	
        } finally {
        	close(rs_user);
        	close(ps_user);
        	close(con);
        	close(conJive);
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
