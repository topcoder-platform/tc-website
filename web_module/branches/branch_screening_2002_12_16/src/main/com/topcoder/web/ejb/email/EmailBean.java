package com.topcoder.web.ejb.email;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.InformixDB;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class EmailBean implements SessionBean {

    private transient InitialContext init_ctx = null;
    private static Logger log = Logger.getLogger(EmailBean.class);
    private DataSource ds = null;
    private DataSource transDs = null;

    private SessionContext ctx;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            init_ctx = new InitialContext();
            ds = (DataSource) init_ctx.lookup("java:comp/env/datasource");
            transDs = (DataSource) init_ctx.lookup("java:comp/env/jts_datasource");
        } catch (NamingException _ne) {
            _ne.printStackTrace();
        }

    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext _ctx) {
        ctx = _ctx;
    }

    public long createEmail(long _user_id) throws RemoteException {

        long email_id = 0;
        PreparedStatement ps = null;
        Connection conn = null;

        try {

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new InformixDB(), ds, "sequence_object", "name",
                        "current_value", 9999999999L, 10, true);
            }

            email_id = IdGenerator.nextId("EMAIL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO email (email_id,user_id) ");
            query.append("VALUES (?,?)");

            conn = transDs.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, email_id);
            ps.setLong(2, _user_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new RemoteException("Wrong number of rows inserted into " +
                        "'email'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new RemoteException(_sqle.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
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
        return (email_id);
    }

    public long getEmailTypeId(long _email_id, long _user_id)
            throws RemoteException {

        long email_type_id = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_type_id ");
            query.append("FROM email ");
            query.append("WHERE email_id=? AND user_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _email_id);
            ps.setLong(2, _user_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                email_type_id = rs.getLong(1);
            } else {
                throw(new RemoteException("No rows found when selecting from 'email' " +
                        "with email_id=" + _email_id + " and " +
                        "user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new RemoteException(_sqle.getMessage()));
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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
        return (email_type_id);
    }

    public String getAddress(long _email_id, long _user_id)
            throws RemoteException {

        String address = "";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT address ");
            query.append("FROM email ");
            query.append("WHERE email_id=? AND user_id=?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _email_id);
            ps.setLong(2, _user_id);

            rs = ps.executeQuery();
            if (rs.next()) {
                address = rs.getString(1);
            } else {
                throw(new RemoteException("No rows found when selecting from 'email' " +
                        "with email_id=" + _email_id + " and " +
                        "user_id=" + _user_id + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new RemoteException(_sqle.getMessage()));
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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
        return (address);
    }

    public void setEmailTypeId(long _email_id, long _user_id, long _email_type_id)
            throws RemoteException {
        PreparedStatement ps = null;
        Connection conn = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET email_type_id=? ");
            query.append("WHERE email_id=? AND user_id=?");

            conn = transDs.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, _email_type_id);
            ps.setLong(2, _email_id);
            ps.setLong(3, _user_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new RemoteException("Wrong number of rows updated in 'email'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new RemoteException(_sqle.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
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

    public void setAddress(long _email_id, long _user_id, String _address)
            throws RemoteException {
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET address=? ");
            query.append("WHERE email_id=? AND user_id=?");

            conn = transDs.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, _address);
            ps.setLong(2, _email_id);
            ps.setLong(3, _user_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new RemoteException("Wrong number of rows updated in 'email'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new RemoteException(_sqle.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
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
     * Sets the primary flag for the given email_id/user_id combo
     * @param emailId
     * @param userId
     * @param primary
     * @throws RemoteException
     * @throws EJBException
     */
    public void setPrimary(long emailId, long userId, boolean primary) throws RemoteException, EJBException {
        log.debug("setPrimary(long, boolean) called...");
        PreparedStatement ps = null;
        Connection conn = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE email ");
            query.append("SET primary = ? ");
            query.append("WHERE email_id = ? ");
            query.append(" AND user_id = ?");

            conn = transDs.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, primary ? 1 : 0);
            ps.setLong(2, emailId);
            ps.setLong(3, userId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'email'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            if (ps != null) {
                try {
                    ps.close();
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
     * Gets the primary flag for the given email_id/user_id combo
     * @param emailId
     * @param userId
     * @return
     * @throws RemoteException
     * @throws EJBException
     */
    public boolean getPrimary(long emailId, long userId) throws RemoteException, EJBException {

        boolean primary = false;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT primary ");
            query.append("FROM email ");
            query.append("WHERE email_id = ? ");
            query.append("AND user_id = ?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, emailId);
            ps.setLong(2, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                primary = rs.getInt(1) == 1;
            } else {
                throw(new RemoteException("No rows found when selecting from 'email' " +
                        "with email_id=" + emailId + " and " +
                        "user_id=" + userId + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new RemoteException(_sqle.getMessage()));
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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

        return primary;
    }


    /**
     * Gets the email_id for the primary email address for the given user
     * @param userId
     * @return
     * @throws RemoteException
     * @throws EJBException
     */
    public long getPrimaryForUser(long userId) throws RemoteException, EJBException {

        long emailId = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT email_id ");
            query.append("FROM email ");
            query.append("WHERE primary = 1 ");
            query.append("AND user_id = ?");

            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);

            rs = ps.executeQuery();
            if (rs.next()) {
                emailId = rs.getLong(1);
            } else {
                throw(new RemoteException("No rows found when selecting from 'email' " +
                        "user_id=" + userId + "."));
            }
        } catch (SQLException _sqle) {
            _sqle.printStackTrace();
            throw(new RemoteException(_sqle.getMessage()));
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
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

        return emailId;
    }

}

;
