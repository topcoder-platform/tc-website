/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.dwload.cloudspokes.contest;

import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.io.IOUtils;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.supercsv.io.CsvMapReader;
import org.supercsv.prefs.CsvPreference;

import com.topcoder.shared.util.dwload.TCLoad;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

/**
 * <p>
 * This class loads CloudSpokes contest data into TC database.
 * It's implemented as a DW loader (see {@link TCLoad} for details).
 * </p>
 *
 * <p>
 * <strong>Change log:</strong>
 * </p>
 * Version 1.1 (CloudSpokes Contest Data Loader Part 2)
 * <ul>
 * <li>Added logic of loading data to all remaining (i.e. project and resource related) tables.</li>
 * <li>Added very many items (look for "since 1.1" tag).</li>
 * <li>Updated {@link #USAGE_MESSAGE}.</li>
 * <li>Updated {@link #performLoad()}.</li>
 * <li>Updated {@link #setParameters(Hashtable)}.</li>
 * <li>Updated {@link #parseComponentName(Row)}.</li>
 * <li>Updated {@link #parseProjectId(Row)}.</li>
 * <li>Updated {@link #parseTechnologyTypes(Row)}.</li>
 * <li>Updated {@link #processInputRow(Row)}.</li>
 * <li>Updated {@link #process()}.</li>
 * <li>Updated {@link #initializeDB()}.</li>
 * <li>Updated {@link #initializeIDGenerators()}.</li>
 * <li>Updated {@link #checkInputFile()}.</li>
 * </ul>
 *
 * @version 1.1
 * @author Selena
 */
public class CloudSpokesContestLoader extends TCLoad {
    /**
     * Debug flag.
     */
    protected static boolean DEBUG = false;

    /**
     * Logger.
     * Not null.
     */
    private static final Logger LOG = Logger.getLogger(CloudSpokesContestLoader.class);

    /**
     * Header of the prize value column in the CS prizes file.
     *
     * @since 1.1
     */
    private static final String VALUE_CS_PRIZE_FILE_COLUMN_HEADER = "Value__c";

    /**
     * Header of the place column in the CS prizes file.
     *
     * @since 1.1
     */
    private static final String PLACE_CS_PRIZE_FILE_COLUMN_HEADER = "Place__c";

    /**
     * Header of the challenge code column in the CS prizes file.
     *
     * @since 1.1
     */
    private static final String CHALLENGE_CODE_CS_PRIZE_FILE_COLUMN_HEADER = "Challenge__c";

    /**
     * Header of the total prize column in the input file.
     *
     * @since 1.1
     */
    private static final String TOTAL_PRIZE_COLUMN_HEADER = "Total_Prize_Money__c";

    /**
     * Header of the community judging column in the input file.
     *
     * @since 1.1
     */
    private static final String COMMUNITY_JUDGING_COLUMN_HEADER = "Community_Judging__c";

    /**
     * "Completed without win" submission status ID.
     *
     * @since 1.1
     */
    private static final long COMPLETED_WITHOUT_WIN_SUBMISSION_STATUS_ID = 4L;

    /**
     * "Active" submission status ID.
     *
     * @since 1.1
     */
    private static final long ACTIVE_SUBMISSION_STATUS_ID = 1L;

    /**
     * Root field of the CS API response JSONs.
     *
     * @since 1.1
     */
    private static final String CS_API_RESPONSE_ROOT_FIELD = "response";

    /**
     * Format of the URL of the CS API project outcome information retrieval method.
     *
     * @since 1.1
     */
    private static final String OUTCOME_INFO_CS_API_URL =
            "http://api.cloudspokes.com/v1/challenges/%1$s/scorecards?challenge_id=%1$s";

    /**
     * Format of the URL of the CS API project information retrieval method.
     *
     * @since 1.1
     */
    private static final String CHALLENGE_INFO_CS_API_URL = "http://api.cloudspokes.com/v1/challenges/%1$s";

    /**
     * Default character encoding.
     *
     * @since 1.1
     */
    private static final String DEFAULT_ENCODING = System.getProperty("file.encoding");

    /**
     * JSON MIME type.
     *
     * @since 1.1
     */
    private static final String JSON_MIME_TYPE = "application/json";

    /**
     * HTTP header for accept MIME types.
     *
     * @since 1.1
     */
    private static final String HTTP_ACCEPT_HEADER = "Accept";

    /**
     * "Submitter" resource role ID.
     *
     * @since 1.1
     */
    private static final long SUBMITTER_RESOURCE_ROLE_ID = 1L;

    /**
     * "Reviewer" resource role ID.
     *
     * @since 1.1
     */
    private static final long REVIEWER_RESOURCE_ROLE_ID = 4L;

    /**
     * "Observer" resource role ID.
     *
     * @since 1.1
     */
    private static final long OBSERVER_RESOURCE_ROLE_ID = 12L;

    /**
     * "Manager" resource role ID.
     *
     * @since 1.1
     */
    private static final long MANAGER_RESOURCE_ROLE_ID = 13L;

    /**
     * "Review" phase type ID.
     *
     * @since 1.1
     */
    private static final long REVIEW_PHASE_TYPE_ID = 4L;

    /**
     * "Submission" phase type ID.
     *
     * @since 1.1
     */
    private static final long SUBMISSION_PHASE_TYPE_ID = 2L;

    /**
     * "Registration" phase type ID.
     *
     * @since 1.1
     */
    private static final long REGISTRATION_PHASE_TYPE_ID = 1L;

    /**
     * Header of the platforms column in the input file.
     *
     * @since 1.1
     */
    private static final String PLATFORMS_COLUMN_HEADER = "Platforms__c";

    /**
     * Header of the community column in the input file.
     *
     * @since 1.1
     */
    private static final String COMMUNITY_COLUMN_HEADER = "Community__c";

    /**
     * Header of the CS prize ID column in the input file.
     *
     * @since 1.1
     */
    private static final String CS_PRIZE_ID_COLUMN_HEADER = "Id";
	
	

    /**
     * Header of the Appirio payment column in the input file.
     *
     * @since 1.1
     */
    private static final String APPIRIO_PAYMENT_TYPE_COLUMN_HEADER = "Appirio_Payment_Type__c";

    /**
     * Header of the Appririo cost center column in the input file.
     *
     * @since 1.1
     */
    private static final String APPIRIO_COST_CENTER_COLUMN_HEADER = "Appirio_Cost_Center__c";

    /**
     * Header of the CMC task column in the input file.
     *
     * @since 1.1
     */
    private static final String CMC_TASK_COLUMN_HEADER = "CMC_Task__c";

    /**
     * Header of the terms of service column in the input file.
     *
     * @since 1.1
     */
    private static final String TERMS_OF_SERVICE_COLUMN_HEADER = "Terms_of_Service__c";

    /**
     * Header of the line of business column in the input file.
     *
     * @since 1.1
     */
    private static final String LINE_OF_BUSINESS_COLUMN_HEADER = "Line_of_Business__c";

    /**
     * Header of the reference number column in the input file.
     *
     * @since 1.1
     */
    private static final String REFERENCE_NUMBER_COLUMN_HEADER = "Reference_Number__c";

    /**
     * Header of the score-card type column in the input file.
     *
     * @since 1.1
     */
    private static final String SCORECARD_TYPE_COLUMN_HEADER = "Scorecard_Type__c";

    /**
     * Header of the account column in the input file.
     *
     * @since 1.1
     */
    private static final String ACCOUNT_COLUMN_HEADER = "Account__c";

    /**
     * project_info.value indicating that DR flag is off.
     *
     * @since 1.1
     */
    private static final String DR_FLAG_OFF = "Off";

    /**
     * project_info.value indicating that DR flag is on.
     *
     * @since 1.1
     */
    private static final String DR_FLAG_ON = "On";

    /**
     * Header of the DR flag column in the input file.
     *
     * @since 1.1
     */
    private static final String DR_FLAG_COLUMN_HEADER = "Display_Leaderboard__c";

    /**
     * Header of the submission details column in the input file.
     *
     * @since 1.1
     */
    private static final String SUBMISSION_DETAILS_COLUMN_HEADER = "Submission_Details__c";

    /**
     * Header of the additional info column in the input file.
     *
     * @since 1.1
     */
    private static final String ADDITIONAL_INFO_COLUMN_HEADER = "Additional_Info__c";

    /**
     * Header of the requirements text column in the input file.
     *
     * @since 1.1
     */
    private static final String REQUIREMENTS_TEXT_COLUMN_HEADER = "Requirements__c";

    /**
     * Maximal length of the project_spec.requirements column.
     *
     * @since 1.1
     */
    private static final int PROJECT_SPEC_REQUIREMENTS_MAX_LENGTH = 20000;

    /**
     * Header of the description column in the input file.
     *
     * @since 1.1
     */
    private static final String DESCRIPTION_COLUMN_HEADER = "Description__c";

    /**
     * Maximal length of the direct_project.name column.
     *
     * @since 1.1
     */
    private static final int DIRECT_PROJECT_NAME_MAX_LENGTH = 200;

    /**
     * Header of the project column in the input file.
     *
     * @since 1.1
     */
    private static final String PROJECT_COLUMN_HEADER = "Project__c";

    /**
     * Header of the contact column in the input file.
     *
     * @since 1.1
     */
    private static final String CONTACT_COLUMN_HEADER = "Contact__c";

    /**
     * Header of the last modified by column in the input file.
     *
     * @since 1.1
     */
    private static final String LAST_MODIFIED_BY_COLUMN_HEADER = "LastModifiedById";

    /**
     * Header of the created by column in the input file.
     *
     * @since 1.1
     */
    private static final String CREATED_BY_COLUMN_HEADER = "CreatedById";

    /**
     * Header of the owner column in the input file.
     *
     * @since 1.1
     */
    private static final String OWNER_COLUMN_HEADER = "OwnerId";

    /**
     * "Code" project category ID.
     *
     * @since 1.1
     */
    private static final long CODE_PROJECT_CATEGORY_ID = 39L;

    /**
     * Default review duration, in milliseconds.
     *
     * @since 1.1
     */
    private static final long DEFAULT_REVIEW_DURATION = 3 * 24 * 60 * 60 * 1000;

    /**
     * Header of the review date column in the input file.
     *
     * @since 1.1
     */
    private static final String REVIEW_DATE_COLUMN_HEADER = "Review_Date__c";

    /**
     * Header of the end date column in the input file.
     *
     * @since 1.1
     */
    private static final String END_DATE_COLUMN_HEADER = "End_Date__c";

    /**
     * Header of the start date column in the input file.
     *
     * @since 1.1
     */
    private static final String START_DATE_COLUMN_HEADER = "Start_Date__c";

    /**
     * Header of the submissions column in the input file.
     *
     * @since 1.1
     */
    private static final String SUBMISSIONS_COLUMN_HEADER = "Submissions__c";

    /**
     * Header of the status column in the input file.
     *
     * @since 1.1
     */
    private static final String STATUS_COLUMN_HEADER = "Status__c";

    /**
     * "Failed review" project status ID.
     *
     * @since 1.1
     */
    private static final long FAILED_REVIEW_PROJECT_STATUS_ID = 4L;

    /**
     * "Failed (zero submissions)" project status ID.
     *
     * @since 1.1
     */
    private static final long ZERO_SUBMISSIONS_PROJECT_STATUS_ID = 6L;

    /**
     * "Completed" project status ID.
     *
     * @since 1.1
     */
    private static final long COMPLETED_PROJECT_STATUS_ID = 7L;

    /**
     * Name of warnings filename configuration parameter.
     */
    private static final String WARNINGS_FILENAME_PARAMETER = "warnings_filename";

    /**
     * Name of score-card ID configuration parameter.
     */
    private static final String SCORECARD_ID_PARAMETER = "scorecard_id";

    /**
     * Name of score-card question ID configuration parameter.
     */
    private static final String SCORECARD_QUESTION_ID_PARAMETER = "scorecard_question_id";

    /**
     * Name of errors filename configuration parameter.
     */
    private static final String ERRORS_FILENAME_PARAMETER = "errors_filename";

    /**
     * Name of report filename configuration parameter.
     */
    private static final String REPORT_FILENAME_PARAMETER = "report_filename";

    /**
     * Name of input filename configuration parameter.
     */
    private static final String INPUT_FILENAME_PARAMETER = "input_filename";

    /**
     * Name of CS prizes filename configuration parameter.
     *
     * @since 1.1
     */
    private static final String CS_PRIZES_FILENAME_PARAMETER = "cs_prizes_filename";

    /**
     * Full amount of percents.
     */
    private static final int FULL_PERCENT = 100;

    /**
     * Max length of project info value.
     */
    private static final int PROJECT_INFO_VALUE_MAX_LENGTH = 255;

    /**
     * Max length of component name.
     */
    private static final int COMPONENT_NAME_MAX_LENGTH = 254;

    /**
     * Default transaction item count.
     */
    private static final int DEFAULT_TRANSACTION_ITEM_COUNT = 50;

    /**
     * Header of the challenge name column in the input file.
     */
    private static final String CHALLENGE_NAME_COLUMN_HEADER = "Name";

    /**
     * Header of the challenge ID column in the input file.
     */
    private static final String CHALLENGE_ID_COLUMN_HEADER = "Challenge_Id__c";

    /**
     * Header of the technologies column in the input file.
     */
    private static final String TECHNOLOGIES_COLUMN_HEADER = "Technologies__c";

    /**
     * Header of the created date column in the input file.
     */
    private static final String CREATED_DATE_COLUMN_HEADER = "CreatedDate";

    /**
     * Amount of default version dates to be populated to the comp_version_dates table.
     * See {@link #insertCompVersionDate(long)} for details.
     */
    private static final int DEFAULT_VERSION_DATES_COUNT = 9;
	
	
	private static final SimpleDateFormat resource_info_fomate = new SimpleDateFormat("MM.dd.yyyy hh:mm a");
	
	private static final SimpleDateFormat simpleFormat = new SimpleDateFormat("M/d/yyyy");

    /**
     * Phase time value to be populated into the database tables.
     * It's set by {@link #CloudSpokesContestLoader()} constructor and not mutated afterwards.
     * Not null once initialized.
     */
    private static final Timestamp PHASE_TIME =
            new Timestamp(new GregorianCalendar(1976, 5, 5, 19, 0, 0).getTimeInMillis());

    /**
     * Posting date value to be populated into the database tables.
     * It's set by {@link #CloudSpokesContestLoader()} constructor and not mutated afterwards.
     * Not null once initialized.
     */
    private static final Timestamp POSTING_DATE =
            new Timestamp(new GregorianCalendar(1976, 5, 5).getTimeInMillis());

