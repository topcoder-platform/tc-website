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
    private static final String dataSourceName = "java:comp/env/datasource";
    /**
     *
     * @param sessionProfileId
     * @param languageId
     * @throws RemoteException
     */
    public void createProfileLanguage(long sessionProfileId, int languageId)
            throws RemoteException {

        log.debug("createProfileLanguage called. sessionProfileId: "
                + sessionProfileId + "languageId: " + languageId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO session_profile_language_xref ");
            query.append("(screening_profile_id, language_id, modify_date, ");
            query.append("create_date) VALUES(?,?,?,?)");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            pstmt.setInt(2,languageId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in createProfileLanguage sessionProfileId: " + sessionProfileId + " languageId: " + languageId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in createProfileLanguage sessionProfileId: " + sessionProfileId + " languageId: " + languageId);
        } catch (Exception e) {
            throw new EJBException("Exception in createProfileLanguage sessionProfileId: " + sessionProfileId + " languageId: " + languageId);
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
        log.debug("removeProfileLanguage called. sessionProfileId: "
                + sessionProfileId + "languageId: " + languageId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(160);
            query.append("DELETE FROM session_profile_language_xref ");
            query.append("WHERE screening_profile_id = ? AND language_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,sessionProfileId);
            pstmt.setInt(2,languageId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in removeProfileLanguage sessionProfileId: " + sessionProfileId + " languageId: " + languageId);
        } catch (NamingException e) {
            throw new EJBException("NamingException in removeProfileLanguage sessionProfileId: " + sessionProfileId + " languageId: " + languageId);
        } catch (Exception e) {
            throw new EJBException("Exception in removeProfileLanguage sessionProfileId: " + sessionProfileId + " languageId: " + languageId);
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in removeProfileLanguage");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in removeProfileLanguage");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in removeProfileLanguage");}}
        }
    }
}