package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 9, 2003 2:01:40 AM
 */
public class SessionProfileLanguageBean extends BaseEJB {
    private static Logger log = Logger.getLogger(SessionProfileLanguageBean.class);
    private final static String DATA_SOURCE = "java:comp/env/datasource_name";
    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    /**
     *
     * @param sessionProfileId
     * @param languageId
     */
    public void createProfileLanguage(long sessionProfileId, int languageId) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO session_profile_language_xref ");
            query.append("(session_profile_id, language_id) ");
            query.append("VALUES(?,?)");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(JTS_DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionProfileId);
            ps.setInt(2, languageId);

            ps.executeUpdate();

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
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
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     * @param sessionProfileId
     * @param languageId
     */
    public void removeProfileLanguage(long sessionProfileId, int languageId) {
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
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(160);
            query.append("DELETE FROM session_profile_language_xref ");
            query.append("WHERE session_profile_id = ? AND language_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());

            ps.setLong(1, sessionProfileId);
            ps.setInt(2, languageId);

            ps.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
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
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    /**
     *
     * @param sessionProfileId
     */
    public ResultSetContainer getLanguages(long sessionProfileId) {
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("sessionProfileId: ");
        varBuf.append(sessionProfileId);

        debugBuf.append("getLanguages called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());

        // begin method
        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSetContainer ret = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append(" SELECT l.language_id");
            query.append(" , l.language_name");
            query.append(" , l.language_desc");
            query.append(" FROM session_profile_language_xref x");
            query.append(" , language l");
            query.append(" WHERE l.language_id = x.language_id");
            query.append(" AND x.session_profile_id = ?");

            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(DATA_SOURCE);
            conn = ds.getConnection();

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, sessionProfileId);

            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in getLanguages. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in getLanguages. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in getLanguages. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return ret;
    }


}
