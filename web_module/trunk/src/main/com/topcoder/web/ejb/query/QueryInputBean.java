package com.topcoder.web.ejb.query;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

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
public class QueryInputBean extends BaseEJB {

    private static Logger log = Logger.getLogger(QueryInputBean.class);

    public void createQueryInput(long queryId, long inputId, String dataSourceName)
            throws RemoteException, EJBException {
        log.debug("createQueryInput called...query: " + queryId + " input: " + inputId);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append(" INSERT INTO query_input_xref");
            query.append(" (query_id, input_id)");
            query.append(" VALUES (?, ?)");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            ps.setLong(2, inputId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows +
                    " query: " + queryId + " input: " + inputId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating query input, query: " + queryId + " input: " +
                    inputId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception creating query input, query: " + queryId + " input: " + inputId
                    + "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }

    }

    public void setOptional(long queryId, long inputId, char optional, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setOptional called...query: " + queryId + " input: " + inputId + " optional: " + optional);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE query_input_xref");
            query.append(   " SET optional = ?");
            query.append( " WHERE query_id = ?");
            query.append(   " AND input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, ""+optional);
            ps.setLong(2, queryId);
            ps.setLong(3, inputId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for query: " +
                    queryId + " input: " + inputId + " optional: " + optional);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating query: " +
                    queryId + " input: " + inputId + " optional: " + optional);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating query: " +
                    queryId + " input: " + inputId + " optional: " + optional +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }

    }

    public void setDefaultValue(long queryId, long inputId, String defaultValue, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setDefaultValue called...query: " + queryId + " input: " + inputId + " default value: " + defaultValue);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE query_input_xref");
            query.append(   " SET default_value = ?");
            query.append( " WHERE query_id = ?");
            query.append(   " AND input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, defaultValue);
            ps.setLong(2, queryId);
            ps.setLong(3, inputId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for query: " +
                    queryId + " input: " + inputId + " default value: " + defaultValue);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating query: " + queryId + " input: " + inputId +
                    " default value: " + defaultValue);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating query: " + queryId + " input: " + inputId +
                    " default value: " + defaultValue + "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }

    public void setSortOrder(long queryId, long inputId, int sortOrder, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setSortOrder called...query: " + queryId + " input: " + inputId + " sort order: " + sortOrder);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE query_input_xref");
            query.append(   " SET sort_order = ?");
            query.append( " WHERE query_id = ?");
            query.append(   " AND input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, sortOrder);
            ps.setLong(2, queryId);
            ps.setLong(3, inputId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for query: " +
                    queryId + " input: " + inputId + " sort order: " + sortOrder);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating query: " + queryId + " input: " + inputId +
                    " sort order: " + sortOrder);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating query: " + queryId + " input: " + inputId +
                    " sort order: " + sortOrder + "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }

    public char getOptional(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getOptional called...query: " + queryId + " input: " + inputId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        char ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT optional");
            query.append(  " FROM query_input_xref");
            query.append( " WHERE query_id = ?");
            query.append(   " AND input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            ps.setLong(2, inputId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getString("optional").charAt(0);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting optional for query: " + queryId + " input: " + inputId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting optional for query: " + queryId + " input: " +
                    inputId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public String getDefaultValue(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getDefaultValue called...query: " + queryId + " input: " + inputId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        String ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT default_value");
            query.append(  " FROM query_input_xref");
            query.append( " WHERE query_id = ?");
            query.append(   " AND input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            ps.setLong(2, inputId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getString("default_value");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting default value for query: " + queryId + " input: " + inputId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting default value for query: " + queryId + " input: " + inputId +
                    "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public int getSortOrder(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getSortOrder called...query: " + queryId + " input: " + inputId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        int ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT sort_order");
            query.append(  " FROM query_input_xref");
            query.append( " WHERE query_id = ?");
            query.append(   " AND input_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            ps.setLong(2, inputId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getInt("sort_order");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting sort order for query: " + queryId + " input: " + inputId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting sort order for query: " + queryId + " input: " + inputId +
                    "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public void removeQueryInput(long queryId, long inputId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("removeQueryInput called...query: " + queryId + " input: " + inputId);

         PreparedStatement ps = null;
         Connection conn = null;
         Context ctx = null;
         DataSource ds = null;
         try {
             StringBuffer query = new StringBuffer();
             query.append(" DELETE");
             query.append(  " FROM query_input_xref");
             query.append( " WHERE query_id = ?");
             query.append(   " AND input_id = ?");
             ctx = new InitialContext();
             if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
             ds = (DataSource)ctx.lookup(dataSourceName);
             conn = ds.getConnection();
             ps = conn.prepareStatement(query.toString());
             ps.setLong(1, queryId);
             ps.setLong(2, inputId);
             int rows = ps.executeUpdate();
             if (rows!=1) throw new EJBException("Wrong number of rows in delete: " + rows + " for query: " +
                     queryId + " input: " + inputId);
         } catch (SQLException sqe) {
             DBMS.printSqlException(true, sqe);
             throw new EJBException("SQLException deleting query input, query: " +
                     queryId + " input: " + inputId);
         } catch (NamingException e) {
             throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
         } catch (Exception e) {
             throw new EJBException("Exception deleting query input, query: " +
                     queryId + " input: " + inputId + "\n " + e.getMessage());
         } finally {
             if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
             if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
             if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
         }
     }

    public ResultSetContainer getInputsForCommand(long commandId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getInputsForCommand called...command: " + commandId);

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
            query.append(     " , qix.query_id");
            query.append(  " FROM query_input_xref qix");
            query.append(     " , input_lu i");
            query.append(     " , command_query_xref cqx");
            query.append( " WHERE cqx.command_id = ?");
            query.append(   " AND cqx.query_id = qix.query_id");
            query.append(   " AND qix.input_id = i.input_id");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, commandId);
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting inputs for command: " +commandId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting inputs for command: " +
                    commandId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public ResultSetContainer getInputsForQuery(long queryId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getInputsForquery called...query: " + queryId);

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
            query.append(     " , qix.query_id");
            query.append(     " , qix.optional");
            query.append(     " , qix.default_value");
            query.append(     " , qix.sort_order");
            query.append(  " FROM query_input_xref qix");
            query.append(     " , input_lu i");
            query.append( " WHERE qix.query_id = ?");
            query.append(   " AND qix.input_id = i.input_id");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting inputs for query: " +queryId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting inputs for query: " +
                    queryId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }


}


