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
public class CommandBean extends BaseEJB {

    private static Logger log = Logger.getLogger(CommandBean.class);

    public long createCommand(String commandDesc, int commandGroupId, String dataSourceName)
            throws RemoteException, EJBException {
        log.debug("createCommand called...desc: " + commandDesc + " group: " + commandGroupId);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append(" INSERT INTO command");
            query.append(" (command_id, command_desc, command_group_id)");
            query.append(" VALUES (?, ?, ?)");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource) ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ret = getNextValue();
            ps.setLong(1, ret);
            ps.setString(2, commandDesc);
            ps.setInt(3, commandGroupId);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows +
                        " desc: " + commandDesc + " group: " + commandGroupId);
            return ret;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating command desc: " +
                    commandDesc + " group: " + commandGroupId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception creating command desc: " +
                    commandDesc + " group: " + commandGroupId + "\n " + e.getMessage());

        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
        }

    }

    public void setCommandDesc(long commandId, String commandDesc, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setCommandDesc called...command: " + commandId + " desc: " + commandDesc);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE command");
            query.append(" SET command_desc = ?");
            query.append(" WHERE command_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource) ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, commandDesc);
            ps.setLong(2, commandId);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " + rows + " for command: " +
                        commandId + " desc: " + commandDesc);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating command desc: " + commandId + " desc: " + commandDesc);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating command desc: " + commandId + " desc: " + commandDesc +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
        }

    }

    public void setCommandGroupId(long commandId, int commandGroupId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setCommandGroupId called...command: " + commandId + " group: " + commandGroupId);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE command");
            query.append(" SET command_group_id = ?");
            query.append(" WHERE command_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource) ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, commandGroupId);
            ps.setLong(2, commandId);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " + rows + " for command: " +
                        commandId + " group: " + commandGroupId);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating command group: " + commandId + " group: " + commandGroupId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating command group: " + commandId + " group: " + commandGroupId +
                    "\n " + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
        }

    }

    public String getCommandDesc(long commandId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getCommandDesc called...command: " + commandId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        String ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT command_desc");
            query.append(" FROM command");
            query.append(" WHERE command_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource) ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, commandId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getString("command_desc");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting command desc: " + commandId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting command desc: " + commandId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
        }
        return ret;
    }

    public int getCommandGroupId(long commandId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getCommandGroupId called...command: " + commandId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        int ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT command_group_id");
            query.append(" FROM command");
            query.append(" WHERE command_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource) ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, commandId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getInt("command_group_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting command group: " + commandId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting command group: " + commandId + "\n " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
        }
        return ret;


    }


    public ResultSetContainer getCommandList(String dataSourceName) throws RemoteException, EJBException {
        log.debug("getCommandList(String) called...");

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        ResultSetContainer ret;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT c.command_id");
            query.append(" , c.command_desc");
            query.append(" , c.command_group_id");
            query.append(" , cg.command_group_name");
            query.append(" , cg.command_group_id");
            query.append(" , LOWER(c.command_desc)");
            query.append(" , LOWER(cg.command_group_name)");
            query.append(" FROM command c");
            query.append(" , command_group_lu cg");
            query.append(" WHERE c.command_group_id = cg.command_group_id");
            query.append(" ORDER BY 7 ASC, 6 ASC");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource) ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting command list");
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting command list\n " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
        }
        return ret;
    }


    public ResultSetContainer getCommandList(String dataSourceName, int commandGroupId) throws RemoteException, EJBException {
        log.debug("getCommandList(String, int) called...");

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        ResultSetContainer ret;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT c.command_id");
            query.append(" , c.command_desc");
            query.append(" , c.command_group_id");
            query.append(" , cg.command_group_name");
            query.append(" , cg.command_group_id");
            query.append(" , LOWER(c.command_desc)");
            query.append(" FROM command c");
            query.append(" , command_group_lu cg");
            query.append(" WHERE c.command_group_id = cg.command_group_id");
            query.append("   AND c.command_group_id = ?");
            query.append(" ORDER BY 6 ASC");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            ds = (DataSource) ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, commandGroupId);
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting command list");
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting command list\n " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
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
                IdGenerator.init(new SimpleDB(), (DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME),
                        "sequence_object", "name", "current_value", 9999999999L, 1, false);
            }
            ret = IdGenerator.nextId("COMMAND_SEQ");

        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting sequence\n" + sqe.getMessage());
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + DBMS.OLTP_DATASOURCE_NAME);
        } catch (Exception e) {
            throw new EJBException("Exception getting sequence\n " + e.getMessage());
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context");
                }
            }
        }
        return ret;
    }

}


