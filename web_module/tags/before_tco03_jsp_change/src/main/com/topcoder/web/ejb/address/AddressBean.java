package com.topcoder.web.ejb.address;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
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
public class AddressBean extends BaseEJB {
    private static Logger log = Logger.getLogger(AddressBean.class);

    /**
     *
     *
     * @return a long with the unique address ID created
     */
    public long createAddress(String dataSource, String idDataSource) {
        log.debug("createAddress called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(
                        new SimpleDB(),
                        (DataSource) ctx.lookup(idDataSource),
                        "sequence_object",
                        "name",
                        "current_value",
                        9999999999L,
                        1,
                        false
                );
            }

            ret = IdGenerator.nextId("ADDRESS_SEQ");

            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO address (address_id) " +
                    "VALUES (?)");
            ps.setLong(1, ret);
            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating address");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating address");
        } catch (Exception e) {
            throw new EJBException("Exception creating address:\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
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
    public long getAddressTypeId(long addressId, String dataSource) {
        log.debug("getAddressTypeId called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT address_type_id FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("address_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting address_type_id");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address type ID");
        } catch (Exception e) {
            throw new EJBException("Exception getting address_type_id\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public String getAddress1(long addressId, String dataSource) {
        log.debug("getAddress1 called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT address1 FROM address WHERE " +
                    "address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("address1");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting address1");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address 1");
        } catch (Exception e) {
            throw new EJBException("Exception getting address1\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public String getAddress2(long addressId, String dataSource) {
        log.debug("getAddress2 called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT address2 FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("address2");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting address2");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address 2");
        } catch (Exception e) {
            throw new EJBException("Exception getting address2\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public String getAddress3(long addressId, String dataSource) {
        log.debug("getAddress3 called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT address3 FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("address3");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting address3");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address 3");
        } catch (Exception e) {
            throw new EJBException("Exception getting address2\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public String getCity(long addressId, String dataSource) {
        log.debug("getCity called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT city FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("city");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting city");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting city");
        } catch (Exception e) {
            throw new EJBException("Exception getting city\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public String getStateCode(long addressId, String dataSource) {
        log.debug("getStateCode called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT state_code FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("state_code");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting state_code");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting state code");
        } catch (Exception e) {
            throw new EJBException("Exception getting state_code\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }


    /**
     *
     *
     * @param addressId the address ID of the entry
     *
     * @return a String with the entry's province
     *
     * @throws EJBException
     */
    public String getProvince(long addressId, String dataSource) {
        log.debug("getProvince called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT province FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("province");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting province");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting province");
        } catch (Exception e) {
            throw new EJBException("Exception getting province\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public String getZip(long addressId, String dataSource) {
        log.debug("getZip called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT zip FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("zip");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting zip");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting zip");
        } catch (Exception e) {
            throw new EJBException("Exception getting zip\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public String getCountryCode(long addressId, String dataSource) {
        log.debug("getCountryCode called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT country_code FROM address " +
                    "WHERE address_id = ?");
            ps.setLong(1, addressId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("country_code");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting country code");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting country code");
        } catch (Exception e) {
            throw new EJBException("Exception getting country_code\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
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
    public void setAddressTypeId(long addressId, long addressTypeId, String dataSource) {
        log.debug("setAddressTypeId called...addressId: " + addressId +
                " addressTypeId: " + addressTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
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
            close(ps);
            close(conn);
            close(ctx);
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
    public void setAddress1(long addressId, String address1, String dataSource) {
        log.debug("setAddress1 called...addressId: " + addressId +
                " address1: " + address1);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " address1: " + address1);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address 1");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " address1: " + address1 +
                    "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
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
    public void setAddress2(long addressId, String address2, String dataSource) {
        log.debug("setAddress2 called...addressId: " + addressId +
                " address2: " + address2);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " address2: " + address2);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address 2");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " address2: " + address2 +
                    "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param address3 the address line 3 to set to
     *
     * @throws EJBException
     */
    public void setAddress3(long addressId, String address3, String dataSource) {
        log.debug("setAddress3 called...addressId: " + addressId +
                " address3: " + address3);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET address3 = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, address3);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " address3: " + address3);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " address3: " + address3);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address 3");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " address3: " + address3 +
                    "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
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
    public void setCity(long addressId, String city, String dataSource) {
        log.debug("setCity called...addressId: " + addressId + " city: " +
                city);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " city: " + city);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating city");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " city: " + city + "\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
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
    public void setStateCode(long addressId, String stateCode, String dataSource) {
        log.debug("setStateCode called...addressId: " + addressId +
                " stateCode: " + stateCode);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: '" +
                    addressId + "' state_code: " + stateCode);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating state code");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " state_code: " + stateCode +
                    "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


    /**
     *
     *
     * @param addressId address ID of entry to set
     * @param province the province to set to
     *
     * @throws EJBException
     */
    public void setProvince(long addressId, String province, String dataSource) {
        log.debug("setProvince called...addressId: " + addressId +
                " province: " + province);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE address SET province = ? " +
                    "WHERE address_id = ?");
            ps.setString(1, province);
            ps.setLong(2, addressId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows + " for address_id: " + addressId +
                        " province: " + province);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: '" +
                    addressId + "' province: " + province);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating state code");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " province: " + province +
                    "\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
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
    public void setZip(long addressId, String zip, String dataSource) {
        log.debug("setZip called...addressId: " + addressId + " zip: " + zip);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " +
                    addressId + " zip: " + zip);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating zip");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " +
                    addressId + " zip: " + zip + "\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
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
    public void setCountryCode(long addressId, String countryCode, String dataSource) {
        log.debug("setCountryCode called...addressId: " + addressId +
                " countryCode: " + countryCode);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
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
            close(ps);
            close(conn);
            close(ctx);
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
    public String getAddressTypeDesc(long addressId, String dataSource) {
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
            ds = (DataSource) ctx.lookup(dataSource);
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
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting address_type_desc");
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address type " +
                    "description");
        } catch (Exception e) {
            throw new EJBException("Exception getting address_type_desc\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (ret);
    }
}
