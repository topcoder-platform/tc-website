package com.topcoder.web.corp.common;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import java.lang.reflect.Field;

public class Constants {

    //don't instantiate this class
    private Constants() {
    }

    private static boolean isInitialized;

    //Controller Servlet Constants
    public static String VALID_CHAR_LIST;
    public static String VALID_PASS_CHAR_LIST;
    public static String DEFAULT_PAGE;

    //URL Parameter constants
    public static String USER_ID;
    public static String CANDIDATE_ID;

    public static int STUDENT;
    public static int PROFESSIONAL;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of parameter
     * of incoming HTTP requests containing the preference level of some user relevant to some company.</p>
     *
     * <p>The controller servlet configuration file must have a "preference_level" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String PREFERENCE_LEVEL;

    public static String EMAIL_ADDRESS;
    public static String MESSAGE_PARAMETER;
    public static String FIRST_ATTEMPT;
    public static String REFERRER;
    public static String MODULE_KEY;
    public static String PROFILE_ID;
    public static String PROFILE_NAME;
    public static String TEST_SET_A;
    public static String TEST_SET_B;
    public static String LANGUAGE;
    public static String TEST_SET_B_ADD;
    public static String TEST_SET_B_REMOVE;
    public static String PROBLEM_ID;
    public static String PROBLEM_TYPE_ID;
    public static String ROUND_ID;
    public static String DIVISION_ID;
    public static String BEGIN_MONTH;
    public static String BEGIN_DAY;
    public static String BEGIN_YEAR;
    public static String BEGIN_HOUR;
    public static String END_MONTH;
    public static String END_DAY;
    public static String END_YEAR;
    public static String END_HOUR;
    public static String TIMEZONE;
    public static String CANDIDATE_EMAIL;
    public static String REP_EMAIL;
    public static String NOTE_TEXT;
    public static String ROUND_PROBLEM_ID;
    public static String SESSION_ID;
    public static String SEARCH_PAGE;
    public static String SEARCH_RESULTS_PAGE;

    public static String DEMOGRAPHICS_PAGE;

    public static String FIRST_NAME;
    public static String LAST_NAME;

    public static String CITY;
    public static int AREA_OF_INTEREST_ID;
    public static int DEGREE_ID;

    public static String DEMOG_PREFIX;

    //Candidate constants
    public static String CANDIDATE_INFO;
    public static String CANDIDATE_SETUP_PAGE;
    public static String CANDIDATE_LIST_PAGE;
    public static String NOTE_CREATE_PAGE;
    public static String UC_DEFAULT_FORWARD_PROCESSOR;
    public static String UC_CREATE_CODER_STATUS_ID;
    public static String MAX_PASSWORD_SIZE;
    public static String CANDIDATE_LIST_QUERY_KEY;
    public static String CREATE_CANDIDATE_PROCESSOR;
    public static String POPULATE_CANDIDATE_PROCESSOR;
    public static String CHECK_COMPANY_USER_QUERY_KEY;

    public static int SEARCH_SCROLL_SIZE;

    /**
     * <p>A <code>String</code> name of the processor to be used to add the new note to candidate's profile.</p>
     *
     * <p>The controller servlet configuration file must have a "note_create_processor" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String NOTE_CREATE_PROCESSOR;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the content of
     * candidate's profile.</p>
     *
     * <p>The controller servlet configuration file must have a "candidate_profile_info" parameter specified.
     * </p>
     *
     * @since Screening Tool 1.1
     */
    public static String CANDIDATE_PROFILE_INFO;

