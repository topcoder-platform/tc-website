package com.topcoder.util.idgenerator.sql;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.sql.DataSource;

/**
 * The <code>DataSource</code> implementation that uses <code>DriverManager</code>.  
 * 
 * @version     1.0  
 * @author      Timur Zambalayev
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

}
