package com.topcoder.ejb.JavaDocServices;

import java.rmi.RemoteException;
import java.sql.*;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;

public class JavaDocServicesBean extends BaseEJB {

    private final static Logger logger =
          Logger.getLogger(JavaDocServicesBean.class);

    private final static int CODING_SEGMENT_ID = 2;
    private final static int LEVEL_ONE_ADMIN_GROUP_ID = 13;
    private final static int LEVEL_TWO_ADMIN_GROUP_ID = 14;

    public void ejbCreate () { }

    /** 
     * Checks if a user has permission to view a java doc.  The returned String 
     * is "" if he does and a String error message if he doesn't.
     */
    public String authenticateUserForWebService(String handle, String password, String webServiceName) 
            throws JavaDocServicesException {
        logger.info("authenticateUserForWebService("+handle+", "+password+", "+webServiceName+")");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sql = null;
        String errors = "";

        try {
            conn = DBMS.getConnection();

            //First, is this a user?
            sql = new StringBuffer("SELECT user_id FROM user WHERE handle = ? AND password = ? AND status = 'A'");
            ps = conn.prepareStatement(sql.toString());
            ps.setString(1, handle);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if(!rs.next()) {
                return "Invalid handle / password information.";
            }
            int userId = rs.getInt(1);
            close(ps, rs);

            //Next, is it an admin?
            sql = new StringBuffer();
            sql.append("SELECT * FROM group_user WHERE user_id = ? AND group_id IN (?, ?) ");
            ps = conn.prepareStatement(sql.toString());
            ps.setInt(1, userId);
            ps.setInt(2, LEVEL_ONE_ADMIN_GROUP_ID);
            ps.setInt(3, LEVEL_TWO_ADMIN_GROUP_ID);
            rs = ps.executeQuery();
            if(rs.next()) {  
                //we have an admin, let them have it
                return "";
            }

            //Next, get all the rounds this web service is used in
            sql = new StringBuffer();
            sql.append("SELECT DISTINCT r.round_id, rs.status ");
            sql.append("FROM round r ");
            sql.append(    ",round_component rc ");
            sql.append(    ",component c ");
            sql.append(    ",problem_web_service_xref pws ");
            sql.append(    ",web_service w ");
            sql.append(    ",round_segment rs ");
            sql.append("WHERE r.round_id = rc.round_id ");
            sql.append(  "AND rc.component_id = c.component_id ");
            sql.append(  "AND c.problem_id = pws.problem_id ");
            sql.append(  "AND pws.web_service_id = w.web_service_id ");
            sql.append(  "AND w.web_service_name = ? ");
            sql.append(  "AND rs.round_id = r.round_id ");
            sql.append(  "AND rs.segment_id = ? ");
            ps = conn.prepareStatement(sql.toString());
            ps.setString(1, webServiceName);
            ps.setInt(2, CODING_SEGMENT_ID);
            rs = ps.executeQuery();

            //decide if any of these rounds requires viewing the web service
            boolean canView = false;
            while(rs.next()) {
                int roundId = rs.getInt(1);
                String status = rs.getString(2);
                logger.debug("RoundId = " + roundId + " has coding phase with status = " + status + ", for web service = " + webServiceName);
                if(!status.equals("F")) {
                    logger.debug("Allowing user to view web service.");
                    canView = true;
                    break;
                }
            }

            if(!canView) {
                return "You cannot view these java docs because there is no active coding phase requiring you to view them.";
            }

        } catch(Exception e) {
            logger.error("Error authenticating user for web service, sql was: " + sql, e);
            throw new JavaDocServicesException(e.toString());
        } finally {
            close(conn, ps, rs);
        }

        return "";
    }

    /**
     * Returns the HTML corresponding the the file specified by path for the 
     * specified web service.
     */
    public String getFile(String webServiceName, String path) 
          throws RemoteException, JavaDocServicesException {
        logger.info("getFile("+webServiceName+", "+path+")");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer sql = null;
        String file = "";

        try {
            conn = DBMS.getConnection();

            sql = new StringBuffer();
            sql.append("SELECT wsjd.content ");
            sql.append("FROM web_service_java_doc wsjd ");
            sql.append(    ",web_service ws ");
            sql.append("WHERE ws.web_service_id = wsjd.web_service_id ");
            sql.append(  "AND ws.web_service_name = ? ");
            sql.append(  "AND wsjd.path LIKE ? ");
            ps = conn.prepareStatement(sql.toString());
            ps.setString(1, webServiceName);
            ps.setString(2, "%" + path);
            rs = ps.executeQuery();
            if(rs.next()) {
                file = DBMS.getTextString(rs, 1);
            } else {
                throw new JavaDocServicesException("No web service file for webServiceName = " + webServiceName +", path = " + path);
            }
        } catch(JavaDocServicesException jdse) {
            logger.error("", jdse);
            throw jdse;
        } catch(Exception e) {
            logger.error("Error getting web service java doc file for web service, sql was: " + sql, e);
            throw new JavaDocServicesException(e.toString());
        } finally {
            close(conn, ps, rs);
        }
        return file;
    }

    private void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        close(ps, rs);
        if(conn != null) { try { conn.close(); } catch(Exception e) { } }
    }

    private void close(PreparedStatement ps, ResultSet rs) {
        if(rs != null) { try { rs.close(); } catch(Exception e) { } }
        if(ps != null) { try { ps.close(); } catch(Exception e) { } }
    }
}
