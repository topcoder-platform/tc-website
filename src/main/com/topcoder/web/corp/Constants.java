package com.topcoder.web.corp;

import com.topcoder.shared.util.TCResourceBundle;

import javax.servlet.ServletConfig;
import java.util.Hashtable;

/**
 * General set of constants to be used in scope of this web application.
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Constants {
    private static final TCResourceBundle store;

    // keys.
    public static final String KEY_CCTX_SUM = "cctx-sum";
    /**
     * Every request passed thru our controller will have such attribute.
     * Intended to be used when building http links.
     */
    public static final String KEY_LINK_PREFIX = "url-prefix";

    /**
     * When error has arised, request will be polulated with such attribute (its
     * content is exception itself) and, then forwarded to error page.
     */
    public static final String KEY_EXCEPTION = "caught-exception";

    /**
     * Processor's name have to be specified in request via such parameter
     */
    public static final String KEY_MODULE = "module";
    public static final String KEY_INTERNAL_EXC_PAGE = "int-exc-page";

    /**
     * Environment to produce JTA InitialContext from.
     */
    public static final Hashtable JTA_CONTEXT_ENVIRONMENT = new Hashtable();

    /**
     * Environment to produce JTA InitialContext from.
     */
    public static final Hashtable NDS_CONTEXT_ENVIRONMENT = new Hashtable();

    /**
     * jndi name of transaction manager
     */
    public static String JTA_TX_MANAGER = null;

    /**
     * Environment to produce InitialContext for our EJB.
     */
    public static final Hashtable EJB_CONTEXT_ENVIRONMENT = new Hashtable();

    /**
     * Name of transactional DataSourse to be used
     */
    public static String JTA_DATA_SOURCE = null;

    /**
     * Name of non-transactional DataSourse to be used
     */
    public static String NDS_DATA_SOURCE = null;
    public static String CORP_PRINCIPAL = null;
    public static String CCTX_LOGIN = null;
    public static String CCTX_PARTNER = null;
    public static String CCTX_CONFIRM = null;
    public static String CCTX_URL = null;
    public static String CCTX_TYPE = null;

    public static String REGISTRATION_PAGE_SUCCESS = null;
    public static String REGISTRATION_PAGE_RETRY = null;
    public static String USEREDIT_PAGE_SUCCESS = null;
    public static String USEREDIT_PAGE_RETRY = null;
    public static String USERLIST_PAGE = null;

    public static String CORP_ADMIN_ROLE = null;
    public static String CORP_GROUP = null;
    public static String CORP_ANONYMOUS_GROUP = null;

    public static void init(ServletConfig cfg) {
        REGISTRATION_PAGE_SUCCESS = cfg.getInitParameter("page-Registration-success");
        REGISTRATION_PAGE_RETRY = cfg.getInitParameter("page-Registration-retry");
        USEREDIT_PAGE_SUCCESS = cfg.getInitParameter("page-UserEdit-success");
        USEREDIT_PAGE_RETRY = cfg.getInitParameter("page-UserEdit-retry");
        USERLIST_PAGE = cfg.getInitParameter("page-UserList");
    }

    static {

        store = new TCResourceBundle("CorpConstants");
        CORP_PRINCIPAL = store.getProperty("security-corp-principal", "corp_user");
        JTA_TX_MANAGER = store.getProperty(
                "jta-transaction-manager",
                "weblogic/transaction/TransactionManager"
        );

        JTA_DATA_SOURCE = store.getProperty("jta-data-source", "JTS_CORP_OLTP");
        NDS_DATA_SOURCE = store.getProperty("nds-data-source", "CORP_OLTP");

        String value;
        // jta environment
        value = store.getProperty("jta-context-factory", "weblogic.jndi.WLInitialContextFactory");
        JTA_CONTEXT_ENVIRONMENT.put(
                javax.naming.Context.INITIAL_CONTEXT_FACTORY,
                value
        );
        value = store.getProperty("jta-provider-url", "t3://127.0.0.1:8040");
        JTA_CONTEXT_ENVIRONMENT.put(
                javax.naming.Context.PROVIDER_URL,
                value
        );

        // nds environment
        value = store.getProperty(
                "nds-context-factory",
                "weblogic.jndi.WLInitialContextFactory"
        );
        NDS_CONTEXT_ENVIRONMENT.put(
                javax.naming.Context.INITIAL_CONTEXT_FACTORY,
                value
        );
        value = store.getProperty("nds-provider-url", "t3://127.0.0.1:8040");
        NDS_CONTEXT_ENVIRONMENT.put(
                javax.naming.Context.PROVIDER_URL,
                value
        );

        // app ejb environment
        value = store.getProperty(
                "ejb-context-factory",
                "weblogic.jndi.WLInitialContextFactory"
        );
        EJB_CONTEXT_ENVIRONMENT.put(
                javax.naming.Context.INITIAL_CONTEXT_FACTORY,
                value
        );
        value = store.getProperty("ejb-provider-url", "t3://127.0.0.1:8040");
        EJB_CONTEXT_ENVIRONMENT.put(
                javax.naming.Context.PROVIDER_URL,
                value
        );

        CCTX_LOGIN = store.getProperty("cctx-login", null);
        CCTX_PARTNER = store.getProperty("cctx-partner", null);
        CCTX_CONFIRM = store.getProperty("cctx-showconfirm", null);
        CCTX_URL = store.getProperty("cctx-payflow-url", null);
        CCTX_TYPE = store.getProperty("cctx-type", null);

        CORP_ADMIN_ROLE = store.getProperty("security-corp-admin-role", "Account Administrator");
        CORP_GROUP = store.getProperty("security-corp-group", "Corp User");
        CORP_ANONYMOUS_GROUP = store.getProperty("security-anonymous-group", "Anonymous");
    }
}
