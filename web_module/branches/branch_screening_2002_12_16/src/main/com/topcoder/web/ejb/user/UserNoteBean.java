package com.topcoder.web.ejb.user;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;
import com.topcoder.web.ejb.note.NoteBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$ 
 * Jan 1, 2003 1:51:52 AM
 */
public class UserNoteBean extends BaseEJB {

    private static Logger log = Logger.getLogger(UserNoteBean.class);
    private static final String dataSourceName = "COMMON_OLTP";

    /**
     *
     * @param userId
     * @param noteId
     * @throws RemoteException
     */
    public void createUserNote(long userId, long noteId)
            throws RemoteException {
        log.debug("createUserNote called. userId: " + userId
            + " noteId: " + noteId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("INSERT INTO user_note_xref (user_id, " +
                "note_id) values(?,?,?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,userId);
            pstmt.setLong(2,noteId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in createUserNote userId: " + userId + " noteId: " + noteId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in createUserNote userId: " + userId + " noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in createUserNote userId: " + userId + " noteId: " + noteId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createUserNote");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createUserNote");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createUserNote");}}
        }
    }

    /**
     *
     * @param userId
     * @param noteId
     * @throws RemoteException
     */
    public void removeUserNote(long userId, long noteId)
            throws RemoteException {
        log.debug("createUserNote called. userId: " + userId
            + " noteId: " + noteId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("DELETE from user_note_xref where user_id = ? " +
                "and note_id = ? ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,userId);
            pstmt.setLong(2,noteId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in removeUserNote userId: " + userId + " noteId: " + noteId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in removeUserNote userId: " + userId + " noteId: " + noteId);
        } catch (Exception e) {
            throw new EJBException("Exception in removeUserNote userId: " + userId + " noteId: " + noteId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in removeUserNote");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in removeUserNote");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in removeUserNote");}}
        }
    }
}
