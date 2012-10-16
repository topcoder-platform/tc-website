/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.badge;

import com.topcoder.web.common.WebConstants;

/**
 * <p>
 * This class store constants for badge administrator tool.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0
 */
public class BadgeAdminToolConstants implements WebConstants {
    
    /**
     * <p>
     * Default constructor.
     * </p>
     */
    private BadgeAdminToolConstants() {
    }
    
    /**
     * Key of matching handles.
     */
    public static final String MATCHING_HANDLES_KEY = "matching_handles";
    
    /**
     * Key to earned badges.
     */
    public static final String EARNED_BADGES_KEY = "earned_badges";
    
    /**
     * This is the name of request parameter for rule ID.
     */
    public static final String RULE_ID_KEY = "ruleId";
}
