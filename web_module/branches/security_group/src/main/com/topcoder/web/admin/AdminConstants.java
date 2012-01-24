/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin;

/**
 * <p>This class stores a variety of constants for the admin tool.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added constants to support new columns in terms_of_use table.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Added "handle" request parameter name constants.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Miscellaneous TC Improvements Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added "userId" request parameter name constants.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.4 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Remove field <code>TERMS_ELECTRONICALLY_SIGNABLE</code>.</li>
 *     <li>Added fields {@link #TERMS_OF_USE_DAO_NS}, {@link #USER_TERMS_OF_USE_DAO_NS}, {@link #TERMS_AGREE_TYPE_ID},
 *     {@link #DEPENDENCIES_TERMS_IDS}, {@link #NON_ELEC_AGREEABLE_TYPE} constant fields.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, isv, TCSASSEMBER
 * @version 1.4
 */
public interface AdminConstants {
    public static final String TERMS_OF_USE_ID = "tid";
    public static final String TERMS = "terms";
    public static final String TERMS_OF_USE_TYPE_ID = "ttid";

    /**
     * <p>
     * A <code>String</code> containing the attribute key for terms title column.
     * </p>
     *
     * @since 1.1
     */
    public static final String TERMS_TITLE = "ttit";

    /**
     * <p>
     * A <code>String</code> containing the attribute key for terms url column.
     * </p>
     *
     * @since 1.1
     */
    public static final String TERMS_URL = "turl";

    /**
     * <p>
     * A <code>String</code> containing the request parameter name for "handle".
     * </p>
     *
     * @since 1.2
     */
    public static final String HANDLE = "ha";

    /**
     * <p>A <code>String</code> containing the request parameter name for "user ID".</p>
     *
     * @since 1.3
     */
    public static final String USER_ID = "uid";

    public static final String SURVEY_ID = "sid";
    public static final String QUESTION_ID = "qid";
    public static final String ANSWER_ID = "aid";
    public static final String SURVEY_NAME = "sname";
    public static final String SURVEY_START = "sstart";
    public static final String SURVEY_END = "send";
    public static final String SURVEY_STATUS = "sstatus";
    public static final String SURVEY_TEXT = "stext";
    public static final String RESULTS_VIEWABLE = "rv";
    public static final String KEYWORD = "kw";
    public static final String QUESTION_STYLE = "qs";
    public static final String QUESTION_TYPE = "qt";
    public static final String QUESTION_STATUS = "qstat";
    public static final String QUESTION_TEXT = "qtext";
    public static final String REQUIRED = "req";
    public static final String ANSWER_TEXT ="atext";
    public static final String SORT = "sort";

    /**
     * <p>A <code>String</code> providing the namespace of terms of use DAO implementation.</p>
     * 
     * @since 1.4
     */
    public static final String TERMS_OF_USE_DAO_NS = "termsOfUseDao";
    
    /**
     * <p>A <code>String</code> providing the namespace of user terms of use DAO implementation.</p>
     * 
     * @since 1.4
     */
    public static final String USER_TERMS_OF_USE_DAO_NS = "userTermsOfUseDao";
    
    /**
     * <p>A <code>String</code> providing the parameter key of the terms agree-ability type id.</p>
     * 
     * @since 1.4
     */
    public static final String TERMS_AGREE_TYPE_ID = "tatid";
    
    /**
     * <p>A <code>String</code> providing the parameter key of the dependencies terms id list.</p>
     */
    public static final String DEPENDENCIES_TERMS_IDS = "deptids";
    
    /**
     * <p>An <code>Integer</code> providing the id of the non-electronically agreeable type of the terms of use.</p>
     */
    public static final Integer NON_ELEC_AGREEABLE_TYPE = 2;
    
    public static final int[] ACTIVE_STATUSES = {1,83};
    public static final int[] INACTIVE_STATUSES = {0,82};


}
