/*
 * Copyright (C) 2001 - 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * <p>
 * This class stores a variety of constants.
 * </p>
 * 
 * <p>
 * Version 1.1 (TCS Release 2.2.2) Change notes:
 * <ol>
 * <li>Added constants to support Conceptualization, Specification and Application Testing Review Board pages.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (2009 TopCoder Open Site Integration 1.1.1) Change notes:
 * <ol>
 * <li>Added several constants to support TCO09 Studio track leader board pages.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.3 (Member Profile Enhancement 1.0) Change notes:
 * <ol>
 * <li>Added serveral constants to support Member Advance Search Pages for newly added tracks.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.4 (Testing Competition Split Release Assembly 1.0) Change notes:
 * <ol>
 * <li>Updated Application Testing to Test Suites.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.5 (Project View) Change notes:
 * <ol>
 * <li>Added constants for the Project View report.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.6 (Member Payment Improvements Release Assembly v1.0) Change notes:
 * <ol>
 * <li>Added constant for the minimum allowed payment accrual amount.</li>
 * <li>Added constant for <code>Digital Run</code> track contest types for current DR schema.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.7 (TopCoder Copilot Pool Front End Assembly v 1.0) Change notes:
 * <ol>
 * <li>Added constant for copilot pool jsp page COPILOT_POOL.
 * </ol>
 * (TopCoder Copilot Profiles Front End Assembly v 1.0) Change notes:
 * <ol>
 * <li>Added constant for copilot profile jsp page COPILOT_PROFILE.
 * <li>Added constant for copilot project history jsp page COPILOT_PROJECT_HISTORY.
 * <li>Added constant for copilot project jsp page COPILOT_PROJECT.
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.8 (Central content management generating JSP pages automatically Assembly) Change notes:
 * <ol>
 * <li>Added constant for press room current news jsp page CURRENT_NEWS_RSS.</li>
 * <li>Added constant for press room current news jsp page CURRENT_NEWS_CATEGORY.</li>
 * <li>Added constant for press room release archive jsp page RELEASE_ARCHIVE_RSS.</li>
 * <li>Added constant for press room release archive jsp page RELEASE_ARCHIVE_CATEGORY.</li>
 * <li>Added constant for press room articles archive jsp page ARTICLES_ARCHIVE_RSS.</li>
 * <li>Added constant for press room articles archive jsp page ARTICLES_ARCHIVE_CATEGORY.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9 Change notes:
 * <ol>
 * <li>Added serveral constants to support Test Scenarios, UI Prototype and RIA Build tracks.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.1 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 * <ol>
 * <li>Added constants {@link #RESOURCE_ROLE_IDS}, {@link #TERMS_OF_USE_DAO_NS}, {@link #USER_TERMS_OF_USE_DAO_NS},
 * {@link #PROJECT_TERMS_OF_USE_DAO_NS}, {@link #NON_AGREEABLE_TERMS_TYPE_ID},
 * {@link #NON_ELEC_AGREEABLE_TERMS_TYPE_ID}, {@link #ELEC_AGREEABLE_TERMS_TYPE_ID}.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.2 (Release Assembly - TopCoder Software Contest Detail Page Bug Fix Release) Change notes:
 * <ol>
 * <li>Added constants {@link #TAB_INDEX}.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.3 (Member Payments Automation Assembly 1.0) Change notes:
 * <ol>
 * <li>Added {@link #PAYME_CONFIRMATION_MESSAGE_TEMPLATE_WESTERN_UNION} constant.</li>
 * <li>Added {@link #PAYME_CONFIRMATION_MESSAGE_TEMPLATE_PAYONEER} constant.</li>
 * <li>Added {@link #PAYME_CONFIRMATION_MESSAGE_TEMPLATE_PAYPAL} constant.</li>
 * <li>Added {@link #INSUFFICIENT_BALANCE_EMAIL_FROM_ADDRESS} constant.</li>
 * <li>Added {@link #INSUFFICIENT_BALANCE_EMAIL_SUBJECT} constant.</li>
 * <li>Added {@link #INSUFFICIENT_BALANCE_EMAIL_TO_ADDRESS} constant.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.4 Change notes:
 * <ol>
 * <li>Added {@link #GOVERNMENT_ID_EDIT} constant.</li>
 * <li>Added {@link #GOVERNMENT_ID} constant.</li>
 * <li>Added {@link #GOVERNMENT_ID_EXPIRES} constant.</li>
 * <li>Added {@link #GOVERNMENT_ID_NUMBER} constant.</li>
 * <li>Added {@link #GOVERNMENT_ID_RECEIVED} constant.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.5 Change notes:
 * <ol>
 * <li>Added {@link #PAYMENT_PREFS_UPDATE_EMAIL_FROM_ADDRESS} constant.</li>
 * <li>Added {@link #PAYMENT_PREFS_UPDATE_EMAIL_SUBJECT} constant.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.6 Change notes:
 * <ol>
 * <li>Added {@link #MEMBER_ACHIEVEMENT_CURRENT_SQL_PATH} constant.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.7 (Review Application Integration Assembly 1.0) Change notes:
 * <ol>
 * <li>Added {@link #REVIEW_AUCTION_ID} constant.</li>
 * <li>Added {@link #REVIEW_APPLICATION_ROLE_ID} constant.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.8 Change notes:
 * <ol>
 * <li>Added {@link #PROJECT_PAYMENT_CALCULATOR_CLASS_NAME} constant.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.9.6 Change notes:
 * <ol>
 * <li>Removed {@link #MEMBER_ACHIEVEMENT_CURRENT_SQL_PATH} constant.</li>
 * </ol>
 * </p>
 * <p>
 * Version 1.9.9 Change notes:
 *   <ol>
 *     <li>Add {@link #RESEND_BUTTON_DELAY_SECONDS} constant.</li>
 *     <li>Add {@link #PRIMARY_EMAIL_TYPE_ID} constant.</li>
 *     <li>Add {@link #SECOND_EMAIL_TYPE_ID} constant.</li>
 *     <li>Add {@link #RESET_TOKEN_GENERATOR_CLASS} constant.</li>
 *     <li>Add {@link #RESET_TOKEN_AGE} constant.</li>
 *     <li>Add {@link #RESET_TOKEN_NOTIFY_MAIL_SUBJECT} constant.</li>
 *     <li>Add {@link #RESET_TOKEN_NOTIFY_MAIL_BODY} constant.</li>
 *     <li>Add {@link #SECOND_EMAIL_REQUEST_AGE} constant.</li>
 *     <li>Add {@link #SECOND_EMAIL_VERIFY_MAIL_SUBJECT} constant.</li>
 *     <li>Add {@link #SECOND_EMAIL_VERIFY_EMAIL_BODY} constant.</li>
 *     <li>Add {@link #SECOND_EMAIL_PAGE} constant.</li>
 *     <li>Add {@link #SECOND_EMAIL_PAGE_CONFIRM} constant.</li>
 *     <li>Add {@link #UNVERIFY_PAGE} constant.</li>
 *     <li>Add {@link #VERIFY_PAGE} constant.</li>
 *     <li>Add {@link #RECOVER_BY_EMAIL} constant.</li>
 *     <li>Add {@link #FIND_USER_QUERY_MAX_LENGTH} constant.</li>
 *     <li>Add {@link #RESET_TOKEN_NOTIFY_MAIL_FROM_ADDRESS} constant.</li>
 *     <li>Add {@link #SECOND_EMAIL_VERIFY_EMAIL_FROM_ADDRESS} constant.</li>
 *   </ol>
 * </p>
 * Version 1.9.10 Change notes:
 *   <ol>
 *     <li>Added {@link #DEVELOPER_PORTAL} and 
 *     {@link #DEVELOPER_PORTAL_WELCOME} constants.</li>
 *   </ol>
 * </p>
 *
 * Version 1.9.11(Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) Change notes:
 *   <ol>
 *     <li>Added {@link #PERMISSION} constants.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.9.12 (Release Assembly - TopCoder Website Social Login) change log:
 *   <ol>
 *     <li>Add CLIENT_ID_AUTH0 constant</li>
 *     <li>Add CLIENT_SECRET_AUTH0 constant</li>
 *     <li>Add REDIRECT_URL_AUTH0 constant</li>
 *     <li>Add DOMAIN_AUTH0 constant</li>
 *     <li>Add REG_SERVER_NAME constant.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.9.13 (Release Assembly - Social Login Linking for Existing User) change log:
 *   <ol>
 *     <li>Add BIND_CALLBACK_URL_AUTH0 constant</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.9.14 (Module Assembly - DocuSign Integration v1.0):
 * <ol>
 *      <li>Add {@link #RETURN_SIGNING} field.</li>
 *      <li>Add {@link #SIGN_DOCUMENT} field.</li>
 *      <li>Add {@link #AFFIDAVIT_DOCUSIGN_TEMPLATE_ID} field.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.9.15 (PoC Assembly - Discourse SSO by using existing Auth0 Login):
 * <ol>
 *      <li>Add {@link #DISCOURSE_CALLBACK_URL} field.</li>
 *      <li>Add {@link #DISCOURSE_SSO_SECRET} field.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.9.16 (Release Assembly - Member Report Improvements):
 * <ol>
 *      <li>Add {@link #NEW_HANDLE} field.</li>
 *      <li>Add {@link #NEW_HANDLE_INPUT} field.</li>
 *      <li>Add {@link #NEW_STATUS} field.</li>
 *      <li>Add {@link #NEW_STATUS_SELECT} field.</li>
 *      <li>Add {@link #OLD_STATUS_SELECT_VALUE} field.</li>
 *      <li>Add {@link #NEW_STATUS_COMMENT} field.</li>
 *      <li>Add {@link #USER_HANDLE_CHANGE} field.</li>
 *      <li>Add {@link #USER_STATUS_CHANGE} field.</li>
 * </ol>
 * </p>
 *
 * @author pulky, isv, VolodymyrK, TrePe, gevak, ecnu_haozi, tangzx, gonia_119, frozenfx
 * @version 1.9.16
 */
