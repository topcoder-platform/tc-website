package com.topcoder.sql.wrapper;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Wraps a Connection.<p>
 * All undocumented methods simply delegate to the wrapped
 * Connection.
 *
 * @author veredox
 * @version Copyright 2003, TopCoder Software, Inc.  All rights reserved.
 */
public class ConnectionWrapper implements Connection {

    private Long id;
    private long createTime;

    /**
     * The DriverWrapper to which this ConnectionWrapper belongs.
     */
    private DriverWrapper driverWrapper;

    /**
     * The Connection being wrapped.
     */
    private Connection connection;

    /**
     * All StatementWrappers belonging to this ConnectionWrapper.
     * key - the Statement being wrapped
     * value - the StatementWrapper wrapping the Statement
     */
    private Map statementWrappers;

    /**
     * The Exception created during instantiation to store the
     * stacktrace to the creation of the Connection.
     */
    private ContentsNotClosedException contentsNotClosedException;

    private static Map connectionWrappers = new HashMap();

    /**
     * Creates a new ConnectionWrapper
     *
     * @param connection the Connection to wrap
     * @param driverWrapper the DriverWrapper to which this
     *        ConnectionWrapper belongs
     */
    ConnectionWrapper(Connection connection, DriverWrapper driverWrapper) {
        createTime = System.currentTimeMillis();
        id = IdGenerator.nextId();
        this.connection = connection;
        this.driverWrapper = driverWrapper;
        statementWrappers = new HashMap();
        contentsNotClosedException = (ContentsNotClosedException) new ContentsNotClosedException("Connection still open.").fillInStackTrace();
        connectionWrappers.put(id, this);
    }

    public static ConnectionWrapper getConnectionWrapper(Long id) {
        return (ConnectionWrapper) connectionWrappers.get(id);
    }

    public Long getId() {
        return id;
    }

    public long getAge() {
        return System.currentTimeMillis() - createTime;
    }

    /**
     * Gets the DriverWrapper to which this ConnectionWrapper belongs
     *
     * @return the DriverWrapper to which this ConnectionWrapper belongs
     */
    public Driver getDriver() {
        return driverWrapper;
    }

    /**
     * Gets the Connection wrapped by this ConnectionWrapper
     *
     * @return the Connection wrapped by this ConnectionWrapper
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * Gets all StatementWrappers belonging to this ConnectionWrapper
     *
     * @return all StatementWrappers belonging to this ConnectionWrapper
     */
    public StatementWrapper[] getStatementWrappers() {
        return (StatementWrapper[]) statementWrappers.values().toArray(new StatementWrapper[0]);
    }

    /**
     * Closes the ConnectionWrapper (and subsequently, the Connection).<br>
     * If after the Connection is closed, any StatementWrappers
     * belonging to this ConnectionWrapper are left open, a stack trace
     * leading to the call to ConnectionWrapper.close() will be printed to
     * standard error.  An attempt will also be made to close the
     * StatementWrappers
     *
     * @throws SQLException if an exception is thrown when trying to close
     *         the Connection
     */
    public void close() throws SQLException {
        close(false);
    }

    /**
     * Closes the ConnectionWrapper (and subsequently, the Connection).<br>
     * If after the Connection is closed, any StatementWrappers
     * belonging to this ConnectionWrapper are left open, a stack trace
     * leading to the call to ConnectionWrapper.close() will be printed to
     * standard error.  An attempt will also be made to close the
     * StatementWrappers
     *
     * @param quiet if true, do not print successful closing of
     *        StatementWrappers to standard error
     * @throws SQLException if an exception is thrown when trying to close
     *         the Connection
     */
    public void close(boolean quiet) throws SQLException {
        connection.close();
        removeIfEmpty();
    }

    void removeIfEmpty() {
        try {
            if (!isClosed()) return;
        } catch (SQLException sqle) {
            //what do i do with it?
            return;
        }
        boolean successful = true;
        StatementWrapper[] statementWrappers = getStatementWrappers();
        for (int i = 0; i < statementWrappers.length; i++) {
            if (!statementWrappers[i].isClosed()) {
//                try {
//                    statementWrappers[i].close();
//                    if (!quiet) {
//                        String message = "Successfully closed Statement; please clean up after yourself.";
//                        Exception ex = new ContentsNotClosedException(message);
//                        ex.fillInStackTrace().printStackTrace();
//                    }
//                } catch (Exception e) {
                successful = false;
//                    String message = "Unable to close Statement; please clean up after yourself.";
//                    Exception ex = new ContentsNotClosedException(message, e);
//                    ex.fillInStackTrace().printStackTrace();
//                }
            }
        }
        if (successful) {
            driverWrapper.remove(this);
            connectionWrappers.remove(id);
        }
    }

