package com.topcoder.web.ejb.product;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
 * Bean which modifies ProductUnit table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class ProductUnitBean implements SessionBean {
    private static Logger log = Logger.getLogger(ProductUnitBean.class);
    private SessionContext ctx;


    //business methods

    /**
     *
     *
     * @param productId the product ID to insert
     * @param unitId the unit type ID to insert
     * @param numUnits the number of units to insert
     */
    public void createProductUnit(long productId, long unitId, int numUnits)
            throws RemoteException, EJBException {
        log.debug("createProductUnit called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;

        try {
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO product_unit_xref (product_id, " +
                    "unit_id, num_units) " +
                    "VALUES (?,?,?)");
            ps.setLong(1, productId);
            ps.setLong(2, unitId);
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
                            "createProductUnit");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createProductUnit");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createProductUnit");
                }
            }
        }
    }

    /**
     *
     *
     * @param productId product ID of the entry
     * @param unitId unit type ID of the entry
     *
     * @return the entry's number of units
     */
    public int getNumUnits(long productId, long unitId)
        throws RemoteException, EJBException {
        log.debug("getNumUnits called...product_id: " + productId +
                " unitId: " + unitId);

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

            ps = conn.prepareStatement("SELECT num_units FROM product_unit_xref WHERE " +
                    "product_id = ? AND unit_id = ?");
            ps.setLong(1, productId);
            ps.setLong(2, unitId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getInt("num_units");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting unit_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting unit_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_id\n" +
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
     * @param productId product ID of the entry
     *
     * @return
     */
    public ResultSetContainer getUnits(long productId)
        throws RemoteException, EJBException {
        log.debug("getNumUnits called...product_id: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        ResultSetContainer ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            StringBuffer query = new StringBuffer(150);
            query.append("SELECT u.unit_id");
            query.append(    " , u.unit_desc");
            query.append(    " , u.unit_type_id");
            query.append( " FROM product_unit_xref p");
            query.append(    " , unit u");
            query.append(" WHERE p.product_id = ?");
            query.append(  " AND p.unit_id = u.unit_id");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, productId);
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException getting unit_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting unit_id");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_id\n" + e.getMessage());
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
     * @param unitId unit type ID of entry to set
     * @param numUnits the number of units to set to
     */
    public void setNumUnits(long productId, long unitId, int numUnits)
        throws RemoteException, EJBException {
        log.debug("setNumUnits called...productId: " + productId +
                " unitId: " + unitId + " numUnits: " + numUnits);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE product_unit_xref SET num_units = ? " +
                    "WHERE product_id = ? AND " +
                    "unit_id = ?");
            ps.setInt(1, numUnits);
            ps.setLong(2, productId);
            ps.setLong(3, unitId);

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
     * @param unitId
     * @return String
     * @throws RemoteException
     * @throws EJBException
     */
    public String getUnitDescription(long productId, long unitId)
            throws RemoteException, EJBException {
        log.debug("getUnitDescription called... productId: " + productId +
                "unitId: " + unitId);

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

            ps = conn.prepareStatement("SELECT u.unit_desc FROM product_unit_xref p, unit u WHERE " +
                    "p.unit_id = u.unit_id and product_id = ? and p.unit_id = ?");
            ps.setLong(1, productId);
            ps.setLong(2, unitId);
            rs = ps.executeQuery();

            if (rs.next()) {
                ret = rs.getString("unit_desc");
            }
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting unit_desc");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting unit_desc");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_desc\n" +
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


}
