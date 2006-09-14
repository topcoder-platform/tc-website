/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * <strong>Purpose</strong>:
 * It holds constants to the response codes.
 *
 * @author WishingBone, pulky
 * @version 1.0.1
 */
public abstract class ResponseCode {

    public static final long NON_JAR_FILE = 1;
    public static final long NON_ZIP_FILE = 2;
    public static final long INVALID_DIRECTORY = 3;
    public static final long NO_COMP_SPEC = 4;
    public static final long NO_LOG_DIR = 5;
    public static final long NO_LOG_FILES = 6;
    public static final long NO_POS_DESIGN = 7;
    public static final long NO_USE_CASE_DIAGRAM = 8;
    public static final long NO_CLASS_DIAGRAM = 9;
    public static final long NO_SEQUENCE_DIAGRAM = 10;
    public static final long NO_SOURCE_CODE = 11;
    public static final long NO_TEST_CODE = 12;
    public static final long CHECKSTYLE_WARNING = 13;
    public static final long PERSONAL_INFO = 14;
    public static final long SUCCESS = 15;

    public static final long NO_QA_PLAN = 16;
    public static final long NO_APP_SPEC = 17;
    public static final long NO_ZUML = 18;
    public static final long WRONG_ZUML = 19;

}