    /**
     * Date value to be populated into the most of the *_date columns of the comp_version_dates table.
     * See {@link #insertCompVersionDate(long)} for details.
     * It's set by {@link #CloudSpokesContestLoader()} constructor and not mutated afterwards.
     * Not null once initialized.
     */
    private static final Timestamp DEFAULT_VERSION_DATE =
            new Timestamp(new GregorianCalendar(2000 , 1, 1).getTimeInMillis());

    /**
     * Usage message.
     */
    protected String USAGE_MESSAGE = "Supported configuration parameters:\n"
            + "    input_filename Input filename.\n"
            + "    cs_prizes_filename CS prizes filename.\n"
            + "    report_filename Report filename.\n"
            + "    errors_filename Errors filename.\n"
            + "    warnings_filename Warnings filename.\n"
            + "    transaction_item_count Amount of items in a single transaction.\n"
            + "    default_user_id User ID to be used if created by / modified by user is not specified.\n";

    /**
     * Formatter for project_info 21 completion time-stamp.
     *
     */
    private final DateFormat projectInfoCompletionDateFormat = new SimpleDateFormat("MM.dd.yyyy HH:mm z");

    /**
     * Input filename.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * Not null/empty once initialized.
     */
    private String inputFilename;

    /**
     * CS prizes filename.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * Not null/empty once initialized.
     *
     * @since 1.1
     */
    private String csPrizesFilename;

    /**
     * Report filename.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * Not null/empty once initialized.
     */
    private String reportFilename;

    /**
     * Errors filename.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * Not null/empty once initialized.
     */
    private String errorsFilename;

    /**
     * Warnings filename.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * Not null/empty once initialized.
     */
    private String warningsFilename;

    /**
     * Score-card ID.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * Not null/empty once initialized.
     */
    private Long scorecardId;

    /**
     * Score-card question ID.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * Not null/empty once initialized.
     */
    private Long scorecardQuestionId;

    /**
     * Report writer.
     * It's initialized by {@link #initializeWriters()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PrintWriter reportWriter;

    /**
     * Error writer.
     * It's initialized by {@link #initializeWriters()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PrintWriter errorWriter;

    /**
     * Warning writer.
     * It's initialized by {@link #initializeWriters()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PrintWriter warningWriter;

    /**
     * Total amount of records to import.
     * It's initialized by {@link #checkInputFile()} method and not mutated afterwards.
     * Not negative once initialized.
     */
    private int totalRecords;

    /**
     * Input sheet from which the records should be read.
     * It's initialized by {@link #checkInputFile()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private Sheet inputSheet;

    /**
     * Headers of the columns which are required to present in the input file.
     * Constant.
     */
    private final Set<String> requiredColumnHeaders = new HashSet<String>(Arrays.asList(new String[] {
        CHALLENGE_ID_COLUMN_HEADER, CHALLENGE_NAME_COLUMN_HEADER,
        TECHNOLOGIES_COLUMN_HEADER, CREATED_DATE_COLUMN_HEADER
    }));

    /**
     * Mapping of user handles by IDs.
     * Key is a user ID, value is a handle.
     * It's not null, doesn't contain null/empty keys/values.
     */
    private final Map<Long, String> handleByUserId = new HashMap<Long, String>();

    /**
     * Mapping of column indices by names.
     * Key is a column name (determined from column header), value is a column index.
     * It's initialized by {@link #checkInputFile()} method and not mutated afterwards.
     * Once initialized, it's not null, doesn't contain null/empty keys,
     * all values are not negative and not null.
     */
    private final Map<String, Integer> columnIndexByName = new HashMap<String, Integer>();

    /**
     * Set of indices of empty rows.
     * It's initialized by {@link #checkInputFile()} method and not mutated afterwards.
     * Once initialized, it's not null, all elements are positive and not null.
     */
    private final Set<Integer> emptyRows = new HashSet<Integer>();


    /**
     * Formatter for parsing dates from the input file.
     * Constant.
     */
    private final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

    /**
     * Technology types lookup map.
     * Key is technology type name in lower case, value is technology type ID.
     * It's initialized by {@link #loadTechnologyTypes()} method and not mutated afterwards.
     * Once initialized, it's not null, doesn't contain null/empty keys, all values are not null.
     */
    private final Map<String, Long> technologyTypeByName = new HashMap<String, Long>();

    /**
     * CS prizes map.
     * Key is a CS prize ID, inner key is a placement, inner value is a prize amount.
     * It's initialized by {@link #loadCSPrizes()} method and not mutated afterwards.
     * Once initialized, it's not null, doesn't contain null/empty keys (including inner keys),
     * all values are not null.
     *
     * @since 1.1
     */
    private final Map<String, Map<Integer, Double>> csPrizes = new HashMap<String, Map<Integer, Double>>();

    /**
     * Project platforms lookup map.
     * Key is a project platform name in lower case, value is a project platform ID.
     * It's initialized by {@link #loadProjectPlatforms()} method and not mutated afterwards.
     * Once initialized, it's not null, doesn't contain null/empty keys, all values are not null.
     *
     * @since 1.1
     */
    private final Map<String, Long> projectPlatformByName = new HashMap<String, Long>();

    /**
     * ID of user to be used by default if created / modified by user is not specified.
     */
    private Long defaultUserId = null;
	
	private String defaultUserHandle = "";

    /**
     * Counter of records, imported successfully without warnings.
     * Not negative once initialized.
     */
    private int totalSuccess = 0;

    /**
     * Counter of records, imported successfully with warnings.
     * Not negative once initialized.
     */
    private int totalWarnings = 0;

    /**
     * Counter of records, imported successfully without warnings during current transaction.
     * Not negative once initialized.
     */
    private int totalSuccessDuringCurrentTransaction = 0;

    /**
     * Counter of records, imported successfully with warnings during current transaction.
     * Not negative once initialized.
     */
    private int totalWarningsDuringCurrentTransaction = 0;

    /**
     * Counter of records, import for which has been failed.
     * Not negative once initialized.
     */
    private int totalErrors = 0;

    /**
     * String builder for the warnings of the currently processed row.
     * It's initialized by {@link #processInputRow(Row, int)} method for each row.
     * Not null once initialized.
     */
    private StringBuilder warnings;

    /**
     * String builder for the errors of the currently processed row.
     * It's initialized by {@link #processInputRow(Row, int)} method for each row.
     * Not null once initialized.
     */
    private StringBuilder errors;

    /**
     * Amount items per single transaction.
     * It's set by {@link #setParameters(Hashtable)} method according to configuration and not mutated afterwards.
     * A positive integer once initialized.
     */
    private int transactionItemCount = DEFAULT_TRANSACTION_ITEM_COUNT;

    /**
     * DB connection.
     * It's set by {@link #initializeDB()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private Connection conn;

    /**
     * ID generator for a review.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator reviewIDGenerator;

    /**
     * ID generator for a review_item.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator reviewItemIDGenerator;

    /**
     * ID generator for a review_item_comment.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator reviewItemCommentIDGenerator;

    /**
     * ID generator for a component.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private IDGenerator compIDGenerator;

    /**
     * ID generator for a project.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator projectIDGenerator;

    /**
     * ID generator for a prize.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator prizeIDGenerator;

    /**
     * ID generator for a upload.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator uploadIDGenerator;

    /**
     * ID generator for a submission.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator submissionIDGenerator;

    /**
     * ID generator for a project_phase.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator projectPhaseIDGenerator;

    /**
     * ID generator for a project_spec.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator projectSpecIDGenerator;

    /**
     * ID generator for a resource.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private IDGenerator resourceIDGenerator;

    /**
     * ID generator for a component version.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private IDGenerator compVersionIDGenerator;

    /**
     * ID generator for a component version date.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private IDGenerator compVersionDateIDGenerator;

    /**
     * ID generator for a component category.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private IDGenerator compCategoryIDGenerator;

    /**
     * ID generator for a component technology.
     * It's set by {@link #initializeIDGenerators()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private IDGenerator compTechnologyIDGenerator;

    /**
     * Prepared statement for checking if a record has been already migrated.
     * It's set during first invocation of {@link #alreadyMigrated(String)} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PreparedStatement alreadyMigratedStmt = null;

    /**
     * Prepared statement for retrieving TC user ID of the imported CS user.
     * It's set during first invocation of {@link #searchCSUserTCId(String)} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement searchCSUserTCIdStmt = null;

    /**
     * Prepared statement for retrieving TC direct project ID by name.
     * It's set during first invocation of {@link #searchDirectProject(String)} method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement searchDirectProjectStmt = null;

    /**
     * Prepared statement for inserting a record to the project table.
     * It's set during first invocation of {@link #insertProject(long, long, long, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertProjectStmt = null;

    /**
     * Prepared statement for inserting a record to the prize table.
     * It's set during first invocation of {@link #insertPrize(long, int, double, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertPrizeStmt = null;

    /**
     * Prepared statement for inserting a record to the upload table.
     * It's set during first invocation of {@link #insertUpload(long, long, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertUploadStmt = null;

    /**
     * Prepared statement for inserting a record to the project table.
     * It's set during first invocation of {@link #insertSubmission(long, double, int, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertSubmissionStmt = null;

    /**
     * Prepared statement for inserting a record to the project_phase table.
     * It's set during first invocation of {@link #insertProjectPhase(long, long, Timestamp,
     * Timestamp, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertProjectPhaseStmt = null;

    /**
     * Prepared statement for inserting a record to the phase_criteria table.
     * It's set during first invocation of {@link #insertPhaseCriteria(long, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertPhaseCriteriaStmt = null;

    /**
     * Prepared statement for inserting a record to the project_spec table.
     * It's set during first invocation of {@link #insertProjectSpec(long, String, String,
     * String, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertProjectSpecStmt = null;

    /**
     * Prepared statement for inserting a record to the project_info table.
     * It's set during first invocation of {@link #insertProjectInfo(long, long, String, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertProjectInfoStmt = null;

    /**
     * Prepared statement for inserting a record to the tc_direct_project table.
     * It's set during first invocation of {@link #insertDirectProject(String, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertDirectProjectStmt = null;

    /**
     * Prepared statement for inserting a record to the contest_eligibility table.
     * It's set during first invocation of {@link #insertContestEligibility(long)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertContestEligibilityStmt = null;

    /**
     * Prepared statement for inserting a record to the review table.
     * It's set during first invocation of {@link #insertReviewStmt}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertReviewStmt = null;

    /**
     * Prepared statement for inserting a record to the review_item table.
     * It's set during first invocation of {@link #insertReviewStmt}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertReviewItemStmt = null;

    /**
     * Prepared statement for inserting a record to the review_item_comment table.
     * It's set during first invocation of {@link #insertReviewStmt}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertReviewItemCommentStmt = null;

    /**
     * Prepared statement for inserting a record to the project_result table.
     * It's set during first invocation of {@link #insertProjectResult(long, long, double, int, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertProjectResultStmt = null;

    /**
     * Prepared statement for inserting a record to the resource table.
     * It's set during first invocation of {@link #insertResource(long, long, long, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertResourceStmt = null;

    /**
     * Prepared statement for inserting a record to the resource_info table.
     * It's set during first invocation of {@link #insertResource(long, long, long, long, long, Timestamp)}
     * method and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertResourceInfoStmt = null;

    /**
     * Prepared statement for inserting a record to the comp_catalog table.
     * It's set during first invocation of {@link #insertCompCatalog(String)} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PreparedStatement insertCompCatalogStmt = null;

    /**
     * Prepared statement for inserting a record to the comp_versions table.
     * It's set during first invocation of {@link #insertCompVersion(long)} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PreparedStatement insertCompVersionStmt = null;

    /**
     * Prepared statement for inserting a record to the comp_version_dates table.
     * It's set during first invocation of {@link #insertCompVersionDate(long)} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PreparedStatement insertCompVersionDateStmt = null;

    /**
     * Prepared statement for inserting a record to the comp_categories table.
     * It's set during first invocation of {@link #insertCompCategory(long)} method and not mutated afterwards.
     * Not null once initialized.
     */
    private PreparedStatement insertCompCategoryStmt = null;

    /**
     * Prepared statement for inserting a record to the comp_technology table.
     * It's set during first invocation of {@link #insertCompTechnologies(long, List)} method
     * and not mutated afterwards.
     * Not null once initialized.
     */
    private PreparedStatement insertCompTechnologyStmt = null;

    /**
     * Prepared statement for inserting a record to the project_platform table.
     * It's set during first invocation of {@link #insertProjectPlatforms(long, List, long, long, Timestamp)} method
     * and not mutated afterwards.
     * Not null once initialized.
     *
     * @since 1.1
     */
    private PreparedStatement insertProjectPlatformStmt = null;

    /**
     * {@link OPCPackage} of the input file.
     * It's initialized by {@link #checkInputFile()} method and not mutated afterwards.
     * Not null once initialized.
     */
    private OPCPackage inputOpcPackage;

    /**
     * Creates instance.
     */
    public CloudSpokesContestLoader() {
    }

    /**
     * Performs load.
     *
     * @exception Exception If any error occurs.
     */
    @Override
    public void performLoad() throws Exception {
        // Check input file.
        System.out.println("Checking input file...");
        checkInputFile();
        System.out.println("Input file OK.");
        System.out.println(totalRecords + " record(s) to load.");
        if (totalRecords == 0) {
            return;
        }

        // Load CS prizes file.
        System.out.println("Checking CS prizes file...");
        loadCSPrizes();
        System.out.println("CS prizes file OK.");

        // Initialize writers.
        System.out.println("Initializing output files...");
        initializeWriters();
        System.out.println("Output files OK.");

        // Initialize DB.
        System.out.println("Initializing DB...");
        initializeDB();
        System.out.println("DB OK.");

        // Process the input records.
        process();

        // Release resources.
        releaseResources();
    }

