package com.topcoder.sql.wrapper;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: mmurphy
 * Date: Nov 21, 2003
 * Time: 12:18:08 PM
 * To change this template use Options | File Templates.
 */
public class StatementWrapper implements Statement {

    private Long id;
    private long createTime;
    private ConnectionWrapper connectionWrapper;
    private Statement statement;

    /**
     * All ResultSetWrappers belonging to this StatementWrapper.
     * key - the ResultSet being wrapped
     * value - the ResultSetWrapper wrapping the ResultSet
     */
    private Map resultSetWrappers;

    private boolean isClosed;
    private ContentsNotClosedException contentsNotClosedException;
    private static Map statementWrappers = new HashMap();

    StatementWrapper(Statement statement, ConnectionWrapper connectionWrapper) {
        createTime = System.currentTimeMillis();
        id = IdGenerator.nextId();
        this.statement = statement;
        this.connectionWrapper = connectionWrapper;
        resultSetWrappers = new HashMap();
        isClosed = false;
        contentsNotClosedException = (ContentsNotClosedException) new ContentsNotClosedException("Statement is still open.").fillInStackTrace();
        statementWrappers.put(id, this);
    }

    public static StatementWrapper getStatementWrapper(Long id) {
        return (StatementWrapper) statementWrappers.get(id);
    }

    public Long getId() {
        return id;
    }

    public long getAge() {
        return System.currentTimeMillis() - createTime;
    }

    public Connection getConnection() throws SQLException {
        return connectionWrapper;
    }

    public Statement getStatement() {
        return statement;
    }

    public ResultSetWrapper[] getResultSetWrappers() {
        return (ResultSetWrapper[]) resultSetWrappers.values().toArray(new ResultSetWrapper[0]);
    }

    public void close() throws SQLException {
        close(false);
    }

    public void close(boolean quiet) throws SQLException {
        statement.close();
        isClosed = true;
        removeIfEmpty();
        connectionWrapper.removeIfEmpty();
    }

    void removeIfEmpty() {
        if (!isClosed) return;
        boolean successful = true;
        ResultSetWrapper[] resultSetWrappers = getResultSetWrappers();
        for (int i = 0; i < resultSetWrappers.length; i++) {
            if (!resultSetWrappers[i].isClosed()) {
                try {
                    resultSetWrappers[i].close();
//                    if (!quiet) {
//                        String message = "Successfully closed ResultSet; please clean up after yourself.";
//                        Exception ex = new ContentsNotClosedException(message);
//                        ex.fillInStackTrace().printStackTrace();
//                    }
                } catch (Exception e) {
                    successful = false;
//                    String message = "Unable to close ResultSet; please clean up after yourself.";
//                    Exception ex = new ContentsNotClosedException(message, e);
//                    ex.fillInStackTrace().printStackTrace();
                }
            }
        }
        if (successful) {
            connectionWrapper.remove(this);
            statementWrappers.remove(id);
        }
    }

    public boolean isClosed() {
        return isClosed;
    }

    public ContentsNotClosedException getCreationStackTrace() {
        return contentsNotClosedException;
    }

    ResultSet wrapResultSet(ResultSet resultSet) {
        synchronized (resultSetWrappers) {
            if (resultSetWrappers.containsKey(resultSet)) {
                return (ResultSet) resultSetWrappers.get(resultSet);
            } else {
                ResultSetWrapper wrapped = new ResultSetWrapper(resultSet, this);
                resultSetWrappers.put(resultSet, wrapped);
                return wrapped;
            }
        }
    }

    /**
     * Removes a ResultSetWrapper from this StatementWrapper's
     * Collection of ResultSetWrappers.<br>
     * This method is called by the ResultSetWrapper after it has
     * been closed.
     *
     * @param resultSetWrapper the ResultSetWrapper to remove
     */
    void remove(ResultSetWrapper resultSetWrapper) {
        resultSetWrappers.remove(resultSetWrapper.getResultSet());
    }

    public ResultSet executeQuery(String sql) throws SQLException {
        return wrapResultSet(statement.executeQuery(sql));
    }

    public int executeUpdate(String sql) throws SQLException {
        return statement.executeUpdate(sql);
    }

    public int getMaxFieldSize() throws SQLException {
        return statement.getMaxFieldSize();
    }

    public void setMaxFieldSize(int max) throws SQLException {
        statement.setMaxFieldSize(max);
    }

    public int getMaxRows() throws SQLException {
        return statement.getMaxRows();
    }

    public void setMaxRows(int max) throws SQLException {
        statement.setMaxRows(max);
    }

    public void setEscapeProcessing(boolean enable) throws SQLException {
        statement.setEscapeProcessing(enable);
    }

    public int getQueryTimeout() throws SQLException {
        return statement.getQueryTimeout();
    }

    public void setQueryTimeout(int seconds) throws SQLException {
        statement.setQueryTimeout(seconds);
    }

    public void cancel() throws SQLException {
        statement.cancel();
    }

    public SQLWarning getWarnings() throws SQLException {
        return statement.getWarnings();
    }

    public void clearWarnings() throws SQLException {
        statement.clearWarnings();
    }

    public void setCursorName(String name) throws SQLException {
        statement.setCursorName(name);
    }

    public boolean execute(String sql) throws SQLException {
        return statement.execute(sql);
    }

    public ResultSet getResultSet() throws SQLException {
        return wrapResultSet(statement.getResultSet());
    }

    public int getUpdateCount() throws SQLException {
        return statement.getUpdateCount();
    }

    public boolean getMoreResults() throws SQLException {
        return statement.getMoreResults();
    }

    public void setFetchDirection(int direction) throws SQLException {
        statement.setFetchDirection(direction);
    }

    public int getFetchDirection() throws SQLException {
        return statement.getFetchDirection();
    }

    public void setFetchSize(int rows) throws SQLException {
        statement.setFetchSize(rows);
    }

    public int getFetchSize() throws SQLException {
        return statement.getFetchSize();
    }

    public int getResultSetConcurrency() throws SQLException {
        return statement.getResultSetConcurrency();
    }

    public int getResultSetType() throws SQLException {
        return statement.getResultSetType();
    }

    public void addBatch(String sql) throws SQLException {
        statement.addBatch(sql);
    }

    public void clearBatch() throws SQLException {
        statement.clearBatch();
    }

    public int[] executeBatch() throws SQLException {
        return statement.executeBatch();
    }

    public boolean getMoreResults(int current) throws SQLException {
        return statement.getMoreResults(current);
    }

    public ResultSet getGeneratedKeys() throws SQLException {
        return wrapResultSet(statement.getGeneratedKeys());
    }

    public int executeUpdate(String sql, int autoGeneratedKeys) throws SQLException {
        return statement.executeUpdate(sql, autoGeneratedKeys);
    }

    public int executeUpdate(String sql, int columnIndexes[]) throws SQLException {
        return statement.executeUpdate(sql, columnIndexes);
    }

    public int executeUpdate(String sql, String columnNames[]) throws SQLException {
        return statement.executeUpdate(sql, columnNames);
    }

    public boolean execute(String sql, int autoGeneratedKeys) throws SQLException {
        return statement.execute(sql, autoGeneratedKeys);
    }

    public boolean execute(String sql, int columnIndexes[]) throws SQLException {
        return statement.execute(sql, columnIndexes);
    }

    public boolean execute(String sql, String columnNames[]) throws SQLException {
        return statement.execute(sql, columnNames);
    }

    public int getResultSetHoldability() throws SQLException {
        return statement.getResultSetHoldability();
    }
}
