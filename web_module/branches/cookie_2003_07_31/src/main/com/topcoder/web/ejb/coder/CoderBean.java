package com.topcoder.web.ejb.coder;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.BaseEJB;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.sql.*;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$
 * Jan 9, 2003 12:48:54 AM
 */
public class CoderBean extends BaseEJB {

    private static Logger log = Logger.getLogger(CoderBean.class);

    /**
     *
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
            query.append( " INTO coder (coder_id)");
            query.append(" VALUES (?) ");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating Coder coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception creating Coder coderId: " + coderId);
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
            query.append(   " SET member_since = ?");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
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
     *
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
            query.append(   " SET quote = ?");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
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
            query.append(   " SET editor_id = ?");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
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
            close(ctx);        }
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
            query.append(   " SET language_id = ?");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
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
            query.append(   " SET coder_type_id = ?");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
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



    /**
     *
     * @param coderId
     * @return Member Since Date
     */
    public Date getMemberSince(long coderId, String dataSource) {
        log.debug("getMemberSince called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        Date memberSince = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT member_since ");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            stmt = conn.prepareStatement(query.toString());

            stmt.setLong(1, coderId);

            rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                memberSince = rs.getDate(1);
            } else {
                throw new EJBException("EJBException in getMemberSince"
                        + " empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getMemberSince coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getMemberSince coderId: " + coderId);
        } finally {
            close(rs);
            close(stmt);
            close(conn);
            close(ctx);        }
        return memberSince;
    }


    public String getQuote(long coderId, String dataSource) {
        log.debug("getQuote called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        String quote = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT quote");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            stmt = conn.prepareStatement(query.toString());

            stmt.setLong(1, coderId);

            rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                quote = rs.getString(1);
            } else {
                throw new EJBException("EJBException in getQuote"
                        + " empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getQuote coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getQuote coderId: " + coderId);
        } finally {
            close(rs);
            close(stmt);
            close(conn);
            close(ctx);
        }
        return quote;
    }

    public int getEditorId(long coderId, String dataSource) {
        log.debug("getEditorId called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        int editorId;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT editor_id ");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            stmt = conn.prepareStatement(query.toString());

            stmt.setLong(1, coderId);

            rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                editorId = rs.getInt(1);
            } else {
                throw new EJBException("EJBException in getEditorId"
                        + " empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getEditorId coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getEditorId coderId: " + coderId);
        } finally {
            close(rs);
            close(stmt);
            close(conn);
            close(ctx);
        }
        return editorId;
    }


    public int getLanguageId(long coderId, String dataSource) {
        log.debug("getLanguageId called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        int languageId;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT language_id ");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            stmt = conn.prepareStatement(query.toString());

            stmt.setLong(1, coderId);

            rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                languageId= rs.getInt(1);
            } else {
                throw new EJBException("EJBException in getLanguageId"
                        + " empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getLanguageId coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getLanguageId coderId: " + coderId);
        } finally {
            close(rs);
            close(stmt);
            close(conn);
            close(ctx);
        }
        return languageId;
    }

    public int getCoderTypeId(long coderId, String dataSource) {
        log.debug("getCoderTypeId called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        int languageId;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT coder_type_id ");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            stmt = conn.prepareStatement(query.toString());

            stmt.setLong(1, coderId);

            rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                languageId= rs.getInt(1);
            } else {
                throw new EJBException("EJBException in getCoderTypeId"
                        + " empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getCoderTypeId coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getCoderTypeId coderId: " + coderId);
        } finally {
            close(rs);
            close(stmt);
            close(conn);
            close(ctx);
        }
        return languageId;
    }


}