    /**
     * This method is passed with any configuration parameters passed to this loader.
     * It loads assigns configuration parameters to the proper variables.
     *
     * @param params Configuration parameters.
     * @return false if any parameter is invalid or true if all valid.
     */
    @Override
    public boolean setParameters(@SuppressWarnings("rawtypes") Hashtable params) {
        inputFilename = (String) params.get(INPUT_FILENAME_PARAMETER);
        csPrizesFilename = (String) params.get(CS_PRIZES_FILENAME_PARAMETER);
        reportFilename = (String) params.get(REPORT_FILENAME_PARAMETER);
        errorsFilename = (String) params.get(ERRORS_FILENAME_PARAMETER);
        warningsFilename = (String) params.get(WARNINGS_FILENAME_PARAMETER);
        try {
            scorecardId = (long) retrieveIntParam(SCORECARD_ID_PARAMETER, params, false, false);
        } catch (Exception e) {
            String message = e.getMessage();
            System.err.println(message);
            setReasonFailed(message);
            return false;
        }
        try {
            scorecardQuestionId = (long) retrieveIntParam(SCORECARD_QUESTION_ID_PARAMETER, params, false, false);
        } catch (Exception e) {
            String message = e.getMessage();
            System.err.println(message);
            setReasonFailed(message);
            return false;
        }
        if (params.containsKey("transaction_item_count")) {
            try {
                transactionItemCount = Integer.valueOf(((String) params.get("transaction_item_count")).trim());
            } catch (Exception e) {
                String message = "transaction_item_count must be an integer." + "\n" + USAGE_MESSAGE;
                System.err.println(message);
                setReasonFailed(message);
                return false;
            }
            if (transactionItemCount <= 0) {
                String message = "transaction_item_count must be positive." + "\n" + USAGE_MESSAGE;
                System.err.println(message);
                setReasonFailed(message);
                return false;
            }
        }
        if (params.containsKey("default_user_id")) {
            try {
                defaultUserId = Long.valueOf(((String) params.get("default_user_id")).trim());
            } catch (Exception e) {
                String message = "default_user_id must be an integer." + "\n" + USAGE_MESSAGE;
                System.err.println(message);
                setReasonFailed(message);
                return false;
            }
        }
		if (params.containsKey("default_user_handle")) {
            try {
                defaultUserHandle = ((String) params.get("default_user_handle")).trim();
            } catch (Exception e) {
                String message = "error readying default handle." + "\n" + USAGE_MESSAGE;
                System.err.println(message);
                setReasonFailed(message);
                return false;
            }
        }
		
		if (defaultUserId != null && defaultUserHandle != null && !defaultUserHandle.equals("")) {
				handleByUserId.put(defaultUserId, defaultUserHandle); System.out.println("---adding "+defaultUserHandle);
		}
        return checkRequiredParameter(INPUT_FILENAME_PARAMETER, inputFilename)
                && checkRequiredParameter(CS_PRIZES_FILENAME_PARAMETER, csPrizesFilename)
                && checkRequiredParameter(REPORT_FILENAME_PARAMETER, reportFilename)
                && checkRequiredParameter(ERRORS_FILENAME_PARAMETER, errorsFilename)
                && checkRequiredParameter(WARNINGS_FILENAME_PARAMETER, warningsFilename);
    }

    /**
     * Checks required string configuration parameter.
     *
     * @param name Parameter name.
     * @param value Parameter value.
     * @return false if parameter is invalid or true otherwise.
     */
    private boolean checkRequiredParameter(String name, String value) {
        if (value == null) {
            String message = name + " must be specified." + "\n" + USAGE_MESSAGE;
            System.err.println(message);
            setReasonFailed(message);
            return false;
        }
        if (value.trim().length() == 0) {
            String message = name + " must be not empty." + "\n" + USAGE_MESSAGE;
            System.err.println(message);
            setReasonFailed(message);
            return false;
        }
        return true;
    }

    /**
     * Parses component name from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     */
    private String parseComponentName(Row row) {
        String value = getStringCellValue(row.getCell(columnIndexByName.get(CHALLENGE_NAME_COLUMN_HEADER)));
        if (isStringNullEmpty(value)) {
            errors.append("; challenge name may not be empty");
        } else if (value.length() > COMPONENT_NAME_MAX_LENGTH) {
            warnings.append("; challenge name is truncated to " + COMPONENT_NAME_MAX_LENGTH + " characters");
            value = value.substring(0, COMPONENT_NAME_MAX_LENGTH);
        }
        return value;
    }

    /**
     * Parses project ID from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     */
    private String parseProjectId(Row row) {
        String value = getStringCellValue(row.getCell(columnIndexByName.get(CHALLENGE_ID_COLUMN_HEADER)));
        if (isStringNullEmpty(value)) {
            errors.append("; challenge ID may not be empty");
        } else if (value.length() > PROJECT_INFO_VALUE_MAX_LENGTH) {
            errors.append("; challenge ID may not be longer than " + PROJECT_INFO_VALUE_MAX_LENGTH + " characters");
        }
        return value;
    }

    /**
     * Parses technology types from the specified row of the from input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     */
    private List<Long> parseTechnologyTypes(Row row) {
        List<Long> technologyTypeIds = new ArrayList<Long>();
        String value = getStringCellValue(row.getCell(columnIndexByName.get(TECHNOLOGIES_COLUMN_HEADER)));
        if (!isStringNullEmpty(value)) {
            String[] tokens = value.split(",");
            for (String token : tokens) {
                String technology = token.trim();
                if (technology.length() > 0) {
                    if (technologyTypeByName.containsKey(technology.toLowerCase())) {
                        technologyTypeIds.add(technologyTypeByName.get(technology.toLowerCase()));
                    } else {
                        warnings.append("; unknown technology '" + technology + "'");
                    }
                }
            }
        }
        return technologyTypeIds;
    }

    /**
     * Parses platforms from the specified row of the from input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed values.
     *
     * @since 1.1
     */
    private List<Long> parsePlatforms(Row row) {
        List<Long> ids = new ArrayList<Long>();
        String value = getStringCellValue(row.getCell(columnIndexByName.get(PLATFORMS_COLUMN_HEADER)));
        if (!isStringNullEmpty(value)) {
            String[] tokens = value.split(",");
            for (String token : tokens) {
                String platform = token.trim();
                if (platform.length() > 0) {
                    if (projectPlatformByName.containsKey(platform.toLowerCase())) {
                        ids.add(projectPlatformByName.get(platform.toLowerCase()));
                    } else {
                        warnings.append("; unknown project platform '" + platform + "'");
                    }
                }
            }
        }
        return ids;
    }

    /**
     * Parses date from the specified cell of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @param name Name of the cell (needed for generating messages).
     * @param required If value is required to be specified.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private Timestamp parseDate(Row row, String name, boolean required) {
        String stringValue = getStringCellValue(row.getCell(columnIndexByName.get(name)));
        Date value = null;
        String message = null;
        if (isStringNullEmpty(stringValue)) {
            message = "; date in cell '" + name + "' is not specified";
        } else {
            try {
                value = dateFormat.parse(stringValue);
            } catch (ParseException e) {
                errors.append("; date in cell '" + name + "' has invalid date/time format");
            }
        }
        if (message != null) {
            if (required) {
                errors.append(message);
            } else {
                warnings.append(message);
            }
        }
        return (value != null) ? new Timestamp(value.getTime()) : null;
    }
	
	private Timestamp parseSimpleDate(Row row, String name, boolean required) {
        String stringValue = getStringCellValue(row.getCell(columnIndexByName.get(name)));
        Date value = null;
        String message = null;
        if (isStringNullEmpty(stringValue)) {
            message = "; date in cell '" + name + "' is not specified";
        } else {
            try {
                value = simpleFormat.parse(stringValue);
            } catch (ParseException e) { System.out.println("--parseSimpleDate---"+e);
                //errors.append("; date in cell '" + name + "' has invalid date/time format "+stringValue);
            }
        }
        if (message != null) {
            if (required) {
                errors.append(message);
            } else {
                warnings.append(message);
            }
        }
        return (value != null) ? new Timestamp(value.getTime()) : null;
    }

    /**
     * Parses project status from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private Long parseProjectStatus(Row row) {
        String value = getStringCellValue(row.getCell(columnIndexByName.get(STATUS_COLUMN_HEADER)));
        if ("Winner Selected".equalsIgnoreCase(value)) {
            return COMPLETED_PROJECT_STATUS_ID;
        } else if ("Failed".equalsIgnoreCase(value)) {
            String submissions = getStringCellValue(row.getCell(columnIndexByName.get(SUBMISSIONS_COLUMN_HEADER)));
            if (!isStringNullEmpty(submissions)) {
                if (submissions.trim().equals("0")) {
                    return ZERO_SUBMISSIONS_PROJECT_STATUS_ID;
                } else {
                    return FAILED_REVIEW_PROJECT_STATUS_ID;
                }
            } else {
                errors.append("; can't determine the project status, because the '"
                        + SUBMISSIONS_COLUMN_HEADER + "' cell is empty");
                return null;
            }
        } else {
            errors.append("; skipped, because the value of the '"
                    + STATUS_COLUMN_HEADER + "' cell is not supported");
            return null;
        }
    }

    /**
     * Parses project category from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private Long parseProjectCategory(Row row) {
        return CODE_PROJECT_CATEGORY_ID;
    }

    /**
     * Parses user from the specified cell of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @param name Name of the user cell (needed for generating messages).
     * @param required If user is required to be specified.
     * @return TC ID of the imported user or null if not specified or not yet imported.
     *
     * @since 1.1
     */
    private Long parseUser(Row row, String name, boolean required) {
        Long tcUserId = null;
        String message = null;
        String value = getStringCellValue(row.getCell(columnIndexByName.get(name)));
        if (!isStringNullEmpty(value)) {
            try {
                tcUserId = searchCSUserTCId(value);
            } catch (SQLException e) {
                errors.append("; DB error during searching imported CS user '" + value
                        + "' from '" + name + "' cell");
                return null;
            }
            if (tcUserId == null) {
                message = "; user from '" + name + "' cell with CS ID '" + value + "' is not found in TC DB";
            }
        } else {
            message = "; user in '" + name + "' cell is not specified";
        }
        if (message != null) {
            if (required) {
                errors.append(message);
            } else {
                warnings.append(message);
            }
        }
        return tcUserId;
    }

    /**
     * Parses direct project name from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private String parseDirectProjectName(Row row) {
        String value = getStringCellValue(row.getCell(columnIndexByName.get(PROJECT_COLUMN_HEADER)));
        if (isStringNullEmpty(value)) {
            value = null;
        } else if (value.length() > DIRECT_PROJECT_NAME_MAX_LENGTH) {
            errors.append("; direct project name is too long");
        }
        return value;
    }

    /**
     * Parses digital run flag from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private String parseDRFlag(Row row) {
        return "true".equalsIgnoreCase(getStringCellValue(row.getCell(
                columnIndexByName.get(DR_FLAG_COLUMN_HEADER)))) ? DR_FLAG_ON : DR_FLAG_OFF;
    }

    /**
     * Parses a value, which will be stored in the project_info table,
     * from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @param name Column name.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private String parseProjectInfoValue(Row row, String name) { 

        String value = getStringCellValue(row.getCell(columnIndexByName.get(name)));
        if (isStringNullEmpty(value)) {
            value = null;
            warnings.append("; '" + name + "' cell is empty, thus a corresponding "
                    + "project_info record will not be inserted");
        }
        return value;
    }

    /**
     * Parses requirements from the specified row of the input file.
     * from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private String parseRequirements(Row row) {
        String description = getStringCellValue(row.getCell(columnIndexByName.get(DESCRIPTION_COLUMN_HEADER)));
        String additionalInfo = getStringCellValue(row.getCell(columnIndexByName.get(ADDITIONAL_INFO_COLUMN_HEADER)));
        if (isStringNullEmpty(description)) {
            description = null;
            warnings.append("; project requirements not specified in the '" + DESCRIPTION_COLUMN_HEADER + "' cell");
        }
        if (isStringNullEmpty(additionalInfo)) {
            additionalInfo = null;
            warnings.append("; project requirements not specified in the '" + ADDITIONAL_INFO_COLUMN_HEADER + "' cell");
        }
        if (description == null && additionalInfo == null) {
            return null;
        }
        String value = ((description != null) ? description : "") + ((additionalInfo != null) ? additionalInfo : "");
        if (value.length() > PROJECT_SPEC_REQUIREMENTS_MAX_LENGTH) {
            warnings.append("; project requirements (concatenation of the '" + DESCRIPTION_COLUMN_HEADER + "' and '"
                    + ADDITIONAL_INFO_COLUMN_HEADER + "' cells are truncated to "
                    + PROJECT_SPEC_REQUIREMENTS_MAX_LENGTH + " characters");
            value = value.substring(0, PROJECT_SPEC_REQUIREMENTS_MAX_LENGTH);
        }
        return value;
    }

    /**
     * Parses requirements text from the specified row of the input file.
     * from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private String parseRequirementsText(Row row) {
        String value = getStringCellValue(row.getCell(columnIndexByName.get(REQUIREMENTS_TEXT_COLUMN_HEADER)));
        if (isStringNullEmpty(value)) {
            value = null;
            warnings.append("; project requirements text from the '" + REQUIREMENTS_TEXT_COLUMN_HEADER
                    + "' cell is not specified");
        }
        return value;
    }

    /**
     * Parses submission deliverables text from the specified row of the input file.
     * from the specified row of the input file.
     *
     * @param row Row of the input file from which to parse the desired value.
     * @return Parsed value.
     *
     * @since 1.1
     */
    private String parseSubmissionDeliverablesText(Row row) {
        String value = getStringCellValue(row.getCell(columnIndexByName.get(SUBMISSION_DETAILS_COLUMN_HEADER)));
        if (isStringNullEmpty(value)) {
            value = null;
            warnings.append("; submission deliverables text from the '" + SUBMISSION_DETAILS_COLUMN_HEADER
                    + "' cell is not specified");
        }
        return value;
    }

