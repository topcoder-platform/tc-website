package com.topcoder.web.ejb.address;

import com.topcoder.shared.util.logging.Logger;
//import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.*; // for SimpleDB() ?
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
*
* @author   George Nassar
* @version  $Revision$
*
*/

public class AddressBean implements SessionBean {

    private SessionContext ctx;
    private static Logger log = Logger.getLogger(UserBean.class);
    private static final String dataSourceName = "CORP_OLTP";
    private static final String idGenDataSourceName = "SCREENING_OLTP";

    //required ejb methods

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }

    public void ejbCreate() {

      //InitContext = new InitialContext(); // from BaseEJB
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext ctx) {

        this.ctx = ctx;
    }

    //business methods

    public long createAddress() {

        log.debug("createAddress called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), (DataSource)ctx.lookup(idGenDataSourceName), "sequence_object", "name", "current_value", 9999999999L, 1, true);
            }
            ret = IdGenerator.nextId("ADDRESS_SEQ");

            StringBuffer query = new StringBuffer();
            query.append("INSERT INTO address (address_id, create_date, modify_date) VALUES (");
            query.append(Long.toString(ret));
            query.append("','now','now')");

            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException creating address");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating address");
        } catch (Exception e) {
            throw new EJBException("Exception creating address:\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createAddress");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createAddress");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createAddress");}}
        }
        return(ret);
    }

    public long getAddressTypeId(long addressId) {

        log.debug("getAddressTypeId called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT address_type_id FROM address WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getLong("address_type_id");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting address_type_id for address_id: " + addressId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address type ID");
        } catch (Exception e) {
            throw new EJBException("Exception getting address_type_id for address_id: " + addressId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getAddressTypeId");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getAddressTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getAddressTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getAddressTypeId");}}
        }
        return (ret);
    }

    public String getAddress1(long addressId) {

        log.debug("getAddress1 called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT address1 FROM address WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("address1");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting address1 for address_id: " + addressId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address 1");
        } catch (Exception e) {
            throw new EJBException("Exception getting address1 for address_id: " + addressId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getAddress1");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getAddress1");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getAddress1");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getAddress1");}}
        }
        return (ret);
    }

    public String getAddress2(long addressId) {

        log.debug("getAddress2 called...address_id: " + addressId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT address2 FROM address WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            if (rs.next()) ret = rs.getString("address2");

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException getting address2 for address_id: " + addressId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting address 2");
        } catch (Exception e) {
            throw new EJBException("Exception getting address2 for address_id: " + addressId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getAddress2");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getAddress2");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getAddress2");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getAddress2");}}
        }
        return (ret);
    }

     public String getCity(long addressId) {

         log.debug("getCity called...address_id: " + addressId);

         Context ctx = null;
         PreparedStatement ps = null;
         ResultSet rs = null;
         Connection conn = null;
         DataSource ds = null;
         String ret = null;

         try {
             StringBuffer query = new StringBuffer();
             query.append("SELECT city FROM address WHERE address_id = ");
             query.append(Long.toString(addressId));

             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup(dataSourceName);
             conn = ds.getConnection();
             ps = conn.prepareStatement(query.toString());
             rs = ps.executeQuery();
             if (rs.next()) ret = rs.getString("city");

         } catch (SQLException sqe) {
             printSqlException(true, sqe);
             throw new EJBException("SQLException getting city for address_id: " + addressId);
         } catch (NamingException e) {
             throw new EJBException("NamingException getting city");
         } catch (Exception e) {
             throw new EJBException("Exception getting city for address_id: " + addressId + "\n" + e.getMessage());
         } finally {
             if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCity");}}
             if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCity");}}
             if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCity");}}
             if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCity");}}
         }
         return (ret);
     }

     public String getStateCode(long addressId) {

         log.debug("getStateCode called...address_id: " + addressId);

         Context ctx = null;
         PreparedStatement ps = null;
         ResultSet rs = null;
         Connection conn = null;
         DataSource ds = null;
         String ret = null;

         try {
             StringBuffer query = new StringBuffer();
             query.append("SELECT state_code FROM address WHERE address_id = ");
             query.append(Long.toString(addressId));

             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup(dataSourceName);
             conn = ds.getConnection();
             ps = conn.prepareStatement(query.toString());
             rs = ps.executeQuery();
             if (rs.next()) ret = rs.getString("state_code");

         } catch (SQLException sqe) {
             printSqlException(true, sqe);
             throw new EJBException("SQLException getting state_code for address_id: " + addressId);
         } catch (NamingException e) {
             throw new EJBException("NamingException getting state code");
         } catch (Exception e) {
             throw new EJBException("Exception getting state_code for address_id: " + addressId + "\n" + e.getMessage());
         } finally {
             if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getStateCode");}}
             if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getStateCode");}}
             if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getStateCode");}}
             if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getStateCode");}}
         }
         return (ret);
     }

     public String getZip(long addressId) {

         log.debug("getZip called...address_id: " + addressId);

         Context ctx = null;
         PreparedStatement ps = null;
         ResultSet rs = null;
         Connection conn = null;
         DataSource ds = null;
         String ret = null;

         try {
             StringBuffer query = new StringBuffer();
             query.append("SELECT zip FROM address WHERE address_id = ");
             query.append(Long.toString(addressId));

             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup(dataSourceName);
             conn = ds.getConnection();
             ps = conn.prepareStatement(query.toString());
             rs = ps.executeQuery();
             if (rs.next()) ret = rs.getString("zip");

         } catch (SQLException sqe) {
             printSqlException(true, sqe);
             throw new EJBException("SQLException getting zip for address_id: " + addressId);
         } catch (NamingException e) {
             throw new EJBException("NamingException getting zip");
         } catch (Exception e) {
             throw new EJBException("Exception getting zip for address_id: " + addressId + "\n" + e.getMessage());
         } finally {
             if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getZip");}}
             if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getZip");}}
             if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getZip");}}
             if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getZip");}}
         }
         return (ret);
     }

     public String getCountryCode(long addressId) {

         log.debug("getCountryCode called...address_id: " + addressId);

         Context ctx = null;
         PreparedStatement ps = null;
         ResultSet rs = null;
         Connection conn = null;
         DataSource ds = null;
         String ret = null;

         try {
             StringBuffer query = new StringBuffer();
             query.append("SELECT country_code FROM address WHERE address_id = ");
             query.append(Long.toString(addressId));

             ctx = new InitialContext();
             ds = (DataSource)ctx.lookup(dataSourceName);
             conn = ds.getConnection();
             ps = conn.prepareStatement(query.toString());
             rs = ps.executeQuery();
             if (rs.next()) ret = rs.getString("country_code");

         } catch (SQLException sqe) {
             printSqlException(true, sqe);
             throw new EJBException("SQLException getting country_code for address_id: " + addressId);
         } catch (NamingException e) {
             throw new EJBException("NamingException getting country code");
         } catch (Exception e) {
             throw new EJBException("Exception getting country_code for address_id: " + addressId + "\n" + e.getMessage());
         } finally {
             if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet in getCountryCode");}}
             if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in getCountryCode");}}
             if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in getCountryCode");}}
             if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in getCountryCode");}}
         }
         return (ret);
     }

    public void setAddressTypeId(long addressId, long addressTypeId) {

        log.debug("setAddressTypeId called...addressId: " + addressId + " addressTypeId: " + addressTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE address SET address_type_id = " + addressTypeId + ", modify_date = 'now' WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for address_id: " + addressId + " address_type_id: " + addressTypeId);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " + addressId + " address_type_id: " + addressTypeId);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address type ID");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " + addressId + " address_type_id: " + addressTypeId + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setAddressTypeId");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setAddressTypeId");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setAddressTypeId");}}
        }
    }

    public void setAddress1(long addressId, String address1) {

        log.debug("setAddress1 called...addressId: " + addressId + " address1: " + address1);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE address SET address1 = '" + address1 + "', modify_date = 'now' WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for address_id: " + addressId + " address1: " + address1);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " + addressId + " address1: " + address1);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address 1");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " + addressId + " address1: " + address1 + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setAddress1");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setAddress1");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setAddress1");}}
        }
    }

    public void setAddress2(long addressId, String address2) {

        log.debug("setAddress2 called...addressId: " + addressId + " address2: " + address2);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE address SET address2 = '" + address2 + "', modify_date = 'now' WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for address_id: " + addressId + " address2: " + address2);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " + addressId + " address2: " + address2);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating address 2");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " + addressId + " address2: " + address2 + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setAddress2");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setAddress2");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setAddress2");}}
        }
    }

    public void setCity(long addressId, String city) {

        log.debug("setCity called...addressId: " + addressId + " city: " + city);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE address SET city = '" + city + "', modify_date = 'now' WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for address_id: " + addressId + " city: " + city);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " + addressId + " city: " + city);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating city");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " + addressId + " city: " + city + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setCity");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setCity");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setCity");}}
        }
    }

    public void setStateCode(long addressId, String stateCode) {

        log.debug("setStateCode called...addressId: " + addressId + " stateCode: " + stateCode);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE address SET state_code = '" + stateCode + "', modify_date = 'now' WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for address_id: " + addressId + " state_code: " + stateCode);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: '" + addressId + "' state_code: " + stateCode);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating state code");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " + addressId + " state_code: " + stateCode + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setStateCode");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setStateCode");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setStateCode");}}
        }
    }

    public void setZip(long addressId, String zip) {

        log.debug("setZip called...addressId: " + addressId + " zip: " + zip);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE address SET zip = '" + zip + "', modify_date = 'now' WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for address_id: " + addressId + " zip: " + zip);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " + addressId + " zip: " + zip);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating zip");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " + addressId + " zip: " + zip + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setZip");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setZip");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setZip");}}
        }
    }

    public void setCountryCode(long addressId, String countryCode) {

        log.debug("setCountryCode called...addressId: " + addressId + " countryCode: " + countryCode);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append("UPDATE address SET country_code = '" + countryCode + "', modify_date = 'now' WHERE address_id = ");
            query.append(Long.toString(addressId));

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for address_id: " + addressId + " country_code: " + countryCode);

        } catch (SQLException sqe) {
            printSqlException(true, sqe);
            throw new EJBException("SQLException updating address_id: " + addressId + " country_code: " + countryCode);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating country code");
        } catch (Exception e) {
            throw new EJBException("Exception updating address_id: " + addressId + " country_code: " + countryCode + "\n" + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in setCountryCode");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in setCountryCode");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in setCountryCode");}}
        }
    }
}

