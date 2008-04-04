package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 1, 2003 1:51:52 AM
 */
public class UserNoteBean extends BaseEJB {

    private static Logger log = Logger.getLogger(UserNoteBean.class);

    /**
     *
     * @param userId
     * @param noteId
     */
    public void createUserNote(long userId, long noteId, String dataSource) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("INSERT INTO user_note_xref (user_id, ");
            query.append("note_id) ");
            query.append("values(?,?) ");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, userId);
            ps.setLong(2, noteId);

            ps.executeUpdate();

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createUserNote. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param userId
     * @param noteId
     */
    public void removeUserNote(long userId, long noteId, String dataSource) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("DELETE FROM user_note_xref WHERE user_id = ? ");
            query.append("AND note_id = ? ");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, userId);
            ps.setLong(2, noteId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
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
            close(ps);
            close(conn);
            close(ctx);
        }
    }
}