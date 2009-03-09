package com.topcoder.web.corp.ejb.coder;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.*;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 9, 2003 12:48:54 AM
 */
public class CoderBean extends BaseEJB {

    private static Logger log = Logger.getLogger(CoderBean.class);
    private static final String dataSourceName = "java:comp/env/datasource";

    /**
     *
     * @param coderId
     * @param coderStatusId
     * @throws RemoteException
     */
    public void createCoder(long coderId, int coderStatusId)
            throws RemoteException {
        log.debug("createCoder called. coderId: " + coderId
                + "coderStatusId: " + coderStatusId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(180);
            query.append("INSERT INTO coder (coder_id, ");
            query.append("member_since, status)");
            query.append(" VALUES(?,CURRENT,?) ");

            conn = DBMS.getConnection(dataSourceName);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, coderId);
            pstmt.setInt(2, coderStatusId);

            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating Coder coderId: " + coderId + "coderStatusId: " + coderStatusId);
        } catch (Exception e) {
            throw new EJBException("Exception creating Coder coderId: " + coderId + "coderStatusId: " + coderStatusId);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in createCoder");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createCoder");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createCoder");
                }
            }
        }
    }

    /**
     *
     * @param coderId
     * @param memberSince
     * @throws RemoteException
     */
    public void setMemberSince(long coderId, Date memberSince)
            throws RemoteException {
        log.debug("setMemberSince called. coderId: "
                + coderId + " memberSince: " + memberSince);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);

            query.append("UPDATE coder set member_since = ? ");
            query.append("where coder_id = ?");

            conn = DBMS.getConnection(dataSourceName);
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
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setMemberSince");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setMemberSince");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setMemberSince");
                }
            }
        }
    }

    /**
     *
     * @param coderId
     * @param coderStatusId
     * @throws RemoteException
     */
    public void setCoderStatusId(long coderId, int coderStatusId)
            throws RemoteException {

        log.debug("setCoderStatusId called. coderId: "
                + coderId + " coderStatusId: " + coderStatusId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("UPDATE coder set status = ? where coder_id = ?");

            conn = DBMS.getConnection(dataSourceName);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setInt(1, coderStatusId);
            pstmt.setLong(2, coderId);
            pstmt.executeUpdate();

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in setCoderStatusId coderId: " + coderId + " coderStatusId: " + coderStatusId);
        } catch (Exception e) {
            throw new EJBException("Exception in setCoderStatusId coderId: " + coderId + " coderStatusId: " + coderStatusId);
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setCoderStatus");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setCoderStatus");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setCoderStatus");
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
    public Date getMemberSince(long coderId)
            throws RemoteException {
        log.debug("getMemberSince called. coderId: " + coderId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        Date memberSince = null;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT member_since FROM coder WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSourceName);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, coderId);
            rs = pstmt.executeQuery();
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
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getMemberSince");
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getMemberSince");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getMemberSince");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getMemberSince");
                }
            }
        }
        return memberSince;
    }

    /**
     *
     * @param coderId
     * @return coderStatusId int
     * @throws RemoteException
     */
    public int getCoderStatusId(long coderId)
            throws RemoteException {
        log.debug("getCoderStatusId called. coderId: " + coderId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        int coderStatusId = -1;

        try {
            StringBuffer query = new StringBuffer(60);
            query.append("SELECT status FROM coder WHERE coder_id = ?");

            conn = DBMS.getConnection(dataSourceName);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, coderId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                coderStatusId = rs.getInt(1);
            } else {
                throw new EJBException("EJBException in getMemberSince"
                        + " empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getCoderStatusId coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getCoderStatusId coderId: " + coderId);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getCoderStatusId");
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getCoderStatusId");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getCoderStatusId");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getCoderStatusId");
                }
            }
        }
        return coderStatusId;
    }

    /**
     *
     * @param coderId
     * @return Coder Status Description
     * @throws RemoteException
     */
    public String getCoderStatusDesc(long coderId)
            throws RemoteException {
        log.debug("getCoderStatusDesc called. coderId: " + coderId);

        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSet rs = null;
        String coderStatusDesc = null;

        try {
            StringBuffer query = new StringBuffer(240);

            query.append("SELECT coder_status_desc FROM coder a, ");
            query.append("coder_status_lu b ");
            query.append("WHERE a.coder_id = ? ");
            query.append(" AND a.status = b.coder_status_id");

            conn = DBMS.getConnection(dataSourceName);
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1, coderId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                coderStatusDesc = rs.getString(1);
            } else {
                throw new EJBException("EJBException in getCoderStatusDesc"
                        + " empty result set for query: " + query.toString());
            }

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException in getCoderStatusDesc coderId: " + coderId);
        } catch (Exception e) {
            throw new EJBException("Exception in getCoderStatusDesc coderId: " + coderId);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getCoderStatusDesc");
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getCoderStatusDesc");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getCoderStatusDesc");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getCoderStatusDesc");
                }
            }
        }
        return coderStatusDesc;
    }
}