public class Constants implements WebConstants {

    private static final TCResourceBundle bundle = new TCResourceBundle("TC");

    private static final Logger log = Logger.getLogger(Constants.class);

    /**
     * Developer portal main page.
     */
    public static String DEVELOPER_PORTAL;

    /**
     * Developer portal welcome page.
     */
    public static String DEVELOPER_PORTAL_WELCOME;

    public static String DEFAULT_PAGE;

    public static String HOME_PAGE;

    public static String VIEW_LEADER_BOARD_PAGE;

    public static String VIEW_ROOKIE_BOARD_PAGE;

    public static String VIEW_COMPETITION_HISTORY_PAGE;

    public static String VIEW_RELIABILITY_DETAIL_PAGE;

    public static String VIEW_REVIEWER_RATING_HISTORY_PAGE;

    public static String VIEW_REVIEW_FEEDBACK_DETAILS_PAGE;

    public static String VIEW_CURRENT_PROJECTS_PAGE;

    public static String VIEW_ALGO_COMPETITION_HISTORY_PAGE;

    public static String VIEW_PAYMENT_SUMMARY_PAGE;

    public static String VIEW_PAYMENT_DETAIL_PAGE;

    public static String CODER_LIST_KEY;

    public static String HISTORY_LIST_KEY;

    public static String COMPETITION_HISTORY_COMMAND;

    public static String COMPETITION_HISTORY_QUERY;

    public static String REVIEWER_RATING_HISTORY_COMMAND;

    public static String REVIEWER_RATING_HISTORY_QUERY;

    public static String REVIEW_FEEDBACK_KEY;

    public static String REVIEW_FEEDBACK_DETAILS_COMMAND;

    public static String REVIEW_FEEDBACK_DETAILS_QUERY;

    public static String ALGO_COMPETITION_HISTORY_COMMAND;

    public static String ALGO_COMPETITION_HISTORY_QUERY;

    public static String CURRENT_PERIOD_COMMAND;

    public static String CURRENT_PERIOD_QUERY;

    public static String DR_STAGE_COMMAND;

    public static String DR_STAGE_QUERY;

    public static int MAX_LEADERS;

    public static int DEFAULT_LEADERS;

    public static int MAX_HISTORY;

    public static int DEFAULT_HISTORY;

    public static String TYPE_KEY;

    public static String STAGE_LIST_KEY;

    public static String SEASON_LIST_KEY;

    public static String DEFAULT_COLLEGE_TOUR;

    public static String MAX_COLLEGE_TOUR;

    /* request parameters */
    // todo convert problem id to pm and move it to webconstants. it is only used by problem rating right now
    public static String PROBLEM_ID;

    public static String SURVEY_ID;

    public static String FIRST_NAME;

    public static String LAST_NAME;

    public static final String COMPANY_NAME = "compName";

    public static String NOTE_ID;

    public static String STATE_CODE;

    public static String COUNTRY_CODE;

    public static String MIN_RATING;

    public static String MAX_RATING;

    public static String MIN_DESIGN_RATING;

    public static String MAX_DESIGN_RATING;

    public static String MIN_DEV_RATING;

    public static String MAX_DEV_RATING;

