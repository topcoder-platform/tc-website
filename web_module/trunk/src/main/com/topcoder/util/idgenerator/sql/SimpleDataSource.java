package com.topcoder.util.idgenerator.sql;

import javax.sql.DataSource;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;

/**
 * The <code>DataSource</code> implementation that uses <code>DriverManager</code>.
 *
 *
 * <p>
 * Version 1.1 (TOPCODER - UPDATE BUILD SCRIPTS TO USE TOPCODER CACHE CLIENT MODULE) Change notes:
 *   <ol>
 *     <li>Added default implementation for methods introduced with JRE 1.7</li>
 *   </ol>
 * </p>
 * @version     1.1
 * @author      Timur Zambalayev, isv
 */
public class SimpleDataSource implements DataSource {

    private final String url;
    private final String username;
    private final String password;

    /**
     * Creates an instance of this class.
     *
     * @param jdbcDriverClassName           the JDBC driver's class name.
     * @param url                           a database url of the form <code>jdbc:<em>subprotocol</em>:<em>subname</em></code>.
     * @param username                      the database user on whose behalf the connection is being made.
     * @param password                      the user's password.
     * @throws ClassNotFoundException       if the class cannot be located.
     */
    public SimpleDataSource(String jdbcDriverClassName, String url, String username, String password)
            throws ClassNotFoundException {
        Class.forName(jdbcDriverClassName);
        this.url=url;
        this.username=username;
        this.password=password;
    }

    public Connection getConnection() throws SQLException {
        return getConnection(username, password);
    }

    public Connection getConnection(String username, String password) throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }

    public PrintWriter getLogWriter() {
        return DriverManager.getLogWriter();
    }

    public void setLogWriter(PrintWriter out) {
        DriverManager.setLogWriter(out);
    }

    public int getLoginTimeout() {
        return DriverManager.getLoginTimeout();
    }

    public void setLoginTimeout(int seconds) {
        DriverManager.setLoginTimeout(seconds);
    }

    // for jdk 1.7

    /**
     * <p>Return the parent Logger of all the Loggers used by this data source.</p>
     *
     * @return the parent Logger for this data source.
     * @since 1.1
     */
    public final Logger getParentLogger() {
        return Logger.getLogger(SimpleDataSource.class.getName());
    }

    /**
     * <p>Returns true if this either implements the interface argument or is directly or indirectly a wrapper for an
     * object that does. Returns false otherwise.</p>
     *
     * @return true always.
     * @since 1.1
     */
    public boolean isWrapperFor(Class<?> ignored) {
        return true;
    }

    /**
     * <p>Returns an object that implements the given interface to allow access to
     * non-standard methods, or standard methods not exposed by the proxy.</p>
     * 
     * @return null always.
     * @since 1.1
     */
    public <T> T unwrap(Class<T> ignored) {
        return (T) null;
    }
}
