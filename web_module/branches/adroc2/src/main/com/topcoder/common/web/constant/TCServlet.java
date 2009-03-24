package com.topcoder.common.web.constant;

import com.topcoder.shared.util.ApplicationServer;

/**
 *  A set of constants related to servlets
 *  @author Steve Burrows
 *  @version $Revision$
 *
 */
public class TCServlet {

    public static String XSL_ROOT = ApplicationServer.BASE_DIR + "resources/xsl/";
    public static String HOME_PAGE = XSL_ROOT + "home/home.xsl";
    public static String NAVIGATION_ERROR_PAGE = XSL_ROOT + "error/navigation.xsl";
    public static String INTERNAL_ERROR_PAGE = XSL_ROOT + "error/internal.xsl";
    public static String LOGGED_OUT_ERROR_PAGE = XSL_ROOT + "error/logged_out.xsl";
    public static String LOGIN_PAGE = XSL_ROOT + "authentication/login.xsl";

    public static final int MAX_SCHOOLS = 10;
    public static final int MAX_CODER_SCHOOLS = 10;
    public static final int MAX_EDUCATIONS = 10;
    public static final int MAX_EXPERIENCES = 10;
    public static final String LOGGED_IN_KEY = "1";
    public static final String LOGGED_OUT_KEY = "0";
    public static final int CODER_STAT_SORT_SCROLL = 10;
    public static final int REFERRAL_SORT_SCROLL = 10;

}
