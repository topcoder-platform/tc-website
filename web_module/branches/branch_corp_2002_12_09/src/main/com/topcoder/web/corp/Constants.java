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
    private static final String KEY_SECURITY_CONTEXT_FACTORY = "security-context-factory";
    private static final String KEY_SECURITY_PROVIDER_URL    = "security-provider-url";
    
    private static final String KEY_JTA_CONTEXT_FACTORY = "jta-context-factory";
    private static final String KEY_JTA_PROVIDER_URL    = "jta-provider-url";
    private static final String KEY_JTA_TX_MANAGER      = "jta-transaction-manager";
    private static final String KEY_JTA_DATA_SOURCE     = "jta-data-source";
    
    private static final String KEY_NDS_CONTEXT_FACTORY = "nds-context-factory";
    private static final String KEY_NDS_PROVIDER_URL    = "nds-provider-url";
    private static final String KEY_NDS_DATA_SOURCE     = "nds-data-source";

    private static final String KEY_EJB_CONTEXT_FACTORY = "ejb-context-factory";
    private static final String KEY_EJB_PROVIDER_URL    = "ejb-provider-url";

    private static final String KEY_CORP_PRINCIPAL      = "corp-web-app-principal";

    // and their defaults
    private static final String DEF_SECURITY_CONTEXT_FACTORY =
        "org.jnp.interfaces.NamingContextFactory";

    private static final String DEF_SECURITY_PROVIDER_URL =
        "jnp://127.0.0.1:1099";

    private static final String DEF_JTA_CONTEXT_FACTORY =
        "weblogic.jndi.WLInitialContextFactory";

    private static final String DEF_JTA_PROVIDER_URL = "t3://127.0.0.1:8040";
        
    private static final String DEF_JTA_TX_MANAGER =
        "weblogic/transaction/TransactionManager";

    private static final String DEF_JTA_DATA_SOURCE  =  "JTS_CORP_OLTP";

    private static final String DEF_NDS_CONTEXT_FACTORY =
        DEF_JTA_CONTEXT_FACTORY;
    private static final String DEF_NDS_PROVIDER_URL = DEF_JTA_PROVIDER_URL;
    private static final String DEF_NDS_DATA_SOURCE  = "CORP_OLTP";

    private static final String DEF_EJB_CONTEXT_FACTORY =
        DEF_JTA_CONTEXT_FACTORY;

    private static final String DEF_EJB_PROVIDER_URL =
        DEF_JTA_PROVIDER_URL;

    private static final String DEF_CORP_PRINCIPAL      = "corp_user";

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
     * Environment to produce JTA InitialContext from.
     */
    public static final Hashtable NDS_CONTEXT_ENVIRONMENT =
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
        
    /**
     * Name of transactional DataSourse to be used
     */
    public static String JTA_DATA_SOURCE = null;

    /**
     * Name of non-transactional DataSourse to be used
     */
    public static String NDS_DATA_SOURCE = null;

    public static String CORP_PRINCIPAL = null;

    static {
        store = new TCResourceBundle("CorpConstants");
        
        CORP_PRINCIPAL = store.getProperty(KEY_CORP_PRINCIPAL,
                                           DEF_CORP_PRINCIPAL
        );

        JTA_TX_MANAGER = store.getProperty(KEY_JTA_TX_MANAGER,
                                           DEF_JTA_TX_MANAGER
        );
        
        JTA_DATA_SOURCE = store.getProperty(KEY_JTA_DATA_SOURCE,
                                            DEF_JTA_DATA_SOURCE
        );

        NDS_DATA_SOURCE = store.getProperty(KEY_NDS_DATA_SOURCE,
                                            DEF_NDS_DATA_SOURCE
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

        // nds environment
        value = store.getProperty(KEY_NDS_CONTEXT_FACTORY,
                                  DEF_NDS_CONTEXT_FACTORY
        );
        NDS_CONTEXT_ENVIRONMENT.put(
            javax.naming.Context.INITIAL_CONTEXT_FACTORY,
            value
        );
        value = store.getProperty(KEY_NDS_PROVIDER_URL,
                                  DEF_NDS_PROVIDER_URL
        );
        NDS_CONTEXT_ENVIRONMENT.put(
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
