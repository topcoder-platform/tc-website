package com.topcoder.ejb.ResumeServices;

import com.topcoder.common.web.constant.OLTP;
import com.topcoder.common.web.constant.Sort;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.data.stat.coder.Coder;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.resume.bean.Resume;

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
            "SELECT " +
            "   r.file AS file, " +
            "   r.file_name AS file_name, " +
            "   ftl.mime_type AS mime_type " +
            "FROM " +
            "   resume r " +
            "JOIN " +
            "   file_type_lu ftl " +
            "   ON ftl.file_type_id = r.file_type_id " +
            "WHERE " +
            "    coder_id = ?";

    public Resume getResume(int userID) throws RemoteException{
        log.debug("ejb:ResumeServices:getResume("+userID+") called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Resume ret = null;
        try{
            conn = DBMS.getTransConnection();
            ps = conn.prepareStatement(GET_RESUME_QUERY);
            ps.setInt(1,userID);
            rs = ps.executeQuery();
            if(!rs.next())throw new SQLException(userID+" does not hava a submitted resume.");
            byte[] file = rs.getBytes("file");
            String name = rs.getString("file_name");
            String type = rs.getString("mime_type");
            ret = new Resume(name,type,file);
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
        return ret;
    }
    private static final String PUT_RESUME_QUERY =
            "INSERT INTO resume "+
            "(resume_id, coder_id, file_name, file_type_id, timestamp, file) "+
            "VALUES (?, ?, ?, ?, current, ?)";
    private static final String DELETE_FILE_QUERY =
            "DELETE FROM resume " +
            "WHERE coder_id = ?";
    public void putResume(int userID,int fileType, String fileName, byte[] file)
            throws RemoteException{
        log.debug("ejb:ResumeServices:putResume("+userID+","+fileType+","+fileName+","+file.length+") called...");
        Connection conn = null;
        PreparedStatement ps = null;
        try{
            conn = DBMS.getTransConnection();
            ps = conn.prepareStatement(DELETE_FILE_QUERY);
            ps.setInt(1,userID);
            int numDeleted = ps.executeUpdate();
            if(numDeleted!=1&&numDeleted!=0)throw new Exception(numDeleted + " columns where deleted, when 0 or 1 were expected.");
            ps.close();
            ps = conn.prepareStatement(PUT_RESUME_QUERY);
            ps.setInt(1,DBMS.getTransSeqId(conn,DBMS.RESUME_SEQ));
            ps.setInt(2,userID);
            ps.setString(3,fileName);
            ps.setInt(4,fileType);
            ps.setBytes(5,file);
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
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            ps = null;
            conn = null;
        }
    }
    private static final String GET_FILE_TYPES_QUERY =
            "SELECT " +
            "   file_type_id AS file_type_id, " +
            "   file_type_desc AS file_type_desc " +
            "FROM " +
            "   file_type_lu";
    public ArrayList getFileTypes() throws RemoteException{
        log.debug("ejb:ResumeServices:getFileTypes() called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList ret = new ArrayList();
        try{
            conn = DBMS.getTransConnection();
            ps = conn.prepareStatement(GET_FILE_TYPES_QUERY);
            rs = ps.executeQuery();
            while(rs.next()){
                Integer id = new Integer(rs.getInt("file_type_id"));
                String desc = rs.getString("file_type_desc");
                ret.add(id);
                ret.add(desc);
            }
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
        return ret;
    }
}
