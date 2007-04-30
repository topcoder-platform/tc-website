package com.topcoder.sql.wrapper;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverPropertyInfo;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Wraps a Driver.<p>
 * All undocumented methods simply delegate to the wrapped
 * Connection.
 *
 * @author veredox
 * @version Copyright 2003, TopCoder Software, Inc.  All rights reserved.
 */
public class DriverWrapper implements Driver {

    private Long id;

    /**
     * The Driver being wrapped.
     */
    private Driver driver;

    /**
     * All ConnectionWrappers belonging to this DriverWrapper.
     * key - the Connection being wrapped
     * value - the ConnectionWrapper wrapping the Connection
     */
    private Map connectionWrappers;

    private static Map driverWrappers = new HashMap();

    /**
     * Creates a new DriverWrapper.<br>
     * All DriverWrappers register themselves with DriverWrapper home
     *
     * @param driver the Driver to wrap
     */
    protected DriverWrapper(Driver driver) {
        id = IdGenerator.nextId();
        this.driver = driver;
        connectionWrappers = new HashMap();
        driverWrappers.put(id, this);
    }

    public static DriverWrapper getDriverWrapper(Long id) {
        return (DriverWrapper) driverWrappers.get(id);
    }

    public static DriverWrapper[] getDriverWrappers() {
        return (DriverWrapper[]) driverWrappers.values().toArray(new DriverWrapper[0]);
    }

    public Long getId() {
        return id;
    }

    /**
     * Gets the Driver wrapped by this DriverWrapper
     *
     * @return the Driver wrapped by this DriverWrapper
     */
    public Driver getDriver() {
        return driver;
    }

    /**
     * Gets all ConnectionWrappers belonging to this DriverWrapper
     *
     * @return all ConnectionWrappers belonging to this DriverWrapper
     */
    public ConnectionWrapper[] getConnectionWrappers() {
        return (ConnectionWrapper[]) connectionWrappers.values().toArray(new ConnectionWrapper[0]);
    }

    /**
     * Wraps a Connection in a ConnectionWrapper
     *
     * @param connection the Connection to wrap
     * @return the ConnectionWrapper wrapping the Connection
     */
    Connection wrapConnection(Connection connection) {
        synchronized (connectionWrappers) {
            if (connectionWrappers.containsKey(connection)) {
                return (Connection) connectionWrappers.get(connection);
            } else {
                ConnectionWrapper wrapped = new ConnectionWrapper(connection, this);
                connectionWrappers.put(connection, wrapped);
                return wrapped;
            }
        }
    }

    /**
     * Delegates to the Driver and returns a ConnectionWrapper
     *
     * @return a ConnectionWrapper
     * @throws SQLException if the call to the delegatee throws
     *         an SQLException
     */
    public Connection connect(String s, Properties properties) throws SQLException {
        return wrapConnection(driver.connect(s, properties));
    }

    /**
     * Removes a ConnectionWrapper from this DriverWrapper's
     * Collection of ConnectionWrappers.<br>
     * This method is called by the ConnectionWrapper after it has
     * been closed.
     *
     * @param connectionWrapper the ConnectionWrapper to remove
     */
    void remove(ConnectionWrapper connectionWrapper) {
        connectionWrappers.remove(connectionWrapper.getConnection());
    }

    //All methods below delegate to the wrapped Driver

    public boolean acceptsURL(String s) throws SQLException {
        return driver.acceptsURL(s);
    }

    public DriverPropertyInfo[] getPropertyInfo(String s, Properties properties) throws SQLException {
        return driver.getPropertyInfo(s, properties);
    }

    public int getMajorVersion() {
        return driver.getMajorVersion();
    }

    public int getMinorVersion() {
        return driver.getMinorVersion();
    }

    public boolean jdbcCompliant() {
        return driver.jdbcCompliant();
    }
}
