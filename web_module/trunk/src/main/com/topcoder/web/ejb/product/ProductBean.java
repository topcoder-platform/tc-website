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
import java.sql.*;


/**
 * Bean which modifies Product table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class ProductBean implements SessionBean {
    private static Logger log = Logger.getLogger(ProductBean.class);
    private SessionContext ctx;


    //business methods

    /**
     *
     *
     * @param cost the cost to assign to a product
     *
     * @return a long with the unique product ID created
     */
    public long createProduct(float cost) {
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
                    "cost) VALUES (?,?)");
            ps.setLong(1, ret);
            ps.setFloat(2, cost);

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
     * @return a long with the terms of use id associated with this product
     */
    public long getTermsOfUseId(long productId) {
        log.debug("getTermsOfUseId called...product_id: " + productId);

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

            ps = conn.prepareStatement("SELECT terms_of_use_id FROM product " +
                    "WHERE product_id = ?");
            ps.setLong(1, productId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("terms_of_use_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException getting terms of use id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting terms of use id");
        } catch (Exception e) {
            throw new EJBException("Exception getting terms of use id\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getTermsOfUseId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getTermsOfUseId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getTermsOfUseId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getTermsOfUseId");
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
     * @param termsOfUseId the id of the terms of use entry associated with this product
     */
    public void setTermsOfUseId(long productId, long termsOfUseId) {
        log.debug("setTermsOfUseId called...productId: " + productId + "terms of use id: " +
                termsOfUseId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE product SET terms_of_use_id = ? " +
                    "WHERE product_id = ?");
            ps.setLong(1, termsOfUseId);
            ps.setLong(2, productId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong cost of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating termsOfUseIdt");
        } catch (NamingException e) {
            throw new EJBException("NamingException updating termsOfUseId");
        } catch (Exception e) {
            throw new EJBException("Exception updating termsOfUseId\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setTermsOfUseId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setTermsOfUseId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setTermsOfUseId");
                }
            }
        }
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
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }


    /**
     * by djFD 19/03/2002
     *
     * @param productId product ID of entry to set
     * @param redirectURL an URL to return user to, after successfull purchase
     * completion
     */
    public void setProductRedirectionURL(long productId, String redirectURL) {
        log.debug(
            "setProductRedirectionURL called... [productId,  redirectURL]=["
            + productId + ", "+ redirectURL
        );

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(
                (String) ctx.lookup("java:comp/env/datasource_name")
            );
            conn = ds.getConnection();
            ps = conn.prepareStatement(
                "UPDATE product SET redirect_url = ? WHERE product_id = ?"
            );
            ps.setString(1, redirectURL);
            ps.setLong(2, productId);

            int rows = ps.executeUpdate();

            if (rows != 1) {
                throw new EJBException(
                    "Wrong number of rows in update: " + rows
                );
            }
        }
        catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException updating redirectURL");
        }
        catch (NamingException e) {
            throw new EJBException("NamingException updating redirectURL");
        }
        catch (Exception e) {
            throw new EJBException("Exception updating redirectURL\n" +e.getMessage());
        }
        finally {
            if( ps != null ) {
                try {
                    ps.close();
                }
                catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setProductRedirectionURL");
                }
            }

            if( conn != null ) {
                try {
                    conn.close();
                }
                catch (Exception ignore) {
                    log.error("FAILED to close Connection in setProductRedirectionURL");
                }
            }

            if( ctx != null ) {
                try {
                    ctx.close();
                }
                catch (Exception ignore) {
                    log.error("FAILED to close Context in setProductRedirectionURL");
                }
            }
        }
    }
    
    /**
     * by djFD 19/03/2003
     * 
     * @param productId product ID of the entry
     * @return a String with redirection URL, ie. an URL where user will be
     * redirected to, upon successfull purchase completion
     */
    public String getRedirectionURL( long productId ) {
        log.debug("getRedirectionURL called... product_id: " + productId);

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
                "SELECT redirect_url FROM product WHERE product_id = ?"
            );
            ps.setLong(1, productId);
            rs = ps.executeQuery();

            if (rs.next()) {
                ret = rs.getString("redirect_url");
            }
        }
        catch (SQLException sqe) {
            DBMS.printSqlException(true,sqe);
            throw new EJBException("SQLException getting redirect_url");
        }
        catch (NamingException e) {
            throw new EJBException("NamingException getting redirect_url");
        }
        catch (Exception e) {
            throw new EJBException("Exception getting redirect_url\n" + e.getMessage());
        }
        finally {
            if( rs != null ) {
                try {
                    rs.close();
                }
                catch( Exception ignore ) {
                    log.error("FAILED to close ResultSet in getRedirectionURL");
                }
            }
            if( ps != null ) {
                try {
                    ps.close();
                }
                catch( Exception ignore ) {
                    log.error("FAILED to close PreparedStatement in getRedirectionURL");
                }
            }
            if( conn != null ) {
                try {
                    conn.close();
                }
                catch( Exception ignore ) {
                    log.error("FAILED to close Connection in getRedirectionURL");
                }
            }

            if( ctx != null ) {
                try {
                    ctx.close();
                }
                catch( Exception ignore ) {
                    log.error("FAILED to close Context in getRedirectionURL");
                }
            }
        }
        return (ret);
    }
}
