package com.topcoder.web.ejb.company;

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
 * Bean which modifies Company table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class CompanyBean implements SessionBean {
    private static Logger log = Logger.getLogger(CompanyBean.class);
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
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    //business methods

    /**
     *
     *
     * @return a long with the unique company ID created
     */
    public long createCompany() {
        log.debug("createCompany called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            log.debug("user transaction " +
                    ctx.lookup("javax/transaction/UserTransaction"));

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

            ret = IdGenerator.nextId("COMPANY_SEQ");

            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO company (company_id) " +
                    "VALUES (?)");
            ps.setLong(1, ret);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException creating company");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating company");
        } catch (Exception e) {
            throw new EJBException("Exception creating company:\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "createCompany");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createCompany");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createCompany");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param companyId company ID of the entry
     *
     * @return a String with the entry's company name
     */
    public String getName(long companyId) {
        log.debug("getName called...company_id: " + companyId);

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

            ps = conn.prepareStatement("SELECT company_name FROM company " +
                    "WHERE company_id = ?");
            ps.setLong(1, companyId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("company_name");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting company_name for " +
                    "company_id: " + companyId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting company name");
        } catch (Exception e) {
            throw new EJBException("Exception getting company_name for " +
                    "company_id: " + companyId + "\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getName");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getName");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getName");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getName");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param companyId company ID of the entry
     *
     * @return a long with the entry's primary contact ID
     */
    public long getPrimaryContactId(long companyId) {
        log.debug("getPrimaryContactId called...company_id: " + companyId);

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

            ps = conn.prepareStatement("SELECT primary_contact_id FROM " +
                    "company WHERE company_id = ?");
            ps.setLong(1, companyId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("primary_contact_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting primary_contact_id " +
                    "for company_id: " + companyId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting primary contact " +
                    "id");
        } catch (Exception e) {
            throw new EJBException("Exception getting primary_contact_id for" +
                    " company_id: " + companyId + "\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in " +
                            "getPrimaryContactId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getPrimaryContactId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "getPrimaryContactId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in " +
                            "getPrimaryContactId");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param companyId company ID of entry to set
     * @param name the company name to set to
     */
    public void setName(long companyId, String name) {
        log.debug("setName called...companyId: " + companyId + " name: " +
                name);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE company SET company_name = ? " +
                    "WHERE company_id = ?");
            ps.setString(1, name);
            ps.setLong(2, companyId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for company_id: " + companyId +
                        " company_name: " + name);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating company_id: " +
                    companyId + " company_name: " + name);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company name");
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id: " +
                    companyId + " company_name: " + name +
                    "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setName");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setName");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setName");
                }
            }
        }
    }

    /**
     *
     *
     * @param companyId company ID of entry to set
     * @param primaryContactId the primary contact to set to
     */
    public void setPrimaryContactId(long companyId, long primaryContactId) {
        log.debug("setPrimaryContactId called...companyId: " + companyId +
                " primaryContactId: " + primaryContactId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE company SET " +
                    "primary_contact_id = ? " +
                    "WHERE company_id = ?");
            ps.setLong(1, primaryContactId);
            ps.setLong(2, companyId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for company_id: " + companyId +
                        " primary_contact_id: " +
                        primaryContactId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating company_id: " +
                    companyId + " primary_contact_id: " +
                    primaryContactId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating company " +
                    "primaryContactId");
        } catch (Exception e) {
            throw new EJBException("Exception updating company_id: " +
                    companyId + " primary_contact_id: " +
                    primaryContactId + "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setPrimaryContactId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "setPrimaryContactId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in " +
                            "setPrimaryContactId");
                }
            }
        }
    }
}