    /**
     * Gets the stack trace associated with this ConnectionWrapper
     *
     * @return the stack trace associated with this ConnectionWrapper
     */
    public ContentsNotClosedException getCreationStackTrace() {
        return contentsNotClosedException;
    }

    /**
     * Wraps a Statement in a StatementWrapper
     *
     * @param statement the Statement to wrap
     * @return the StatementWrapper wrapping the Statement
     */
    Statement wrapStatement(Statement statement) {
        synchronized (statementWrappers) {
            if (statementWrappers.containsKey(statement)) {
                return (Statement) statementWrappers.get(statement);
            } else {
                StatementWrapper wrapped = new StatementWrapper(statement, this);
                statementWrappers.put(statement, wrapped);
                return wrapped;
            }
        }
    }

    /**
     * Wraps a PreparedStatement in a PreparedStatementWrapper
     *
     * @param preparedStatement the PreparedStatement to wrap
     * @return the PreparedStatementWrapper wrapping the PreparedStatement
     */
    PreparedStatement wrapPreparedStatement(PreparedStatement preparedStatement) {
        synchronized (statementWrappers) {
            if (statementWrappers.containsKey(preparedStatement)) {
                return (PreparedStatement) statementWrappers.get(preparedStatement);
            } else {
                PreparedStatementWrapper wrapped = new PreparedStatementWrapper(preparedStatement, this);
                statementWrappers.put(preparedStatement, wrapped);
                return wrapped;
            }
        }
    }

    /**
     * Wraps a CallableStatement in a CallableStatementWrapper
     *
     * @param callableStatement the CallableStatement to wrap
     * @return the CallableStatementWrapper wrapping the CallableStatement
     */
    CallableStatement wrapCallableStatement(CallableStatement callableStatement) {
        synchronized (statementWrappers) {
            if (statementWrappers.containsKey(callableStatement)) {
                return (CallableStatement) statementWrappers.get(callableStatement);
            } else {
                CallableStatementWrapper wrapped = new CallableStatementWrapper(callableStatement, this);
                statementWrappers.put(callableStatement, wrapped);
                return wrapped;
            }
        }
    }