    /**
     * <p>A <code>String</code> name of the query within <code>Query Tool</code> to be executed to get the content of
     * candidate's address.</p>
     *
     * <p>The controller servlet configuration file must have a "candidate_address_info" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CANDIDATE_ADDRESS_INFO;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the content of
     * candidate's demographic info.</p>
     *
     * <p>The controller servlet configuration file must have a "candidate_demographic_info" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CANDIDATE_DEMOGRAPHIC_INFO;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the content of
     * candidate's personal info.</p>
     *
     * <p>The controller servlet configuration file must have a "candidate_personal_info" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CANDIDATE_PERSONAL_INFO;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the content of
     * candidate's notes.</p>
     *
     * <p>The controller servlet configuration file must have a "candidate_notes" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CANDIDATE_NOTES;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the details for
     * problem solutions performed by the candidate.</p>
     *
     * <p>The controller servlet configuration file must have a "candidate_problems_info" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CANDIDATE_PROBLEMS_INFO;

    public static String CANDIDATE_PREFERENCE_INFO;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the details for
     * problem solutions performed by the candidate.</p>
     *
     * <p>The controller servlet configuration file must have a "company_campaigns_list" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String COMPANY_CAMPAIGNS_LIST;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the details for
     * company the user is associated with.</p>
     *
     * <p>The controller servlet configuration file must have a "company_info" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String COMPANY_INFO;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the details for
     * job position the user is associated with.</p>
     *
     * <p>The controller servlet configuration file must have a "position_info" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String POSITION_INFO;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the results for
     * job position the user is associated with.</p>
     *
     * <p>The controller servlet configuration file must have a "position_results_list" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String POSITION_RESULTS_LIST;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the results for
     * job position the user is associated with.</p>
     *
     * <p>The controller servlet configuration file must have a "position_results_page" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String POSITION_RESULTS_PAGE;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a JSP page
     * providing the users with details of profile for requested candidate.</p>
     *
     * <p>The controller servlet configuration file must have a "candidate_profile_page" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CANDIDATE_PROFILE_PAGE;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a JSP page
     * providing the users with details of profile for requested candidate.</p>
     *
     * <p>The controller servlet configuration file must have a "company_campaigns_page" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String COMPANY_CAMPAIGNS_PAGE;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a JSP page
     * providing the users with the list of positions associated with requested campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "position_list_page" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_POSITIONS_PAGE;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * parameter of incoming request containing the ID of requested campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "campaign_id" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_ID;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the details for
     * specified campaign for the company the user is associated with.</p>
     *
     * <p>The controller servlet configuration file must have a "campaign_info" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_INFO;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the details for
     * positions assigned to specified campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "campaign_positions_list" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_POSITIONS_LIST;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * parameter of incoming request containing the ID of requested position associated with campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "job_position_id" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String JOB_POSITION_ID;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a JSP page
     * providing the users with the user results relevant to requested position associated with campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "job_position_results_page" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    //public static String JOB_POSITION_RESULTS_PAGE;

    /**
     * <p>A <code>String</code> name of the command within <code>Query Tool</code> to be executed to get the results for
     * candidates assigned to specified campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "campaign_results_list" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_RESULTS_LIST;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a JSP page
     * providing the users with the candidate results corresponding to requested campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "campaign_results_page" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_RESULTS_PAGE;

    // New processors introduced with Screening Tool 1.1

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * processor to be used to update the preference level for candidates.</p>
     *
     * <p>The controller servlet configuration file must have a "update_preference_processor" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String UPDATE_PREFERENCE_PROCESSOR;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * processor to be used to provide the users with resuls for specified campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "campaign_results_processor" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_RESULTS_PROCESSOR;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * processor to be used to provide the users with resuls for specified position.</p>
     *
     * <p>The controller servlet configuration file must have a "position_results_processor" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String POSITION_RESULTS_PROCESSOR;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * processor to be used to provide the users with the list of campaigns associated with specified company.</p>
     *
     * <p>The controller servlet configuration file must have a "campaign_list_processor" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String CAMPAIGN_LIST_PROCESSOR;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * processor to be used to provide the users with the list of positions associated with specified campaign.</p>
     *
     * <p>The controller servlet configuration file must have a "position_list_processor" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String POSITION_LIST_PROCESSOR;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * parameter of incoming request containing the name of a column to sort the data list against.</p>
     *
     * <p>The controller servlet configuration file must have a "sort_by" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String SORT_BY;

    /**
     * <p>An <code>int</code> representing the number of a records to be displayed at <code>Campaign Resutlts</code> and
     * <code>Position Results</code> JSPs at one time.
     *
     * <p>The controller servlet configuration file must have a "page_size" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static int PAGE_SIZE = 20;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a
     * parameter of incoming request containing the index of a starting element in the list of campaign/position results
     * to render the results from.</p>
     *
     * <p>The controller servlet configuration file must have a "page_start_index" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String PAGE_START_INDEX;

    //Profile constants
    public static String PROFILE_INFO;
    public static String PROFILE_LOOKUP_COMMAND;
    public static String PROFILE_PROBLEM_SET_QUERY_KEY;
    public static String PROFILE_TEST_SET_A_QUERY_KEY;
    public static String PROFILE_TEST_SET_B_QUERY_KEY;
    public static String PROFILE_COMPANY_PROBLEM_QUERY_KEY;
    public static String PROFILE_LANGUAGE_QUERY_KEY;
    public static String PROFILE_INFO_QUERY_KEY;
    public static String PROFILE_PROBLEMS_QUERY_KEY;
    public static String PROFILE_LANGUAGES_QUERY_KEY;
    public static String PROFILE_SESSION_LIST_QUERY_KEY;
    public static String POPULATE_PROFILE_PROCESSOR;
    public static String PROFILE_SETUP_PAGE;
    public static String PROFILE_CONFIRM_PAGE;
    public static String PROFILE_LIST_PAGE;
    public static String PROFILE_DETAIL_PAGE;
    public static String PROFILE_ADD_PROBLEM_PROCESSOR;
    public static String PROFILE_REMOVE_PROBLEM_PROCESSOR;
    public static String PROFILE_CONFIRM_PROCESSOR;
    public static String UPDATE_PROFILE_PROCESSOR;
    public static String CREATE_PROFILE_PROCESSOR;
    public static String PROFILE_CHECK_NAME_QUERY_KEY;
    public static int NO_TEST_SET_A;

    //Problem constants
    public static String PROBLEM_LIST_PAGE;
    public static String PROBLEM_DETAIL_PAGE;
    public static String POPULATE_PROBLEM_DETAIL_PROCESSOR;
    public static String PROBLEM_INFO;
    public static String PROBLEM_DETAIL_COMMAND;
    public static String PROBLEM_INFO_QUERY_KEY;
    public static String PROBLEM_ALGORITHMIC_CATEGORY_QUERY_KEY;
    public static String PROBLEM_BUSINESS_CATEGORY_QUERY_KEY;
    public static String EXAMPLE_PROBLEM_ID;
    public static String PROBLEM_TYPE_EXAMPLE_ID;
    public static int PROBLEM_TYPE_TEST_SET_B_ID;
    public static int PROBLEM_TYPE_TEST_SET_A_ID;
    public static String ACCURACY_INFO_QUERY_KEY;
    public static String CHECK_ACCESS_QUERY_KEY;

    //Results constants
    public static String PROBLEM_RESULT_PAGE;
    public static String TC_PROBLEM_RESULT_PAGE;
    public static String TEST_RESULTS_PAGE;
    public static String PRINTER_RESULTS_PAGE;

    //Session constants
    public static String POPULATE_SESSION_PROCESSOR;
    public static String UPDATE_SESSION_PROCESSOR;
    public static String PREVIEW_EMAIL_PAGE;
    public static String SESSION_SETUP_PAGE;
    public static String SESSION_INFO;
    public static String SESSION_LOOKUP_COMMAND;
    public static String SESSION_CANDIDATE_INFO_QUERY_KEY;
    public static String SESSION_PROFILE_INFO_QUERY_KEY;
    public static String SESSION_CONFIRM_PAGE;
    public static String CONFIRM_SESSION_PROCESSOR;
    public static String SESSION_SEGMENT_COMMAND;
    public static String SESSION_SEGMENT_TEST_SET_A_QUERY_KEY;
    public static String SESSION_SEGMENT_TEST_SET_A_ID;
    public static String SESSION_SEGMENT_TEST_SET_B_QUERY_KEY;
    public static String SESSION_SEGMENT_TEST_SET_B_ID;
    public static String TEST_SET_B_SEGMENT_INTERVAL;
    public static String SESSION_CHECK_COMMAND;
    public static String SESSION_DUPE_CHECK_QUERY_KEY;
    public static String SESSION_CHECK_CANDIDATE_TIME_QUERY_KEY;

    //Preivew email constants
    public static String EMAIL_LOOKUP_COMMAND;
    public static String REP_EMAIL_INFO_QUERY_KEY;
    public static String CANDIDATE_EMAIL_INFO_QUERY_KEY;
    public static String EMAIL_INFO;

    //Common Constants
    public static String DATA_SOURCE;
    public static String TX_DATA_SOURCE;
    public static String DW_DATA_SOURCE;
    public static String CONTACT_INFO_QUERY_KEY;

    /**
     * <p>A <code>String</code> name of a configuration parameter of a controller servlet holding the name of a query
     * existing within <code>Query Tool</code> to be used to get the <code>Screening Tool</code> application usage type
     * set for the company the user wishing to view the candidates info is associated with.</p>
     *
     * <p>The controller servlet configuration file must have a "company_usage_type_query_key" parameter specified.</p>
     *
     * @since Screening Tool 1.1
     */
    public static String COMPANY_USAGE_TYPE_QUERY_KEY;

