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

    public static String CORP_PRINCIPAL = null;
    public static String CCTX_LOGIN = null;
    public static String CCTX_PARTNER = null;
    public static String CCTX_CONFIRM = null;
    public static String CCTX_URL = null;
    public static String CCTX_TYPE = null;

    public static String JSP_ROOT = null;

    public static String REGISTRATION_PAGE_SUCCESS = null;
    public static String REGISTRATION_PAGE_RETRY = null;
    public static String USEREDIT_PAGE_SUCCESS = null;
    public static String USEREDIT_PAGE_RETRY = null;
    public static String USERLIST_PAGE = null;
    public static String LOGIN_PAGE = null;
    public static String WELCOME_PAGE = null;

    public static String CORP_ADMIN_ROLE = null;
    public static String CORP_GROUP = null;
    public static String CORP_ANONYMOUS_GROUP = null;
    public static String SOFTWARE_USER_GROUP = null;
    public static int CORP_SITE_TERMS_ID = -1;

    public static final String KEY_TERMS = "terms";
    public static final String KEY_AGREE_TO_TERMS = "agree-to-terms";


    public static void init(ServletConfig cfg) {
        JSP_ROOT = cfg.getInitParameter("jsp_root");

        REGISTRATION_PAGE_SUCCESS = JSP_ROOT+cfg.getInitParameter("page-Registration-success");
        REGISTRATION_PAGE_RETRY = JSP_ROOT+cfg.getInitParameter("page-Registration-retry");
        USEREDIT_PAGE_SUCCESS = JSP_ROOT+cfg.getInitParameter("page-UserEdit-success");
        USEREDIT_PAGE_RETRY = JSP_ROOT+cfg.getInitParameter("page-UserEdit-retry");
        USERLIST_PAGE = JSP_ROOT+cfg.getInitParameter("page-UserList");
        LOGIN_PAGE = JSP_ROOT+cfg.getInitParameter("page-login");
        WELCOME_PAGE  = JSP_ROOT+cfg.getInitParameter("page-welcome");

    }

    static {

        store = new TCResourceBundle("CorpConstants");
        CORP_PRINCIPAL = store.getProperty("security-corp-principal", "corp_user");

        CCTX_LOGIN = store.getProperty("cctx-login", null);
        CCTX_PARTNER = store.getProperty("cctx-partner", null);
        CCTX_CONFIRM = store.getProperty("cctx-showconfirm", null);
        CCTX_URL = store.getProperty("cctx-payflow-url", null);
        CCTX_TYPE = store.getProperty("cctx-type", null);

        CORP_ADMIN_ROLE = store.getProperty("security-corp-admin-role", "Account Administrator");
        CORP_GROUP = store.getProperty("security-corp-group", "Corp User");
        CORP_ANONYMOUS_GROUP = store.getProperty("security-anonymous-group", "Anonymous");
        SOFTWARE_USER_GROUP = store.getProperty("security-software-user-group", "Users");
        CORP_SITE_TERMS_ID = store.getIntProperty("corp-site-terms-id", 3);
    }
}
