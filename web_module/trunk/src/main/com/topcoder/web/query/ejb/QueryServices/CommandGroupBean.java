package com.topcoder.web.query.ejb.QueryServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
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
public class CommandGroupBean extends BaseEJB {

    private static Logger log = Logger.getLogger(CommandGroupBean.class);
    private String dataSourceName;

    public void createCommandGroup(String commandGroupName) throws RemoteException, EJBException {
        log.debug("createCommandGroup called...name: " + commandGroupName);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer();
            query.append(" INSERT INTO command_group_lu");
            query.append(" (command_group_id, command_group_name)");
            query.append(" VALUES (?, ?)");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, getNextValue());
            ps.setString(2, commandGroupName);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in insert: " + rows +
                    " name: " + commandGroupName);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating command group: " + commandGroupName);
        } catch (Exception e) {
            throw new EJBException("Exception creating command group: " + commandGroupName +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }

    }

    public void setCommandGroupName(int commandGroupId, String commandGroupName) throws RemoteException, EJBException {
        log.debug("setCommandGroupName called...group: " + commandGroupId + " name: " + commandGroupName);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE command_group_lu");
            query.append(   " SET command_group_name = ?");
            query.append( " WHERE command_group_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, commandGroupName);
            ps.setInt(2, commandGroupId);
            int rows = ps.executeUpdate();
            if (rows!=1) throw new EJBException("Wrong number of rows in update: " + rows + " for group: " + commandGroupId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating command name, command: " + commandGroupId + " name: " + commandGroupName);
        } catch (Exception e) {
            throw new EJBException("Exception updating command name, command: " + commandGroupId + " name: " + commandGroupName +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }

    }

    public String getCommandGroupName(int commandGroupId) throws RemoteException, EJBException {
        log.debug("getCommandGroupName called...command: " + commandGroupId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        String ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT command_group_name");
            query.append(  " FROM command_group_lu");
            query.append( " WHERE command_group_id = ?");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, commandGroupId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getString("command_group_name");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting group name for command: " + commandGroupId);
        } catch (Exception e) {
            throw new EJBException("Exception getting group name for command: " + commandGroupId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    public ResultSetContainer getAllCommandGroups() throws RemoteException, EJBException {
        log.debug("getAllCommandGroups called...");

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        ResultSetContainer ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT command_group_name");
            query.append(     " , command_group_id");
            query.append(  " FROM command_group_lu");
            ctx = new InitialContext();
            if (dataSourceName==null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting all command groups");
        } catch (Exception e) {
            throw new EJBException("Exception getting all command groups\n " + e.getMessage());
        } finally {
            if (rs != null) {try {rs.close();} catch (Exception ignore) {log.error("FAILED to close ResultSet");}}
            if (ps != null) {try {ps.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context");}}
        }
        return ret;
    }

    private int getNextValue() {
        log.debug("getNextValue called...");

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        int ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append("  EXECUTE PROCEDURE nextval(?)");
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, DBMS.COMMAND_GROUP_SEQ);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getInt(1);
            else throw new SQLException("nextval() did not return a value");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting sequence");
        } catch (Exception e) {
            throw new EJBException("Exception getting sequence\n " + e.getMessage());
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


