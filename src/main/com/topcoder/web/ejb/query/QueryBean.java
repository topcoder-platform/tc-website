package com.topcoder.web.ejb.query;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

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
public class QueryBean extends BaseEJB {

    private static Logger log = Logger.getLogger(QueryBean.class);

    public long createQuery(String text, String name, int ranking, String dataSourceName)
            throws RemoteException, EJBException {
        log.debug("createQuery called...\ntext: " + text + "\nname: " +
                name + " ranking: " + ranking);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        long ret = 0;

        try {
            StringBuffer query = new StringBuffer();
            query.append(" INSERT INTO query");
            query.append(" (query_id, text, name, ranking)");
            query.append(" VALUES (?, ?, ?, ?)");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ret = getNextValue();
            ps.setLong(1, ret);
            ps.setBytes(2, DBMS.serializeTextString(text));
            ps.setString(3, name);
            ps.setInt(4, ranking);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows +
                        " \ntext: " + text + "\nname: " +
                        name + " ranking: " + ranking);
            return ret;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating query, \ntext: " + text + "\nname: " +
                    name + " ranking: " + ranking);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception creating query, \ntext: " + text + "\nname: " +
                    name + " ranking: " + ranking + "\n " + e.getMessage());
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

    public void setText(long queryId, String text, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setText called...query: " + queryId + "\ntext: " + text);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE query");
            query.append(" SET text = ?");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setBytes(1, DBMS.serializeTextString(text));
            ps.setLong(2, queryId);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " + rows + " for query: " +
                        queryId + "\ntext: " + text);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating query: " + queryId + "\ntext: " + text);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating query: " + queryId + "\ntext: " + text +
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

    public void setName(long queryId, String name, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setName called...query: " + queryId + " name: " + name);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE query");
            query.append(" SET name = ?");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, name);
            ps.setLong(2, queryId);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " + rows + " for query: " +
                        queryId + " name: " + name);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating query: " + queryId + " name: " + name);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating query: " + queryId + " name: " + name +
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

    public void setRanking(long queryId, int ranking, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setRanking called...query: " + queryId + " ranking: " + ranking);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE query");
            query.append(" SET ranking = ?");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, ranking);
            ps.setLong(2, queryId);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " + rows + " for query: " +
                        queryId + " ranking: " + ranking);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating query: " + queryId + " ranking: " + ranking);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating query: " + queryId + " ranking: " + ranking +
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

    public void setColumnIndex(long queryId, int columnIndex, String dataSourceName) throws RemoteException, EJBException {
        log.debug("setColumnIndex called...query: " + queryId + " column index: " + columnIndex);

        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" UPDATE query");
            query.append(" SET column_index = ?");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, columnIndex);
            ps.setLong(2, queryId);
            int rows = ps.executeUpdate();
            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " + rows + " for query: " +
                        queryId + " column_index: " + columnIndex);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating query: " + queryId + " column index: " + columnIndex);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception updating query: " + queryId + " column index: " + columnIndex +
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

    public String getText(long queryId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getText called...query: " + queryId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        String ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT text");
            query.append(" FROM query");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = DBMS.getTextString(rs, 1);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting text for query: " + queryId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting text for query: " + queryId + "\n " + e.getMessage());
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

    public String getName(long queryId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getName called...query: " + queryId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        String ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT name");
            query.append(" FROM query");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getString("name");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting name for query: " + queryId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting name for query: " + queryId + "\n " + e.getMessage());
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

    public int getRanking(long queryId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getRanking called...query: " + queryId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        int ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT ranking");
            query.append(" FROM query");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getInt("ranking");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting ranking for query: " + queryId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting ranking for query: " + queryId + "\n " + e.getMessage());
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

    public int getColumnIndex(long queryId, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getColumnIndex called...query: " + queryId);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        int ret = 0;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT column_index");
            query.append(" FROM query");
            query.append(" WHERE query_id = ?");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, queryId);
            rs = ps.executeQuery();
            if (rs.next())
                ret = rs.getInt("column_index");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting column index for query: " + queryId);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting column index for query: " + queryId + "\n " + e.getMessage());
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

    public ResultSetContainer getAllQueries(boolean includeText, String dataSourceName) throws RemoteException, EJBException {
        log.debug("getAllQueries called...includeText: " + includeText);

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Context ctx = null;
        DataSource ds = null;
        ResultSetContainer ret = null;
        try {
            StringBuffer query = new StringBuffer();
            query.append(" SELECT query_id");
            query.append(" , lower(name)");
            query.append(" , name");
            if (includeText)
                query.append(" , text");
            query.append(" , ranking");
            query.append(" , column_index");
            query.append(" FROM query");
            query.append(" ORDER BY 2 ASC");
            ctx = new InitialContext();
            if (dataSourceName == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(dataSourceName);
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            ret = new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting all queries, include text: " + includeText);
        } catch (NamingException e) {
            throw new EJBException("Naming exception, probably couldn't find DataSource named: " + dataSourceName);
        } catch (Exception e) {
            throw new EJBException("Exception getting all queries, include text: " + includeText + "\n " + e.getMessage());
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

        long ret = 0;
        try {
            ret = IdGeneratorClient.getSeqId("QUERY_SEQ");

        } catch (Exception e) {
            throw new EJBException("Exception getting sequence\n " + e.getMessage());
        }
        return ret;
    }


}


