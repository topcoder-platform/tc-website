package com.topcoder.web.ejb.sessionprofile;

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
 * Jan 9, 2003 2:01:40 AM
 */
public class SessionProfileLanguageBean extends BaseEJB
{
    private static Logger log = Logger.getLogger(SessionProfileLanguageBean.class);
    private static final String dsName = "java:comp/env/datasource";
    private static final String transDsName = "java:comp/env/jts_datasource";

    /**
     *
     * @param sessionProfileId
     * @param languageId
     * @throws RemoteException
     */
    public void createProfileLanguage(long sessionProfileId, int languageId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" languageId: ");
        varBuf.append(languageId);

        debugBuf.append("createProfileLanguage called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO session_profile_language_xref ");
            query.append("(session_profile_id, language_id) ");
            query.append("VALUES(?,?)");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(transDsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            pstmt.setInt(2,languageId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createProfileLanguage. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in createProfileLanguage. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createProfileLanguage. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createProfileLanguage");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createProfileLanguage");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createProfileLanguage");}}
        }
    }

    /**
     *
     * @param sessionProfileId
     * @param languageId
     * @throws RemoteException
     */
    public void removeProfileLanguage(long sessionProfileId, int languageId)
            throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);
        varBuf.append(" languageId: ");
        varBuf.append(languageId);

        debugBuf.append("removeProfileLanguage called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(160);
            query.append("DELETE FROM session_profile_language_xref ");
            query.append("WHERE session_profile_id = ? AND language_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dsName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            pstmt.setInt(2,languageId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in removeProfileLanguage. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in removeProfileLanguage. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in removeProfileLanguage. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in removeProfileLanguage");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in removeProfileLanguage");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in removeProfileLanguage");}}
        }
    }
}