    public static String MIN_NUM_RATINGS;

    public static String MAX_NUM_RATINGS;

    public static String MAX_DAYS_SINCE_LAST_COMP;

    public static String NOTE_TEXT;

    public static String CONTACT_TEXT;

    public static String SCHOOL_NAME;

    public static int TCO05_LOGO_TERMS_ID;

    public static int TCO06_LOGO_TERMS_ID;

    public static int TCCC06_LOGO_TERMS_ID;

    public static String LOGO;

    public static int TCO05_SPONSOR_TERMS_ID;

    public static String MIN_HS_RATING;

    public static String MAX_HS_RATING;

    public static String MIN_NUM_HS_RATINGS;

    public static String MAX_NUM_HS_RATINGS;

    public static String MAX_DAYS_SINCE_LAST_HS_COMP;

    public static String MIN_MAR_RATING;

    public static String MAX_MAR_RATING;

    public static String MIN_NUM_MAR_RATINGS;

    public static String MAX_NUM_MAR_RATINGS;

    public static String MAX_DAYS_SINCE_LAST_MAR_COMP;

    public static String PROJECT_ID;

    public static String PROJECT_TYPE_ID;

    public static String PROJECT_TYPES_ID;

    public static String PHASE_ID;

    public static String SEASON_ID;

    public static String REVIEW_RESP_ID;

    public static String DOCUMENT_ID;

    /**
     * <p>
     * A <code>String</code> providing the name of request parameter with ID of review auction.
     * </p>
     * 
     * @since 1.9.7
     */
    public static String REVIEW_AUCTION_ID;

    /**
     * <p>
     * A <code>String</code> providing the name of request parameter with ID of review application role.
     * </p>
     * 
     * @since 1.9.7
     */
    public static String REVIEW_APPLICATION_ROLE_ID;

    /**
     * <p>
     * A <code>String</code> providing the fully-qualified name of class implementing
     * <code>ProjectPaymentCalculator</code> interface to be used for calculating the payments for projects.
     * </p>
     * 
     * @since 1.9.8
     */
    public static String PROJECT_PAYMENT_CALCULATOR_CLASS_NAME;

    /**
     * Represents the resource role IDs parameter name in query tool.
     * 
     * @since 1.9.1
     */
    public static String RESOURCE_ROLE_IDS;

    public static String STAGE_ID;

    public static String PRIMARY_FLAG;

    public static String REVIEWER_TYPE_ID;

    public static String QUESTION_PREFIX;

    public static String ANSWER_PREFIX;

    public static String MESSAGE;

    public static String SUBMISSION_TYPE;

    /* pages */
    public static String SURVEY_RESULTS;

    public static String SCHULZE_RESULTS;

    public static String SURVEY_VIEW;

    public static String SURVEY_LIST;

    public static String SURVEY_THANKS;

    public static String CRPF_REPORT;

    public static String PROBLEM_RATING_RESULTS;

    public static String PROBLEM_RATING_QUESTIONS;

    public static String PROBLEM_RATING_QUESTION_INFO;

    public static String HIGHEST_RATING;

    public static String PROBLEM_ARCHIVE;

    public static String PROBLEM_DETAIL;

    public static String LOGIN;

    public static String ACTIVATE;

    public static String EMAIL_ACTIVATE;

    public static String EMAIL_ACTIVATE_CONFIRM;

    public static String RECOVER_PASSWORD;

    public static String RESET_PASSWORD;

    public static String RESET_PASSWORD_CONFIRM;

    public static String RECOVER_PASSWORD_CONFIRM;

    public static String EMAIL_SENT;

    public static String SIMPLE_SEARCH_RESULTS;

    public static String ADVANCED_SEARCH_RESULTS;

    public static String ADVANCED_SEARCH;

    public static String PUBLIC_HOME_PAGE;

    public static String MEMBER_HOME_PAGE;

    public static String TCCC04_TERMS;

    public static String TCO04_TERMS;

    public static String TCCC05_TERMS;

    public static String TCO05_TERMS;

    public static String CARD_PREVIEW;

    public static String CARD_INSTRUCTIONS;

    public static String DOWNLOADS;

    public static String LANDING_PAGE;

    public static String REFERRALS;

    public static String DESIGN_REVIEWERS;

    public static String DEV_REVIEWERS;

    public static String RATING_SIM;

    public static String PLACEMENT_INFO_DETAIL;

    public static String NOTE_LIST;

    public static String NOTE_EDIT;

    /**
     * <p>
     * A <code>String</code> referencing the view for editing the government issued ID document.
     * </p>
     * 
     * @since 1.9.4
     */
    public static String GOVERNMENT_ID_EDIT;

    public static String CONTACT_DATE;

    public static String TCS_SURVEY_RESULTS;

    public static String MEMBER_PROFILE;

    public static String MEMBER_CONTACT;

    public static String VISA_LETTER_REQUEST;

    public static String VISA_LETTER_REQUEST_STATUS;

    public static String VISA_SELECTION;

    public static String VISA_ERROR;

    public static String MEMBER_CONTACT_ENABLE_SUCCEEDED;

    public static String MEMBER_CONTACT_ENABLE;

    public static String MEMBER_CONTACT_FROM_ADDRESS;

    public static String MEMBER_CONTACT_SUBJECT;

    public static String MEMBER_CONTACT_SUBJECT_COPY;

    public static String VALIDATE_HANDLE;

    public static String BLACK_LIST;

    public static String BLOCK_HANDLE;

    public static String DOWNLOAD_SUBMISSION;

    public static String DOWNLOAD_SUBMISSION_TERMS;

    public static String ACTIVE_BUGRACE_COMPETITIONS;

    public static String AGREE_TO_TERMS;

    /**
     * Represents the jsp page for request processor view copilot pool.
     */
    public static String COPILOT_POOL;

    /**
     * Represents the jsp page for request processor view copilot profile.
     */
    public static String COPILOT_PROFILE;

    /**
     * Represents the jsp page for request processor view copilot project history.
     */
    public static String COPILOT_PROJECT_HISTORY;

    /**
     * Represents the jsp page for request processor view copilot project.
     */
    public static String COPILOT_PROJECT;

    /**
     * <p>
     * A <code>String</code> providing the path to the unified review project detail page.
     * </p>
     * 
     * @since 1.1
     */
    public static final String UNIFIED_REVIEW_PROJECT_DETAIL_PAGE = "/review_board/reviewProjectDetail.jsp";

    /**
     * <p>
     * A <code>String</code> providing the path to the unified review project page.
     * </p>
     * 
     * @since 1.1
     */
    public static final String UNIFIED_REVIEW_PROJECTS_PAGE = "/review_board/reviewProjects.jsp";

