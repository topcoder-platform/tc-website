package com.topcoder.ejb.ResumeServices;

import com.topcoder.common.web.constant.OLTP;
import com.topcoder.common.web.constant.Sort;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.data.stat.coder.Coder;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;

/*************************************************************************************************
 *
 * Creation Date: 08-19-02
 * Modified Date: 08-19-02
 * Author: Lars Backstrom
 *
 *
 *************************************************************************************************
 */

public class ResumeServicesBean extends BaseEJB {

    private static Logger log = Logger.getLogger(ResumeServicesBean.class);

    private static final String GET_RESUME_QUERY =
            "SELECT file AS file "+
            "FROM resume "+
            "WHERE coder_id = ?";

    public byte[] getResume(int userID) throws RemoteException{
        log.debug("ejb:ResumeServices:getResume("+userID+") called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = DBMS.getTransConnection();
            ps = conn.prepareStatement(GET_RESUME_QUERY);
            rs = ps.executeQuery();
            byte[] b = rs.getBytes("file");
            return b;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
    }
    private static final String PUT_RESUME_QUERY =
            "INSERT INTO resume "+
            "(resume_id, coder_id, file_name, file_type_id, timestamp, file) "+
            "VALUES (?, ?, ?, ?, current, ?)";
    private static final String GET_FILE_TYPE_ID_QUERY =
            "SELECT file_type_id as file_type_id "+
            "FROM file_type_lu " +
            "WHERE file_type_desc = ?";
    private static final String DELETE_FILE_QUERY =
            "DELETE FROM resume " +
            "WHERE coder_id = ?";
    public void putResume(int userID,String fileType, String fileName, byte[] file)
            throws RemoteException{
        log.debug("ejb:ResumeServices:putResume("+userID+","+fileType+","+fileName+","+file.length+") called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            conn = DBMS.getTransConnection();
            ps = conn.prepareStatement(DELETE_FILE_QUERY);
            ps.setInt(1,userID);
            int numDeleted = ps.executeUpdate();
            if(numDeleted!=1)throw new Exception(numDeleted + " columns where deleted, when 1 was expected.");
            ps = conn.prepareStatement(GET_FILE_TYPE_ID_QUERY);
            ps.setString(1,fileType);
            rs = ps.executeQuery();
            ps.close();
            ps = conn.prepareStatement(PUT_RESUME_QUERY);
            ps.setInt(1,DBMS.getTransSeqId(conn,DBMS.RESUME_SEQ));
            ps.setInt(2,userID);
            ps.setString(3,fileName);
            ps.setInt(4,rs.getInt("file_type_id"));
            ps.setBytes(5,file);
            rs.close();
            int numUpdated = ps.executeUpdate();
            if(numUpdated!=1)throw new Exception(numUpdated + " columns where inserted, when 1 was expected.");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
    }

}
