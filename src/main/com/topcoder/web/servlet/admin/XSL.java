package com.topcoder.web.servlet.admin;

import com.topcoder.common.web.constant.TCServlet;

public final class XSL {

    public static final String DIR = TCServlet.XSL_ROOT + "admin/";
    private static final String ERROR_SUB_DIR = "error/";
    public static final String NAVIGATION_ERROR_URL = DIR + ERROR_SUB_DIR + "navigation.xsl";
    public static final String LOGGED_OUT_ERROR_URL = DIR + ERROR_SUB_DIR + "logged_out.xsl";
    public static final String INTERNAL_ERROR_URL = DIR + ERROR_SUB_DIR + "internal.xsl";
    public static final String SESSION_TIMEOUT_URL = DIR + ERROR_SUB_DIR + "session_timeout.xsl";
    public static final String INVALID_BROWSER_URL = DIR + ERROR_SUB_DIR + "invalid_browser.xsl";

}