    public static String REVIEWER_TERMS;

    /**
     * <p>
     * A <code>String</code> providing the logical name for the view corresponding to
     * <code>Assembly Review Terms</code> page.
     * </p>
     * 
     * @since TCS Release 2.2.0 (TCS-54)
     */
    public static final String ASSEMBLY_REVIEWER_TERMS = "/dev/assembly/reviewerTerms.jsp";

    /**
     * <p>
     * A <code>String</code> providing the logical name for the view corresponding to
     * <code>Architecture Review Terms</code> page.
     * </p>
     * 
     * @since TCS Release 2.2.1 (TCS-57)
     */
    public static final String ARCHITECTURE_REVIEWER_TERMS = "/architecture/reviewerTerms.jsp";

    /**
     * <p>
     * A <code>String</code> providing the path to the unified review terms page.
     * </p>
     * 
     * @since 1.1
     */
    public static final String UNIFIED_REVIEWER_TERMS_PAGE = "/review_board/reviewerTerms.jsp";

    /**
     * <p>
     * A <code>String</code> providing the path to the unified meet the review board page.
     * </p>
     * 
     * @since 1.1
     */
    public static final String UNIFIED_MEET_REVIEW_BOARD_PAGE = "/review_board/meetReviewBoard.jsp";

    /**
     * <p>
     * Minimum conceptualization rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MIN_CONCEPT_RATING;

    /**
     * <p>
     * Maximum conceptualization rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MAX_CONCEPT_RATING;

    /**
     * <p>
     * Minimum specification rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MIN_SPEC_RATING;

    /**
     * <p>
     * Maximum specification rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MAX_SPEC_RATING;

    /**
     * <p>
     * Minimum architecture rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MIN_ARCH_RATING;

    /**
     * <p>
     * Maximum architecture rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MAX_ARCH_RATING;

    /**
     * <p>
     * Minimum assembly rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MIN_ASS_RATING;

    /**
     * <p>
     * Maximum assembly rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MAX_ASS_RATING;

    /**
     * <p>
     * Minimum test suites rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MIN_TEST_RATING;

    /**
     * <p>
     * Maximum test suites rating parameter name.
     * </p>
     * 
     * @since Member Profile Enhancment assembly
     */
    public static String MAX_TEST_RATING;

    /**
     * <p>
     * Minimum test scenarios rating parameter name.
     * </p>
     * 
     * @since 1.9
     */
    public static String MIN_TEST_SCENARIOS_RATING;

    /**
     * <p>
     * Maximum test scenarios rating parameter name.
     * </p>
     * 
     * @since 1.9
     */
    public static String MAX_TEST_SCENARIOS_RATING;

    /**
     * <p>
     * Minimum ui prototype rating parameter name.
     * </p>
     * 
     * @since 1.9
     */
    public static String MIN_UI_PROTOTYPE_RATING;

    /**
     * <p>
     * Maximum ui prototype rating parameter name.
     * </p>
     * 
     * @since 1.9
     */
    public static String MAX_UI_PROTOTYPE_RATING;

    /**
     * <p>
     * Minimum ria build rating parameter name.
     * </p>
     * 
     * @since 1.9
     */
    public static String MIN_RIA_BUILD_RATING;

    /**
     * <p>
     * Maximum ria build rating parameter name.
     * </p>
     * 
     * @since 1.9
     */
    public static String MAX_RIA_BUILD_RATING;

    public static String MIN_CONTENT_CREATION_RATING;

    public static String MAX_CONTENT_CREATION_RATING;

    public static String MIN_REPORTING_RATING;

    public static String MAX_REPORTING_RATING;

    /**
     * <p>
     * A <code>String</code> providing the namespace of terms of use DAO implementation.
     * </p>
     * 
     * @since 1.9.1
     */
    public static String TERMS_OF_USE_DAO_NS;

    /**
     * <p>
     * A <code>String</code> providing the namespace of user terms of use DAO implementation.
     * </p>
     * 
     * @since 1.9.1
     */
    public static String USER_TERMS_OF_USE_DAO_NS;

    /**
     * <p>
     * A <code>String</code> providing the namespace of project terms of use DAO implementation.
     * </p>
     * 
     * @since 1.9.1
     */
    public static String PROJECT_TERMS_OF_USE_DAO_NS;

    /**
     * <p>
     * The id of the non agreeable terms type.
     * </p>
     * 
     * @since 1.9.1
     */
    public static int NON_AGREEABLE_TERMS_TYPE_ID;

    /**
     * <p>
     * The id of the non-electronically agreeable terms type.
     * </p>
     * 
     * @since 1.9.1
     */
    public static int NON_ELEC_AGREEABLE_TERMS_TYPE_ID;

    /**
     * <p>
     * The id of the electronically agreeable terms type.
     * </p>
     * 
     * @since 1.9.1
     */
    public static int ELEC_AGREEABLE_TERMS_TYPE_ID;

    /**
     * <p>
     * The id of the docusignable terms type.
     * </p>
     */
    public static int DOCUSIGNABLE_TERMS_TYPE_ID;

    /* misc constants */
    public static int SRM_SURVEY_QUESTION;

    public static int TOURNAMENT_SURVEY_QUESTION;

    public static int SEARCH_SCROLL_SIZE;

    public static int PROBLEM_ARCHIVE_SCROLL_SIZE;

    public static int COLOR_CHANGE_SCROLL_SIZE;

    public static String STATISTICS_PATH;

    public static int TCCC04_TERMS_OF_USE_ID;

    public static int TCO04_EVENT_ID;

    public static int TCO04_ALGORITHM_TERMS_OF_USE_ID;

    public static int TCO04_COMPONENT_TERMS_OF_USE_ID;

    public static int TCCC05_EVENT_ID;

    public static int TCCC05_ALGORITHM_TERMS_OF_USE_ID;

    public static int TCCC05_COMPONENT_TERMS_OF_USE_ID;

    public static int TCO05_EVENT_ID;

    public static final int TCO06_EVENT_ID = 5;

    public static final int TCCC06_EVENT_ID = 6;

    public static int TCO05_ALGORITHM_TERMS_OF_USE_ID;

    public static int TCO05_COMPONENT_TERMS_OF_USE_ID;

    public static final int TCO06_ALGORITHM_TERMS_OF_USE_ID = 20383;

    public static final int TCO06_COMPONENT_TERMS_OF_USE_ID = 20384;

    public static final int TCO05_SPONSOR_COMPANY_QUESTION_ID = 30;

    public static final int TCO06_SPONSOR_COMPANY_QUESTION_ID = 31;