    /**
     * Processes the specified row of the input file.
     *
     * @param row Row of the input file which should be processed.
     */
    private void processInputRow(Row row) {
        LOG.info("Processing row number " + (row.getRowNum() + 1));

        warnings = new StringBuilder();
        errors = new StringBuilder();
        String csProjectId = parseProjectId(row);
        // Skip already migrated records.
        if (csProjectId != null) {
            try {
                if (alreadyMigrated(csProjectId)) {
                    errors.append("; record already migrated");
                }
            } catch (SQLException e) {
			    System.out.println("---error ----------------"+e);
                errors.append("; DB error during checking if record is already migrated");
            }
        }
        if (errors.length() > 0) {
            printImportErrors(row.getRowNum() + 1);
            return;
        }
        // Validate input values.
        String compName = parseComponentName(row);
        List<Long> technologyTypeIds = parseTechnologyTypes(row);
        Timestamp createDate = parseDate(row, CREATED_DATE_COLUMN_HEADER, true);
        Timestamp submissionStartDate = parseDate(row, START_DATE_COLUMN_HEADER, true);
        Timestamp submissionEndDate = parseDate(row, END_DATE_COLUMN_HEADER, true);
		Timestamp reviewEndDate = null;
		try {
			reviewEndDate = parseSimpleDate(row, REVIEW_DATE_COLUMN_HEADER, false);
		} catch (Exception e) { 
			reviewEndDate = null;
		}
        if (reviewEndDate == null && submissionEndDate != null) {
            reviewEndDate = new Timestamp(submissionEndDate.getTime() + DEFAULT_REVIEW_DURATION);
        }
        Long projectStatusId = parseProjectStatus(row);
        Long projectCategoryId = parseProjectCategory(row);
        Long ownerUserId = defaultUserId; // parseUser(row, OWNER_COLUMN_HEADER, false);
        Long createUserId = defaultUserId; //parseUser(row, CREATED_BY_COLUMN_HEADER, defaultUserId == null);
        /*if (createUserId == null) {
            createUserId = defaultUserId;
        }*/
        Long modifyUserId = defaultUserId;  //parseUser(row, LAST_MODIFIED_BY_COLUMN_HEADER, defaultUserId == null);
        /*if (modifyUserId == null) {
            modifyUserId = defaultUserId;
        }*/
        Long contactUserId = defaultUserId;  //parseUser(row, CONTACT_COLUMN_HEADER, false);
        String directProjectName = parseDirectProjectName(row);
        String requirements = parseRequirements(row);
        String requirementsText = parseRequirementsText(row);
        String submissionDeliverablesText = parseSubmissionDeliverablesText(row);
        String community = parseProjectInfoValue(row, COMMUNITY_COLUMN_HEADER);
        String challengeSFDCId = parseProjectInfoValue(row, CS_PRIZE_ID_COLUMN_HEADER);
        if (challengeSFDCId == null) {
            errors.append("; CS prize is not specified");
        }
        // Project info.
        Map<Long, String> projectInfoValues = getProjectInfoValues(
                row, compName, csProjectId, community, reviewEndDate);
        List<Long> platformIds = parsePlatforms(row);
        if (errors.length() > 0) {
            printImportErrors(row.getRowNum() + 1);
            return;
        }

        // Get data from CS API.
        JSONObject challengeInfoJson = null;
        JSONObject outcomeInfoJson = null;
        try {
            challengeInfoJson = callCSAPI(String.format(
                    CHALLENGE_INFO_CS_API_URL, URLEncoder.encode(csProjectId, DEFAULT_ENCODING)));
            outcomeInfoJson = callCSAPI(String.format(
                    OUTCOME_INFO_CS_API_URL, URLEncoder.encode(csProjectId, DEFAULT_ENCODING)));
        } catch (Exception e) {
			System.out.println("---error rrrrr----------------"+e);
            errors.append("; failed to retrieve information from CS API");
        }
        if (errors.length() > 0) {
            printImportErrors(row.getRowNum() + 1);
            return;
        }

        // Insert records to the necessary tables.
        try {
            // Component tables.
            long compId = insertCompCatalog(compName, createDate);
            long compVersionId = insertCompVersion(compId, createDate);
            insertCompVersionDate(compVersionId, createDate);
            insertCompCategory(compId);
            insertCompTechnologies(compVersionId, technologyTypeIds);

            // Direct project.
            Long directProjectId = null;
            if (directProjectName != null) {
                try {
                    directProjectId = searchDirectProject(directProjectName);
                } catch (SQLException e) {
                    System.out.println("---errorrrrr ----------------"+e);
                    errors.append("; DB error during searching TC direct project");
                }
                if (directProjectId == null) {
                    directProjectId = insertDirectProject(directProjectName,
                            (ownerUserId != null) ? ownerUserId : createUserId, createDate);
                }
            }

            // Project tables.
            long projectId = insertProject(projectStatusId, projectCategoryId, directProjectId,
                    createUserId, modifyUserId, createDate);
            // Project info.
            projectInfoValues.put(1L, "" + compVersionId); // External reference ID.
            projectInfoValues.put(2L, "" + compId); // Component ID.
            projectInfoValues.put(74L, challengeSFDCId); // CloudSpokes Challenge SFDC Id.
            for (Map.Entry<Long, String> projectInfoValue : projectInfoValues.entrySet()) {
                if (projectInfoValue.getValue() != null) {
                    insertProjectInfo(projectId, projectInfoValue.getKey(), projectInfoValue.getValue(),
                            createUserId, modifyUserId, createDate);
                }
            }
            if (community != null) {
                insertContestEligibility(projectId);
            }
            insertProjectPlatforms(projectId, platformIds, createUserId, modifyUserId, createDate);
            insertProjectSpec(projectId, requirements, requirementsText, submissionDeliverablesText,
                    createUserId, modifyUserId, createDate);
            // Phases.
            insertProjectPhase(projectId, REGISTRATION_PHASE_TYPE_ID, submissionStartDate, submissionEndDate,
                    createUserId, modifyUserId, createDate);
            insertProjectPhase(projectId, SUBMISSION_PHASE_TYPE_ID, submissionStartDate, submissionEndDate,
                    createUserId, modifyUserId, createDate);
            long reviewPhaseId = insertProjectPhase(projectId, REVIEW_PHASE_TYPE_ID, submissionEndDate, reviewEndDate,
                    createUserId, modifyUserId, createDate);
            insertPhaseCriteria(reviewPhaseId, createUserId, modifyUserId, createDate);

            // User resources.
            insertUserResources(projectId, ownerUserId, Arrays.asList(new Long[] {
                createUserId, modifyUserId, contactUserId }), submissionStartDate, createUserId,
                modifyUserId, createDate);

            // Outcome (registrants, reviewers, scores, places, prizes) tables.
            try {
                insertOutcome(projectId, challengeSFDCId, challengeInfoJson, outcomeInfoJson, reviewPhaseId,
                        submissionStartDate, createUserId, modifyUserId, createDate);
            } catch (Exception e) {
                String message = "CS API response processing failed";
                LOG.error(message, e);
                errors.append("; " + message);
            }
        } catch (IDGenerationException e) {
            errors.append("; ID generation failed");
        } catch (SQLException e) {
			System.out.println("---SQLException ----------------"+e);
            errors.append("; DB operation failed");
        }

        // Print errors/warnings if any and track the result.
        if (errors.length() > 0) {
            rollback();
            printImportErrors(row.getRowNum() + 1);
        } else if (warnings.length() > 0) {
            printImportWarnings(row.getRowNum() + 1);
        } else {
            totalSuccess++;
            totalSuccessDuringCurrentTransaction++;
        }
    }

    /**
     * Constructs project info records.
     *
     * @param row Row of the input file.
     * @param compName Component name.
     * @param csProjectId CS project ID.
     * @param community Community value.
     * @param completedDate Date of project completion.
     * @return Map with project info type IDs as keys and project info values as values.
     *
     * @since 1.1
     */
    private Map<Long, String> getProjectInfoValues(Row row, String compName, String csProjectId,
        String community, Timestamp completedDate) {
        Map<Long, String> projectInfoValues = new HashMap<Long, String>();

        // TC information.
        projectInfoValues.put(3L, "1"); // Version ID.
        projectInfoValues.put(5L, "9926572"); // Root catalog ID.
        projectInfoValues.put(6L, compName); // Project name.
        projectInfoValues.put(7L, "1.0"); // Project version.
        projectInfoValues.put(8L, ""); // SVN module.
        projectInfoValues.put(9L, "On"); // Auto-pilot option.
        projectInfoValues.put(10L, "On"); // Status notification.
        projectInfoValues.put(11L, "On"); // Time-line notification.
        projectInfoValues.put(12L, "Yes"); // Public.
        projectInfoValues.put(13L, "No"); // Rated.
        projectInfoValues.put(14L, "Open"); // Eligibility.
        projectInfoValues.put(17L, ""); // Notes.
        projectInfoValues.put(26L, "Off"); // Digital run flag.
        projectInfoValues.put(30L, "0"); // DR points.
        if (completedDate != null) {
         // Completion time-stamp.
            projectInfoValues.put(21L, projectInfoCompletionDateFormat.format(completedDate));
        }
        projectInfoValues.put(30L, parseProjectInfoValue(row, TOTAL_PRIZE_COLUMN_HEADER)); // DR points.
        projectInfoValues.put(41L, "false"); // Approval required.
        projectInfoValues.put(42L, "false"); // Requires other fixes.
        projectInfoValues.put(43L, "false"); // Send winner emails.
        projectInfoValues.put(44L, "false"); // Post-mortem Required.
        projectInfoValues.put(45L, "false"); // Reliability Bonus Eligible.
        projectInfoValues.put(46L, "false"); // Member Payments Eligible.
        projectInfoValues.put(48L, "false"); // Track Late Deliverables.
        projectInfoValues.put(59L, "false"); // Review Feedback Flag.

        // CloudSpokes information.
        projectInfoValues.put(64L, csProjectId);
        projectInfoValues.put(65L, parseProjectInfoValue(row, ACCOUNT_COLUMN_HEADER));
        projectInfoValues.put(66L, parseProjectInfoValue(row, SCORECARD_TYPE_COLUMN_HEADER));
        projectInfoValues.put(67L, parseProjectInfoValue(row, REFERENCE_NUMBER_COLUMN_HEADER));
        projectInfoValues.put(68L, parseProjectInfoValue(row, LINE_OF_BUSINESS_COLUMN_HEADER));
        projectInfoValues.put(69L, parseProjectInfoValue(row, TERMS_OF_SERVICE_COLUMN_HEADER));
        projectInfoValues.put(70L, parseProjectInfoValue(row, CMC_TASK_COLUMN_HEADER));
        projectInfoValues.put(71L, parseProjectInfoValue(row, APPIRIO_COST_CENTER_COLUMN_HEADER));
        projectInfoValues.put(72L, parseProjectInfoValue(row, APPIRIO_PAYMENT_TYPE_COLUMN_HEADER));
        projectInfoValues.put(73L, community);

        return projectInfoValues;
    }

    /**
     * Inserts project outcome (registrants, reviewers, scores, places, prizes) information to TC DB.
     *
     * @param projectId Project ID.
     * @param challengeInfoJson Challenge info JSON.
     * @param outcomeInfoJson Outcome info JSON.
     * @param reviewPhaseId Review phase ID.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @throws SQLException
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     * @throws Exception If any error occurs with CS API response parsing.
     *
     * @since 1.1
     */
    private void insertOutcome(long projectId, String challengeCode, JSONObject challengeInfoJson, JSONObject outcomeInfoJson,
        long reviewPhaseId, Timestamp startDate, long createUserId, long modifyUserId, Timestamp createDate) throws Exception {
        // Insert registrants and get the challenge code.
        Map<String, Long> registrantResourceIdByCSUserId = insertRegistrants(projectId, challengeInfoJson,
                startDate, createUserId, modifyUserId, createDate);

        if (outcomeInfoJson != null) {
            // Insert reviewers.
            Map<String, Long> reviewerResourceIdByCSUserId =
                    insertReviewers(projectId, outcomeInfoJson, startDate, createUserId, modifyUserId, createDate);
System.out.println("---------------------------"+reviewerResourceIdByCSUserId.size());
System.out.println("---------------------------"+reviewerResourceIdByCSUserId.get(String.valueOf(defaultUserId)));
            // Insert prizes.
            Map<Integer, Long> prizeMap = insertPrizes(projectId, challengeCode,
                    createUserId, modifyUserId, createDate);

            // Insert uploads and submissions.
            insertUploadsAndSubmissions(projectId, outcomeInfoJson, reviewPhaseId,
                    registrantResourceIdByCSUserId, reviewerResourceIdByCSUserId, prizeMap,
                    createUserId, modifyUserId, createDate);
        }
    }


    /**
     * Inserts prizes to TC DB.
     *
     * @param projectId Project ID.
     * @param challengeCode Challenge code.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return Key is a place, value is a prize ID.
     *
     * @throws IDGenerationException If any error occurs with ID generation.
     * @throws SQLException If any error occurs in the database.
     * @throws Exception If prizes can't be found for the specified challenge code.
     *
     * @since 1.1
     */
    private Map<Integer, Long> insertPrizes(long projectId, String challengeCode, long createUserId, long modifyUserId,
            Timestamp createDate) throws Exception {
        if (!csPrizes.containsKey(challengeCode)) {
            Exception e = new Exception("Prizes not found for challenge with code '" + challengeCode + "'.");
            LOG.error(e.getMessage(), e);
            throw e;
        }
        Map<Integer, Long> prizeMap = new HashMap<Integer, Long>();
        for (Map.Entry<Integer, Double> kvp : csPrizes.get(challengeCode).entrySet()) {
            prizeMap.put(kvp.getKey(), insertPrize(projectId, kvp.getKey(), kvp.getValue(),
                    createUserId, modifyUserId, createDate));
        }
        return prizeMap;
    }

    /**
     * Inserts submissions and uploads to TC DB.
     *
     * @param projectId Project ID.
     * @param outcomeInfoJson Outcome info JSON.
     * @param registrantResourceIdByCSUserId Mapping of CS user IDs to resource IDs.
     * @param reviewPhaseId Review phase ID.
     * @param prizeMap Key is place, value is prize ID.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     *
     * @throws IDGenerationException If any error occurs with ID generation.
     * @throws SQLException If any error occurs in the database.
     *
     * @since 1.1
     */
    private void insertUploadsAndSubmissions(long projectId, JSONObject outcomeInfoJson, long reviewPhaseId,
            Map<String, Long> registrantResourceIdByCSUserId, Map<String, Long> reviewerResourceIdByCSUserId,
            Map<Integer, Long> prizeMap, long createUserId, long modifyUserId, Timestamp createDate)
            throws IDGenerationException, SQLException {
        JSONArray outcomesArray = outcomeInfoJson.getJSONArray(CS_API_RESPONSE_ROOT_FIELD);
        for (Object outcomeObject : outcomesArray) {
            JSONObject outcomeJson = (JSONObject) outcomeObject;
            String csUserId = outcomeJson.getString("member");
            if (csUserId != null && registrantResourceIdByCSUserId.containsKey(csUserId)) {
                long resourceId = registrantResourceIdByCSUserId.get(csUserId);
                double score = outcomeJson.getDouble("score");

                // Insert upload.
                long uploadId = insertUpload(projectId, resourceId,
                        reviewPhaseId, createUserId, modifyUserId, createDate);
                // Insert submission.
                int place = outcomeJson.getInt("place");
                long submissionId = insertSubmission(uploadId, score, place,
                        prizeMap.get(place), createUserId, modifyUserId, createDate);
                // Insert project result.
                insertProjectResult(projectId, resourceId, score, place, createDate);
                // Insert winner / runner up.
                long tcUserId = searchCSUserTCId(csUserId);
                if (place == 1) {
                    // Winner External Reference ID.
                    insertProjectInfo(projectId, 23L, "" + tcUserId,
                            createUserId, modifyUserId, createDate);
                } else if (place == 2) {
                    // Runner-up External Reference ID.
                    insertProjectInfo(projectId, 24L, "" + tcUserId,
                            createUserId, modifyUserId, createDate);
                }

                // Insert review.
                if (((JSONObject) outcomeJson).getJSONObject("scorecard__r") != null
                        && ((JSONObject) outcomeJson).getJSONObject("scorecard__r").containsKey("records")) {
                    JSONArray recordsArray = ((JSONObject) outcomeJson).getJSONObject("scorecard__r").getJSONArray("records");
                    for (Object recordJson : recordsArray) {
                        String reviewerCSId = ((JSONObject) recordJson).getString("reviewer");
                        if (reviewerCSId != null && reviewerResourceIdByCSUserId.containsKey(reviewerCSId)) {
                            long reviewerResourceId = reviewerResourceIdByCSUserId.get(reviewerCSId);
                            double reviewerScore = ((JSONObject) recordJson).getDouble("final_score");
                            insertReview(reviewerResourceId, submissionId, uploadId, reviewPhaseId, reviewerScore,
                                    createUserId, modifyUserId, createDate);
                        }
                    }
                } else {
						long reviewerResourceId = reviewerResourceIdByCSUserId.get(String.valueOf(defaultUserId));
						insertReview(reviewerResourceId, submissionId, uploadId, reviewPhaseId, score,
                                    createUserId, modifyUserId, createDate);
				}
            } else {
                warnings.append("; upload and submission records not added for user '"
                        + ((csUserId != null) ? csUserId : "") + "', because user is not yet imported");
            }
        }
    }

