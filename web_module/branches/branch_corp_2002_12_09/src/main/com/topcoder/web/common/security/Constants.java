package com.topcoder.web.common.security;

//import java.util.Hashtable;
//import javax.servlet.ServletConfig;
import java.util.Hashtable;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * General set of constants to be used in scope of this web application. 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Constants {
    private static final TCResourceBundle store;
    /**
     * Environment to produce security InitialContext from.
     */
    public static final Hashtable SECURITY_CONTEXT_ENVIRONMENT = new Hashtable();

    static {
        String value;
        store = new TCResourceBundle("SecurityConfig");
        // security environment
        value = store.getProperty(
            "security-context-factory",
            "org.jnp.interfaces.NamingContextFactory"
        );
        SECURITY_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.INITIAL_CONTEXT_FACTORY,
            value
        );
        value = store.getProperty("security-provider-url", "jnp://127.0.0.1:1099");
        SECURITY_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.PROVIDER_URL,
            value
        );
    }
}
