package com.topcoder.web.query.ejb.QueryServices;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.sql.*;
import java.util.List;


/**
 *
 * @author   Greg Paul
 * @version  $Revision$
 */
public class CommandQueryBean extends BaseEJB {

    private static Logger log = Logger.getLogger(CommandGroupBean.class);
    private String dataSourceName;

    public void createCommandQuery(long commandId, long queryId) throws RemoteException, EJBException {
        log.debug("createCommandQuery called...command: " + commandId + " query: " + queryId);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append(" INSERT INTO command_query_xref");
            query.append(" (command_id, query_id)");
            query.append(" VALUES (?, ?)");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, commandId);
            ps.setLong(2, queryId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows +
                    " command: " + commandId + " query: " + queryId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating command query: " + commandId + " query: " +
                    queryId);
        } catch (Exception e) {
            throw new EJBException("Exception creating command query: " + commandId + " query: " +
                    queryId + "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }

    public void setSortOrder(long commandId, long queryId, int sortOrder) throws RemoteException, EJBException {
        log.debug("setSortOrder called...command: " + commandId + " query: " + queryId + " sort: " + sortOrder);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE command_query_xref");
            query.append(   " SET sort_order = ?");
            query.append( " WHERE command_id = ?");
            query.append(   " AND query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, sortOrder);
            ps.setLong(2, commandId);
            ps.setLong(3, queryId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for command: " +
                    commandId + " query: " + queryId + " sort: " + sortOrder);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating command query sort, command: " +
                    commandId + " query: " + queryId + " sort: " + sortOrder);
        } catch (Exception e) {
            throw new EJBException("Exception updating command query sort, command: " +
                    commandId + " query: " + queryId + " sort: " + sortOrder + "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }

    public int getSortOrder(long commandId, long queryId) throws RemoteException, EJBException {
        log.debug("getSortOrder called...command: " + commandId + " query: " + queryId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        int ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT sort_order");
            query.append(  " FROM command_query_xref");
            query.append( " WHERE command_id = ?");
            query.append(   " AND query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, commandId);
            ps.setLong(2, queryId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getInt("sort_order");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting command query sort, command: " +
                    commandId + " query: " + queryId);
        } catch (Exception e) {
            throw new EJBException("Exception getting command query sort, command: " +
                    commandId + " query: " + queryId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public void removeCommandQuery(long commandId, long queryId) throws RemoteException, EJBException {
        log.debug("removeCommandQuery called...command: " + commandId + " query: " + queryId);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" DELETE");
            query.append(  " FROM command_query_xref");
            query.append( " WHERE command_id = ?");
            query.append(   " AND query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, commandId);
            ps.setLong(2, queryId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in delete: " + rows + " for command: " +
                    commandId + " query: " + queryId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException deleting command query, command: " +
                    commandId + " query: " + queryId);
        } catch (Exception e) {
            throw new EJBException("Exception deleting command query, command: " +
                    commandId + " query: " + queryId + "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
    }

    public ResultSetContainer getQueriesForCommand(long commandId) throws RemoteException, EJBException {
        log.debug("getQueriesForCommand called...command: " + commandId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        ResultSetContainer ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT q.query_id");
            query.append(     " , q.name");
            query.append(     " , cqx.command_id");
            query.append(     " , cqx.sort_order");
            query.append(  " FROM command_query_xref cqx");
            query.append(     " , query q");
            query.append( " WHERE cqx.command_id = ?");
            query.append(   " AND q.query_id = cqx.query_id");
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
            throw new EJBException("SQLException getting queries for command: " +commandId);
        } catch (Exception e) {
            throw new EJBException("Exception getting queries for command: " +
                    commandId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public void setDataSource(String dataSourceName) throws RemoteException, EJBException {
        this.dataSourceName = dataSourceName;
    }


}