    /**
     * Inserts registrants to TC DB.
     *
     * @param projectId Project ID.
     * @param challengeInfoJson Challenge info JSON.
     * @param startDate Start date.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return Mapping of registrants' CS user IDs to their resource role IDs.
     *
     * @throws IDGenerationException If any error occurs with ID generation.
     * @throws SQLException If any error occurs in the database.
     * @throws Exception If any error occurs with CS API response parsing.
     *
     * @since 1.1
     */
    private Map<String, Long> insertRegistrants(long projectId, JSONObject challengeInfoJson, Timestamp startDate,
            long createUserId, long modifyUserId, Timestamp createDate) throws Exception {
        // Extract registrant records from JSON.
        JSONArray membersArray = challengeInfoJson.getJSONObject(CS_API_RESPONSE_ROOT_FIELD).getJSONObject(
                "challenge_participants__r").getJSONArray("records");
        Map<String, Long> registrantTCUserIdByCSUserId = new HashMap<String, Long>();
        for (Object memberJson : membersArray) {
            String csUserId = ((JSONObject) memberJson).getString("member");
            if (isStringNullEmpty(csUserId)) {
                throw new Exception("Error in CS API response: CS user ID not specified.");
            }
            Long tcUserId = null;
            // Search registrant in TC DB.
            try {
                tcUserId = searchCSUserTCId(csUserId);
            } catch (SQLException e) {
                throw new Exception("; DB error during searching project registrant CS user '"
                        + csUserId + "' in TC DB", e);
            }
            if (tcUserId != null) {
                registrantTCUserIdByCSUserId.put(csUserId, tcUserId);
            }
        }

        // Assign registrants as resources to the project.
        Map<String, Long> registrantResourceIdByCSUserId = new HashMap<String, Long>();
        for (Map.Entry<String, Long> kvp : registrantTCUserIdByCSUserId.entrySet()) {
            registrantResourceIdByCSUserId.put(kvp.getKey(), insertResource(projectId,
                    SUBMITTER_RESOURCE_ROLE_ID, kvp.getValue(), startDate, createUserId, modifyUserId, createDate));
        }
        return registrantResourceIdByCSUserId;
    }

    /**
     * Inserts reviewers to TC DB.
     *
     * @param projectId Project ID.
     * @param outcomeInfoJson Outcome info JSON.
     * @param startDate Start date.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return Mapping of reviewers' CS user IDs to their resource role IDs.
     *
     * @throws IDGenerationException If any error occurs with ID generation.
     * @throws SQLException If any error occurs in the database.
     * @throws Exception If any error occurs with CS API response parsing.
     *
     * @since 1.1
     */
    private Map<String, Long> insertReviewers(long projectId, JSONObject outcomeInfoJson, Timestamp startDate,
            long createUserId, long modifyUserId, Timestamp createDate) throws Exception {
        // Extract reviewer records from JSON.
        
        JSONArray outcomesArray = outcomeInfoJson.getJSONArray(CS_API_RESPONSE_ROOT_FIELD);
        Set<String> addedCSUserIds = new HashSet<String>();
        Map<String, Long> reviewerTCUserIdByCSUserId = new HashMap<String, Long>();
        for (Object outcomeJson : outcomesArray) {
            if (((JSONObject) outcomeJson).getJSONObject("scorecard__r") != null
                    && ((JSONObject) outcomeJson).getJSONObject("scorecard__r").containsKey("records")) {
                JSONArray recordsArray = ((JSONObject) outcomeJson).getJSONObject("scorecard__r").getJSONArray("records");
                for (Object recordJson : recordsArray) {
                    String csUserId = ((JSONObject) recordJson).getString("reviewer");
                    if (isStringNullEmpty(csUserId)) {
                        throw new Exception("Error in CS API response: CS user ID not specified.");
                    }
                    if (!addedCSUserIds.contains(csUserId)) {
                        Long tcUserId = null;
                        // Search reviewer in TC DB.
                        try {
                            tcUserId = searchCSUserTCId(csUserId);
                        } catch (SQLException e) {
                            throw new Exception("; DB error during searching project reviewer CS user '"
                                    + csUserId + "' in TC DB", e);
                        }
                        if (tcUserId != null) {
                            reviewerTCUserIdByCSUserId.put(csUserId, tcUserId);
                        }
                        addedCSUserIds.add(csUserId);
                    }
                }
            }
        }

        // Assign reviewers as resources to the project.
        Map<String, Long> resourceIdByCSUserId = new HashMap<String, Long>();
        for (Map.Entry<String, Long> kvp : reviewerTCUserIdByCSUserId.entrySet()) {
            resourceIdByCSUserId.put(kvp.getKey(), insertResource(projectId, REVIEWER_RESOURCE_ROLE_ID,
                    kvp.getValue(), startDate, createUserId, modifyUserId, createDate));
        }
		
		if (reviewerTCUserIdByCSUserId.size() ==0) 
		{   System.out.println("---insert default resource-----------");
			resourceIdByCSUserId.put(String.valueOf(defaultUserId), insertResource(projectId, REVIEWER_RESOURCE_ROLE_ID,
                    defaultUserId, startDate, createUserId, modifyUserId, createDate));
		}	
        return resourceIdByCSUserId;
    }

    /**
     * Makes a call to CS API.
     *
     * @param urlString URL to call.
     * @return Response.
     *
     * @throws Exception If any error occurs with CS API call.
     *
     * @since 1.1
     */
    private JSONObject callCSAPI(String urlString) throws Exception {
        // Create HTTP connection.
        HttpURLConnection httpConn = null;
        try {
            httpConn = (HttpURLConnection) new URL(urlString).openConnection();
            httpConn.setRequestMethod("GET");
            httpConn.setRequestProperty(HTTP_ACCEPT_HEADER, JSON_MIME_TYPE);
        } catch (Exception e) {
            LOG.error("Error calling CS API.", e);
            throw e;
        } finally {
            if (httpConn != null) {
                httpConn.disconnect();
            }
        }

        // Retrieve response.
        String responseString = null;
        InputStream responseStream = null;
        try {
            int responseCode = httpConn.getResponseCode();
            responseStream = (responseCode == HttpURLConnection.HTTP_OK)
                    ? httpConn.getInputStream() : httpConn.getErrorStream();
            responseString = IOUtils.toString(responseStream, DEFAULT_ENCODING);
            if (responseCode != HttpURLConnection.HTTP_OK) {
                Exception e = new Exception("Error response from CS API call.");
                LOG.error(e.getMessage(), e);
                throw e;
            }
        } catch (IOException e) {
            LOG.error("Error reading CS API response.", e);
            throw e;
        } finally {
            close("responseStream", responseStream);
            httpConn.disconnect();
        }

        // Parse response.
        try {
            return (JSONObject) JSONSerializer.toJSON(responseString);
        } catch (Exception e) {
            LOG.error("Error parsing CS API response.", e);
            throw e;
        }
    }

    /**
     * Inserts user resources to TC DB.
     *
     * @param projectId Project ID.
     * @param managerUserId User ID of manager.
     * @param observerUserIds User ID of observers.
     * @param startDate Start date.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     *
     * @throws IDGenerationException If any error occurs with ID generation.
     * @throws SQLException If any error occurs in the database.
     *
     * @since 1.1
     */
    private void insertUserResources(long projectId, Long managerUserId, List<Long> observerUserIds,
        Timestamp startDate, long createUserId, long modifyUserId, Timestamp createDate)
        throws IDGenerationException, SQLException {
        Set<Long> assignedUserIds = new HashSet<Long>();

        // Insert managers.
        if (managerUserId != null) {
            insertResource(projectId, MANAGER_RESOURCE_ROLE_ID, managerUserId, startDate,
                    createUserId, modifyUserId, createDate);
            assignedUserIds.add(managerUserId);
        }

        // Insert observers.
        for (Long userId : observerUserIds) {
            if (userId != null && !assignedUserIds.contains(userId)) {
                insertResource(projectId, OBSERVER_RESOURCE_ROLE_ID, userId, startDate,
                        createUserId, modifyUserId, createDate);
                assignedUserIds.add(userId);
            }
        }
    }

    /**
     * Searches TC direct project ID by name.
     *
     * @param name Direct project name.
     * @return TC direct project ID. <code>null</code> if not found.
     *
     * @throws SQLException If any error occurs in persistence.
     *
     * @since 1.1
     */
    private Long searchDirectProject(String name) throws SQLException {
        ResultSet rs = null;
        try {
            if (searchDirectProjectStmt == null) {
                searchDirectProjectStmt = conn.prepareStatement(
                        "SELECT project_id FROM tc_direct_project WHERE name = ?");
            }
            searchDirectProjectStmt.setString(1, name);
            rs = searchDirectProjectStmt.executeQuery();
            if (rs.next()) {
                return rs.getLong(1);
            } else {
                return null;
            }
        } catch (SQLException e) {
            LOG.error("Error searching a direct project by name in DB.", e);
            throw e;
        } finally {
            close(rs);
        }
    }

    /**
     * Searches TC user ID of the user imported from CloudSpokes.
     *
     * @param csId CloudSpokes user ID.
     * @return TC user ID. <code>null</code> if not found.
     *
     * @throws SQLException If any error occurs in persistence.
     *
     * @since 1.1
     */
    private Long searchCSUserTCId(String csId) throws SQLException {
        ResultSet rs = null;
        try {
            if (searchCSUserTCIdStmt == null) {
                searchCSUserTCIdStmt = conn.prepareStatement(
                        "SELECT user_id, handle FROM user WHERE open_id = ?");
            }
            searchCSUserTCIdStmt.setString(1, csId);
            rs = searchCSUserTCIdStmt.executeQuery();
            if (rs.next()) {
                handleByUserId.put(rs.getLong(1), rs.getString(2));
                return rs.getLong(1);
            } else {
                return null;
            }
        } catch (SQLException e) {
            LOG.error("Error searching user by CS ID in DB.", e);
            throw e;
        } finally {
            close(rs);
        }
    }

    /**
     * Inserts a record to the tc_direct_project table.
     *
     * @param name Direct project name.
     * @param userId User ID.
     * @param createDate Create date.
     * @return ID (primary key) of the created record.
     *
     * @throws SQLException If any error occurs in the database.
     *
     * @since 1.1
     */
    private long insertDirectProject(String name, long userId, Timestamp createDate) throws SQLException {
        // Insert record to tc_direct_project table.
        ResultSet rs = null;
        try {
            if (insertDirectProjectStmt == null) {
                insertDirectProjectStmt = conn.prepareStatement(
                    "INSERT INTO tc_direct_project (project_id,name,user_id,create_date,modify_date) "
                    + "VALUES (corporate_oltp:project_sequence.NEXTVAL,?,?,?,?)");
            }
            int index = 1;
            insertDirectProjectStmt.setString(index++, name);
            insertDirectProjectStmt.setLong(index++, userId);
            insertDirectProjectStmt.setTimestamp(index++, createDate);
            insertDirectProjectStmt.setTimestamp(index++, createDate);
            insertDirectProjectStmt.executeUpdate();
            rs = conn.createStatement().executeQuery(
                    "SELECT FIRST 1 corporate_oltp:project_sequence.CURRVAL FROM tc_direct_project");
            if (!rs.next()) {
                throw new SQLException("tc_direct_project primary key sequence project_sequence value not available.");
            }
            return rs.getLong(1);
        } catch (SQLException e) {
            LOG.error("Error inserting record to tc_direct_project table.", e);
            throw e;
        } finally {
            close(rs);
        }
    }

    /**
     * Inserts a record to the project_result table.
     *
     * @param projectId Project ID.
     * @param userId User ID.
     * @param score Score.
     * @param place Place.
     * @param createDate Create date.
     *
     * @throws SQLException If any error occurs in the database.
     *
     * @since 1.1
     */
    private void insertProjectResult(long projectId, long userId, double score, int place, Timestamp createDate)
        throws SQLException {
        try {
            if (insertProjectResultStmt == null) {
                insertProjectResultStmt = conn.prepareStatement(
                    "INSERT INTO project_result (project_id,user_id,raw_score,final_score,placed,rating_ind,"
                    + "valid_submission_ind,passed_review_ind,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,0,1,1,?,?)");
            }
            int index = 1;
            insertProjectResultStmt.setLong(index++, projectId);
            insertProjectResultStmt.setLong(index++, userId);
            insertProjectResultStmt.setDouble(index++, score);
            insertProjectResultStmt.setDouble(index++, score);
            insertProjectResultStmt.setInt(index++, place);
            insertProjectResultStmt.setTimestamp(index++, createDate);
            insertProjectResultStmt.setTimestamp(index++, createDate);
            insertProjectResultStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to project_result table.", e);
            throw e;
        }
    }