    /**
     * Delegates to the Connection and returns a StatementWrapper
     *
     * @return a StatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public Statement createStatement() throws SQLException {
        return wrapStatement(connection.createStatement());
    }

    /**
     * Delegates to the Connection and returns a PreparedStatementWrapper
     *
     * @return a PreparedStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public PreparedStatement prepareStatement(String sql) throws SQLException {
        return wrapPreparedStatement(connection.prepareStatement(sql));
    }

    /**
     * Delegates to the Connection and returns a CallableStatementWrapper
     *
     * @return a CallableStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public CallableStatement prepareCall(String sql) throws SQLException {
        return wrapCallableStatement(connection.prepareCall(sql));
    }

    /**
     * Delegates to the Connection and returns a StatementWrapper
     *
     * @return a StatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public Statement createStatement(int resultSetType, int resultSetConcurrency) throws SQLException {
        return wrapStatement(connection.createStatement(resultSetType, resultSetConcurrency));
    }

    /**
     * Delegates to the Connection and returns a PreparedStatementWrapper
     *
     * @return a PreparedStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public PreparedStatement prepareStatement(String sql, int resultSetType, int resultSetConcurrency) throws SQLException {
        return wrapPreparedStatement(connection.prepareStatement(sql, resultSetType, resultSetConcurrency));
    }

    /**
     * Delegates to the Connection and returns a CallableStatementWrapper
     *
     * @return a CallableStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public CallableStatement prepareCall(String sql, int resultSetType, int resultSetConcurrency) throws SQLException {
        return wrapCallableStatement(connection.prepareCall(sql, resultSetType, resultSetConcurrency));
    }

    /**
     * Delegates to the Connection and returns a StatementWrapper
     *
     * @return a StatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public Statement createStatement(int resultSetType, int resultSetConcurrency, int resultSetHoldability) throws SQLException {
        return wrapStatement(connection.createStatement(resultSetType, resultSetConcurrency, resultSetHoldability));
    }

    /**
     * Delegates to the Connection and returns a PreparedStatementWrapper
     *
     * @return a PreparedStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public PreparedStatement prepareStatement(String sql, int resultSetType, int resultSetConcurrency, int resultSetHoldability) throws SQLException {
        return wrapPreparedStatement(connection.prepareStatement(sql, resultSetType, resultSetConcurrency, resultSetHoldability));
    }

    /**
     * Delegates to the Connection and returns a CallableStatementWrapper
     *
     * @return a CallableStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public CallableStatement prepareCall(String sql, int resultSetType, int resultSetConcurrency, int resultSetHoldability) throws SQLException {
        return wrapCallableStatement(connection.prepareCall(sql, resultSetType, resultSetConcurrency, resultSetHoldability));
    }

    /**
     * Delegates to the Connection and returns a PreparedStatementWrapper
     *
     * @return a PreparedStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public PreparedStatement prepareStatement(String sql, int autoGeneratedKeys) throws SQLException {
        return wrapPreparedStatement(connection.prepareStatement(sql, autoGeneratedKeys));
    }

    /**
     * Delegates to the Connection and returns a PreparedStatementWrapper
     *
     * @return a PreparedStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public PreparedStatement prepareStatement(String sql, int columnIndexes[]) throws SQLException {
        return wrapPreparedStatement(connection.prepareStatement(sql, columnIndexes));
    }

    /**
     * Delegates to the Connection and returns a PreparedStatementWrapper
     *
     * @return a PreparedStatementWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public PreparedStatement prepareStatement(String sql, String columnNames[]) throws SQLException {
        return wrapPreparedStatement(connection.prepareStatement(sql, columnNames));
    }

    /**
     * Removes a StatementWrapper from this ConnectionWrapper's
     * Collection of StatementWrappers.<br>
     * This method is called by the StatementWrapper after it has
     * been closed.
     *
     * @param statementWrapper the StatementWrapper to remove
     */
    void remove(StatementWrapper statementWrapper) {
        statementWrappers.remove(statementWrapper.getStatement());
    }

    //All methods below delegate to the wrapped Connection

    public boolean isClosed() throws SQLException {
        return connection.isClosed();
    }

    public String nativeSQL(String sql) throws SQLException {
        return connection.nativeSQL(sql);
    }

    public void setAutoCommit(boolean autoCommit) throws SQLException {
        connection.setAutoCommit(autoCommit);
    }

    public boolean getAutoCommit() throws SQLException {
        return connection.getAutoCommit();
    }

    public void commit() throws SQLException {
        connection.commit();
    }

    public void rollback() throws SQLException {
        connection.rollback();
    }

    public DatabaseMetaData getMetaData() throws SQLException {
        return connection.getMetaData();
    }

    public void setReadOnly(boolean readOnly) throws SQLException {
        connection.setReadOnly(readOnly);
    }

    public boolean isReadOnly() throws SQLException {
        return connection.isReadOnly();
    }

    public void setCatalog(String catalog) throws SQLException {
        connection.setCatalog(catalog);
    }

    public String getCatalog() throws SQLException {
        return connection.getCatalog();
    }

    public void setTransactionIsolation(int level) throws SQLException {
        connection.setTransactionIsolation(level);
    }

    public int getTransactionIsolation() throws SQLException {
        return connection.getTransactionIsolation();
    }

    public SQLWarning getWarnings() throws SQLException {
        return connection.getWarnings();
    }

    public void clearWarnings() throws SQLException {
        connection.clearWarnings();
    }

    public Map getTypeMap() throws SQLException {
        return connection.getTypeMap();
    }

    public void setTypeMap(Map map) throws SQLException {
        connection.setTypeMap(map);
    }

    public void setHoldability(int holdability) throws SQLException {
        connection.setHoldability(holdability);
    }

    public int getHoldability() throws SQLException {
        return connection.getHoldability();
    }

    public Savepoint setSavepoint() throws SQLException {
        return connection.setSavepoint();
    }

    public Savepoint setSavepoint(String name) throws SQLException {
        return connection.setSavepoint(name);
    }

    public void rollback(Savepoint savepoint) throws SQLException {
        connection.rollback(savepoint);
    }

    public void releaseSavepoint(Savepoint savepoint) throws SQLException {
        connection.releaseSavepoint(savepoint);
    }
}
