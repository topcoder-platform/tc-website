package com.topcoder.web.ejb.product;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Bean which modifies Unit table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class UnitBean implements SessionBean {
    private static Logger log = Logger.getLogger(UnitBean.class);
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
     * @param productId the product ID to insert
     * @param unitTypeId the unit type ID to insert
     * @param int numUnits the number of units to insert
     */
    public void createUnit(long productId, long unitTypeId, int numUnits) {
        log.debug("createUnit called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;

        try {
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO unit (product_id, " +
                    "unit_type_id, num_units) " +
                    "VALUES (?,?,?)");
            ps.setLong(1, productId);
            ps.setLong(2, unitTypeId);
            ps.setInt(3, numUnits);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException creating unit");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating unit");
        } catch (Exception e) {
            throw new EJBException("Exception creating unit:\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "createUnit");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createUnit");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createUnit");
                }
            }
        }
    }

    /**
     *
     *
     * @param productId product ID of the entry
     * @param unitTypeId unit type ID of the entry
     *
     * @return the entry's number of units
     */
    public int getNumUnits(long productId, long unitTypeId) {
        log.debug("getNumUnits called...product_id: " + productId +
                " unitTypeId: " + unitTypeId);

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

            ps = conn.prepareStatement("SELECT num_units FROM unit WHERE " +
                    "product_id = ? AND unit_type_id = ?");
            ps.setLong(1, productId);
            ps.setLong(2, unitTypeId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getInt("num_units");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting unit_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting unit_type_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_type_id\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getNumUnits");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getNumUnits");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getNumUnits");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getNumUnits");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param productId product ID of entry to set
     * @param unitTypeId unit type ID of entry to set
     * @param numUnits the number of units to set to
     */
    public void setNumUnits(long productId, long unitTypeId, int numUnits) {
        log.debug("setNumUnits called...productId: " + productId +
                " unitTypeId: " + unitTypeId + " numUnits: " + numUnits);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE unit SET num_units = ? " +
                    "WHERE product_id = ? AND " +
                    "unit_type_id = ?");
            ps.setInt(1, numUnits);
            ps.setLong(2, productId);
            ps.setLong(3, unitTypeId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong cost of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating num_units");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating num_units");
        } catch (Exception e) {
            throw new EJBException("Exception updating num_units\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setNumUnits");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setNumUnits");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setNumUnits");
                }
            }
        }
    }

    /**
     *
     * @param unitTypeId
     * @return String
     * @throws RemoteException
     * @throws EJBException
     */
    public String getUnitDescription(long productId, long unitTypeId)
            throws RemoteException, EJBException {
        log.debug("getUnitDescription called... productId: " + productId +
                "unitTypeId: " + unitTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(
                    (String) ctx.lookup("java:comp/env/datasource_name")
            );
            conn = ds.getConnection();

            ps = conn.prepareStatement(
                    "SELECT unit_type_desc FROM unit_type_lu WHERE " +
                    "unit_type_id = ?"
            );
            ps.setLong(1, unitTypeId);
            rs = ps.executeQuery();

            if (rs.next()) {
                ret = rs.getString("unit_type_desc");
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting unit_type_desc");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting unit_type_desc");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_type_desc\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in " +
                            "getUnitDescription");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error(
                            "FAILED to close PreparedStatement in " +
                            "getUnitDescription"
                    );
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "getUnitDescription");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getUnitDescription");
                }
            }
        }
        return (ret);
    }
}
