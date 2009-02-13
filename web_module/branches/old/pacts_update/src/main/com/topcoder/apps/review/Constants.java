/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.Phase;
import com.topcoder.apps.review.projecttracker.Role;

/**
 * <p>
 * Manifest constants for the front-end layer.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class Constants {

    /**
     * The package name for this application.
     */
    public static final String PACKAGE = "com.topcoder.apps.review";

    /**
     * The message resource name for this application.
     */
    public static final String MESSAGE_RESOURCE_KEY =
            "com.topcoder.apps.review.ReviewResources";

    /**
     * The message key for the error message from logic layer.
     */
    public static final String MESSAGE_ERROR_KEY = "error.format";

    // --------------------------------------------------------- JavaBean Name

    /**
     * The session scope attribute under which the User object
     * for the currently logged in user is stored.
     */
    public static final String USER_KEY = "user";

    /**
     * The session scope attribute under which the UtilityBean object
     * for the currently logged in user is stored.
     */
    public static final String UTILITY_KEY = "utility";

    /**
     * The session scope attribute under which the open projects
     * information is stored.
     */
    public static final String PROJECT_LIST_KEY = "projects";

    /**
     * The request scope attribute under which the open project
     * types are stored.
     */
    public static final String PROJECT_TYPE_KEY = "projectTypes";

    /**
     * The session scope attribute under which the project's detail
     * information is stored.
     */
    public static final String PROJECT_KEY = "project";

    /**
     * The request scope attribute under which the project's
     * information is stored.
     */
    public static final String PROJECT_INFO_KEY = "projectInfo";

    /**
     * The request scope attribute under which the scorecard list
     * information is stored.
     */
    public static final String SCORECARD_LIST_KEY = "scorecards";

    /**
     * The request scope attribute under which the screening scorecard list
     * information is stored.
     */
    public static final String SCREENING_LIST_KEY = "screenings";

    /**
     * The request scope attribute under which the review scorecard list
     * information is stored.
     */
    public static final String REVIEW_LIST_KEY = "reviews";

    /**
     * The request scope attribute under which the scorecard
     * information is stored.
     */
    public static final String SCORECARD_KEY = "scorecards";

    /**
     * The request scope attribute under which the submission
     * information is stored.
     */
    public static final String SUBMISSION_KEY = "submission";

    /**
     * The request scope attribute under which the submission list
     * information is stored.
     */
    public static final String SUBMISSION_LIST_KEY = "submissions";

    /**
     * The session scope attribute under which the aggregation
     * information is stored.
     */
    public static final String AGGREGATION_KEY = "aggregation";

    /**
     * The request scope attribute under which the aggregation reviews
     * information is stored.
     */
    public static final String AGG_REVIEW_LIST_KEY = "aggreviews";

    /**
     * The request scope attribute under which the final fix
     * information is stored.
     */
    public static final String FINAL_FIX_KEY = "finalfix";

    /**
     * The request scope attribute under which the final review
     * information is stored.
     */
    public static final String FINAL_REVIEW_KEY = "finalreview";

    /**
     * The request scope attribute under which the appeals
     * information is stored.
     */
    public static final String APPEAL_LIST_KEY = "appeals";

    /**
     * The request scope attribute under which the testcases
     * information is stored.
     */
    public static final String TESTCASE_LIST_KEY = "testcases";

    // --------------------------------------------------------- Action Mapping

    /**
     * The action mapping when login fail or login needed.
     */
    public final static String LOGIN_KEY = "login";

    /**
     * The action mapping when logoff.
     */
    public final static String LOGOFF_KEY = "logoff";

    /**
     * The action mapping when login fail or permission denied.
     */
    public final static String FAILURE_KEY = "failure";

    /**
     * The action mapping when login success.
     */
    public final static String SUCCESS_KEY = "success";

    /**
     * The action mapping when cancel.
     */
    public final static String CANCEL_KEY = "cancel";

    /**
     * The action mapping when admin login.
     */
    public final static String ADMIN_KEY = "admin";

    /**
     * The action mapping when editing.
     */
    public final static String EDIT_KEY = "edit";

    /**
     * The action mapping when viewing.
     */
    public final static String VIEW_KEY = "view";

    /**
     * The action mapping when popup.
     */
    public final static String POPUP_KEY = "popup";

    /**
     * The action mapping when terminating project.
     */
    public final static String TERMINATE_KEY = "terminate";

    // --------------------------------------------------------- URL Parameter

    /**
     * The parameter of project id.
     */
    public final static String ID_KEY = "id";

    /**
     * The parameter of whether to view all projects.
     */
    public final static String ALL_KEY = "all";

    /**
     * The parameter of index id.
     */
    public final static String CARD_ID_KEY = "cid";

    /**
     * The parameter of submitter id.
     */
    public final static String SUBMITTER_ID_KEY = "sid";

    /**
     * The parameter of submission id.
     */
    public final static String SUBMISSION_ID_KEY = "sid";

    /**
     * The parameter of reviewer id.
     */
    public final static String REVIEWER_ID_KEY = "rid";

    /**
     * The parameter of appealer id.
     */
    public static final String APPEALER_ID_KEY = "aid";

    /**
     * Indicates if upload testcases is visible in reviewScorecardList.
     */
    public static final String UPLOAD_TESTCASES_KEY = "upload_testcases";

    /**
     * The parameter of question id.
     */
    public static final String QUESTION_ID_KEY = "qid";

    /**
     * The parameter of user action.
     */
    public static final String ACTION_KEY = "action";

    /**
     * The string constant for action add.
     */
    public static final String ACTION_ADD = "add";

    /**
     * The string constant for action delete.
     */
    public static final String ACTION_DELETE = "delete";

    /**
     * The string constant for action save.
     */
    public static final String ACTION_SAVE = "save";

    /**
     * The string constant for action finish.
     */
    public static final String ACTION_FINISH = "finish";

    /**
     * The string constant for action view.
     */
    public static final String ACTION_VIEW = "view";

    /**
     * The string constant for action popup.
     */
    public static final String ACTION_POPUP = "popup";

    /**
     * The string constant for action edit.
     */
    public static final String ACTION_EDIT = "edit";

    /**
     * The string constant for action admin.
     */
    public static final String ACTION_ADMIN = "admin";

    /**
     * The string constant for action accept.
     */
    public static final String ACTION_ACCEPT = "accept";

    /**
     * The string constant for action reject.
     */
    public static final String ACTION_REJECT = "reject";

    /**
     * The string constant for action approve.
     */
    public static final String ACTION_APPROVE = "approve";

    /**
     * The string constant for action terminate.
     */
    public static final String ACTION_TERMINATE = "terminate";

    /**
     * The string constant for action partial.
     */
    public static final String ACTION_PARTIAL = "partial";

    // --------------------------------------------------------- Phase Id

    /**
     * The submission phase id.
     */
    public final static long PHASE_SUBMISSION = Phase.ID_SUBMISSION;

    /**
     * The screening phase id.
     */
    public final static long PHASE_SCREENING = Phase.ID_SCREENING;

    /**
     * The review phase id.
     */
    public final static long PHASE_REVIEW = Phase.ID_REVIEW;

    /**
     * The aggregation phase id.
     */
    public final static long PHASE_AGGREGATION = Phase.ID_AGGREGATION;

    /**
     * The appeals phase id.
     */
    public final static long PHASE_APPEALS = Phase.ID_APPEALS;

    /**
     * The aggregation review phase id.
     */
    public final static long PHASE_AGG_REVIEW = Phase.ID_AGGREGATION_REVIEW;

    /**
     * The final fix phase id.
     */
    public final static long PHASE_FINAL_FIX = Phase.ID_FINAL_FIXES;

    /**
     * The final review phase id.
     */
    public final static long PHASE_FINAL_REVIEW = Phase.ID_FINAL_REVIEW;

    /**
     * The component preparation phase id.
     */
    public final static long PHASE_COMP_PREPARE = Phase.ID_COMPONENT_PREPARATION;

    /**
     * The appelas response phase id.
     */
    public final static long PHASE_APPEALS_RESPONSE = Phase.ID_APPEALS_RESPONSE;

    // --------------------------------------------------------- Role Id

    /**
     * The designer / developer role id.
     */
    public final static long ROLE_DESINGER_DEVELOPER = Role.ID_DESIGNER_DEVELOPER;

    /**
     * The screener role id.
     */
    public final static long ROLE_SCREENER = Role.ID_PRIMARY_SCREENER;

    /**
     * The reviewer role id.
     */
    public final static long ROLE_REVIEWER = Role.ID_REVIEWER;

    /**
     * The aggregator role id.
     */
    public final static long ROLE_AGGREGATOR = Role.ID_AGGREGATOR;

    /**
     * The final reviewer role id.
     */
    public final static long ROLE_FINAL_REVIEWER = Role.ID_FINAL_REVIEWER;

    /**
     * The project manager role id.
     */
    public final static long ROLE_PROJECT_MANAGER = Role.ID_PRODUCT_MANAGER;

    /**
     * The removed role id.
     */
    public final static long ROLE_REMOVED = Role.ID_REMOVED;

    // --------------------------------------------------------- Format String

    /**
     * The date format string.
     */
    public final static String DATE_FORMAT = "MM.dd.yyyy hh:mm a";

    /**
     * Another date format string.
     */
    public final static String DATE_FORMAT2 = "MM/dd/yyyy";

    /**
     * The currency format string.
     */
    public final static String CURRENCY_FORMAT = "$#,###.##";

    /**
     * The score format string.
     */
    public final static String SCORE_FORMAT = "##.00";
}
