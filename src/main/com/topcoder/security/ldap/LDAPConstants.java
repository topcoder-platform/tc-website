/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.ldap;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * <p>A collection of constants for managing the process of communication to <code>LDAP</code> server and managing
 * <code>LDAP</code> entries.</p>
 *
 * @author isv
 * @version 1.0 (LDAP Authentication Release Assembly v1.0)
 */
public class LDAPConstants {

    /**
     * <p>A <code>TCResourceBundle</code> providing access to configuration properties for this class.</p>
     */
    private static final TCResourceBundle bundle = new TCResourceBundle("LDAP");

    /**
     * <p>A <code>Logger</code> to be used for logging the events.</p>
     */
    private static final Logger log = Logger.getLogger(LDAPConstants.class);

    /**
     * <p>A <code>String</code> providing the logical name to be used by application's code for referring to
     * <code>handle</code> property of <code>TopCoder</code> member profile when using <code>LDAP</code> client.</p>
     */
    public static final String MEMBER_PROFILE_PROPERTY_HANDLE = "handle";

    /**
     * <p>A <code>String</code> providing the logical name to be used by application's code for referring to
     * <code>password</code> property of <code>TopCoder</code> member profile when using <code>LDAP</code> client.</p>
     */
    public static final String MEMBER_PROFILE_PROPERTY_PASSWORD = "userPassword";

    /**
     * <p>A <code>String</code> providing the logical name to be used by application's code for referring to
     * <code>user ID</code> property of <code>TopCoder</code> member profile when using <code>LDAP</code> client.</p>
     */
    public static final String MEMBER_PROFILE_PROPERTY_USERID = "uid";

    /**
     * <p>A <code>String</code> providing the logical name to be used by application's code for referring to
     * <code>status</code> property of <code>TopCoder</code> member profile when using <code>LDAP</code> client.</p>
     */
    public static final String MEMBER_PROFILE_PROPERTY_STATUS = "status";

    /**
     * <p>A <code>String</code> providing the hostname or IP-address for network node hosting the <code>LDAP</code>
     * server.</p>
     */
    public static String HOST;

    /**
     * <p>An <code>int</code> providing the port which the <code>LDAP</code> server accepts connections on.</p>
     */
    public static int PORT;

    /**
     * <p>A <code>String</code> providing the DN for binding to <code>LDAP</code> directory.</p>
     */
    public static String BIND_DN;

    /**
     * <p>A <code>String</code> providing the password for binding to <code>LDAP</code> directory.</p>
     */
    public static String BIND_PASSWORD;

    /**
     * <p>A <code>String</code> providing the class for <code>LDAP SDK Connection Factory</code> implementation to be
     * used for establishing connections to target <code>LDAP</code> server.</p>
     */
    public static String CONNECTION_FACTORY;

    /**
     * <p>A <code>String</code> providing the base DN for the entries in <code>LDAP</code> directory maintaining the
     * data for <code>TopCoder</code> member profiles.</p>
     */
    public static String TOPCODER_MEMBER_BASE_DN;

    /**
     * <p>A <code>String</code> providing the value for <code>status</code> attribute for <code>LDAP</code> entries for
     * active <code>TopCoder</code> member profiles.</p>
     */
    public static String TOPCODER_MEMBER_STATUS_ACTIVE;

    /**
     * <p>Initializes non-final static fields for this class with values for the same-named properties from the resource
     * bundle.</p>
     */
    static {
        initialize();
    }

    /**
     * <p>Constructs new <code>LDAPConstants</code> instance. This implementation does nothing.</p>
     */
    private LDAPConstants() {
    }

    /**
     * <p>Initializes non-final static fields for this class with values for the same-named properties from the resource
     * bundle.</p>
     */
    public static void initialize() {
        Field[] f = LDAPConstants.class.getFields();
        for (int i = 0; i < f.length; i++) {
            try {
                if (!Modifier.isFinal(f[i].getModifiers())) {
                    if (f[i].getType().getName().equals("int")) {
                        try {
                            f[i].setInt(null, bundle.getIntProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else if (f[i].getType().getName().equals("java.lang.String")) {
                        try {
                            System.out.println(f[i].getName().toLowerCase() + ":"
                                               + bundle.getProperty(f[i].getName().toLowerCase()));
                            f[i].set(null, bundle.getProperty(f[i].getName().toLowerCase()));
                        } catch (MissingResourceException ignore) {
                        }
                    } else {
                        throw new Exception("Unrecognized type: " + f[i].getType().getName());
                    }
                }
                if (f[i].get(null) == null) {
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                } else {
                    if (log.isDebugEnabled()) {
                        log.debug(f[i].getName() + " <== " + f[i].get(null));
                    }
                }
            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
        }
    }
}
