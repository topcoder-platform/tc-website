/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * <p>This class stores a variety of constants used for purposes of <code>2010 TCO Website</code> application.</p>
 *
 * @author isv
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class TCO10Constants implements WebConstants {

    /**
     * <p>A <code>TCResourceBundle</code> providing access to configuration properties for this class.</p>
     */
    private static final TCResourceBundle bundle = new TCResourceBundle("TC");

    /**
     * <p>A <code>Logger</code> to be used for logging the events.</p>
     */
    private static final Logger log = Logger.getLogger(TCO10Constants.class);

    /**
     * <p>
     * A <code>String</code> referencing TCO10 short description
     * </p>
     */
    public static String TCO10_SHORT_DESC = "tco10";

    /**
     * <p>
     * A <code>String</code> referencing TCO10 terms success page.
     * </p>
     */
    public static String TCO10_TERMS_SUCCESS_PAGE = "/tournaments/tco10/termsSuccess.jsp";

    /**
     * <p>
     * A <code>String</code> referencing TCO10 terms page.
     * </p>
     */
    public static String TCO10_TERMS_PAGE = "/tournaments/tco10/terms.jsp";

    /**
     * <p>A <code>String</code> referencing TCO10 view registration request.</p>
     */
    public static String TCO10_VIEW_REGISTRATION_REQUEST = "/tco10?module=ViewUnifiedRegistration";

    /**
     * <p>A <code>String</code> referencing TCO10 registrants command.</p>
     */
    public static String TCO10_REGISTRANTS_COMMAND = "tco10_registrants";

    /**
     * <p>A <code>String</code> referencing TCO10 overview page.</p>
     */
    public static String TCO10_OVERVIEW_PAGE = "/tournaments/tco10/overview/overview.jsp";

    /**
     * <p>A <code>String</code> referencing TCO10 registrants page.</p>
     */
    public static String TCO10_REGISTRANTS_PAGE = "/tournaments/tco10/overview/registrants.jsp";

    /**
     * <p>An <code>int</code> referencing the maximum competitor rank that goes onsite for TCO10 Studio track.</p>
     */
    public static int TCO10_STUDIO_TOP_ONSITE_RANK = 14;

    /**
     * <p>An <code>int</code> referencing the amount of placement points for first placed submission
     * in the TCO10 Studio track.</p>
     */
    public static int TCO10_STUDIO_PLACE_SCORE_1 = 11;

    /**
     * <p>An <code>int</code> referencing the amount of placement points for second placed submission
     * in the TCO10 Studio track.</p>
     */
    public static int TCO10_STUDIO_PLACE_SCORE_2 = 9;

    /**
     * <p>An <code>int</code> referencing the amount of placement points for third placed submission
     * in the TCO10 Studio track.</p>
     */
    public static int TCO10_STUDIO_PLACE_SCORE_3 = 7;

    /**
     * <p>An <code>int</code> referencing the amount of placement points for fourth placed submission
     * in the TCO10 Studio track.</p>
     */
    public static int TCO10_STUDIO_PLACE_SCORE_4 = 4;

    /**
     * <p>An <code>int</code> referencing the amount of placement points for fifth placed submission
     * in the TCO10 Studio track.</p>
     */
    public static int TCO10_STUDIO_PLACE_SCORE_5 = 1;

    /**
     * <p>A <code>String</code> referencing TCO10 Studio track leaderboard page.</p>
     */
    public static String TCO10_STUDIO_LEADERBOARD_PAGE = "/tournaments/tco10/studio/leaderboard.jsp";

    /**
     * <p>A <code>String</code> referencing TCO10 Studio track leaderboard details page.</p>
     */
    public static String TCO10_STUDIO_LEADERBOARD_DETAILS_PAGE = "/tournaments/tco10/studio/leaderboardDetails.jsp";

    /**
     * <p>An <code>int</code> providing the ID for contest for <code>Design</code> track.</p>
     */
    public static int TCO10_DESIGN_TRACK_ID = 476;

    /**
     * <p>An <code>int</code> providing the ID for contest for <code>Development</code> track.</p>
     */
    public static int TCO10_DEVELOPMENT_TRACK_ID = 477;

    /**
     * <p>Initializes non-final static fields for this class with values for the same-named properties from the resource
     * bundle.</p>
     */
    static {
        initialize();
    }

    /**
     * <p>Constructs new <code>TCO10Constants</code> instance. This implementation does nothing.</p>
     */
    private TCO10Constants() {
    }

    /**
     * <p>Initializes non-final static fields for this class with values for the same-named properties from the resource
     * bundle.</p>
     */
    public static void initialize() {
        Field[] f = Constants.class.getFields();
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
                            System.out.println(f[i].getName().toLowerCase() + ":"+ bundle.getProperty(f[i].getName().toLowerCase()));
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
