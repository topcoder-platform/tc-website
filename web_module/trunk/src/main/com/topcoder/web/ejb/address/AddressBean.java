package com.topcoder.web.ejb.address;

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
 * Bean which modifies Address table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class AddressBean implements SessionBean {
    private static Logger log = Logger.getLogger(AddressBean.class);
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
     *
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    //business methods

    /**
     *
     *
     * @return a long with the unique address ID created
     */
    public long createAddress() {
        log.debug("createAddress called...");

        Context ctx = null;
        PreparedStatement ps = null;
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
                        true
                );
            }

            ret = IdGenerator.nextId("ADDRESS_SEQ");

            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO address (address_id) " +
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
            throw new EJBException("SQLException creating address");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating address");
        } catch (Exception e) {
            throw new EJBException("Exception creating address:\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "createAddress");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in createAddress");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createAddress");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a long with the entry's address type ID
     *
     * @throws EJBException
     */
    public long getAddressTypeId(long addressId) {
        log.debug("getAddressTypeId called...address_id: " + addressId);

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

            ps = conn.prepareStatement("SELECT address_type_id FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("address_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting address_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address type ID");
        } catch (Exception e) {
            throw new EJBException("Exception getting address_type_id\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getAddressTypeId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getAddressTypeId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "getAddressTypeId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getAddressTypeId");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's address line 1
     *
     * @throws EJBException
     */
    public String getAddress1(long addressId) {
        log.debug("getAddress1 called...address_id: " + addressId);

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

            ps = conn.prepareStatement("SELECT address1 FROM address WHERE " +
                    "address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("address1");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting address1");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address 1");
        } catch (Exception e) {
            throw new EJBException("Exception getting address1\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getAddress1");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getAddress1");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getAddress1");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getAddress1");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's address line 2
     *
     * @throws EJBException
     */
    public String getAddress2(long addressId) {
        log.debug("getAddress2 called...address_id: " + addressId);

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

            ps = conn.prepareStatement("SELECT address2 FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("address2");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting address2");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address 2");
        } catch (Exception e) {
            throw new EJBException("Exception getting address2\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getAddress2");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getAddress2");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getAddress2");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getAddress2");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's city
     *
     * @throws EJBException
     */
    public String getCity(long addressId) {
        log.debug("getCity called...address_id: " + addressId);

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

            ps = conn.prepareStatement("SELECT city FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("city");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting city");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting city");
        } catch (Exception e) {
            throw new EJBException("Exception getting city\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getCity");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getCity");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getCity");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getCity");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's state code
     *
     * @throws EJBException
     */
    public String getStateCode(long addressId) {
        log.debug("getStateCode called...address_id: " + addressId);

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

            ps = conn.prepareStatement("SELECT state_code FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("state_code");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting state_code");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting state code");
        } catch (Exception e) {
            throw new EJBException("Exception getting state_code\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getStateCode");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getStateCode");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getStateCode");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getStateCode");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's zip code
     *
     * @throws EJBException
     */
    public String getZip(long addressId) {
        log.debug("getZip called...address_id: " + addressId);

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

            ps = conn.prepareStatement("SELECT zip FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("zip");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting zip");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting zip");
        } catch (Exception e) {
            throw new EJBException("Exception getting zip\n" + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getZip");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getZip");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getZip");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getZip");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's country code
     *
     * @throws EJBException
     */
    public String getCountryCode(long addressId) {
        log.debug("getCountryCode called...address_id: " + addressId);

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

            ps = conn.prepareStatement("SELECT country_code FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("country_code");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting country code");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting country code");
        } catch (Exception e) {
            throw new EJBException("Exception getting country_code\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getCountryCode");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getCountryCode");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getCountryCode");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getCountryCode");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param addressTypeId the address type to set to
     *
     * @throws EJBException
     */
    public void setAddressTypeId(long addressId, long addressTypeId) {
        log.debug("setAddressTypeId called...addressId: " + addressId +
                " addressTypeId: " + addressTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET address_type_id =" +
                    " ? WHERE address_id = ?");
            ps.setLong(1, addressTypeId);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " address_type_id: " + addressTypeId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " address_type_id: " +
                    addressTypeId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address type ID");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " address_type_id: " +
                    addressTypeId + "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setAddressTypeId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "setAddressTypeId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setAddressTypeId");
                }
            }
        }
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param address1 the address line 1 to set to
     *
     * @throws EJBException
     */
    public void setAddress1(long addressId, String address1) {
        log.debug("setAddress1 called...addressId: " + addressId +
                " address1: " + address1);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET address1 = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, address1);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " address1: " + address1);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " address1: " + address1);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address 1");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " address1: " + address1 +
                    "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setAddress1");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setAddress1");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setAddress1");
                }
            }
        }
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param address2 the address line 2 to set to
     *
     * @throws EJBException
     */
    public void setAddress2(long addressId, String address2) {
        log.debug("setAddress2 called...addressId: " + addressId +
                " address2: " + address2);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET address2 = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, address2);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " address2: " + address2);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " address2: " + address2);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address 2");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " address2: " + address2 +
                    "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setAddress2");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setAddress2");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setAddress2");
                }
            }
        }
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param city the city to set to
     *
     * @throws EJBException
     */
    public void setCity(long addressId, String city) {
        log.debug("setCity called...addressId: " + addressId + " city: " +
                city);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET city = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, city);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " city: " + city);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " city: " + city);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating city");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " city: " + city + "\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setCity");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setCity");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setCity");
                }
            }
        }
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param stateCode the state code to set to
     *
     * @throws EJBException
     */
    public void setStateCode(long addressId, String stateCode) {
        log.debug("setStateCode called...addressId: " + addressId +
                " stateCode: " + stateCode);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET state_code = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, stateCode);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " state_code: " + stateCode);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating address_id: '" +
                    addressId + "' state_code: " + stateCode);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating state code");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " state_code: " + stateCode +
                    "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setStateCode");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setStateCode");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setStateCode");
                }
            }
        }
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param zip the zip code to set to
     *
     * @throws EJBException
     */
    public void setZip(long addressId, String zip) {
        log.debug("setZip called...addressId: " + addressId + " zip: " + zip);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET zip = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, zip);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " zip: " + zip);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " zip: " + zip);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating zip");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " zip: " + zip + "\n" +
                    e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setZip");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setZip");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setZip");
                }
            }
        }
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param countryCode the country code to set to
     *
     * @throws EJBException
     */
    public void setCountryCode(long addressId, String countryCode) {
        log.debug("setCountryCode called...addressId: " + addressId +
                " countryCode: " + countryCode);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET country_code = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, countryCode);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " country_code: " + countryCode);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " country_code: " +
                    countryCode);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating country code");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " country_code: " +
                    countryCode + "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "setCountryCode");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setCountryCode");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setCountryCode");
                }
            }
        }
    }

    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's address type ID
     *
     * @throws EJBException
     */
    public String getAddressTypeDesc(long addressId) {
        log.debug("getAddressTypeDesc called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;
        long addressTypeId = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup((String) ctx.lookup(
                    "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT address_type_id " +
                    "FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                addressTypeId = rs.getLong("address_type_id");

            ps = conn.prepareStatement("SELECT address_type_desc " +
                    "FROM address_type_lu " +
                    "WHERE address_type_id = ?");
            ps.setLong(1, addressTypeId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("address_type_desc");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                    true,
                    sqe);
            throw new EJBException("SQLException getting address_type_desc");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address type " +
                    "description");
        } catch (Exception e) {
            throw new EJBException("Exception getting address_type_desc\n" +
                    e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in " +
                            "getAddressTypeDesc");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getAddressTypeDesc");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                            "getAddressTypeDesc");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getAddressTypeDesc");
                }
            }
        }
        return (ret);
    }
}
