package com.topcoder.sql.wrapper.informix;

import com.informix.jdbc.IfxDriver;
import com.topcoder.sql.wrapper.DriverWrapper;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * The Informix driver for use with JBoss connection pooling.<br>
 * This driver delegates to the IfxDriver.
 *
 * @author veredox
 * @version Copyright 2003, TopCoder Software, Inc.  All rights reserved.
 */
public class IfxDriverWrapper extends DriverWrapper {

    /**
     * Constructs a new DriverWrapper with a new IfxDriver as
     * the root Driver.
     */
    public IfxDriverWrapper() {
        super(new IfxDriver());
    }

    /**
     * Overrides the connect method.<br>
     * Chops the first character off the front of the password
     * property.  This is an ungly juke but is necessary because
     * we are using JBoss' connection pooling.  For some reason
     * JBoss doesn't acutally use the JDBC Driver if it doesn't
     * have to.  JBoss tries to connect on its own so we give it
     * a password with an extra character on the front of it.
     * When JBoss cannot connect on its own, it tries to connect
     * via the Driver (this method).  Here we intercept, trim
     * off the extra character, and connect successfully.
     *
     * @param s the connection String
     * @param properties the connection Properties
     * @return {@link DriverWrapper#connect}
     * @throws SQLException
     */
    public Connection connect(String s, Properties properties) throws SQLException {
        String password = properties.getProperty("password");
        if (password != null && password.length() > 0) {
            properties.setProperty("password", password.substring(1));
        }
        password = properties.getProperty("Password");
        if (password != null && password.length() > 0) {
            properties.setProperty("Password", password.substring(1));
        }
        return super.connect(s, properties);
    }
}