    public static final int TCO06_SPONSOR_TERMS_ID = 20388;

    public static final int TCCC06_ALGORITHM_TERMS_OF_USE_ID = 20504;

    public static final int TCCC06_COMPONENT_TERMS_OF_USE_ID = 20503;

    public static int DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID;

    public static final int TCCC06_SPONSOR_TERMS_ID = 20523;

    public static final int TCCC06_SPONSOR_COMPANY_QUESTION_ID = 136;

    public static final int TCHS07_TERMS_OF_USE_ID = 20553;

    public static int UNLOCK_CARD_PREFERENCE_ID;

    public static int JAVA_CATALOG_ID;

    public static int DOT_NET_CATALOG_ID;

    public static int CUSTOM_JAVA_CATALOG_ID;

    public static int CUSTOM_DOT_NET_CATALOG_ID;

    public static int FLASH_CATALOG_ID;

    public static int APPLICATIONS_CATALOG_ID;

    public static int CPP_CATALOG_ID;

    public static int INTERNAL_NOTE_TYPE_ID;

    // public static int LANGUAGE_NOTE_TYPE_ID;
    // public static int TECH_NOTE_TYPE_ID;
    // public static int OS_NOTE_TYPE_ID;
    // public static int DB_NOTE_TYPE_ID;
    // public static int INDUSTRY_NOTE_TYPE_ID;
    public static int MAX_RATED_INQUIRIES;

    public static int MAX_UNRATED_INQUIRIES;

    public static int REVIEWER_TERMS_ID;

    public static int PROJECT_TERMS_ID;

    public static int ARCHITECTURE_TERMS_ID;

    public static int TOURNAMENT_COMPONENT;

    // public static int ACTIVE_REVIEWER;

    public static int PASSWORD_RECOVERY_EXPIRE;

    /* job posting stuff */
    public static String JOB_HIT_TYPE_PARAM;

    public static String JOB_HIT_PREFIX;

    public static int CLICK_THRU_ID;

    public static int PLACEMENT_CLICK_THRU_ID;

    public static int JOB_POSTING_ID;

    public static String JOB_ID_PARAM;

    public static String PROFILE_PAGE;

    public static String UNRATED_PAGE;

    public static String NO_RESUME_PAGE;

    public static String CLASS_NAME;

    public static String CATEGORY;

    public static String MIN_DIV1_SUCCESS;

    public static String MIN_DIV2_SUCCESS;

    public static String MAX_DIV1_SUCCESS;

    public static String MAX_DIV2_SUCCESS;

    public static String DIV1_LEVEL;

    public static String DIV2_LEVEL;

    public static String WRITER;

    public static String JOB_HIT_MESSAGE_NOT_REGISTERED;

    public static String JOB_HIT_MESSAGE_UN_REGISTERED;

    // profile generator constants
    public static String PROFILE_DOC_CONVERTOR_PAGE;

    public static String PROFILE_MAIN_PAGE;

    public static String PROFILE_CONFIG_PAGE;

    /* Contract Constants */
    public static String CONTRACTING_INFO;

    public static String CONTRACTING_PREFERENCES_PAGE;

    public static String CONTRACTING_LANGUAGES_PAGE;

    public static String CONTRACTING_TECHNOLOGIES_PAGE;

    public static String CONTRACTING_OS_PAGE;

    public static String CONTRACTING_DATABASES_PAGE;

    public static String CONTRACTING_INDUSTRIES_PAGE;

    public static String CONTRACTING_CONFIRM_PAGE;

    public static String CONTRACTING_SUCCESS_PAGE;

    public static String PREFERENCE_PREFIX;

    public static String SKILL_PREFIX;

    public static String NOTE_PREFIX;

    public static String TCCC05_STUDENT_REPS;

    public static final String URL = "url";

    public static final String FIELD_OF_INSTRUCTION = "fofins";

    public static final String OTHER_FIELD_OF_INSTRUCTION = "o" + FIELD_OF_INSTRUCTION;

    public static final String NOMINATION_TEXT = "nomtxt";

    public static final String COLLEGE_TOUR_EVENT_ID = "cteid";

    public static final String COLLEGE_TOUR_CONFIG_INFO = "configInfo";

    public static final String ROUND_NAME = "rdname";

    public static final String EVENT_NAME = "ename";

    public static final String EVENT_ID = "eid";

    public static final String EVENT_TYPE = "et";

    public static final String HANDLE = "ha";

    public static final int ACHIEVEMENT_TYPE_COM = 1;

    public static final int ACHIEVEMENT_TYPE_NAUGHTY = 2;

    public static final int ACHIEVEMENT_TYPE_OTHER = 3;

    public static final int ACHIEVEMENT_TYPE_TOURNEY_AWARD = 4;

    public static final int ACHIEVEMENT_TYPE_ALGO_COM = 5;

    public static final int ACHIEVEMENT_TYPE_DESIGN_COM = 6;

    public static final int ACHIEVEMENT_TYPE_DEV_COM = 7;

    public static final String ACHIEVEMENT_TYPE_ID = "achtid";

    // High School statistics
    public static String HS_ROUND_OVERVIEW;

    public static String HS_ROUND_STATS_TEAM;

    public static String HS_ROUND_STATS_IND;

    public static String HS_ROOM_STATS;

    public static String HS_TEAM_RESULTS;

    public static String HS_RANK;

    public static String HS_TEAM_RANK;

    public static String HS_COUNTRY_RANK;

    public static String HS_PROBLEM_STATEMENT;

    public static String HS_PROBLEM_SOLUTION;

    public static String HS_RATING_HISTORY;

    public static String HS_VIEW_REGISTER;

    public static String HS_VIEW_UNREGISTER;

    public static String HS_UNREGISTER;

    public static String HS_REGISTER_SUCCESS;

    public static String HS_REGISTER_NOT_ELIGIBLE;

    public static final int CONTEST_TYPE_DR_TOP_PERFORMERS = 18;

    public static final int CONTEST_TYPE_DR_STAGE = 19;

    public static final int CONTEST_TYPE_DR_ROOKIE = 20;

    public static String DEFAULT_SURVEY_SCROLL_SIZE;

    public static final String COLOR = "color";

    public static String ACTIVATE_IP_TRANSFER;

    // Flag to turn on/off the global AD feature
    public static String GLOBAL_AD_FLAG;

    public static String APPLY_REVIEW_BOARD_WITHHOLDING;

    public static String RSVP_TO_ADDRESS;

    public static final String DATASOURCE_ID = "dsid";

    public static final String DATA_RETURN_TYPE = "drt";

