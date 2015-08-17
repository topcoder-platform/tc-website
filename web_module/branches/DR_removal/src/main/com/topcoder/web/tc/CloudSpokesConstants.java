package com.topcoder.web.tc;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * Created by David on 10/12/13.
 */
public class CloudSpokesConstants {

    /**
     * The base URL for the CloudSpokes REST API.
     */
    public static String CLOUD_SPOKES_API_BASE;

    public static String CLOUD_SPOKES_OPEN_CHALLENGES_API;

    public static String CLOUD_SPOKES_IN_PROGRESS_CHALLENGES_API;

    public static String CLOUD_SPOKES_PAST_CHALLENGES_API;

    public static String CLOUD_SPOKES_REVIEW_OPPORTUNITIES_API;

    public static String CLOUD_SPOKES_CHALLENGE_DETAILS_API;

    public static String CLOUD_SPOKES_API_KEY;

    /**
     * The max limitation sent to active contests API to retrieve all the contests.
     * It should be set to a large enough value.
     */
    public static int ACTIVE_CONTESTS_MAX_LIMIT;

    private static final TCResourceBundle bundle = new TCResourceBundle("CloudSpokes");

    private static final Logger log = Logger.getLogger(CloudSpokesConstants.class);

    static {
        initialize();
    }

    private CloudSpokesConstants() {
    }

    public static void initialize() {
        Field[] f = CloudSpokesConstants.class.getFields();

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
                            System.out.println(f[i].getName().toLowerCase() + ":"
                                    + bundle.getProperty(f[i].getName().toLowerCase()));
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
