/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.ldap;

import com.topcoder.util.net.ldap.sdkinterface.LDAPSDKFactory;
import com.topcoder.util.net.ldap.sdkinterface.LDAPSDKConnection;
import netscape.ldap.LDAPException;

/**
 * <p>A custom implementation of {@link LDAPSDKFactory} interface to be used for obtaining {@link LDAPSDKConnection}
 * objects for establishing connections to <code>LDAP</code> server using <code>LDAPv3</code> protocol.</p>
 *
 * @author isv
 * @version 1.0  (LDAP Authentication Release Assembly v1.0)
 * @see NetscapeV3Connection
 */
public class NetscapeV3Factory implements LDAPSDKFactory {

    /**
     * <p>Constructs new <code>NetscapeV3Factory</code> instance. This implementation does nothing.</p>
     */
    public NetscapeV3Factory() {
    }

    /**
     * <p>Creates a connection factory for plain connections to <code>LDAP</code> server.</p>
     *
     * @return a <code>LDAPSDKConnection</code> to be used for establishing plain connections to target
     *         <code>LDAP</code> server.
     */
    public LDAPSDKConnection createConnection() {
        return new NetscapeV3Connection(false);
    }

    /**
     * <p>Creates a connection factory for SSL connections to <code>LDAP</code> server.</p>
     *
     * @return a <code>LDAPSDKConnection</code> to be used for establishing SSL connections to target <code>LDAP</code>
     *         server.
     */
    public LDAPSDKConnection createSSLConnection() {
        return new NetscapeV3Connection(true);
    }
}