    public static String CAPTCHA_PATH;

    public static final String CAPTCHA_FILE_NAME = "capfname";

    public static final String CAPTCHA_WORD = "capword";

    public static String RANDOM_STRING_IMAGE_CONFIG;

    public static final String CAPTCHA_RESPONSE = "capresp";

    public static String DR_POINTS_LAST_N_DAYS = "7";

    /**
     * <p>
     * A <code>String</code> referencing event parameter name.
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static final String EVENT = "event";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 short description
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static String TCO09_SHORT_DESC = "tco09";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 terms success page.
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static String TCO09_TERMS_SUCCESS_PAGE = "/tournaments/tco09/termsSuccess.jsp";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 terms page.
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static String TCO09_TERMS_PAGE = "/tournaments/tco09/terms.jsp";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 view registration request.
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static String TCO09_VIEW_REGISTRATION_REQUEST = "/tco09?module=ViewUnifiedRegistration";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 registrants command.
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static String TCO09_REGISTRANTS_COMMAND = "tco09_registrants";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 overview page.
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static String TCO09_OVERVIEW_PAGE = "/tournaments/tco09/overview/overview.jsp";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 registrants page.
     * </p>
     * 
     * @since 2009 TopCoder Open Site Integration
     */
    public static String TCO09_REGISTRANTS_PAGE = "/tournaments/tco09/overview/registrants.jsp";

    /**
     * <p>
     * A <code>String</code> referencing complete parameter name.
     * </p>
     * 
     * @since 1.2
     */
    public static final String COMPLETE_KEY = "complete";

    /**
     * <p>
     * An <code>int</code> referencing the maximum competitor rank that goes onsite for TCO09 Studio track.
     * </p>
     * <p>
     * Note: default set to 10.
     * </p>
     * 
     * @since 1.2
     */
    public static int TCO09_STUDIO_TOP_ONSITE_RANK = 10;

    /**
     * <p>
     * An <code>int</code> referencing the amount of placement points for first placed submission in the TCO09
     * Studio track.
     * </p>
     * <p>
     * Note: default set to 17.
     * </p>
     * 
     * @since 1.2
     */
    public static int TCO09_STUDIO_PLACE_SCORE_1 = 17;

    /**
     * <p>
     * An <code>int</code> referencing the amount of placement points for second placed submission in the TCO09
     * Studio track.
     * </p>
     * <p>
     * Note: default set to 15.
     * </p>
     * 
     * @since 1.2
     */
    public static int TCO09_STUDIO_PLACE_SCORE_2 = 15;

    /**
     * <p>
     * An <code>int</code> referencing the amount of placement points for third placed submission in the TCO09
     * Studio track.
     * </p>
     * <p>
     * Note: default set to 13.
     * </p>
     * 
     * @since 1.2
     */
    public static int TCO09_STUDIO_PLACE_SCORE_3 = 13;

    /**
     * <p>
     * An <code>int</code> referencing the amount of placement points for fourth placed submission in the TCO09
     * Studio track.
     * </p>
     * <p>
     * Note: default set to 10.
     * </p>
     * 
     * @since 1.2
     */
    public static int TCO09_STUDIO_PLACE_SCORE_4 = 10;

    /**
     * <p>
     * An <code>int</code> referencing the amount of placement points for fifth placed submission in the TCO09
     * Studio track.
     * </p>
     * <p>
     * Note: default set to 7.
     * </p>
     * 
     * @since 1.2
     */
    public static int TCO09_STUDIO_PLACE_SCORE_5 = 7;

    /**
     * <p>
     * A <code>String</code> referencing TCO09 Studio track leaderboard page.
     * </p>
     * 
     * @since 1.2
     */
    public static String TCO09_STUDIO_LEADERBOARD_PAGE = "/tournaments/tco09/studio/advancers/leaderboard.jsp";

    /**
     * <p>
     * A <code>String</code> referencing TCO09 Studio track leaderboard details page.
     * </p>
     * 
     * @since 1.2
     */
    public static String TCO09_STUDIO_LEADERBOARD_DETAILS_PAGE =
        "/tournaments/tco09/studio/advancers/leaderboardDetails.jsp";

    /**
     * <p>
     * A <code>String</code> providing the path to the Project View report page.
     * </p>
     * 
     * @since 1.5
     */
    public static String PROJECT_VIEW_PAGE = "/projectview/projectView.jsp";

    /**
     * <p>
     * An <code>int</code> representing the default number of weeks for the date filter interval.
     * </p>
     * 
     * @since 1.5
     */
    public static int PROJECT_VIEW_DEFAULT_WEEKS_INTERVAL = 4;

    /**
     * <p>
     * A <code>String</code> providing date format used in the Project View report page.
     * </p>
     * 
     * @since 1.5
     */
    public static String PROJECT_VIEW_DATE_FORMAT = "yyyy.MM.dd HH:mm";

    /**
     * <p>
     * A <code>String</code> providing alternate date format used in the Project View report page.
     * </p>
     * 
     * @since 1.5
     */
    public static String ALTERNATE_PROJECT_VIEW_DATE_FORMAT = "yyyy.MM.dd";

    /**
     * <p>
     * An <code>int</code> representing the default number of weeks for the date filter interval.
     * </p>
     * 
     * @since 1.6
     */
    public static int MINIMUM_PAYMENT_ACCRUAL_AMOUNT = 25;

    /**
     * <p>
     * An <code>int</code> referencing the <code>Digital Run</code> track contest type of <code>Top N Prize</code>.
     * </p>
     * 
     * @since 1.6
     */
    public static final int CONTEST_TYPE_DR_V2_PRIZE = 1;

    /**
     * <p>
     * An <code>int</code> referencing the <code>Digital Run</code> track contest type of
     * <code>Top Performers Prize</code>.
     * </p>
     * 
     * @since 1.6
     */
    public static final int CONTEST_TYPE_DR_V2_TOP_PERFORMERS = 2;

    /**
     * <p>
     * A <code>String</code> providing the RSS address of the current news in press room page.
     * </p>
     * 
     * @since 1.8
     */
    public static String CURRENT_NEWS_RSS;

    /**
     * <p>
     * A <code>String</code> providing the allowed categories of the current news in press room page.
     * </p>
     * 
     * @since 1.8
     */
    public static String CURRENT_NEWS_CATEGORY;

    /**
     * <p>
     * A <code>String</code> providing the RSS address of the release archive in press room page.
     * </p>
     * 
     * @since 1.8
     */
    public static String RELEASE_ARCHIVE_RSS;

    /**
     * <p>
     * A <code>String</code> providing the allowed categories of the release archive in press room page.
     * </p>
     * 
     * @since 1.8
     */
    public static String RELEASE_ARCHIVE_CATEGORY;