    public static String ERRORS;
    public static String DEBUG;

    public static String USAGE_TYPE;
    public static int USAGE_TYPE_TESTING;
    public static int USAGE_TYPE_SCREENING;

    public static String DATE_TIME_FORMAT;

    private static Logger log = Logger.getLogger(Constants.class);

    public static void initialize(ServletConfig config) {

        Field[] f = Constants.class.getFields();
        for (int i = 0; i < f.length; i++) {
            try {
                if (f[i].getType().getName().equals("int")) {
                    f[i].setInt(null, Integer.parseInt(config.getInitParameter(f[i].getName().toLowerCase())));
                } else if (f[i].getType().getName().equals("java.lang.String")) {
                    f[i].set(null, config.getInitParameter(f[i].getName().toLowerCase()));
                } else {
                    throw new Exception("Unrecognized type: " + f[i].getType().getName());
                }
                if (f[i].get(null) == null)
                    log.error("**DID NOT LOAD** " + f[i].getName() + " constant");
                else
                    log.debug(f[i].getName() + " <== " + f[i].get(null));
            } catch (Exception e) {
                /* probably harmless, could just be a type or modifier mismatch */
                e.printStackTrace();
            }
        }
        isInitialized = true;
    }

    public static boolean isInitialized() {
        return isInitialized;
    }
}
