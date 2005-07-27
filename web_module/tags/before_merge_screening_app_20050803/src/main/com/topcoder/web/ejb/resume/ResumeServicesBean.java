package com.topcoder.web.ejb.resume;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.tc.controller.legacy.resume.bean.Resume;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    public Resume getResume(long userId, String dataSource) throws EJBException {
        log.debug("ejb:ResumeServices:getResume(" + userId + ") called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Resume ret = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_RESUME_QUERY);
            ps.setLong(1, userId);
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
            throw new EJBException(sqe.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
    }

    private static final String INSERT_RESUME_QUERY =
            "INSERT INTO resume " +
            "(resume_id, coder_id, file_name, file_type_id, timestamp, file) " +
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

    public void putResume(long userId, int fileType, String fileName, byte[] file, String dataSource)
            throws EJBException {
        log.debug("ejb:ResumeServices:putResume(" + userId + "," + fileType + "," + fileName + "," + file.length + ") called...");
        Connection conn = null;
        PreparedStatement psSel = null;
        PreparedStatement psUpd = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {
            if (file == null || file.length == 0) throw new EJBException("invalid file, it was either null or empty");
            conn = DBMS.getConnection(dataSource);
            psSel = conn.prepareStatement(GET_RESUME_ID);
            psSel.setLong(1, userId);
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
                psIns.setInt(1, DBMS.getSeqId(conn, DBMS.RESUME_SEQ));
                psIns.setLong(2, userId);
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
            throw new EJBException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new EJBException(e.getMessage());
        } finally {
            close(psSel);
            close(psUpd);
            close(psIns);
            close(rs);
            close(conn);
            close(ctx);
        }
    }

    private static final String GET_FILE_TYPES_QUERY =
            "SELECT file_type_id AS file_type_id " +
            " ,file_type_desc AS file_type_desc " +
            " ,sort " +
            " FROM file_type_lu" +
            " ORDER BY sort ASC";

    public ResultSetContainer getFileTypes(String dataSource) throws EJBException {
        log.debug("ejb:ResumeServices:getFileTypes() called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSetContainer ret = null;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_FILE_TYPES_QUERY);
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
    }

    public boolean hasResume(long userId, String dataSource) throws EJBException {
        log.debug("ejb:ResumeServices:getFileTypes() called...");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean ret = false;
        InitialContext ctx = null;
        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_RESUME_ID);
            ps.setLong(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                ret = true;
            } else {
                ret = false;
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException(sqe.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
    }
}
