package com.topcoder.web.ejb.user;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

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
    private static final String dsName = "java:comp/env/datasource";
    private static final String transDsName = "java:comp/env/jts_datasource";

    /**
     *
     * @param userId
     * @param noteId
     * @throws RemoteException
     */
    public void createUserNote(long userId, long noteId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("userId: ");
        varBuf.append(userId);
        varBuf.append(" noteId: ");
        varBuf.append(noteId);

        debugBuf.append("createUserNote called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("INSERT INTO user_note_xref (user_id, ");
            query.append("note_id) ");
            query.append("values(?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,userId);
            pstmt.setLong(2,noteId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in createUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
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
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("userId: ");
        varBuf.append(userId);
        varBuf.append(" noteId: ");
        varBuf.append(noteId);

        debugBuf.append("removeUserNote called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("DELETE FROM user_note_xref WHERE user_id = ? ");
            query.append("AND note_id = ? ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,userId);
            pstmt.setLong(2,noteId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in removeUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in removeUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in removeUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in removeUserNote");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in removeUserNote");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in removeUserNote");}}
        }
    }
}