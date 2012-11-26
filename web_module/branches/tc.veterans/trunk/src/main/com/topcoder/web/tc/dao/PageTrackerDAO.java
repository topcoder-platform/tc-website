package com.topcoder.web.tc.dao;

import com.topcoder.shared.util.DBMS;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.topcoder.web.common.IdGeneratorClient;

import com.topcoder.shared.util.logging.Logger;

public class PageTrackerDAO {
     public static int LOG_IN_ACTION_ID = 1;

     public static int TIME_OUT_ACTION_ID = 2;

     public static int LINK_CLICK_ACTION_ID = 3;
     
     public static int BROWSER_CLOSE_ACTION_ID = 4;

     private static Logger log = Logger.getLogger(PageTrackerDAO.class);

     public void createPageTrackRecord(String user, int actionId, String url) {
	 Connection conn = null;
        PreparedStatement ps = null;
	 
	 try {
		 StringBuffer query = new StringBuffer(1024);
               query.append("INSERT ");
               query.append("INTO page_tracker (tracking_id,user_id,action_id,next_page_url) ");
               query.append("VALUES (?,?,?,?)");

	        //long ret = IdGeneratorClient.getSeqId("PAGE_TRACKER_SEQ");


		 conn = DBMS.getConnection(DBMS.COMMON_OLTP_DATASOURCE_NAME);
		 ps = conn.prepareStatement(query.toString());
		 ps.setLong(1, 0);
		 ps.setString(2, user);
               ps.setInt(3, actionId);
		 ps.setString(4, url);

		 int rc = ps.executeUpdate();
		 log.debug("rows updated: " + rc);
		
	 }catch(SQLException _sqle) {
		DBMS.printSqlException(true, _sqle);
		//throw _sqle;
	 } finally {
	     if (ps != null) {
	         try {
       	     ps.close();
            	  } catch (Exception ignore) {
                   log.error("FAILED to close PreparedStatement.");
                   ignore.printStackTrace();
            	  }
            }

	     if (conn != null) {
                try {
                   conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection.");
                    ignore.printStackTrace();
                }
            }
	 }
     }
}