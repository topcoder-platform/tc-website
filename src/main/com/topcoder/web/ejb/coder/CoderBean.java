package com.topcoder.web.ejb.coder;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision: 63882 $
 *          Jan 9, 2003 12:48:54 AM
 */
public class CoderBean extends BaseEJB {

    private static Logger log = Logger.getLogger(CoderBean.class);

    /**
     * @param coderId
     */
    public void createCoder(long coderId, String dataSource) {
        log.debug("createCoder called. coderId: " + coderId);

        PreparedStatement pstmt = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer(200);
            query.append("INSERT ");
            query.append(" INTO coder (coder_id)");
            query.append(" VALUES (?) ");

            conn = DBMS.getConnection(dataSource);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating Coder coderId: " + coderId, sqe);
        } catch (Exception e) {
            throw new EJBException("Exception creating Coder coderId: " + coderId, e);
        } finally {
            close(pstmt);
            close(conn);
            close(ctx);
        }
    }

    public void setMemberSince(long coderId, Date memberSince, String dataSource) {
        log.debug("setMemberSince called. coderId: "
                + coderId + " memberSince: " + memberSince);

        PreparedStatement pstmt = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(" SET member_since = ?");
            query.append(" WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSource);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setDate(1, memberSince);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setMemberSince coderId: " + coderId + " memberSince: " + memberSince);
        } catch (Exception e) {
            throw new EJBException("Exception in setMemberSince coderId: " + coderId + " memberSince: " + memberSince);
        } finally {
            close(pstmt);
            close(conn);
            close(ctx);
        }
    }


    /**
     * @param coderId
     * @param quote
     */
    public void setQuote(long coderId, String quote, String dataSource) {
        log.debug("setQuote called. coderId: "
                + coderId + " quote: " + quote);

        PreparedStatement pstmt = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(" SET quote = ?");
            query.append(" WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSource);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setString(1, quote);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setQuote coderId: " + coderId + " quote: " + quote);
        } catch (Exception e) {
            throw new EJBException("Exception in setQuote coderId: " + coderId + " quote: " + quote);
        } finally {
            close(pstmt);
            close(conn);
            close(ctx);
        }
    }


    public void setEditorId(long coderId, int editorId, String dataSource) {
        log.debug("setEditorId called. coderId: "
                + coderId + " editorId: " + editorId);

        PreparedStatement pstmt = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(" SET editor_id = ?");
            query.append(" WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSource);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, editorId);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setEditorId coderId: " + coderId + " editor id: " + editorId);
        } catch (Exception e) {
            throw new EJBException("Exception in setEditorId coderId: " + coderId + " editor id: " + editorId);
        } finally {
            close(pstmt);
            close(conn);
            close(ctx);
        }
    }


    public void setLanguageId(long coderId, int languageId, String dataSource) {
        log.debug("setLanguage called. coderId: "
                + coderId + " languageId: " + languageId);

        PreparedStatement pstmt = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(" SET language_id = ?");
            query.append(" WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSource);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, languageId);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setLanguageId coderId: " + coderId + " languageId: " + languageId);
        } catch (Exception e) {
            throw new EJBException("Exception in setLanguageId coderId: " + coderId + " languageId: " + languageId);
        } finally {
            close(pstmt);
            close(conn);
            close(ctx);
        }
    }

    public void setCoderTypeId(long coderId, int coderTypeId, String dataSource) {
        log.debug("setCoderTypeId called. coderId: "
                + coderId + " coderTypeId: " + coderTypeId);

        PreparedStatement pstmt = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(" SET coder_type_id = ?");
            query.append(" WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSource);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, coderTypeId);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setCoderTypeId coderId: " + coderId + " coderTypeId: " + coderTypeId);
        } catch (Exception e) {
            throw new EJBException("Exception in setCoderTypeId coderId: " + coderId + " coderTypeId: " + coderTypeId);
        } finally {
            close(pstmt);
            close(conn);
            close(ctx);
        }
    }

    public void setContactDate(long coderId, long timestamp, String dataSource) {
        log.debug("setContactDate called. coderId: " + coderId + " date: " + timestamp);

        PreparedStatement pstmt = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(" SET contact_date = ?");
            query.append(" WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSource);
            pstmt = conn.prepareStatement(query.toString());
            if (timestamp == -1) {
                pstmt.setDate(1, null);
            } else {
                pstmt.setDate(1, new java.sql.Date(timestamp));
            }
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setContactDate coderId: " + coderId + " date : " + timestamp);
        } catch (Exception e) {
            throw new EJBException("Exception in setContactDate coderId: " + coderId + " date : " + timestamp);
        } finally {
            close(pstmt);
            close(conn);
            close(ctx);
        }
    }


    /**
     * @param coderId
     * @return Member Since Date
     */
    public Date getMemberSince(long coderId, String dataSource) throws RowNotFoundException {
        log.debug("getMemberSince called. coderId: " + coderId);


        return selectDate("coder", "member_since",
                new String[]{"coder_id"}, new String[]{String.valueOf(coderId)}, dataSource);

    }


    public String getQuote(long coderId, String dataSource) throws RowNotFoundException {
        log.debug("getQuote called. coderId: " + coderId);


        return selectString("coder", "quote",
                new String[]{"coder_id"}, new String[]{String.valueOf(coderId)}, dataSource);

    }

    public Integer getEditorId(long coderId, String dataSource) throws RowNotFoundException {
        log.debug("getEditorId called. coderId: " + coderId);


        return selectInt("coder", "editor_id",
                new String[]{"coder_id"}, new String[]{String.valueOf(coderId)}, dataSource);
    }


    public Integer getLanguageId(long coderId, String dataSource) throws RowNotFoundException {
        log.debug("getLanguageId called. coderId: " + coderId);

        return selectInt("coder", "language_id",
                new String[]{"coder_id"}, new String[]{String.valueOf(coderId)}, dataSource);
    }

    public Integer getCoderTypeId(long coderId, String dataSource) throws RowNotFoundException {
        log.debug("getCoderTypeId called. coderId: " + coderId);
        return selectInt("coder", "coder_type_id",
                new String[]{"coder_id"}, new String[]{String.valueOf(coderId)}, dataSource);
    }

    public boolean exists(long coderId, String dataSource) {
        log.debug("exists called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        String activationCode;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT '1' ");
            query.append(" FROM coder ");
            query.append(" WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSource);
            stmt = conn.prepareStatement(query.toString());

            stmt.setLong(1, coderId);

            rs = stmt.executeQuery();
            return rs.next();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getActivationCode coderId: " + coderId);
        } catch (EJBException e) {
            throw e;
        } catch (Exception e) {
            throw new EJBException("Exception in getActivationCode coderId: " + coderId);
        } finally {
            close(rs);
            close(stmt);
            close(conn);
            close(ctx);
        }
    }


    public void setCompCountryCode(long coderId, String compCountryCode, String dataSource) {

        int ret = update("coder",
                new String[]{"comp_country_code"},
                new String[]{compCountryCode},
                new String[]{"coder_id"},
                new String[]{String.valueOf(coderId)},
                dataSource);
        if (ret != 1) {
            throw (new EJBException("Wrong number of rows updated in " +
                    "'coder'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public String getCompCountryCode(long coderId, String dataSource) throws RowNotFoundException {
        return selectString("coder",
                "comp_country_code",
                new String[]{"coder_id"},
                new String[]{String.valueOf(coderId)},
                dataSource);
    }


}
