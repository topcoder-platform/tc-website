package com.topcoder.web.hs.ejb.coder;

import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.ejb.CreateException;
import java.rmi.RemoteException;
import java.sql.*;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$
 * Jan 9, 2003 12:48:54 AM
 */
public class CoderBean implements SessionBean {

    private static Logger log = Logger.getLogger(CoderBean.class);
    private transient InitialContext ctx = null;
    private SessionContext sessCtx;
    private DataSource ds;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/datasource");
        } catch (NamingException ne) {
            ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext sessCtx) {
        sessCtx = sessCtx;
    }

    /**
     *
     * @param coderId
     * @throws RemoteException
     */
    public void createCoder(long coderId)
            throws RemoteException {
        log.debug("createCoder called. coderId: " + coderId);

        PreparedStatement pstmt = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer(200);
            query.append("INSERT ");
            query.append( " INTO coder (coder_id)");
            query.append(" VALUES (?) ");

            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException creating Coder coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception creating Coder coderId: " + coderId);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
    }

    public void setMemberSince(long coderId, Date memberSince)
            throws RemoteException {
        log.debug("setMemberSince called. coderId: "
                + coderId + " memberSince: " + memberSince);

        PreparedStatement pstmt = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(   " SET member_since = ?");
            query.append( " WHERE coder_id = ?");

            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setDate(1, memberSince);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setMemberSince coderId: " + coderId + " memberSince: " + memberSince);
        } catch (Exception e) {
            throw new EJBException("Exception in setMemberSince coderId: " + coderId + " memberSince: " + memberSince);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
    }


    /**
     *
     * @param coderId
     * @param quote
     * @throws RemoteException
     */
    public void setQuote(long coderId, String quote)
            throws RemoteException {
        log.debug("setQuote called. coderId: "
                + coderId + " quote: " + quote);

        PreparedStatement pstmt = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(   " SET quote = ?");
            query.append( " WHERE coder_id = ?");

            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setString(1, quote);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setQuote coderId: " + coderId + " quote: " + quote);
        } catch (Exception e) {
            throw new EJBException("Exception in setQuote coderId: " + coderId + " quote: " + quote);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
    }


    public void setEditorId(long coderId, int editorId)
            throws RemoteException {
        log.debug("setEditorId called. coderId: "
                + coderId + " editorId: " + editorId);

        PreparedStatement pstmt = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(   " SET editor_id = ?");
            query.append( " WHERE coder_id = ?");

            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, editorId);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setEditorId coderId: " + coderId + " editor id: " + editorId);
        } catch (Exception e) {
            throw new EJBException("Exception in setEditorId coderId: " + coderId + " editor id: " + editorId);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
    }



    public void setLanguageId(long coderId, int languageId)
            throws RemoteException {
        log.debug("setLanguage called. coderId: "
                + coderId + " languageId: " + languageId);

        PreparedStatement pstmt = null;
        Connection conn = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" UPDATE coder ");
            query.append(   " SET language_id = ?");
            query.append( " WHERE coder_id = ?");

            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, languageId);
            pstmt.setLong(2, coderId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            throw new EJBException("SQLException in setLanguageId coderId: " + coderId + " languageId: " + languageId);
        } catch (Exception e) {
            throw new EJBException("Exception in setLanguageId coderId: " + coderId + " languageId: " + languageId);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
    }




    /**
     *
     * @param coderId
     * @return Member Since Date
     * @throws RemoteException
     */
    public Date getMemberSince(long coderId) throws RemoteException {
        log.debug("getMemberSince called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        Date memberSince = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT member_since ");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

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
            throw new EJBException("SQLException in getMemberSince coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getMemberSince coderId: " + coderId);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Statement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
        return memberSince;
    }


    public String getQuote(long coderId) throws RemoteException {
        log.debug("getQuote called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        String quote = null;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT quote");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

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
            throw new EJBException("SQLException in getQuote coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getQuote coderId: " + coderId);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Statement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
        return quote;
    }

    public int getEditorId(long coderId) throws RemoteException {
        log.debug("getEditorId called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        int editorId;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT editor_id ");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

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
            throw new EJBException("SQLException in getEditorId coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getEditorId coderId: " + coderId);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Statement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
        return editorId;
    }


    public int getLanguageId(long coderId) throws RemoteException {
        log.debug("getLanguageId called. coderId: " + coderId);

        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        int languageId;

        try {
            StringBuffer query = new StringBuffer();

            query.append(" SELECT language_id ");
            query.append( " FROM coder ");
            query.append( " WHERE coder_id = ?");

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
            throw new EJBException("SQLException in getLanguageId coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getLanguageId coderId: " + coderId);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Statement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
        }
        return languageId;
    }



}