    /**
     * Inserts a records to the review related tables.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private void insertReview(long reviewerResourceId, long submissionId, long uploadId, long reviewPhaseId,
        double reviewerScore, long createUserId, long modifyUserId, Timestamp createDate)
        throws SQLException, IDGenerationException {
        // Generate review ID (primary key).
        long reviewId;
        try {
            reviewId = reviewIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate review ID.", e);
            throw e;
        }
        LOG.debug("Review ID generated " + reviewId);

        // Insert into review table.
        try {
            if (insertReviewStmt == null) {
                insertReviewStmt = conn.prepareStatement(
                    "INSERT INTO review (review_id,resource_id,submission_id,project_phase_id,scorecard_id,"
                    + "committed,score,initial_score,create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,1,?,?,?,?,?,?)");
            }
            int index = 1;
            insertReviewStmt.setLong(index++, reviewId);
            insertReviewStmt.setLong(index++, reviewerResourceId);
            insertReviewStmt.setDouble(index++, submissionId);
            insertReviewStmt.setDouble(index++, reviewPhaseId);
            insertReviewStmt.setLong(index++, scorecardId);
            insertReviewStmt.setDouble(index++, reviewerScore);
            insertReviewStmt.setDouble(index++, reviewerScore);
            insertReviewStmt.setLong(index++, createUserId);
            insertReviewStmt.setLong(index++, modifyUserId);
            insertReviewStmt.setTimestamp(index++, createDate);
            insertReviewStmt.setTimestamp(index++, createDate);
            insertReviewStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to review table.", e);
            throw e;
        }

        // Generate review_item ID (primary key).
        long reviewItemId;
        try {
            reviewItemId = reviewItemIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate review item ID.", e);
            throw e;
        }
        LOG.debug("Review item ID generated " + reviewItemId);

        // Insert into review_item table.
        try {
            if (insertReviewItemStmt == null) {
                insertReviewItemStmt = conn.prepareStatement(
                    "INSERT INTO review_item (review_item_id,review_id,scorecard_question_id,upload_id,answer,sort,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,0,?,?,?,?)");
            }
            int index = 1;
            insertReviewItemStmt.setLong(index++, reviewItemId);
            insertReviewItemStmt.setLong(index++, reviewId);
            insertReviewItemStmt.setDouble(index++, scorecardQuestionId);
            insertReviewItemStmt.setDouble(index++, uploadId);
			insertReviewItemStmt.setInt(index++, (int)(reviewerScore/10));
            insertReviewItemStmt.setLong(index++, createUserId);
            insertReviewItemStmt.setLong(index++, modifyUserId);
            insertReviewItemStmt.setTimestamp(index++, createDate);
            insertReviewItemStmt.setTimestamp(index++, createDate);
            insertReviewItemStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to review_item table.", e);
            throw e;
        }

        // Generate review_item_comment ID (primary key).
        long reviewItemCommentId;
        try {
            reviewItemCommentId = reviewItemCommentIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate review item comment ID.", e);
            throw e;
        }
        LOG.debug("Review item comment ID generated " + reviewItemCommentId);

        // Insert into review_item_comment table.
        try {
            if (insertReviewItemCommentStmt == null) {
                insertReviewItemCommentStmt = conn.prepareStatement(
                    "INSERT INTO review_item_comment (review_item_comment_id,resource_id,review_item_id,"
                    + "comment_type_id,content,sort,create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,1,'Ok',0,?,?,?,?)");
            }
            int index = 1;
            insertReviewItemCommentStmt.setLong(index++, reviewItemCommentId);
            insertReviewItemCommentStmt.setLong(index++, reviewerResourceId);
            insertReviewItemCommentStmt.setLong(index++, reviewItemId);
            insertReviewItemCommentStmt.setLong(index++, createUserId);
            insertReviewItemCommentStmt.setLong(index++, modifyUserId);
            insertReviewItemCommentStmt.setTimestamp(index++, createDate);
            insertReviewItemCommentStmt.setTimestamp(index++, createDate);
            insertReviewItemCommentStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to review_item_comment table.", e);
            throw e;
        }
    }

    /**
     * Inserts a record to the contest_eligibility table.
     *
     * @param projectId Project ID.
     *
     * @throws SQLException If any error occurs in the database.
     *
     * @since 1.1
     */
    private void insertContestEligibility(long projectId) throws SQLException {
        // Insert record to contest_eligibility table.
        try {
            if (insertContestEligibilityStmt == null) {
                insertContestEligibilityStmt = conn.prepareStatement(
                    "INSERT INTO contest_eligibility (contest_eligibility_id,contest_id,is_studio) "
                    + "VALUES (common_oltp:CONTEST_ELIGIBILITY_SEQ.NEXTVAL,?,0);");
            }
            int index = 1;
            insertContestEligibilityStmt.setLong(index++, projectId);
            insertContestEligibilityStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to contest_eligibility table.", e);
            throw e;
        }
    }

    /**
     * Inserts a record to the submission table.
     *
     * @param uploadId Upload ID.
     * @param score Score.
     * @param place Place.
     * @param prizeId Prize ID.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return Generated ID (primary key).
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private long insertSubmission(long uploadId, double score, int place, Long prizeId,
        long createUserId, long modifyUserId, Timestamp createDate) throws IDGenerationException, SQLException {
        // Generate ID (primary key).
        long pk;
        try {
            pk = submissionIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate submission ID.", e);
            throw e;
        }
        LOG.debug("Submission ID generated " + pk);

        // Insert record to submission table.
        try {
            if (insertSubmissionStmt == null) {
                insertSubmissionStmt = conn.prepareStatement(
                    "INSERT INTO submission (submission_id,upload_id,submission_status_id,initial_score,"
                    + "final_score,placement,prize_id,submission_type_id,create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,?,?,1,?,?,?,?);");
            }
            int index = 1;
            insertSubmissionStmt.setLong(index++, pk);
            insertSubmissionStmt.setLong(index++, uploadId);
            insertSubmissionStmt.setLong(index++, (place == 1) ? ACTIVE_SUBMISSION_STATUS_ID
                    : COMPLETED_WITHOUT_WIN_SUBMISSION_STATUS_ID);
            insertSubmissionStmt.setDouble(index++, score);
            insertSubmissionStmt.setDouble(index++, score);
            insertSubmissionStmt.setLong(index++, place);
            if (prizeId != null) {
                insertSubmissionStmt.setLong(index++, prizeId);
            } else {
                insertSubmissionStmt.setNull(index++, Types.BIGINT);
            }
            insertSubmissionStmt.setLong(index++, createUserId);
            insertSubmissionStmt.setLong(index++, modifyUserId);
            insertSubmissionStmt.setTimestamp(index++, createDate);
            insertSubmissionStmt.setTimestamp(index++, createDate);
            insertSubmissionStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to submission table.", e);
            throw e;
        }
        return pk;
    }

    /**
     * Inserts a record to the upload table.
     *
     * @param projectId Project status ID.
     * @param resourceId Resource ID.
     * @param phaseId Phase ID.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return Generated ID (primary key).
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private long insertUpload(long projectId, long resourceId, long phaseId,
            long createUserId, long modifyUserId, Timestamp createDate)
            throws IDGenerationException, SQLException {
        // Generate ID (primary key).
        long pk;
        try {
            pk = uploadIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate upload ID.", e);
            throw e;
        }
        LOG.debug("Upload ID generated " + pk);

        // Insert record to upload table.
        try {
            if (insertUploadStmt == null) {
                insertUploadStmt = conn.prepareStatement(
                    "INSERT INTO upload (upload_id,project_id,resource_id,upload_type_id,upload_status_id,parameter,"
                    + "project_phase_id,create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,1,1,'',?,?,?,?,?);");
            }
            int index = 1;
            insertUploadStmt.setLong(index++, pk);
            insertUploadStmt.setLong(index++, projectId);
            insertUploadStmt.setLong(index++, resourceId);
            insertUploadStmt.setLong(index++, phaseId);
            insertUploadStmt.setLong(index++, createUserId);
            insertUploadStmt.setLong(index++, modifyUserId);
            insertUploadStmt.setTimestamp(index++, createDate);
            insertUploadStmt.setTimestamp(index++, createDate);
            insertUploadStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to upload table.", e);
            throw e;
        }
        return pk;
    }

    /**
     * Inserts a record to the prize table.
     *
     * @param projectId Project status ID.
     * @param place Place.
     * @param amount Prize amount.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return ID of the created record.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private long insertPrize(long projectId, int place, double amount, long createUserId, long modifyUserId,
        Timestamp createDate) throws IDGenerationException, SQLException {
        // Generate ID (primary key).
        long pk;
        try {
            pk = prizeIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate prize ID.", e);
            throw e;
        }
        LOG.debug("Prize ID generated " + pk);

        // Insert record to prize table.
        try {
            if (insertPrizeStmt == null) {
                insertPrizeStmt = conn.prepareStatement(
                    "INSERT INTO prize (prize_id,project_id,place,prize_amount,prize_type_id,number_of_submissions,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,15,1,?,?,?,?);");
            }
            int index = 1;
            insertPrizeStmt.setLong(index++, pk);
            insertPrizeStmt.setLong(index++, projectId);
            insertPrizeStmt.setInt(index++, place);
            insertPrizeStmt.setDouble(index++, amount);
            insertPrizeStmt.setLong(index++, createUserId);
            insertPrizeStmt.setLong(index++, modifyUserId);
            insertPrizeStmt.setTimestamp(index++, createDate);
            insertPrizeStmt.setTimestamp(index++, createDate);
            insertPrizeStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to prize table.", e);
            throw e;
        }
        return pk;
    }

    /**
     * Inserts a record to the project table.
     *
     * @param projectStatusId Project status ID.
     * @param projectCategoryId Project category ID.
     * @param directProjectId Direct project ID (null if none).
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return ID (primary key) of the created record.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private long insertProject(long projectStatusId, long projectCategoryId, Long directProjectId,
            long createUserId, long modifyUserId, Timestamp createDate) throws IDGenerationException, SQLException {
        // Generate ID (primary key).
        long pk;
        try {
            pk = projectIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate project ID.", e);
            throw e;
        }
        LOG.debug("Project ID generated " + pk);

        // Insert record to project table.
        try {
            if (insertProjectStmt == null) {
                insertProjectStmt = conn.prepareStatement(
                    "INSERT INTO project (project_id,project_status_id,project_category_id,tc_direct_project_id,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,?,?,current);");
            }
            int index = 1;
            insertProjectStmt.setLong(index++, pk);
            insertProjectStmt.setLong(index++, projectStatusId);
            insertProjectStmt.setLong(index++, projectCategoryId);
            if (directProjectId != null) {
                insertProjectStmt.setLong(index++, directProjectId);
            } else {
                insertProjectStmt.setNull(index++, Types.INTEGER);
            }
            insertProjectStmt.setLong(index++, createUserId);
            insertProjectStmt.setLong(index++, modifyUserId);
            insertProjectStmt.setTimestamp(index++, createDate);
           // insertProjectStmt.setTimestamp(index++, createDate);
            insertProjectStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to project table.", e);
            throw e;
        }
        return pk;
    }

    /**
     * Inserts a record to the project_phase table.
     *
     * @param projectId Project ID.
     * @param phaseTypeId Phase type ID.
     * @param startDate Start date.
     * @param endDate End date.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return Generated ID.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private long insertProjectPhase(long projectId, long phaseTypeId, Timestamp startDate, Timestamp endDate,
        long createUserId, long modifyUserId, Timestamp createDate)
        throws SQLException, IDGenerationException {
        // Generate ID (primary key).
        long pk;
        try {
            pk = projectPhaseIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate project phase ID.", e);
            throw e;
        }
        LOG.debug("Project phase ID generated " + pk);

        // Insert record to project_phase table.
        try {
            if (insertProjectPhaseStmt == null) {
                insertProjectPhaseStmt = conn.prepareStatement(
                    "INSERT INTO project_phase (project_phase_id,project_id,phase_type_id,phase_status_id,"
                    + "fixed_start_time,scheduled_start_time,actual_start_time,scheduled_end_time,actual_end_time,"
                    + "duration,create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,3,?,?,?,?,?,?,?,?,?,?);");
            }
            int index = 1;
            insertProjectPhaseStmt.setLong(index++, pk);
            insertProjectPhaseStmt.setLong(index++, projectId);
            insertProjectPhaseStmt.setLong(index++, phaseTypeId);
            if (phaseTypeId == REGISTRATION_PHASE_TYPE_ID) {
                insertProjectPhaseStmt.setTimestamp(index++, startDate);
            } else {
                insertProjectPhaseStmt.setNull(index++, Types.TIMESTAMP);
            }
            insertProjectPhaseStmt.setTimestamp(index++, startDate);
            insertProjectPhaseStmt.setTimestamp(index++, startDate);
            insertProjectPhaseStmt.setTimestamp(index++, endDate);
            insertProjectPhaseStmt.setTimestamp(index++, endDate);
            insertProjectPhaseStmt.setLong(index++, endDate.getTime() - startDate.getTime());
            insertProjectPhaseStmt.setLong(index++, createUserId);
            insertProjectPhaseStmt.setLong(index++, modifyUserId);
            insertProjectPhaseStmt.setTimestamp(index++, createDate);
            insertProjectPhaseStmt.setTimestamp(index++, createDate);
            insertProjectPhaseStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to project_phase table.", e);
            throw e;
        }
        return pk;
    }

    /**
     * Inserts a record to the phase_criteria table.
     *
     * @param phaseId Project ID.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private void insertPhaseCriteria(long phaseId, long createUserId, long modifyUserId, Timestamp createDate)
        throws SQLException, IDGenerationException {
        try {
            if (insertPhaseCriteriaStmt == null) {
                insertPhaseCriteriaStmt = conn.prepareStatement(
                    "INSERT INTO phase_criteria (project_phase_id,phase_criteria_type_id,parameter,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,1,?,?,?,?,?);");
            }
            int index = 1;
            insertPhaseCriteriaStmt.setLong(index++, phaseId);
            insertPhaseCriteriaStmt.setString(index++, "" + scorecardId);
            insertPhaseCriteriaStmt.setLong(index++, createUserId);
            insertPhaseCriteriaStmt.setLong(index++, modifyUserId);
            insertPhaseCriteriaStmt.setTimestamp(index++, createDate);
            insertPhaseCriteriaStmt.setTimestamp(index++, createDate);
            insertPhaseCriteriaStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to phase_criteria table.", e);
            throw e;
        }
    }

    /**
     * Inserts a record to the project_spec table.
     *
     * @param projectId Project ID.
     * @param requirements Requirements.
     * @param requirementsText Requirements text.
     * @param submissionDeliverablesText Submission deliverables text.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private void insertProjectSpec(long projectId, String requirements, String requirementsText,
        String submissionDeliverablesText, long createUserId, long modifyUserId, Timestamp createDate)
        throws SQLException, IDGenerationException {
        // Generate ID (primary key).
        long pk;
        try {
            pk = projectSpecIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate project spec ID.", e);
            throw e;
        }
        LOG.debug("Project spec ID generated " + pk);

        // Insert record to project_spec table.
        try {
            if (insertProjectSpecStmt == null) {
                insertProjectSpecStmt = conn.prepareStatement(
                    "INSERT INTO project_spec (project_spec_id,project_id,version,detailed_requirements,"
                    + "detailed_requirements_text,submission_deliverables_text,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,1,?,?,?,?,?,?,?);");
            }
            int index = 1;
            insertProjectSpecStmt.setLong(index++, pk);
            insertProjectSpecStmt.setLong(index++, projectId);
            insertProjectSpecStmt.setString(index++, requirements);
            insertProjectSpecStmt.setString(index++, requirementsText);
            insertProjectSpecStmt.setString(index++, submissionDeliverablesText);
            insertProjectSpecStmt.setLong(index++, createUserId);
            insertProjectSpecStmt.setLong(index++, modifyUserId);
            insertProjectSpecStmt.setTimestamp(index++, createDate);
            insertProjectSpecStmt.setTimestamp(index++, createDate);
            insertProjectSpecStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to project_spec table.", e);
            throw e;
        }
    }

    /**
     * Inserts a record to the resource and resource_info tables.
     *
     * @param projectId Project ID.
     * @param roleId Role ID.
     * @param userId User ID.
     * @param startDate Start date.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     * @return Resource ID.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     *
     * @since 1.1
     */
    private long insertResource(long projectId, long roleId, long userId, Timestamp startDate,
            long createUserId, long modifyUserId, Timestamp createDate) throws IDGenerationException, SQLException {
        // Generate ID (primary key).
        long resourceId;
        try {
            resourceId = resourceIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate resource ID.", e);
            throw e;
        }
        LOG.debug("Resource ID generated " + resourceId);

        // Insert record to resource table.
        try {
            if (insertResourceStmt == null) {
                insertResourceStmt = conn.prepareStatement(
                    "INSERT INTO resource (resource_id,resource_role_id,project_id,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,?,?);");
            }
            int index = 1;
            insertResourceStmt.setLong(index++, resourceId);
            insertResourceStmt.setLong(index++, roleId);
            insertResourceStmt.setLong(index++, projectId);
            insertResourceStmt.setLong(index++, createUserId);
            insertResourceStmt.setLong(index++, modifyUserId);
            insertResourceStmt.setTimestamp(index++, createDate);
            insertResourceStmt.setTimestamp(index++, createDate);
            insertResourceStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to resource table.", e);
            throw e;
        }

        // Insert record to resource_info table.
        try {
            if (insertResourceInfoStmt == null) {
                insertResourceInfoStmt = conn.prepareStatement(
                    "INSERT INTO resource_info (resource_id,resource_info_type_id,value,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,?,?);");
            }
            int index = 1;
            insertResourceInfoStmt.setLong(index++, resourceId);
            insertResourceInfoStmt.setLong(index++, 1);
            insertResourceInfoStmt.setString(index++, "" + userId);
            insertResourceInfoStmt.setLong(index++, createUserId);
            insertResourceInfoStmt.setLong(index++, modifyUserId);
            insertResourceInfoStmt.setTimestamp(index++, createDate);
            insertResourceInfoStmt.setTimestamp(index++, createDate);
            // External ID.
            insertResourceInfoStmt.executeUpdate();
            // Handle.
            insertResourceInfoStmt.setLong(2, 2);
            insertResourceInfoStmt.setString(3, handleByUserId.get(userId));
            insertResourceInfoStmt.executeUpdate();
            // Start date.
            insertResourceInfoStmt.setLong(2, 6);
            insertResourceInfoStmt.setString(3, (startDate != null) ? resource_info_fomate.format(startDate) : resource_info_fomate.format(createDate));
            insertResourceInfoStmt.executeUpdate();
            // Appeals completed early.
            insertResourceInfoStmt.setLong(2, 13);
            insertResourceInfoStmt.setString(3, "No");
            // Manual payments.
            insertResourceInfoStmt.setLong(2, 15);
            insertResourceInfoStmt.setString(3, "false");
            insertResourceInfoStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to resource_info table.", e);
            throw e;
        }

        return resourceId;
    }