    /**
     * <p>
     * A <code>String</code> providing the RSS address of the articles archive in press room page.
     * </p>
     * 
     * @since 1.8
     */
    public static String ARTICLES_ARCHIVE_RSS;

    /**
     * <p>
     * A <code>String</code> providing the allowed categories of the articles archive in press room page.
     * </p>
     * 
     * @since 1.8
     */
    public static String ARTICLES_ARCHIVE_CATEGORY;

    public static final String CONFIGURATION_FILE = "com/topcoder/util/config/ConfigManager.properties";

    /**
     * <p>
     * A <code>String</code> providing the template for confirmation message when user with PayPal preferred wants
     * to process payments.
     * </p>
     * 
     * @since 1.9.3
     */
    public static String PAYME_CONFIRMATION_MESSAGE_TEMPLATE_PAYPAL;

    /**
     * <p>
     * A <code>String</code> providing the template for confirmation message when user with Payoneer preferred
     * wants to process payments.
     * </p>
     * 
     * @since 1.9.3
     */
    public static String PAYME_CONFIRMATION_MESSAGE_TEMPLATE_PAYONEER;

    /**
     * <p>
     * A <code>String</code> providing the template for confirmation message when user with Western Union preferred
     * wants to process payments.
     * </p>
     * 
     * @since 1.9.3
     */
    public static String PAYME_CONFIRMATION_MESSAGE_TEMPLATE_WESTERN_UNION;

    /**
     * <p>
     * A <code>String</code> providing the subject for email message to be sent to intended recipient in case of
     * insufficient balance encountered while processing user payments.
     * </p>
     * 
     * @since 1.9.3
     */
    public static String INSUFFICIENT_BALANCE_EMAIL_SUBJECT;

    /**
     * <p>
     * A <code>String</code> providing the FROM address for email message to be sent to intended recipient in case
     * of insufficient balance encountered while processing user payments.
     * </p>
     * 
     * @since 1.9.3
     */
    public static String INSUFFICIENT_BALANCE_EMAIL_FROM_ADDRESS;

    /**
     * <p>
     * A <code>String</code> providing the TO address for email message to be sent to intended recipient in case of
     * insufficient balance encountered while processing user payments.
     * </p>
     * 
     * @since 1.9.3
     */
    public static String INSUFFICIENT_BALANCE_EMAIL_TO_ADDRESS;

    /**
     * <p>
     * A <code>String</code> providing the tab index to show for contest detail page.
     * </p>
     * 
     * @since 1.9.2
     */
    public static final String TAB_INDEX = "tab";

    /**
     * <p>
     * A <code>String</code> providing the name of the request attribute providing the ID for government issued ID
     * document.
     * </p>
     * 
     * @since 1.9.4
     */
    public static final String GOVERNMENT_ID = "gov_id";

    /**
     * <p>
     * A <code>String</code> providing the name of the request attribute providing the number for government issued
     * ID document.
     * </p>
     * 
     * @since 1.9.4
     */
    public static final String GOVERNMENT_ID_NUMBER = "gov_id_num";

    /**
     * <p>
     * A <code>String</code> providing the name of the request attribute providing the date of receiving for
     * government issued ID document.
     * </p>
     * 
     * @since 1.9.4
     */
    public static final String GOVERNMENT_ID_EXPIRES = "gov_id_exp";

    /**
     * <p>
     * A <code>String</code> providing the name of the request attribute providing the date for expiration for
     * government issued ID document.
     * </p>
     * 
     * @since 1.9.4
     */
    public static final String GOVERNMENT_ID_RECEIVED = "gov_id_rcv";

    /**
     * <p>
     * A <code>String</code> providing the subject for email message to be sent to intended recipient in case of
     * modifications to their payment preferences.
     * </p>
     * 
     * @since 1.9.5
     */
    public static String PAYMENT_PREFS_UPDATE_EMAIL_SUBJECT;

    /**
     * <p>
     * A <code>String</code> providing the FROM address for email message to be sent to intended recipient in case
     * of modifications to their payment preferences.
     * </p>
     * 
     * @since 1.9.5
     */
    public static String PAYMENT_PREFS_UPDATE_EMAIL_FROM_ADDRESS;

    /**
     * <p>
     * A <code>String</code> providing the name of request attribute providing the list of countries.
     * </p>
     * 
     * @since 1.9.4
     */
    public static final String COUNTRIES = "countries";

    /**
     * The agree to terms page.
     */
    public static final String AGREE_TO_TERMS_PAGE = "/terms/agree_to_terms.jsp";

    /**
     * The is_agree attribute in request.
     */
    public static final String IS_AGREE = "is_agree";

    /**
     * The terms content key in attribute.
     */
    public static final String TERMS_CONTENT = "terms.content";

    /**
     * The origin key in request.
     */
    public static final String TERMS_ORIGIN_PAGE_KEY = "origin";

    /**
     * The the filename key in download request.
     */
    public static final String FILE_NAME = "filename";

    /**
     * The return signing page which the controller will show.
     * @since 1.9.14
     */
    public static String RETURN_SIGNING;

    /**
     * The affidavit docusign template id.
     * @since 1.9.14
     */
    public static String AFFIDAVIT_DOCUSIGN_TEMPLATE_ID;

    /**
     * The sign document jsp page which the controller will show. 
     * @since 1.9.14
     */
    public static String SIGN_DOCUMENT;

    /**
     * The file download terms id.
     */
    public static String FILE_DOWNLOAD_TERMS_ID;

    /**
     * The default page attribute in request.
     */
    public static String AGREE_TO_TERMS_DEFAULT_PAGE;

    /**
     * The file download path.
     */
    public static String FILE_TO_DOWNLOAD_PATH;

    /**
     * <p>
     * The number of seconds the Resend Token button should be disabled after a click.
     * </p>
     * 
     * @since 1.9.9
     */
    public static int RESEND_BUTTON_DELAY_SECONDS;

    /**
     * <p>
     *The ID of the email type for the primary email.
     * </p>
     * 
     * @since 1.9.9
     */
    public static int PRIMARY_EMAIL_TYPE_ID;

    /**
     * <p>
     *The ID of the email type for the second email.
     * </p>
     * 
     * @since 1.9.9
     */
    public static int SECOND_EMAIL_TYPE_ID;

    /**
     * <p>
     *The full name of the in-use class that implements TokenGenerator interface
     * </p>
     * 
     * @since 1.9.9
     */
    public static String RESET_TOKEN_GENERATOR_CLASS;

