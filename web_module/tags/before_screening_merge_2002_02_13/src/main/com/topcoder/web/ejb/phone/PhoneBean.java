package com.topcoder.web.ejb.phone;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;

import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Bean which modifies Phone table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class PhoneBean implements SessionBean {
    private static Logger log = Logger.getLogger(PhoneBean.class);
    private SessionContext ctx;

    //required ejb methods
    public void ejbActivate() {
    }

    /**
     *
     */
    public void ejbPassivate() {
    }

    /**
     *
     */
    public void ejbCreate() {
        //InitContext = new InitialContext(); // from BaseEJB
    }

    /**
     *
     */
    public void ejbRemove() {
    }

    /**
     *
     *
     * @param ctx
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    //business methods

    /**
     *
     *
     * @return a long with the unique phone ID created
     */
    public long createPhone(long userId) {
        log.debug("createPhone called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(
                        new SimpleDB(),
                        (DataSource) ctx.lookup((String)
                        ctx.lookup(
                                "java:comp/env/idgen_datasource_name")),
                        "sequence_object",
                        "name",
                        "current_value",
                        9999999999L,
                        1,
                        false
                );
            }

            ret = IdGenerator.nextId("PHONE_SEQ");

            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO phone (user_id, " +
                    "phone_id) VALUES (?,?)");
            ps.setLong(1, userId);
            ps.setLong(2, ret);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException creating phone");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating phone");
        } catch (Exception e) {
            throw new EJBException("Exception creating phone:\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "createPhone");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createPhone");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createPhone");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param userId user ID of the entry
     * @param phoneId phone ID of the entry
     *
     * @return a long with the entry's phone type ID
     */
    public long getPhoneTypeId(long phoneId) {
        log.debug("getPhoneTypeId called...phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT phone_type_id FROM phone " +
                    "WHERE phone_id = ?");
            ps.setLong(1, phoneId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("phone_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting phone_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting phone_type_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting phone_type_id\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getPhoneTypeId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getPhoneTypeId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getPhoneTypeId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getPhoneTypeId");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param userId user ID of the entry
     * @param phoneId phone ID of the entry
     *
     * @return a long with the entry's phone number
     */
    public String getNumber(long phoneId) {
        log.debug("getNumber called...phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT phone_number FROM phone " +
                    "WHERE phone_id = ?");
            ps.setLong(1, phoneId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("phone_number");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting phone number");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting phone number");
        } catch (Exception e) {
            throw new EJBException("Exception getting phone number\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getNumber");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getNumber");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getNumber");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getNumber");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param userId user ID of entry to set
     * @param phoneId phone ID of entry to set
     * @param phoneTypeId the phone type ID to set to
     */
    public void setPhoneTypeId(long phoneId, long phoneTypeId) {
        log.debug("setPhoneTypeId called...phoneId: " +
                phoneId + " phoneTypeId: " + phoneTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE phone SET phone_type_id = ? " +
                    "WHERE phone_id = ?");
            ps.setLong(1, phoneTypeId);
            ps.setLong(2, phoneId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating phoneTypeId");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating phoneTypeId");
        } catch (Exception e) {
            throw new EJBException("Exception updating phoneTypeId\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setPhoneTypeId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setPhoneTypeId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setPhoneTypeId");
                }
            }
        }
    }

    /**
     *
     *
     * @param userId user ID of entry to set
     * @param phoneId phone ID of entry to set
     * @param phoneTypeId the phone number to set to
     */
    public void setNumber(long phoneId, String number) {
        log.debug("setNumber called...phoneId: " +
                phoneId + " number: " + number);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE phone SET phone_number = ? " +
                    "WHERE phone_id = ?");
            ps.setString(1, number);
            ps.setLong(2, phoneId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating phone_number");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating phone_number");
        } catch (Exception e) {
            throw new EJBException("Exception updating phone_number\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setNumber");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setNumber");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setNumber");
                }
            }
        }
    }

    /**
     *
     *
     * @param userId user ID to look up
     * @return a long with the user's primary phone ID
     */
    public long getPrimaryPhoneId(long userId) {
        log.debug("getPrimaryPhoneId called...user_id: " + userId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT phone_id FROM phone " +
                    "WHERE user_id = ? AND primary = 1");
            ps.setLong(1, userId);
            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("phone_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting primary phone_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting primary phone_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting primary phone_id\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in " +
                            "getPrimaryPhoneId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getPrimaryPhoneId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "getPrimaryPhoneId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getPrimaryPhoneId");
                }
            }
        }
        return (ret);
    }

    /**
     *
     *
     * @param userId the user ID to set
     * @param phoneId the user's phone ID to set to primary
     */
    public void setPrimaryPhoneId(long userId, long phoneId) {
        log.debug("setPrimaryEmailId called...userId: " + userId +
                " phoneId: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE phone SET primary = 0 " +
                    "WHERE user_id = ?");

            ps.setLong(1, userId);

            int rows = ps.executeUpdate();

            ps = conn.prepareStatement("UPDATE phone SET primary = 1 " +
                    "WHERE user_id = ? AND phone_id = ?");

            ps.setLong(1, userId);
            ps.setLong(2, phoneId);

            rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating primary phone");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating primary phone");
        } catch (Exception e) {
            throw new EJBException("Exception updating primary phone\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setPrimaryPhoneId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "setPrimaryPhoneId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setPrimaryPhoneId");
                }
            }
        }
    }

    /**
     *
     *
     * @param userId the user ID to check
     * @param phoneId the phone ID to check
     * @return a boolean with whether the phone ID is the user's primary
     */
    public boolean isPrimaryPhoneId(long userId, long phoneId) {
        log.debug("isPrimaryPhoneId called...user_id: " + userId +
                " phone_id: " + phoneId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT primary FROM phone " +
                    "WHERE user_id = ? AND phone_id = ?");
            ps.setLong(1, userId);
            ps.setLong(2, phoneId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getInt("primary");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException checking primary phone_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException checking primary " +
                    "phone_id");
        } catch (Exception e) {
            throw new EJBException("Exception checking primary phone_id\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in " +
                            "isPrimaryPhoneId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "isPrimaryPhoneId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "isPrimaryPhoneId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in isPrimaryPhoneId");
                }
            }
        }
        return (ret == 1);
    }
}
