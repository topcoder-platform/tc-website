package com.topcoder.web.ejb.product;

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
 * Bean which modifies Product table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class ProductBean implements SessionBean {
    private static Logger log = Logger.getLogger(ProductBean.class);
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
     * @param cost the cost to assign to a product
     * @param unitTypeId
     * @param numUnits
     *
     * @return a long with the unique product ID created
     */
    public long createProduct(long unitTypeId, int numUnits, float cost) {
        log.debug("createProduct called...");

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

            ret = IdGenerator.nextId("PRODUCT_SEQ");

            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO product (product_id, " +
                    "cost, unit_type_id, num_units) VALUES (?,?,?,?)");
            ps.setLong(1, ret);
            ps.setFloat(2, cost);
            ps.setLong(3, unitTypeId);
            ps.setInt(4, numUnits);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException creating product");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating product");
        } catch (Exception e) {
            throw new EJBException("Exception creating product:\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "createProduct");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createProduct");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createProduct");
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
     * @return a String with the entry's product description
     */
    public String getProductDesc(long productId) {
        log.debug("getProductDesc called...product_id: " + productId);

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

            ps = conn.prepareStatement("SELECT product_desc FROM product " +
                    "WHERE product_id = ?");
            ps.setLong(1, productId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("product_desc");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting product_desc");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting product_desc");
        } catch (Exception e) {
            throw new EJBException("Exception getting product_desc\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getProductDesc");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getProductDesc");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getProductDesc");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getProductDesc");
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
     * @return a float with the entry's cost
     */
    public float getCost(long productId) {
        log.debug("getCost called...product_id: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        float ret = (float) 0.0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT cost FROM product " +
                    "WHERE product_id = ?");
            ps.setLong(1, productId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getFloat("cost");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting cost");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting cost");
        } catch (Exception e) {
            throw new EJBException("Exception getting cost\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getCost");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getCost");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getCost");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getCost");
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
     * @return the entry's number of units
     */
    public int getNumUnits(long productId) {
        log.debug("getNumUnits called...product_id: " + productId);

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

            ps = conn.prepareStatement("SELECT num_units FROM product WHERE " +
                    "product_id = ?");
            ps.setLong(1, productId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getInt("num_units");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting num_units");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting num_units");
        } catch (Exception e) {
            throw new EJBException("Exception getting num_units\n" +
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
     * @return the entry's number of units
     */
    public long getUnitTypeId(long productId) {
        log.debug("getUnitTypeId called...product_id: " + productId);

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

            ps = conn.prepareStatement("SELECT unit_type_id FROM product WHERE " +
                    "product_id = ?");
            ps.setLong(1, productId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("unit_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
                    log.error("FAILED to close ResultSet in getUnitTypeId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getUnitTypeId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getUnitTypeId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getUnitTypeId");
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
     * @return the entry's number of units
     */
    public String getUnitTypeDesc(long productId) {
        log.debug("getUnitTypeDesc called...product_id: " + productId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = "";

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT u.unit_type_desc FROM product p, unit_type_lu u WHERE " +
                    "p.unit_type_id = u.unit_type_id and product_id = ?");
            ps.setLong(1, productId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("unit_type_desc");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
                    log.error("FAILED to close ResultSet in getUnitTypeDesc");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getUnitTypeDesc");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getUnitTypeDesc");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getUnitTypeDesc");
                }
            }
        }

        return (ret);
    }





    /**
     *
     *
     * @param productId product ID of entry to set
     * @param productDesc the product description to set to
     */
    public void setProductDesc(long productId, String productDesc) {
        log.debug("setProductDesc called...productId: " + productId +
                " productDesc: " + productDesc);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE product SET product_desc = ?" +
                    "WHERE product_id = ?");
            ps.setString(1, productDesc);
            ps.setLong(2, productId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating productDesc");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating productDesc");
        } catch (Exception e) {
            throw new EJBException("Exception updating productDesc\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setProductDesc");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setProductDesc");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setProductDesc");
                }
            }
        }
    }

    /**
     *
     *
     * @param productId product ID of entry to set
     * @param cost the cost to set to
     */
    public void setCost(long productId, float cost) {
        log.debug("setCost called...productId: " + productId + "cost: " +
                cost);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE product SET cost = ? " +
                    "WHERE product_id = ?");
            ps.setFloat(1, cost);
            ps.setLong(2, productId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong cost of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating cost");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating cost");
        } catch (Exception e) {
            throw new EJBException("Exception updating cost\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setCost");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setCost");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setCost");
                }
            }
        }
    }




    /**
     *
     *
     * @param productId product ID of entry to set
     * @param numUnits the number of units to set to
     */
    public void setNumUnits(long productId, int numUnits) {
        log.debug("setNumUnits called...productId: " + productId +
                 " numUnits: " + numUnits);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE product SET num_units = ? " +
                    "WHERE product_id = ?");
            ps.setInt(1, numUnits);
            ps.setLong(2, productId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
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
     *
     * @param productId product ID of entry to set
     * @param unitTypeId the number of units to set to
     */
    public void setUnitTypeId(long productId, int unitTypeId) {
        log.debug("setUnitTypeId called...productId: " + productId +
                 " unitTypeId: " + unitTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE product SET unit_type_id = ? " +
                    "WHERE product_id = ?");
            ps.setLong(1, unitTypeId);
            ps.setLong(2, productId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException updating unit_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating unit_type_id");
        } catch (Exception e) {
            throw new EJBException("Exception updating unit_type_id\n" +
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










}
