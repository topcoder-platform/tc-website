/*
 * Copyright (C) 2016 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security.synchronizerToken;

import com.topcoder.shared.util.TCResourceBundle;

import java.util.Arrays;
import java.util.List;

/**
 * <p>This class provides the configuration parameters for current implementation of <code>Synchronizer Token Pattern
 * </code>.</p>
 *
 * @author isv
 */
public class SynchronizerTokenPatternConfig {

    /**
     * <p>A <code>TCResourceBundle</code> providing configuration parameters.</p>
     */
    private static final TCResourceBundle bundle = new TCResourceBundle("TC");

    /**
     * <p>A <code>String</code> array listing the operation types which are currently "protected" by implementation of
     * <code>Synchronizer Token Pattern</code>.</p>
     */
    public static final List<String> SUPPORTED_OPERATION_TYPES = Arrays.asList("SavePaymentPreferences");

    /**
     * <p>A <code>String</code> providing the name of session attribute to hold the mappings from supported operation
     * types to synchronizer tokens for current session.</p>
     */
    public static final String SESSION_ATTR_OPERATION_TYPE_TOKENS = "XiwrvFksfuyo";

    /**
     * <p>A <code>String</code> providing the name of session attribute to hold the mappings from supported operation
     * types to names of request parameters for current session which will carry the synchronizer token from the client
     * side.</p>
     */
    public static final String SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES = "OfhCieroUsPqkf";

    /**
     * <p>A <code>String</code> providing the name of servlet context attribute to hold the current implementation of
     * <code>Synchronizer Token Pattern</code>./p>
     */
    public static final String CONTEXT_ATTR_PATTERN_IMPL = "AdkptvmJrtoH";

    /**
     * <p>Constructs new <code>SynchronizerTokenPatternConfig</code> instance. This implementation does nothing.</p>
     */
    private SynchronizerTokenPatternConfig() {
    }

    /**
     * <p>Indicates if HTTP <code>Referrer</code> header is to be analyzed and verified.</p>
     * 
     * @return <code>true</code> always.
     */
    public static boolean checkReferrer() {
        return Boolean.valueOf(bundle.getProperty("csrf_check_referer"));
    }

    /**
     * <p>Indicates if HTTP <code>Origin</code> header is to be analyzed and verified.</p>
     *
     * @return <code>true</code> always.
     */
    public static boolean checkOrigin() {
        return Boolean.valueOf(bundle.getProperty("csrf_check_origin"));
    }

}