    /**
     * <p>
     *The number of seconds after which the new reset tokens should expire.
     * </p>
     * 
     * @since 1.9.9
     */
    public static int RESET_TOKEN_AGE;


    /**
     * <p>
     *The subject of the mail that is used to notify the user the reset token.
     * </p>
     * 
     * @since 1.9.9
     */
    public static String RESET_TOKEN_NOTIFY_MAIL_SUBJECT;

    /**
     * <p>
     *The body of the mail that is used to notify the user the reset token.
     *It supports a variable {token} which is supposed to be replaced by the real token.
     * </p>
     * 
     * @since 1.9.9
     */
    public static String RESET_TOKEN_NOTIFY_MAIL_BODY;

    /**
     * <p>
     *The number of seconds after which the new send email requests should expire.
     * </p>
     * 
     * @since 1.9.9
     */
    public static int SECOND_EMAIL_REQUEST_AGE;

    /**
     * <p>
     *The subject of the mail that is used to verify the second mail.
     * </p>
     * 
     * @since 1.9.9
     */
    public static String SECOND_EMAIL_VERIFY_MAIL_SUBJECT;

    /**
     * <p>
     *The body of the mail that is used to verify the second mail.
     *It supports variables - {userId}, {key} and {expiredAt}  that are used to construct the verification link.
     * </p>
     * 
     * @since 1.9.9
     */
    public static String SECOND_EMAIL_VERIFY_MAIL_BODY;
    
    /**
     * <p>
     * The page to add second email .
     * </p>
     * 
     * @since 1.9.9
     */
    public static String SECOND_EMAIL_PAGE;
    
    /**
     * <p>
     * The page to notify the add second page request is accepted and waited for verification. 
     * </p>
     * 
     * @since 1.9.9
     */
    public static String SECOND_EMAIL_PAGE_CONFIRM;
    
    /**
     * <p>
     *The verification failed page.
     * </p>
     * 
     * @since 1.9.9
     */
    public static String UNVERIFY_PAGE ;

    /**
     * <p>
     *The verification pass page.
     * </p>
     * 
     * @since 1.9.9
     */
    public static String VERIFY_PAGE;
    
    /**
     * <p>The maximum length of the query input text field for FindUser controller.</p>
     * @since 1.9.9
     */
    public static int FIND_USER_QUERY_MAX_LENGTH;
    /**
     * <p>
     * The recovery by email page.
     * </p>
     * 
     * @since 1.9.9
     */
    public static String RECOVER_BY_EMAIL;

    /**
     * <p>The reset token notify mail from address.</p>
     * @since 1.9.9
     */
    public static String RESET_TOKEN_NOTIFY_MAIL_FROM_ADDRESS;

    /**
     * <p>The second email verify from address.</p>
     * @since 1.9.9
     */
    public static String SECOND_EMAIL_VERIFY_MAIL_FROM_ADDRESS;

    /**
     * <p>The PERMISSION session key.</p>
     * @since 1.9.11
     */
    public static String PERMISSION = "reg_permission";
    
        /**
     * <p>The reset token notify mail from personal.</p>
     * @since 1.9.11
     */
    public static String RESET_TOKEN_NOTIFY_MAIL_FROM_PERSONAL;
    /**
     * <p>The email change notify mail from address.</p>
     * @since 1.9.11
     */
    public static String EMAIL_CHANGE_NOTIFY_MAIL_FROM_ADDRESS;
    /**
     * <p>The email change notify mail from personal.</p>
     * @since 1.9.11
     */
    public static String EMAIL_CHANGE_NOTIFY_MAIL_FROM_PERSONAL;
    /**
     * <p>The email change notify mail subject.</p>
     * @since 1.9.11
     */
    public static String EMAIL_CHANGE_NOTIFY_MAIL_SUBJECT;
    /**
     * <p>The email change notify mail body.</p>
     * @since 1.9.11
     */
    public static String EMAIL_CHANGE_NOTIFY_MAIL_BODY;

    /**
     * <p>A <code>String</code> providing the client id in auth0.com to enable login with 
     * social accounts like Google, Facebook.</p>
     *
     * @since 1.9.12
     */
    public static String CLIENT_ID_AUTH0;

    /**
     * <p>The credential of the Auth0 account.</p>
     * 
     * @since 1.9.12
     */
    public static String CLIENT_SECRET_AUTH0;
    

    /**
     * <p>The callback url of the Auth0 account.</p>
     * 
     * @since 1.9.12
     */
    public static String REDIRECT_URL_AUTH0;
    
    /**
     * <p>The domain of the Auth0 account.</p>
     * 
     *  @since 1.9.12
     */
    public static String DOMAIN_AUTH0;
    

    /**
     * <p>The server name of tc_reg_revamp host.</p>
     * 
     *  @since 1.9.12
     */
    public static String REG_SERVER_NAME;

    /**
     * The bind callback url of auth0.
     *
     * @since 1.9.13
     */
    public static String BIND_CALLBACK_URL_AUTH0;

    /**
     * The discourse sso secret.
     *
     * @since 1.9.15
     */
    public static String DISCOURSE_SSO_SECRET;

    /**
     * The discourse callback url.
     *
     * @since 1.9.15
     */
    public static String DISCOURSE_CALLBACK_URL;

    /**
	 * The redirect url for when unactivated user login
	 */
    public static String UNACTIVATED_USER_REDIRECT_URL;

    /**
     * For changing user handle page's validation.
     *
     * @since 1.9.16
     */
    public static final String NEW_HANDLE = "new_handle";

    /**
     * For new handle input control.
     *
     * @since 1.9.16
     */
    public static final String NEW_HANDLE_INPUT = "new_handle_input";

    /**
     * For status page input validation.
     *
     * @since 1.9.16
     */
    public static final String NEW_STATUS = "new_status";

    /**
     * For new status select input.
     *
     * @since 1.9.16
     */
    public static final String NEW_STATUS_SELECT = "new_status_select";

    /**
     * For old status value.
     *
     * @since 1.9.16
     */
    public static final String OLD_STATUS_SELECT_VALUE = "old_status_select_value";

    /**
     * For new status comment input.
     *
     * @since 1.9.16
     */
    public static final String NEW_STATUS_COMMENT = "new_status_comment";

    /**
     * For change user handle jsp page name, and the real name was defined in the corresponding properties file.
     *
     * @since 1.9.16
     */
    public static String USER_HANDLE_CHANGE;

    /**
     * for status change jsp page name, and the real name was defined in the corresponding properties file.
     *
     * @since 1.9.16
     */
    public static String USER_STATUS_CHANGE;

    static {
        initialize();
    }

    private Constants() {
    }

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
