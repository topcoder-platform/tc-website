package com.topcoder.web.corp;

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
    // keys
    private static final String KEY_SECURITY_CONTEXT_FACTORY = 
        "security-context-factory";

    private static final String KEY_SECURITY_PROVIDER_URL =
        "security-provider-url";

    private static final String KEY_JTA_CONTEXT_FACTORY =
        "jta-context-factory";

    private static final String KEY_JTA_PROVIDER_URL =
        "jta-provider-url";

    private static final String KEY_JTA_TX_MANAGER =
        "jta-transaction-manager";

    private static final String KEY_EJB_CONTEXT_FACTORY =
        "ejb-context-factory";

    private static final String KEY_EJB_PROVIDER_URL =
        "ejb-provider-url";

    // and their defaults
    private static final String DEF_SECURITY_CONTEXT_FACTORY =
        "org.jnp.interfaces.NamingContextFactory";

    private static final String DEF_SECURITY_PROVIDER_URL =
        "jnp://127.0.0.1:1099";

    private static final String DEF_JTA_CONTEXT_FACTORY =
        "weblogic.jndi.WLInitialContextFactory";

    private static final String DEF_JTA_PROVIDER_URL =
        "t3://127.0.0.1:8040";
        
    private static final String DEF_JTA_TX_MANAGER =
        "weblogic/transaction/TransactionManager";

    private static final String DEF_EJB_CONTEXT_FACTORY =
        DEF_JTA_CONTEXT_FACTORY;

    private static final String DEF_EJB_PROVIDER_URL =
        DEF_JTA_PROVIDER_URL;

    private static final TCResourceBundle store;
    
    /**
     * Environment to produce security InitialContext from.
     */
    public static final Hashtable SECURITY_CONTEXT_ENVIRONMENT = 
        new Hashtable();

    /**
     * Environment to produce JTA InitialContext from.
     */
    public static final Hashtable JTA_CONTEXT_ENVIRONMENT =
        new Hashtable();

    /**
     * jndi name of transaction manager
     */
    public static String JTA_TX_MANAGER = null;

    /**
     * Environment to produce InitialContext for our EJB.
     */
    public static final Hashtable EJB_CONTEXT_ENVIRONMENT =
        new Hashtable();

    static {
        store = new TCResourceBundle("CorpConstants");

        JTA_TX_MANAGER = store.getProperty(KEY_JTA_TX_MANAGER,
                                           DEF_JTA_TX_MANAGER
        );
        
        String value;
        // jta environment
        value = store.getProperty(KEY_JTA_CONTEXT_FACTORY,
                                  DEF_JTA_CONTEXT_FACTORY
        );
        JTA_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.INITIAL_CONTEXT_FACTORY,
            value
        );
        value = store.getProperty(KEY_JTA_PROVIDER_URL,
                                  DEF_JTA_PROVIDER_URL
        );
        JTA_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.PROVIDER_URL,
            value
        );

        // security environment
        value = store.getProperty(KEY_SECURITY_CONTEXT_FACTORY,
                                  DEF_SECURITY_CONTEXT_FACTORY
        );
        SECURITY_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.INITIAL_CONTEXT_FACTORY,
            value
        );
        value = store.getProperty(KEY_SECURITY_PROVIDER_URL,
                                  DEF_SECURITY_PROVIDER_URL
        );
        SECURITY_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.PROVIDER_URL,
            value
        );
        
        // app ejb environment
        value = store.getProperty(KEY_EJB_CONTEXT_FACTORY,
                                  DEF_EJB_CONTEXT_FACTORY
        );
        EJB_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.INITIAL_CONTEXT_FACTORY,
            value
        );
        value = store.getProperty(KEY_EJB_PROVIDER_URL,
                                  DEF_EJB_PROVIDER_URL
        );
        EJB_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.PROVIDER_URL,
            value
        );
    }
}
