package com.topcoder.web.ejb.query;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;

import javax.ejb.EJBException;
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
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public class InputBean extends BaseEJB {

    private static Logger log = Logger.getLogger(InputBean.class);

    public long createInput(String inputCode, int dataTypeId, String inputDesc, String dataSourceName)
            throws RemoteException, EJBException {
        log.debug("createInput called...input code: " + inputCode + " data type: " +
                dataTypeId + " desc: " + inputDesc);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append(" INSERT INTO input_lu");
            query.append(" (input_id, input_code, data_type_id, input_desc)");
            query.append(" VALUES (?, ?, ?, ?)");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ret = getNextValue();
            ps.setLong(1, ret);
            ps.setString(2, inputCode);
            ps.setInt(3, dataTypeId);
            ps.setString(4, inputDesc);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows +
                    " code: " + inputCode + " data type: " + dataTypeId +
                    " desc: " + inputDesc);
            return ret;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating input, code: " + inputCode +
                    " data type: " + dataTypeId + " desc: " + inputDesc);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception creating input, code: " + inputCode +
                    " data type: " + dataTypeId + " desc: " + inputDesc + "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }

    public void setInputCode(long inputId, String inputCode, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setInputCode called...input: " + inputId + " code: " + inputCode);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE input_lu");
            query.append(   " SET input_code = ?");
            query.append( " WHERE input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, inputCode);
            ps.setLong(2, inputId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for input: " +
                    inputId + " code: " + inputCode);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating input: " + inputId + " code: " + inputCode);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating input: " + inputId + " code: " + inputCode +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }
    public void setDataTypeId(long inputId, int dataTypeId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setDataTypeId called...input: " + inputId + " data type: " + dataTypeId);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE input_lu");
            query.append(   " SET data_type_id = ?");
            query.append( " WHERE input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, dataTypeId);
            ps.setLong(2, inputId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for input: " +
                    inputId + " data type: " + dataTypeId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating input: " + inputId + " data type: " + dataTypeId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating input: " + inputId + " data type: " + dataTypeId +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }
    public void setInputDesc(long inputId, String inputDesc, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setInputDesc called...input: " + inputId + " code: " + inputDesc);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE input_lu");
            query.append(   " SET input_desc = ?");
            query.append( " WHERE input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, inputDesc);
            ps.setLong(2, inputId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for input: " +
                    inputId + " desc: " + inputDesc);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating input: " + inputId + " desc: " + inputDesc);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating input: " + inputId + " desc: " + inputDesc +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }

    }

    public String getInputCode(long inputId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getInputCode called...input: " + inputId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        String ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT input_code");
            query.append(  " FROM input_lu");
            query.append( " WHERE input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, inputId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getString("input_code");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting input code for input: " + inputId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting input code for input: " + inputId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;

    }

    public int getDataTypeId(long inputId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getDataTypeId called...input: " + inputId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        int ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT data_type_id");
            query.append(  " FROM input_lu");
            query.append( " WHERE input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, inputId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getInt("data_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting data type for input: " + inputId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting data type for input: " + inputId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;

    }

    public String getInputDesc(long inputId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getInputDesc called...input: " + inputId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        String ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT input_desc");
            query.append(  " FROM input_lu");
            query.append( " WHERE input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, inputId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getString("input_desc");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting input desc for input: " + inputId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting input desc for input: " + inputId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public ResultSetContainer getAllInputs(String dataSourceName) throws RemoteException, EJBException {
        log.debug("getAllInputs called...");

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        ResultSetContainer ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT i.input_id");
            query.append(     " , i.input_code");
            query.append(     " , i.input_desc");
            query.append(     " , i.data_type_id");
            query.append(     " , LOWER(input_code)");
            query.append(  " FROM input_lu i");
            query.append( " ORDER BY 5 ASC");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting all inputs");
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting all inputs \n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }


    public boolean inputCodeExists(String inputCode, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getInputId called...input code: " + inputCode);

         ResultSet rs = null;
         PreparedStatement ps = null;
         Connection conn = null;
         Context ctx = null;
         DataSource ds = null;
         boolean ret = false;
         try {
             StringBuffer query = new StringBuffer();
             query.append(" SELECT input_id");
             query.append(  " FROM input_lu");
             query.append( " WHERE input_code = ?");
             ctx = new InitialContext();
             if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
             ds = (DataSource)ctx.lookup(dataSourceName);
             conn = ds.getConnection();
             ps = conn.prepareStatement(query.toString());
             ps.setString(1, inputCode);
             rs = ps.executeQuery();
             if (rs.next())
                 ret = true;
         } catch (SQLException sqe) {
             DBMS.printSqlException(true, sqe);
             throw new EJBException("SQLException checking if input code exists: " + inputCode);
         } catch (NamingException e) {
             throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
         } catch (Exception e) {
             throw new EJBException("Exception checking if input code exists: " + inputCode + "\n " + e.getMessage());
         } finally {
             if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
             if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
             if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
             if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
         }
         return ret;
     }

    private long getNextValue() {
        log.debug("getNextValue called...");

        Context ctx = null;
        long ret = 0;
        try {
            ctx = new InitialContext();
            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), (DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME),
                        "sequence_object", "name", "current_value", 9999999999L, 1, false);
            }
            ret = IdGenerator.nextId("INPUT_SEQ");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting sequence\n" + sqe.getMessage());
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + DBMS.OLTP_DATASOURCE_NAME);
        } catch (Exception e) {
            throw new EJBException("Exception getting sequence\n " + e.getMessage());
        } finally {
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }


}


