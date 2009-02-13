package com.topcoder.web.resume.ejb.ResumeServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.resume.bean.Resume;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;

/**
 * Creation Date: 08-19-02
 * Modified Date: 08-19-02
 * @author Lars Backstrom
 */
public class ResumeServicesBean extends BaseEJB {

    private static Logger log = Logger.getLogger(ResumeServicesBean.class);

    private static final String GET_RESUME_QUERY =
            "SELECT r.file AS file " +
                  " ,r.file_name AS file_name " +
                  " ,ft.mime_type AS mime_type " +
                  " ,ft.file_type_desc AS file_type " +
             " FROM resume r " +
              "JOIN file_type_lu ft " +
               " ON ft.file_type_id = r.file_type_id " +
            " WHERE coder_id = ?";

    public Resume getResume(int userId) throws RemoteException{
        log.debug("ejb:ResumeServices:getResume("+userId+") called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Resume ret = null;
        try{
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(GET_RESUME_QUERY);
            ps.setInt(1,userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = new Resume();
                ret.setFile(rs.getBytes("file"));
                ret.setFileName(rs.getString("file_name"));
                ret.setMimeType(rs.getString("mime_type"));
                ret.setFileType(rs.getString("file_type"));
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("rs   close problem"); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("ps   close problem"); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("conn close problem"); }
            rs = null;
            ps = null;
            conn = null;
        }
        return ret;
    }

    private static final String INSERT_RESUME_QUERY =
            "INSERT INTO resume "+
            "(resume_id, coder_id, file_name, file_type_id, timestamp, file) "+
            "VALUES (?, ?, ?, ?, CURRENT, ?)";
    private static final String UPDATE_RESUME_QUERY =
            " UPDATE resume " +
               " SET file_name = ? " +
                   " ,file_type_id = ? " +
                   " ,timestamp = CURRENT " +
                   " ,file = ? " +
            "WHERE resume_id = ?";
    private static final String GET_RESUME_ID =
            " SELECT resume_id " +
              " FROM resume " +
             " WHERE coder_id = ? ";

    public void putResume(int userId,int fileType, String fileName, byte[] file)
            throws RemoteException{
        log.debug("ejb:ResumeServices:putResume("+userId+","+fileType+","+fileName+","+file.length+") called...");
        Connection conn = null;
        PreparedStatement psSel = null;
        PreparedStatement psUpd = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        try{
            conn = DBMS.getConnection();
            psSel = conn.prepareStatement(GET_RESUME_ID);
            psSel.setInt(1,userId);
            rs = psSel.executeQuery();
           
            int numUpdated = 0; 
            if (rs.next()) {
                psUpd = conn.prepareStatement(UPDATE_RESUME_QUERY);
                psUpd.setString(1, fileName);
                psUpd.setInt(2, fileType);
                psUpd.setBytes(3, file);
                psUpd.setInt(4, rs.getInt("resume_id"));
                numUpdated = psUpd.executeUpdate();
            } else {
                psIns = conn.prepareStatement(INSERT_RESUME_QUERY);
                psIns.setInt(1, DBMS.getSeqId(conn,DBMS.RESUME_SEQ));
                psIns.setInt(2, userId);
                psIns.setString(3, fileName);
                psIns.setInt(4, fileType);
                psIns.setBytes(5, file);
                numUpdated = psIns.executeUpdate();
            }


            if (numUpdated != 1) {
                throw new Exception(numUpdated + " columns where changed, when 1 was expected.");
            }


        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try { if (psSel != null) psSel.close(); } catch (Exception ignore) { log.error("psSel   close problem"); }
            try { if (psUpd != null) psUpd.close(); } catch (Exception ignore) { log.error("psUpd   close problem"); }
            try { if (psIns != null) psIns.close(); } catch (Exception ignore) { log.error("psIns   close problem"); }
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("rs   close problem"); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("conn close problem"); }
            psSel = null;
            psUpd = null;
            psIns = null;
            rs = null;
            conn = null;
        }
    }
    private static final String GET_FILE_TYPES_QUERY =
            "SELECT file_type_id AS file_type_id " +
                  " ,file_type_desc AS file_type_desc " +
                  " ,sort " +
             " FROM file_type_lu" +
            " ORDER BY sort ASC";
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
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("rs   close problem"); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("ps   close problem"); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("conn close problem"); }
            rs = null;
            ps = null;
            conn = null;
        }
        return ret;
    }

    public boolean hasResume(int userId) throws RemoteException {
        log.debug("ejb:ResumeServices:getFileTypes() called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        try{
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(GET_RESUME_ID);
            ps.setInt(1,userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = true;
            } else {
                ret = false;
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignore) { log.error("rs   close problem"); }
            try { if (ps != null) ps.close(); } catch (Exception ignore) { log.error("ps   close problem"); }
            try { if (conn != null) conn.close(); } catch (Exception ignore) { log.error("conn close problem"); }
            rs = null;
            ps = null;
            conn = null;
        }
        return ret;
    }
}
