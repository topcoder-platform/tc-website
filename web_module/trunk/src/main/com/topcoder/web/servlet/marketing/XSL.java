package com.topcoder.web.servlet.marketing;

import com.topcoder.common.web.constant.TCServlet;

public final class XSL {

    public static final String DIR = TCServlet.XSL_ROOT + "marketing/";
    private static final String ERROR_SUB_DIR = "error/";
    public static final String NAVIGATION_ERROR_URL = DIR + ERROR_SUB_DIR + "navigation.xsl";
    public static final String INTERNAL_ERROR_URL = DIR + ERROR_SUB_DIR + "internal.xsl";

}