    /**
     * Inserts a record to the project_info table.
     *
     * @param projectId Project ID.
     * @param projectInfoTypeId Project info type ID.
     * @param value Project info value.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     *
     * @throws SQLException If any error occurs in the database.
     *
     * @since 1.1
     */
    private void insertProjectInfo(long projectId, long projectInfoTypeId, String value,
            long createUserId, long modifyUserId, Timestamp createDate) throws SQLException {
        // Insert record to project_info table.
        try {
            if (insertProjectInfoStmt == null) {
                insertProjectInfoStmt = conn.prepareStatement(
                    "INSERT INTO project_info (project_id,project_info_type_id,value,"
                    + "create_user,modify_user,create_date,modify_date) "
                    + "VALUES (?,?,?,?,?,?,?);");
            }
            int index = 1;
            insertProjectInfoStmt.setLong(index++, projectId);
            insertProjectInfoStmt.setLong(index++, projectInfoTypeId);
            insertProjectInfoStmt.setString(index++, value);
            insertProjectInfoStmt.setLong(index++, createUserId);
            insertProjectInfoStmt.setLong(index++, modifyUserId);
            insertProjectInfoStmt.setTimestamp(index++, createDate);
            insertProjectInfoStmt.setTimestamp(index++, createDate);
            insertProjectInfoStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to project_info table.", e);
            throw e;
        }
    }

    /**
     * Inserts a record to the comp_catalog table.
     *
     * @param compName Component name.
     * @param createDate Create date.
     * @return ID (primary key) of the created record.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     */
    private long insertCompCatalog(String compName, Timestamp createDate) throws SQLException, IDGenerationException {
        // Generate component ID.
        long compId;
        try {
            compId = compIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate component ID.", e);
            throw e;
        }
        LOG.debug("Component ID generated " + compId);

        // Insert record to comp_catalog table.
        try {
            if (insertCompCatalogStmt == null) {
                insertCompCatalogStmt = conn.prepareStatement(
                    "INSERT INTO comp_catalog (component_id,component_name,current_version,status_id,"
                    + "root_category_id,short_desc,description,create_time,modify_date) "
                    + "VALUES (?,?,1,102,9926572,'NA','NA',?,?);");
            }
            int index = 1;
            insertCompCatalogStmt.setLong(index++, compId);
            insertCompCatalogStmt.setString(index++, compName);
            insertCompCatalogStmt.setTimestamp(index++, createDate);
            insertCompCatalogStmt.setTimestamp(index++, createDate);
            insertCompCatalogStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to comp_catalog table.", e);
            throw e;
        }
        return compId;
    }

    /**
     * Inserts a record to the comp_versions table.
     *
     * @param compId Component ID.
     * @param createDate Create date.
     * @return ID (primary key) of the created record.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     */
    private long insertCompVersion(long compId, Timestamp createDate) throws SQLException, IDGenerationException {
        // Generate component version ID.
        long compVersionId;
        try {
            compVersionId = compVersionIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate component version ID.", e);
            throw e;
        }
        LOG.debug("Component version ID generated " + compVersionId);

        // Insert record to comp_versions table.
        try {
            if (insertCompVersionStmt == null) {
                insertCompVersionStmt = conn.prepareStatement(
                    "INSERT INTO comp_versions (comp_vers_id,component_id,version,version_text,phase_id,price,"
                    + "phase_time,create_time,modify_date) "
                    + "VALUES (?,?,1,'1.0',112,0.00,?,?,?);");
            }
            int index = 1;
            insertCompVersionStmt.setLong(index++, compVersionId);
            insertCompVersionStmt.setLong(index++, compId);
            insertCompVersionStmt.setTimestamp(index++, PHASE_TIME);
            insertCompVersionStmt.setTimestamp(index++, createDate);
            insertCompVersionStmt.setTimestamp(index++, createDate);
            insertCompVersionStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to comp_versions table.", e);
            throw e;
        }
        return compVersionId;
    }

    /**
     * Inserts a record to the comp_version_dates table.
     *
     * @param compVersionId Component version ID.
     * @param createDate Create date.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     */
    private void insertCompVersionDate(long compVersionId, Timestamp createDate)
        throws SQLException, IDGenerationException {
        // Generate component version date ID.
        long compVersionDateId;
        try {
            compVersionDateId = compVersionDateIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate component version date ID.", e);
            throw e;
        }
        LOG.debug("Component version date ID generated " + compVersionDateId);

        // Insert record to comp_version_dates table.
        try {
            if (insertCompVersionDateStmt == null) {
                insertCompVersionDateStmt = conn.prepareStatement(
                    "INSERT INTO comp_version_dates (comp_version_dates_id,comp_vers_id,posting_date,phase_id,"
                    + "price,status_id,level_id,initial_submission_date,winner_announced_date,"
                    + "final_submission_date,estimated_dev_date,review_complete_date,aggregation_complete_date,"
                    + "phase_complete_date,production_date,screening_complete_date,create_time,modify_date)"
                    + "VALUES (?,?,?,112,0.00,301,100,?,?,?,?,?,?,?,?,?,?,?);");
            }
            int index = 1;
            insertCompVersionDateStmt.setLong(index++, compVersionDateId);
            insertCompVersionDateStmt.setLong(index++, compVersionId);
            insertCompVersionDateStmt.setTimestamp(index++, POSTING_DATE);
            for (int i = 0; i < DEFAULT_VERSION_DATES_COUNT; i++) {
                insertCompVersionDateStmt.setTimestamp(index++, DEFAULT_VERSION_DATE);
            }
            insertCompVersionDateStmt.setTimestamp(index++, createDate);
            insertCompVersionDateStmt.setTimestamp(index++, createDate);
            insertCompVersionDateStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to comp_version_dates table.", e);
            throw e;
        }
    }

    /**
     * Inserts a record to the comp_categories table.
     *
     * @param compId Component ID.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     */
    private void insertCompCategory(long compId) throws SQLException, IDGenerationException {
        // Generate component category ID.
        long compCategoryId;
        try {
            compCategoryId = compCategoryIDGenerator.getNextID();
        } catch (IDGenerationException e) {
            LOG.error("Failed to generate component category ID.", e);
            throw e;
        }
        LOG.debug("Component category ID generated " + compCategoryId);

        // Insert record to comp_categories table.
        try {
            if (insertCompCategoryStmt == null) {
                insertCompCategoryStmt = conn.prepareStatement(
                    "INSERT INTO comp_categories (comp_categories_id,component_id,category_id)"
                    + "VALUES (?,?,9926575);");
            }
            int index = 1;
            insertCompCategoryStmt.setLong(index++, compCategoryId);
            insertCompCategoryStmt.setLong(index++, compId);
            insertCompCategoryStmt.executeUpdate();
        } catch (SQLException e) {
            LOG.error("Error inserting record to comp_categories table.", e);
            throw e;
        }
    }

    /**
     * Inserts a record to the project_platform table.
     *
     * @param projectId Project ID.
     * @param platformIds IDs of the platforms.
     * @param createUserId Create user ID.
     * @param modifyUserId Modify user ID.
     * @param createDate Create date.
     *
     * @throws SQLException If any error occurs in the database.
     *
     * @since 1.1
     */
    private void insertProjectPlatforms(long projectId, List<Long> platformIds,
            long createUserId, long modifyUserId, Timestamp createDate) throws SQLException {
        try {
            if (insertProjectPlatformStmt == null) {
                insertProjectPlatformStmt = conn.prepareStatement(
                    "INSERT INTO project_platform (project_id,create_user,"
                    + "modify_user,create_date,modify_date,project_platform_id)"
                    + "VALUES (?,?,?,?,?,?);");
            }
        } catch (SQLException e) {
            LOG.error("Error preparing statement for populating project_platform table.", e);
            throw e;
        }
        int index = 1;
        insertProjectPlatformStmt.setLong(index++, projectId);
        insertProjectPlatformStmt.setLong(index++, createUserId);
        insertProjectPlatformStmt.setLong(index++, modifyUserId);
        insertProjectPlatformStmt.setTimestamp(index++, createDate);
        insertProjectPlatformStmt.setTimestamp(index++, createDate);
        for (long platformId : platformIds) {
            try {
                insertProjectPlatformStmt.setLong(index, platformId);
                insertProjectPlatformStmt.executeUpdate();
            } catch (SQLException e) {
                LOG.error("Error inserting record to project_platform table.", e);
                throw e;
            }
        }
    }

    /**
     * Inserts a record to the comp_technology table.
     *
     * @param compVersionId Component version ID.
     * @param technologyTypeIds IDs of the technology types.
     *
     * @throws SQLException If any error occurs in the database.
     * @throws IDGenerationException If any error occurs with ID generation.
     */
    private void insertCompTechnologies(long compVersionId, List<Long> technologyTypeIds)
        throws SQLException, IDGenerationException {
        for (long technologyTypeId : technologyTypeIds) {
            // Generate component technology ID.
            long compTechId;
            try {
                compTechId = compTechnologyIDGenerator.getNextID();
            } catch (IDGenerationException e) {
                LOG.error("Failed to generate component technology ID.", e);
                throw e;
            }
            LOG.debug("Component technology ID generated " + compTechId);

            // Insert record to comp_technology table.
            try {
                if (insertCompTechnologyStmt == null) {
                    insertCompTechnologyStmt = conn.prepareStatement(
                        "INSERT INTO comp_technology (comp_tech_id,comp_vers_id,technology_type_id)"
                        + "VALUES (?,?,?);");
                }
                int index = 1;
                insertCompTechnologyStmt.setLong(index++, compTechId);
                insertCompTechnologyStmt.setLong(index++, compVersionId);
                insertCompTechnologyStmt.setLong(index++, technologyTypeId);
                insertCompTechnologyStmt.executeUpdate();
            } catch (SQLException e) {
                LOG.error("Error inserting record to comp_technology table.", e);
                throw e;
            }
        }
    }

