package com.topcoder.web.ejb.user;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.ejb.EJBException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;


/**
 * Bean which modifies Contact table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class ContactBean implements SessionBean {
    private static Logger log = Logger.getLogger(ContactBean.class);
    private SessionContext ctx;

    //required ejb methods
    public void ejbActivate() {}

    /**
     *
     */
    public void ejbPassivate() {}

    /**
     *
     */
    public void ejbCreate() {
        //InitContext = new InitialContext(); // from BaseEJB
    }

    /**
     *
     */
    public void ejbRemove() {}

    /**
     *
     *
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    //business methods

    /**
     *
     *
     * @param companyId company ID to insert into table
     * @param contactId contact ID to insert into table
     */
    public void createContact(long companyId, long contactId) {
        log.debug("createContact called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO contact (contact_id, " +
                                       "company_id) VALUES (?,?)");
            ps.setLong(1, contactId);
            ps.setLong(2, companyId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                                       rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException creating contact");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating contact");
        } catch (Exception e) {
            throw new EJBException("Exception creating contact:\n" +
                                   e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                              "createContact");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createContact");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createContact");
                }
            }
        }
    }

    /**
     *
     *
     * @param contactId contact ID of entry to set
     * @param companyId company ID to set to
     */
    public void setCompanyId(long contactId, long companyId) {
        log.debug("setCompanyId called...contactId: " + contactId +
                  " companyId: " + companyId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE contact SET company_id = ? " +
                         "WHERE contact_id = ?");
            ps.setLong(1, companyId);
            ps.setLong(2, contactId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                                       rows + " for contact_id: " + contactId +
                                       " company_id: " + companyId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException updating contact_id: " +
                                   contactId + " company_id: " + companyId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company ID");
        } catch (Exception e) {
            throw new EJBException("Exception updating contact_id: " +
                                   contactId + " company_id: " + companyId +
                                   "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                              "setCompanyId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setCompanyId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setCompanyId");
                }
            }
        }
    }

    /**
     *
     *
     * @param contactId contact ID of entry
     *
     * @return a long with the entry's company ID
     */
    public long getCompanyId(long contactId) {
        log.debug("getCompanyId called...contact_id: " + contactId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT company_id FROM contact " +
                         "WHERE contact_id = ?");
            ps.setLong(1, contactId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("company_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException getting company_id for " +
                                   "contact_id: " + contactId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting contact ID");
        } catch (Exception e) {
            throw new EJBException("Exception getting company_id for " +
                                   "contact_id: " + contactId + "\n" +
                                   e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getCompanyId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                              "getCompanyId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getCompanyId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getCompanyId");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param contactId contact ID of entry
     *
     * @return a String with entry's title
     */
    public String getTitle(long contactId) {
        log.debug("getTitle called...contact_id: " + contactId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT title FROM contact " +
                                       "WHERE contact_id = ?");
            ps.setLong(1, contactId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("title");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException getting title for " +
                                   "contact_id: " + contactId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting contact title");
        } catch (Exception e) {
            throw new EJBException("Exception getting title for contact_id: " +
                                   contactId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getTitle");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getTitle");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getTitle");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getTitle");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param contactId contact ID of entry to set
     * @param title title to set to
     */
    public void setTitle(long contactId, String title) {
        log.debug("setTitle called...contactId: " + contactId + " title: " +
                  title);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE contact SET title = ? " +
                                       "WHERE contact_id = ?");
            ps.setString(1, title);
            ps.setLong(2, contactId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                                       rows + " for contact_id: " + contactId +
                                       " title: " + title);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException updating contact_id: " +
                                   contactId + " title: " + title);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating title");
        } catch (Exception e) {
            throw new EJBException("Exception updating contact_id: " +
                                   contactId + " title: " + title + "\n" +
                                   e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setTitle");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setTitle");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setTitle");
                }
            }
        }
    }
}
