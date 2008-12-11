/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.*;

/**
 * Base class for Beans with common DB operations.
 *
 * @author TCSDEVELOPER, pulky
 * @version 1.0.0
 */
public abstract class BaseEJB implements SessionBean {
    private static Logger log = Logger.getLogger(BaseEJB.class);

    //required ejb methods
    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }

    public void ejbCreate() {
    }

    public void ejbRemove() {
    }

    public void setSessionContext(SessionContext ctx) {
    }

    protected int insert(Connection conn, String tableName, String[] colNames, String[] colValues) {
        if (colNames.length != colValues.length)
            throw new IllegalArgumentException("name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("insert into ").append(tableName).append(" (");
            for (int i = 0; i < colNames.length; i++) {
                query.append(colNames[i]);
                if (colNames.length > 1 && i != colNames.length - 1)
                    query.append(", ");
            }
            query.append(") values (");
            for (int i = 0; i < colValues.length; i++) {
                query.append("?");
                if (colValues.length > 1 && i != colValues.length - 1)
                    query.append(", ");
            }
            query.append(")");
            log.debug(query);

            PreparedStatement ps = null;
            InitialContext ctx = null;
            try {
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < colNames.length; i++) {
                    if (colValues[i] != null) {
                        ps.setString(i + 1, colValues[i]);
                        log.debug(colNames[i] + " - " + colValues[i]);
                    } else {
                        ps.setNull(i + 1, Types.OTHER);
                    }
                }
                int rc = ps.executeUpdate();
                return rc;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw(new EJBException(e.getMessage()));
            } finally {
                close(ps);
                close(ctx);
            }

        }
    }

    protected int update(Connection conn, String tableName, String[] colNames, String[] colValues,
                         String[] constraintNames, String[] constraintValues) {
        if (colNames.length != colValues.length)
            throw new IllegalArgumentException("name and value arrays don't have the same number of elements.");
        else if (constraintNames.length != constraintValues.length)
            throw new IllegalArgumentException("contraint name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("update ").append(tableName).append(" set ");
            for (int i = 0; i < colNames.length; i++) {
                query.append(colNames[i]).append(" = ?");
                if (colNames.length > 1 && i != colNames.length - 1)
                    query.append(", ");
            }
            query.append(" where ");
            for (int i = 0; i < constraintNames.length; i++) {
                query.append(constraintNames[i]).append(" = ?");
                if (constraintNames.length > 1 && i != constraintNames.length - 1)
                    query.append(" and ");
            }

            log.debug(query);

            PreparedStatement ps = null;
            InitialContext ctx = null;
            try {
                ps = conn.prepareStatement(query.toString());
                int i = 0;
                for (; i < colNames.length; i++) {
                    ps.setString(i + 1, colValues[i]);
                }
                for (int j = 0; j < constraintNames.length; j++, i++) {
                    ps.setString(i + 1, constraintValues[j]);
                }
                int rc = ps.executeUpdate();
                return rc;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw(new EJBException(e.getMessage()));
            } finally {
                close(ps);
                close(ctx);
            }

        }
    }

    protected Long selectLong(Connection conn, String tableName, String colName, String[] colNames, String[] colValues) throws RowNotFoundException{
        String sRet = selectString(conn, tableName, colName, colNames, colValues);
        Long ret = null;
        if (!(sRet == null || sRet.trim().equals(""))) {
            ret = new Long(sRet);
        }
        return ret;
    }

    protected String selectString(Connection conn, String tableName, String colName, String[] colNames, String[] colValues) throws RowNotFoundException {
        if (colNames.length != colValues.length)
            throw new IllegalArgumentException("name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("select ").append(colName).append(" from ").append(tableName).append(" where ");
            for (int i = 0; i < colNames.length; i++) {
                query.append(colNames[i]).append(" = ?");
                if (colNames.length > 1 && i != colNames.length - 1)
                    query.append(" and ");
            }

            log.debug(query);

            PreparedStatement ps = null;
            ResultSet rs = null;
            try {

                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < colNames.length; i++) {
                    ps.setString(i + 1, colValues[i]);
                    log.debug(colNames[i] + " - " + colValues[i]);
                }

                rs = ps.executeQuery();
                String ret = null;
                if (rs.next()) {
                    ret = rs.getString(colName);
                } else {
                    throw new RowNotFoundException("no row found for " + query.toString());
                }
                return ret;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e.getMessage());
            } finally {
                close(rs);
                close(ps);
            }
        }
    }

    protected ResultSetContainer selectSet(String tableName, String colNames[], String[] constraintColNames,
                                           String[] constraintColValues, Connection conn) {
        if (constraintColNames.length != constraintColValues.length)
            throw new IllegalArgumentException("name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("select ");
            for (int i = 0; i < colNames.length; i++) {
                query.append(colNames[i]);
                if (colNames.length > 1 && i != colNames.length - 1)
                    query.append(", ");
            }

            query.append(" from ").append(tableName).append(" where ");
            for (int i = 0; i < constraintColNames.length; i++) {
                query.append(constraintColNames[i]).append(" = ?");
                if (constraintColNames.length > 1 && i != constraintColNames.length - 1)
                    query.append(" and ");
            }

            log.debug(query);

            PreparedStatement ps = null;
            InitialContext ctx = null;
            ResultSet rs = null;
            try {
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < constraintColNames.length; i++) {
                    ps.setString(i + 1, constraintColValues[i]);
                    log.debug(constraintColNames[i] + " - " + constraintColValues[i]);
                }
                rs = ps.executeQuery();
                return new ResultSetContainer(rs);
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e.getMessage());
            } catch (Exception e) {
                throw new EJBException(e.getMessage());
            } finally {
                close(rs);
                close(ps);
                close(ctx);
            }

        }
    }

    protected void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                log.error("FAILED to close ResultSet.");
                ignore.printStackTrace();
            }
        }
    }

    protected void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Connection.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Context.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                log.error("FAILED to close PreparedStatement.");
                ignore.printStackTrace();
            }
        }

    }

    protected void rollback(Connection conn) {
        if (conn != null) {
            try {
                conn.rollback();
            } catch (Exception e) {
            }
        }
    }

}