    /**
     * Checks if project with given ID has been already migrated.
     *
     * @param projectId Project ID.
     * @return true if has been migrated or false otherwise.
     *
     * @throws SQLException If any error occurs in the database.
     */
    private boolean alreadyMigrated(String projectId) throws SQLException {
        ResultSet rs = null;
        try {
            if (alreadyMigratedStmt == null) {
                alreadyMigratedStmt = conn.prepareStatement(
                        "SELECT 1 FROM project p INNER JOIN project_info pi ON pi.project_id = p.project_id "
                        + "WHERE p.project_status_id != 3 AND pi.project_info_type_id = 64 AND pi.value = ?");
            }
            alreadyMigratedStmt.setString(1, projectId);
            rs = alreadyMigratedStmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            LOG.error("Error searching a project by challenge ID in DB.", e);
            throw e;
        } finally {
            close(rs);
        }
    }

    /**
     * Process the records from the input file.
     * It processes the records one by one.
     * @throws Exception If failed to commit transaction.
     */
    private void process() throws Exception {
        // Process input file line by line.
        System.out.println("Progress 0%");
        Iterator<Row> rowIterator = inputSheet.rowIterator();
        Row row = rowIterator.next(); // Skip the header row.
        int completedRecords = 0;
        while (rowIterator.hasNext()) {
            row = rowIterator.next();
            if (!emptyRows.contains(row.getRowNum() + 1)) {
                processInputRow(row);
                completedRecords++;
                if ((FULL_PERCENT * completedRecords / totalRecords)
                    > (FULL_PERCENT * (completedRecords - 1) / totalRecords)) {
                    System.out.println(String.format("Progress %d%%", FULL_PERCENT * completedRecords / totalRecords));
                }
                if (completedRecords % transactionItemCount == 0 || completedRecords == totalRecords) {
                    LOG.debug(String.format("Committing transaction after importing row number %d.",
                            row.getRowNum() + 1));
                    try {
                        conn.commit();
                    } catch (SQLException e) {
                        fail(String.format("Failed to commit transaction after importing row number %d.",
                                row.getRowNum() + 1), e);
                    }
                    totalSuccessDuringCurrentTransaction = 0;
                    totalWarningsDuringCurrentTransaction = 0;
                }
            }
        }

        // Print totals to report.
        StringBuilder sb = new StringBuilder();
        sb.append(totalSuccess + " record(s) imported without warnings.\n");
        sb.append(totalWarnings + " record(s) imported with warnings.\n");
        sb.append(totalErrors + " record(s) not imported due to errors.\n");
        LOG.info(sb);
        reportWriter.print(sb.toString());
        System.out.println("Operation completed.");
        System.out.print(sb.toString());
    }

    /**
     * Initializes the database.
     *
     * @throws Exception If any error occurs.
     */
    private void initializeDB() throws Exception {
        conn = getOpenConnection(TARGET_DB);
        try {
            conn.setAutoCommit(false);
        } catch (SQLException e) {
            fail("Failed to enable DB transaction.", e);
        }
        initializeIDGenerators();
        loadTechnologyTypes();
        loadProjectPlatforms();
    }

    /**
     * Initializes ID generators.
     *
     * @throws Exception If any error occurs.
     */
    private void initializeIDGenerators() throws Exception {
        try {
            compIDGenerator = IDGeneratorFactory.getIDGenerator("COMPONENT_SEQ");
            compVersionIDGenerator = IDGeneratorFactory.getIDGenerator("COMPVERSION_SEQ");
            compVersionDateIDGenerator = IDGeneratorFactory.getIDGenerator("COMPVERSIONDATES_SEQ");
            compCategoryIDGenerator = IDGeneratorFactory.getIDGenerator("COMPCATEGORY_SEQ");
            compTechnologyIDGenerator = IDGeneratorFactory.getIDGenerator("COMPTECH_SEQ");
            projectIDGenerator = IDGeneratorFactory.getIDGenerator("project_id_seq");
            projectSpecIDGenerator = IDGeneratorFactory.getIDGenerator("PROJECT_SPEC_ID_SEQ");
            projectPhaseIDGenerator = IDGeneratorFactory.getIDGenerator("project_phase_id_seq");
            resourceIDGenerator = IDGeneratorFactory.getIDGenerator("resource_id_seq");
            uploadIDGenerator = IDGeneratorFactory.getIDGenerator("upload_id_seq");
            submissionIDGenerator = IDGeneratorFactory.getIDGenerator("submission_id_seq");
            prizeIDGenerator = IDGeneratorFactory.getIDGenerator("prize_id_seq");
            reviewIDGenerator = IDGeneratorFactory.getIDGenerator("review_id_seq");
            reviewItemIDGenerator = IDGeneratorFactory.getIDGenerator("review_item_id_seq");
            reviewItemCommentIDGenerator = IDGeneratorFactory.getIDGenerator("review_item_comment_id_seq");
        } catch (IDGenerationException e) {
            fail("Failed to initialize DB generators", e);
        }
    }

    /**
     * Loads CS prizes from the corresponding file.
     *
     * @throws Exception If any error occurs with loading and parsing.
     *
     * @since 1.1
     */
    private void loadCSPrizes() throws Exception {
        CsvMapReader reader = null;
        FileReader fileReader = null;
        try {
            // Open file.
            try {
                fileReader = new FileReader(csPrizesFilename);
                reader = new CsvMapReader(fileReader, CsvPreference.EXCEL_PREFERENCE);
            } catch (IOException e) {
                fail("Failed to read CS prize file.", e);
            }

            // Reader header.
            String[] header = null;
            try {
                header = reader.getHeader(true);
            } catch (IOException e) {
                fail("Faile to reader header of the CS prize file.", e);
            }

            // Reader data.
            Map<String, String> line = null;
            while (true) {
                try {
                    line = reader.read(header);
                } catch (IOException e) {
                    fail(String.format("Failed to read line number %d of the CS prizes file.",
                            reader.getLineNumber()), e);
                }
                if (line == null) {
                    break;
                }
                // Get values.
                String challengeCode = line.get(CHALLENGE_CODE_CS_PRIZE_FILE_COLUMN_HEADER);
                String placeString = line.get(PLACE_CS_PRIZE_FILE_COLUMN_HEADER);
                String prizeString = line.get(VALUE_CS_PRIZE_FILE_COLUMN_HEADER);
                if (isStringNullEmpty(challengeCode) || isStringNullEmpty(placeString)
                        || isStringNullEmpty(prizeString)) {
                    fail(String.format("Required cell at line number %d in CS prizes file is empty.",
                            reader.getLineNumber()));
                } else {
                    int place = 0;
                    double prize = 0;
                    // Convert numeric values.
                    try {
                        place = Math.round(Float.valueOf(placeString));
                        prize = Double.valueOf(prizeString);
                    } catch (NumberFormatException e) {
                        fail(String.format("Numeric cell at line number %d in CS prizes file "
                                + "can't be parsed to a number.", reader.getLineNumber()), e);
                    }
                    // Save prizes.
                    if (!csPrizes.containsKey(challengeCode)) {
                        csPrizes.put(challengeCode, new HashMap<Integer, Double>());
                    }
                    csPrizes.get(challengeCode).put(place, prize);
                }
            }
        } finally {
            // Close readers.
            close("reader", reader);
            close("fileReader", fileReader);
        }
    }

    /**
     * Loads technology types from the database.
     *
     * @throws Exception If any error occurs.
     */
    private void loadTechnologyTypes() throws Exception {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement("SELECT technology_type_id, technology_name FROM technology_types");
            rs = stmt.executeQuery();
            while (rs.next()) {
                technologyTypeByName.put(rs.getString("technology_name").toLowerCase(),
                        rs.getLong("technology_type_id"));
            }
            LOG.debug(String.format("Loaded %d technology type(s) from DB.", technologyTypeByName.size()));
        } catch (SQLException e) {
            fail("Error loading technology types from DB.", e);
        } finally {
            close(stmt);
            close(rs);
        }
    }

    /**
     * Loads project platforms from the database.
     *
     * @throws Exception If any error occurs.
     *
     * @since 1.1
     */
    private void loadProjectPlatforms() throws Exception {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = conn.prepareStatement("SELECT project_platform_id, name FROM project_platform_lu");
            rs = stmt.executeQuery();
            while (rs.next()) {
                projectPlatformByName.put(rs.getString("name").toLowerCase(),
                        rs.getLong("project_platform_id"));
            }
            LOG.debug(String.format("Loaded %d project platform(s) from DB.", projectPlatformByName.size()));
        } catch (SQLException e) {
            fail("Error loading project platforms from DB.", e);
        } finally {
            close(stmt);
            close(rs);
        }
    }

    /**
     * Checks input file and analyzes it.
     * It populates various variables according to result of the analysis.
     * For example: {@link #emptyRows}, {@link #totalRecords}, {@link #columnIndexByName}.
     *
     * @throws Exception If any error occurs.
     */
    private void checkInputFile() throws Exception {
        // Load the workbook.
        Workbook workbook = null;
        try {
            inputOpcPackage = OPCPackage.open(inputFilename);
            if (inputOpcPackage == null) {
                fail("Failed to load input file.");
            }
            workbook = new XSSFWorkbook(inputOpcPackage);
        } catch (Exception e) {
            fail("Failed to parse input file.", e);
        }
        inputSheet = workbook.getSheetAt(0);
        totalRecords = 0;
        boolean firstRow = true;
        Iterator<Row> rowIterator = inputSheet.rowIterator();
        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();
            Iterator<Cell> cellIterator = row.cellIterator();
            boolean empty = true;
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                cell.setCellType(Cell.CELL_TYPE_STRING);
                String value = getStringCellValue(cell);
                if (!isStringNullEmpty(value)) {
                    empty = false;
                    if (firstRow) {
                        if (columnIndexByName.containsKey(value)) {
                            fail("Invalid input file header: duplicate column with name '" + value + "'.");
                        }
                        columnIndexByName.put(cell.getStringCellValue(), cell.getColumnIndex());
                    }
                }
            }
            if (firstRow) {
                if (empty) {
                    fail("Invalid input file: header is empty.");
                }
                for (String header : requiredColumnHeaders) {
                    if (!columnIndexByName.containsKey(header)) {
                        fail("Invalid input file: '" + header + "'column not found.");
                    }
                }
                firstRow = false;
            } else {
                if (empty) {
                    emptyRows.add(row.getRowNum() + 1);
                } else {
                    totalRecords++;
                }
            }
        }
        if (firstRow) {
            fail("Invalid input file: no header.");
        }
    }

    /**
     * Initializes the necessary writers.
     *
     * @throws Exception If any error occurs.
     */
    private void initializeWriters() throws Exception {
        new File(reportFilename).getParentFile().mkdirs();
        new File(errorsFilename).getParentFile().mkdirs();
        new File(warningsFilename).getParentFile().mkdirs();
        reportWriter = createWriter("Report", reportFilename);
        errorWriter = createWriter("Errors", errorsFilename);
        warningWriter = createWriter("Warnings", warningsFilename);
    }

    /**
     * Creates writer.
     *
     * @param name Writer name.
     * @param filename Filename.
     * @return Created writer.
     *
     * @throws Exception If any error occurs.
     */
    private PrintWriter createWriter(String name, String filename) throws Exception {
        OutputStream fileWriter = null;
        try {
            fileWriter = new FileOutputStream(filename, true);
        } catch (FileNotFoundException e) {
            fail(name + " file '" + filename + "' not found.", e);
        }
        return new PrintWriter(fileWriter, false);
    }

    /**
     * Prints import errors.
     *
     * @param rowIndex Index of a row (in the input file) on which the error occurred.
     */
    private void printImportErrors(int rowIndex) {
        String message = String.format("Error importing record from row %d: ", rowIndex)
                + errors.toString().substring(2);
        LOG.error(message);
        errorWriter.println(message);
        totalErrors++;
    }

    /**
     * Prints import warnings.
     *
     * @param rowIndex Index of a row (in the input file) on which the warning occurred.
     */
    private void printImportWarnings(int rowIndex) {
        String message = String.format("Record from row %d imported with warnings: ", rowIndex)
                + warnings.toString().substring(2);
        LOG.warn(message);
        warningWriter.println(message);
        totalWarnings++;
        totalWarningsDuringCurrentTransaction++;
    }

    /**
     * Terminates the loader with failure.
     *
     * @param message Error message.
     * @throws Exception Exception to throw.
     */
    private void fail(String message) throws Exception {
        fail(message, null);
    }

    /**
     * Terminates the loader with failure.
     *
     * @param message Error message.
     * @param e Occurred exception (or null if none).
     * @throws Exception Exception to throw.
     */
    private void fail(String message, Exception e) throws Exception {
        System.err.println(message + "\nSee log for error details.");
        if (e != null) {
            LOG.error(message, e);
        } else {
            LOG.error(message);
            e = new Exception(message);
        }
        setReasonFailed(message);
        rollback();
        releaseResources();
        throw e;
    }

    /**
     * Releases all resources.
     */
    private void releaseResources() {
        closeStatements();
        try {
            closeDBConnections();
        } catch (SQLException ex) {
            LOG.error("Error during closing DB connection.", ex);
        }
        close("inputOpcPackage", inputOpcPackage);
        closeWriters();
    }

    /**
     * Closes all the writers.
     */
    private void closeWriters() {
        close("reportWriter", reportWriter);
        close("warningWriter", warningWriter);
        close("errorWriter", errorWriter);
    }

    /**
     * Closes the prepared statements.
     */
    private void closeStatements() {
        close(alreadyMigratedStmt);
        close(insertCompCatalogStmt);
        close(insertCompVersionStmt);
        close(insertCompVersionDateStmt);
        close(insertCompCategoryStmt);
        close(insertCompTechnologyStmt);
    }

    /**
     * Closes the given resource.
     *
     * @param name Resource name.
     * @param resource Resource.
     */
    private void close(String name, Closeable resource) {
        if (resource != null) {
            try {
                resource.close();
            } catch (IOException e) {
                LOG.error("Error during closing '" + name + "'.", e);
            }
        }
    }

    /**
     * Rolls back the current database transaction.
     */
    private void rollback() {
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                LOG.error("Error during rolling back the changes.", ex);
            }
        }
        totalSuccess -= totalSuccessDuringCurrentTransaction;
        totalWarnings -= totalWarningsDuringCurrentTransaction;
        totalErrors += totalSuccessDuringCurrentTransaction + totalWarningsDuringCurrentTransaction;
        totalSuccessDuringCurrentTransaction = 0;
        totalWarningsDuringCurrentTransaction = 0;
    }

    /**
     * Gracefully extracts string value from the given input cell.
     *
     * @param cell Cell.
     * @return String value.
     */
    private String getStringCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        return cell.getStringCellValue();
    }

    /**
     * Checks if string is null or trimmed empty.
     *
     * @param s String.
     * @return true if null/empty or false otherwise.
     */
    private boolean isStringNullEmpty(String s) {
        return s == null || s.trim().length() == 0;
    }
}