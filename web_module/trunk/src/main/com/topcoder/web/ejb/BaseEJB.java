package com.topcoder.web.ejb;

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

public abstract class BaseEJB implements SessionBean {
    private SessionContext ctx;
    private static Logger log = Logger.getLogger(BaseEJB.class);

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
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    protected int insert(String tableName, String[] colNames, String[] colValues, String dataSource) {
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

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < colNames.length; i++) {
                    ps.setString(i + 1, colValues[i]);
                }

                int rc = ps.executeUpdate();
                return rc;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } finally {
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }


    protected int delete(String tableName, String[] colNames, String[] colValues, String dataSource) {
        if (colNames.length != colValues.length)
            throw new IllegalArgumentException("name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("delete from ").append(tableName).append(" where ");
            for (int i = 0; i < colNames.length; i++) {
                query.append(colNames[i]).append(" = ?");
                if (colNames.length > 1 && i != colNames.length - 1)
                    query.append(" and ");
            }

            log.debug(query);

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < colNames.length; i++) {
                    ps.setString(i + 1, colValues[i]);
                }

                int rc = ps.executeUpdate();
                return rc;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } finally {
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }

    protected int update(String tableName, String[] colNames, String[] colValues,
                         String[] constraintNames, String[] constraintValues, String dataSource) {
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

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            try {

                conn = DBMS.getConnection(dataSource);
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
                throw new EJBException(e);
            } finally {
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }

    protected int updateDate(String tableName, String colName, Date colValue,
                             String[] constraintNames, String[] constraintValues, String dataSource) {
        if (constraintNames.length != constraintValues.length)
            throw new IllegalArgumentException("contraint name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("update ").append(tableName).append(" set ");
            query.append(colName);
            query.append(" = ?");
            query.append(" where ");
            for (int i = 0; i < constraintNames.length; i++) {
                query.append(constraintNames[i]).append(" = ?");
                if (constraintNames.length > 1 && i != constraintNames.length - 1)
                    query.append(" and ");
            }

            log.debug(query);

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                ps.setDate(1, colValue);
                for (int j = 0; j < constraintNames.length; j++) {
                    ps.setString(j + 2, constraintValues[j]);
                }
                int rc = ps.executeUpdate();
                return rc;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } finally {
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }

    protected int updateTimestamp(String tableName, String colName, Timestamp colValue,
                                  String[] constraintNames, String[] constraintValues, String dataSource) {
        if (constraintNames.length != constraintValues.length)
            throw new IllegalArgumentException("contraint name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("update ").append(tableName).append(" set ");
            query.append(colName);
            query.append(" = ?");
            query.append(" where ");
            for (int i = 0; i < constraintNames.length; i++) {
                query.append(constraintNames[i]).append(" = ?");
                if (constraintNames.length > 1 && i != constraintNames.length - 1)
                    query.append(" and ");
            }

            log.debug(query);

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                ps.setTimestamp(1, colValue);
                for (int j = 0; j < constraintNames.length; j++) {
                    ps.setString(j + 2, constraintValues[j]);
                }
                int rc = ps.executeUpdate();
                return rc;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } finally {
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }


    protected Integer selectInt(String tableName, String colName, String[] colNames, String[] colValues, String dataSource) throws RowNotFoundException {
        String sRet = selectString(tableName, colName, colNames, colValues, dataSource);
        Integer ret = null;
        if (!(sRet == null || sRet.trim().equals(""))) {
            ret = new Integer(sRet);
        }
        return ret;
    }

    protected Double selectDouble(String tableName, String colName, String[] colNames, String[] colValues, String dataSource) throws RowNotFoundException {
        String sRet = selectString(tableName, colName, colNames, colValues, dataSource);
        Double ret = null;
        if (!(sRet == null || sRet.trim().equals(""))) {
            ret = new Double(sRet);
        }
        return ret;
    }

    protected Long selectLong(String tableName, String colName, String[] colNames, String[] colValues, String dataSource) throws RowNotFoundException {
        String sRet = selectString(tableName, colName, colNames, colValues, dataSource);
        Long ret = null;
        if (!(sRet == null || sRet.trim().equals(""))) {
            ret = new Long(sRet);
        }
        return ret;
    }

    protected String selectString(String tableName, String colName, String[] colNames, String[] colValues, String dataSource) throws RowNotFoundException {
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

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            ResultSet rs = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < colNames.length; i++) {
                    ps.setString(i + 1, colValues[i]);
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
                throw new EJBException(e);
            } finally {
                close(rs);
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }


    protected Date selectDate(String tableName, String colName, String[] colNames, String[] colValues, String dataSource) throws RowNotFoundException {
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

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            ResultSet rs = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < colNames.length; i++) {
                    ps.setString(i + 1, colValues[i]);
                }

                rs = ps.executeQuery();
                Date ret = null;
                if (rs.next()) {
                    ret = rs.getDate(colName);
                } else {
                    throw new RowNotFoundException("no row found for " + query.toString());
                }
                return ret;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } finally {
                close(rs);
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }

    protected Timestamp selectTimestamp(String tableName, String colName, String[] colNames, String[] colValues, String dataSource) throws RowNotFoundException {
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

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            ResultSet rs = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < colNames.length; i++) {
                    ps.setString(i + 1, colValues[i]);
                }

                rs = ps.executeQuery();
                Timestamp ret = null;
                if (rs.next()) {
                    ret = rs.getTimestamp(colName);
                } else {
                    throw new RowNotFoundException("no row found for " + query.toString());
                }
                return ret;
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } finally {
                close(rs);
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }


    protected ResultSetContainer selectSet(String tableName, String colNames[], String[] constraintColNames,
                                           String[] constraintColValues, String dataSource) {
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

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            ResultSet rs = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < constraintColNames.length; i++) {
                    ps.setString(i + 1, constraintColValues[i]);
                }
                rs = ps.executeQuery();
                return new ResultSetContainer(rs);

            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } catch (Exception e) {
                throw new EJBException(e);
            } finally {
                close(rs);
                close(ps);
                close(conn);
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

}
