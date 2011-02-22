/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.studio;

import com.topcoder.shared.util.dwload.TCLoad;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Stack;

/**
 * <p>An extension to <code>TCLoad</code> tool which migrates the data for <code>Studio</code> contests from
 * <code>studio_oltp</code> database to <code>tcs_catalog</code> database.</p>
 * 
 * <p><b>Thread safety:</b> This class is NOT thread-safe and it is not intended to be called by multiple threads.</p>
 * 
 * @author isv
 * @version 1.0 (Re-platforming Data Migration Release 1 assembly)
 */
public class StudioContestMigrationTool extends TCLoad {
    
    /**
     * <p>A <code>LOGGER</code> to be used for logging the events encountered while doing data migration.</p>
     */
    private static final Logger LOGGER = Logger.getLogger(StudioContestMigrationTool.class);

    /**
     * <p>A <code>DateFormat</code> to be used for parsing the dates from the textual values.</p>
     */
    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("MM/dd/yyyy");

    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the start date for
     * period to select the contests for migration.</p>
     */
    private static final String START_DATE_PARAM_NAME = "start_date";

    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the end date for
     * period to select the contests for migration.</p>
     */
    private static final String END_DATE_PARAM_NAME = "end_date";

    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the list of IDs of
     * contests for migration.</p>
     */
    private static final String CONTEST_IDS_PARAM_NAME = "contest_ids";

    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of screening
     * scorecard.</p>
     */
    private static final String SCREENING_SCORECARD_ID_PARAM_NAME = "screening_scorecard_id";

    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of review
     * scorecard.</p>
     */
    private static final String REVIEW_SCORECARD_ID_PARAM_NAME = "review_scorecard_id";
    
    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of milestone
     * screening scorecard.</p>
     */
    private static final String MILESTONE_SCREENING_SCORECARD_ID_PARAM_NAME = "milestone_screening_scorecard_id";

    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of milestone
     * review scorecard.</p>
     */
    private static final String MILESTONE_REVIEW_SCORECARD_ID_PARAM_NAME = "milestone_review_scorecard_id";

    /**
     * <p>A <code>long</code> referencing the <code>Scheduled</code> phase status.</p>
     */
    private static final long SCHEDULED = 1;

    /**
     * <p>A <code>long</code> referencing the <code>Closed</code> phase status.</p>
     */
    private static final long CLOSED = 3;

    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.comp_catalog</code> table.</p>
     */
    private static final String INSERT_COMPONENT_SQL 
        = "INSERT INTO comp_catalog (component_id, current_version, short_desc, " +
                                  "component_name, description, function_desc, status_id, root_category_id, " +
                                  "public_ind, create_time, modify_date) " +
                                  "VALUES (?, 1, ?, ?, ?, NULL, 102, 27202915, 0, ?, ?)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.comp_versions</code> table.</p>
     */
    private static final String INSERT_COMPONENT_VERSION_SQL 
        = "INSERT INTO comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, " +
          "phase_time, price, comments, modify_date, suspended_ind, browse, location, issue_tracker_path, " +
          "revision) VALUES (?, ?, 1, '1.0', ?, 112, ?, 0, NULL, ?, 0, NULL, NULL, NULL, NULL)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.comp_categories</code> table.</p>
     */
    private static final String INSERT_COMPONENT_CATEGORIES_SQL 
        = "INSERT INTO comp_categories (comp_categories_id, component_id, category_id) VALUES (?, ?, 27202915)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.project</code> table.</p>
     */
    private static final String INSERT_PROJECT_SQL = "INSERT INTO project (project_id, project_status_id, " +
                                "project_category_id, project_studio_spec_id, tc_direct_project_id, " +
                                "create_user, create_date, modify_user, modify_date) " +
                                "VALUES (?, ?, ?, NULL, ?, ?, ?, ?, ?)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.project_info</code> table.</p>
     */
    private static final String INSERT_PROJECT_INFO_SQL 
        = "INSERT INTO project_info (project_id, project_info_type_id, value, " +
                                     "create_user, create_date, modify_user, modify_date) " +
                                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.project_phase</code> table.</p>
     */
    private static final String INSERT_PHASE_SQL 
        = "INSERT INTO project_phase (project_phase_id, project_id, phase_type_id, " +
                              "phase_status_id, fixed_start_time, scheduled_start_time, scheduled_end_time, " +
                              "actual_start_time, actual_end_time, duration, " +
                              "create_user, create_date, modify_user, modify_date) " +
                              "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.phase_criteria</code> table.</p>
     */
    private static final String INSERT_PHASE_CRITERIA_SQL 
        = "INSERT INTO phase_criteria (project_phase_id, phase_criteria_type_id, " +
                                       "parameter, create_user, create_date, modify_user, modify_date) " +
                                       "VALUES (?, ?, ?, ?, ?, ?, ?)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.phase_dependency</code> table.</p>
     */
    private static final String INSERT_PHASE_DEPENDENCY_SQL 
        = "INSERT INTO phase_dependency (dependency_phase_id, dependent_phase_id, " +
                                       "dependency_start, dependent_start, lag_time, " +
                                       "create_user, create_date, modify_user, modify_date) " +
                                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
    /**
     * <p>A <code>Map</code> mapping the IDs for contest statuses from <code>Studio</code> database to <code>Online
     * Review</code> database.</p>
     */
    private static final Map<Long, Long> STATUS_MAPPING = new HashMap<Long, Long>();

    /**
     * <p>A <code>Map</code> mapping the IDs for project types/categories from <code>Studio</code> database to
     * <code>Online Review</code> database.</p>
     */
    private static final Map<Long, Long> PROJECT_CATEGORY_MAPPING = new HashMap<Long, Long>();

    /**
     * <p>Initializes the mappings.</p>
     */
    static {
        STATUS_MAPPING.put(1L, 2L);  // Draft
        STATUS_MAPPING.put(2L, 1L);  // Active
        STATUS_MAPPING.put(3L, 3L);  // Deleted
        STATUS_MAPPING.put(4L, 6L);  // No submissions
        STATUS_MAPPING.put(10L, 4L); // No winners
        STATUS_MAPPING.put(11L, 9L); // Abandoned
        
        PROJECT_CATEGORY_MAPPING.put(1L , 17L); // Web Page Design
        PROJECT_CATEGORY_MAPPING.put(2L , 18L); // Prototype 
        PROJECT_CATEGORY_MAPPING.put(3L , 20L); // Logo Design 
        PROJECT_CATEGORY_MAPPING.put(4L , 16L); // Web Elements 
        PROJECT_CATEGORY_MAPPING.put(5L , 32L); // Application Front-End Design 
        PROJECT_CATEGORY_MAPPING.put(6L , 30L); // Mobile Screen
        PROJECT_CATEGORY_MAPPING.put(7L , 34L); // Email Newsletter
        PROJECT_CATEGORY_MAPPING.put(8L , 31L); // FLASH
        PROJECT_CATEGORY_MAPPING.put(9L , 30L); // Widget
        PROJECT_CATEGORY_MAPPING.put(10L , 32L); // Javascript
        PROJECT_CATEGORY_MAPPING.put(11L , 21L); // Print-Branding
        PROJECT_CATEGORY_MAPPING.put(12L , 21L); // Print-Design
        PROJECT_CATEGORY_MAPPING.put(13L , 21L); // Print-Marketing
        PROJECT_CATEGORY_MAPPING.put(14L , 16L); // Icon
        PROJECT_CATEGORY_MAPPING.put(15L , 34L); // Apparel
        PROJECT_CATEGORY_MAPPING.put(16L , 34L); // Sound
        PROJECT_CATEGORY_MAPPING.put(17L , 21L); // Presentation
        PROJECT_CATEGORY_MAPPING.put(18L , 34L); // Other
        PROJECT_CATEGORY_MAPPING.put(19L , 34L); // CSS Re-Skin
        PROJECT_CATEGORY_MAPPING.put(20L , 34L); // XSL-FO Document Conversion
        PROJECT_CATEGORY_MAPPING.put(21L , 34L); // PowerPoint Presentation
        PROJECT_CATEGORY_MAPPING.put(22L , 32L); // Flex
        PROJECT_CATEGORY_MAPPING.put(23L , 34L); // Active Site Code Implementation
        PROJECT_CATEGORY_MAPPING.put(24L , 34L); // Bug Race
        PROJECT_CATEGORY_MAPPING.put(25L , 18L); // Wireframes
        PROJECT_CATEGORY_MAPPING.put(26L , 22L); // Idea Generation 
    }
    
    /**
     * <p>A <code>Date</code> providing the lower boundary in contest start time range for selecting the contests for
     * migration.</p>
     */
    private Date startDate;

    /**
     * <p>A <code>Date</code> providing the upper boundary in contest start time range for selecting the contests for
     * migration.</p>
     */
    private Date endDate;

    /**
     * <p>A <code>long[]</code> providing the IDs of contests to be migrated.</p>
     */
    private long[] contestIds;

    /**
     * <p>A <code>Stack</code> collecting the details (name, timestamp) for activities occurring while doing contest
     * migration. Such activities are used just for logging purposes.</p>
     */
    private Stack<Object[]> activities;

    /**
     * <p>A <code>IdGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.project</code> table.</p>
     */
    private IDGenerator projectIdGenerator;

    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.comp_catalog</code> table.</p>
     */
    private IDGenerator componentIdGenerator;

    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.comp_versions</code> table.</p>
     */
    private IDGenerator componentVersionIdGenerator;

    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.comp_categories</code> table.</p>
     */
    private IDGenerator componentCategoriesIdGenerator;

    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.project_phase</code> table.</p>
     */
    private IDGenerator phaseIdGenerator;

    /**
     * <p>A <code>long</code> providing the ID of a screening scorecard.</p>
     */
    private long screeningScorecardId;

    /**
     * <p>A <code>long</code> providing the ID of review scorecard.</p>
     */
    private long reviewScorecardId;

    /**
     * <p>A <code>long</code> providing the ID of milestone screening scorecard.</p>
     */
    private long milestoneScreeningScorecardId;

    /**
     * <p>A <code>long</code> providing the ID of milestone review scorecard.</p>
     */
    private long milestoneReviewScorecardId;

    /**
     * <p>Constructs new <code>StudioContestMigrationTool</code> instance. This implementation does nothing.</p>
     */
    public StudioContestMigrationTool() {
        this.activities = new Stack<Object[]>();
    }

    /**
     * <p>Gets the upper boundary in contest start time range for selecting the contests for migration.</p>
     *
     * @return a <code>Date</code> providing the upper boundary in contest start time range for selecting the contests
     *         for migration.
     */
    public Date getEndDate() {
        return this.endDate;
    }

    /**
     * <p>Sets the upper boundary in contest start time range for selecting the contests for migration.</p>
     *
     * @param endDate a <code>Date</code> providing the upper boundary in contest start time range for selecting the
     *                contests for migration.
     * @throws IllegalArgumentException if specified end date is not <code>null</code> and start date is also not 
     *         <code>null</code> and specified end date is not after start date.  
     */
    public void setEndDate(Date endDate) {
        if ((endDate != null) && (getStartDate() != null)) {
            if (endDate.before(getStartDate())) {
                throw new IllegalArgumentException("End date " + endDate +  " is before start date " + getStartDate());
            }
        }
        this.endDate = endDate;
    }

    /**
     * <p>Gets the lower boundary in contest start time range for selecting the contests for migration.</p>
     *
     * @return a <code>Date</code> providing the lower boundary in contest start time range for selecting the contests
     *         for migration.
     */
    public Date getStartDate() {
        return this.startDate;
    }

    /**
     * <p>Sets the lower boundary in contest start time range for selecting the contests for migration.</p>
     *
     * @param startDate a <code>Date</code> providing the lower boundary in contest start time range for selecting the
     *                  contests for migration.
     * @throws IllegalArgumentException if specified start date is not <code>null</code> and end date is also not 
     *         <code>null</code> and specified start date is not before end date.  
     */
    public void setStartDate(Date startDate) {
        if ((startDate != null) && (getEndDate() != null)) {
            if (startDate.after(getEndDate())) {
                throw new IllegalArgumentException("Start date " + startDate +  " is after end date " + getEndDate());
            }
        }
        this.startDate = startDate;
    }

    /**
     * <p>Gets the IDs of contests to be migrated.</p>
     *
     * @return a <code>long[]</code> providing the IDs of contests to be migrated.
     */
    public long[] getContestIds() {
        return this.contestIds;
    }

    /**
     * <p>Sets the IDs of contests to be migrated.</p>
     *
     * @param contestIds a <code>long[]</code> providing the IDs of contests to be migrated.
     * @throws IllegalArgumentException if specified array is not <code>null</code> but is empty.
     */
    public void setContestIds(long[] contestIds) {
        if ((contestIds != null) && (contestIds.length == 0)) {
            throw new IllegalArgumentException("The list of contest IDs is empty");
        }
        this.contestIds = contestIds;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.project</code> table.</p>
     *
     * @return a <code>IdGenerator</code> providing the generator for IDs for records inserted into
     *         <code>tcs_catalog.project</code> table.
     */
    public IDGenerator getProjectIdGenerator() {
        return this.projectIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.project</code> table.</p>
     *
     * @param projectIdGenerator a <code>IdGenerator</code> providing the generator for IDs for records inserted into
     *                           <code>tcs_catalog.project</code> table.
     */
    public void setProjectIdGenerator(IDGenerator projectIdGenerator) {
        this.projectIdGenerator = projectIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.comp_catalog</code> table.</p>
     *
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *         <code>tcs_catalog.comp_catalog</code> table.
     */
    public IDGenerator getComponentIdGenerator() {
        return this.componentIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.comp_catalog</code> table.</p>
     *
     * @param componentIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *                             <code>tcs_catalog.comp_catalog</code> table.
     */
    public void setComponentIdGenerator(IDGenerator componentIdGenerator) {
        this.componentIdGenerator = componentIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.comp_versions</code> table.</p>
     *
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *         <code>tcs_catalog.comp_versions</code> table.
     */
    public IDGenerator getComponentVersionIdGenerator() {
        return this.componentVersionIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.comp_versions</code> table.</p>
     *
     * @param componentVersionIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records
     *                                    inserted into <code>tcs_catalog.comp_versions</code> table.
     */
    public void setComponentVersionIdGenerator(IDGenerator componentVersionIdGenerator) {
        this.componentVersionIdGenerator = componentVersionIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.comp_categories</code> table.</p>
     *
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *         <code>tcs_catalog.comp_categories</code> table.
     */
    public IDGenerator getComponentCategoriesIdGenerator() {
        return this.componentCategoriesIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.comp_categories</code> table.</p>
     *
     * @param componentCategoriesIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records
     *                                       inserted into <code>tcs_catalog.comp_categories</code> table.
     */
    public void setComponentCategoriesIdGenerator(IDGenerator componentCategoriesIdGenerator) {
        this.componentCategoriesIdGenerator = componentCategoriesIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.project_phase</code> table.</p>
     *
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *         <code>tcs_catalog.project_phase</code> table.
     */
    public IDGenerator getPhaseIdGenerator() {
        return this.phaseIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.project_phase</code> table.</p>
     *
     * @param phaseIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *                         <code>tcs_catalog.project_phase</code> table.
     */
    public void setPhaseIdGenerator(IDGenerator phaseIdGenerator) {
        this.phaseIdGenerator = phaseIdGenerator;
    }

    /**
     * <p>Gets the ID of a screening scorecard.</p>
     *
     * @return a <code>long</code> providing the ID of a screening scorecard.
     */
    public long getScreeningScorecardId() {
        return this.screeningScorecardId;
    }

    /**
     * <p>Sets the ID of a screening scorecard.</p>
     *
     * @param screeningScorecardId a <code>long</code> providing the ID of a screening scorecard.
     */
    public void setScreeningScorecardId(long screeningScorecardId) {
        this.screeningScorecardId = screeningScorecardId;
    }

    /**
     * <p>Gets the ID of review scorecard.</p>
     *
     * @return a <code>long</code> providing the ID of review scorecard.
     */
    public long getReviewScorecardId() {
        return this.reviewScorecardId;
    }

    /**
     * <p>Sets the ID of review scorecard.</p>
     *
     * @param reviewScorecardId a <code>long</code> providing the ID of review scorecard.
     */
    public void setReviewScorecardId(long reviewScorecardId) {
        this.reviewScorecardId = reviewScorecardId;
    }

    /**
     * <p>Gets the ID of milestone screening scorecard.</p>
     *
     * @return a <code>long</code> providing the ID of milestone screening scorecard.
     */
    public long getMilestoneScreeningScorecardId() {
        return this.milestoneScreeningScorecardId;
    }

    /**
     * <p>Sets the ID of milestone screening scorecard.</p>
     *
     * @param milestoneScreeningScorecardId a <code>long</code> providing the ID of milestone screening scorecard.
     */
    public void setMilestoneScreeningScorecardId(long milestoneScreeningScorecardId) {
        this.milestoneScreeningScorecardId = milestoneScreeningScorecardId;
    }

    /**
     * <p>Gets the ID of milestone review scorecard.</p>
     *
     * @return a <code>long</code> providing the ID of milestone review scorecard.
     */
    public long getMilestoneReviewScorecardId() {
        return this.milestoneReviewScorecardId;
    }

    /**
     * <p>Sets the ID of milestone review scorecard.</p>
     *
     * @param milestoneReviewScorecardId a <code>long</code> providing the ID of milestone review scorecard.
     */
    public void setMilestoneReviewScorecardId(long milestoneReviewScorecardId) {
        this.milestoneReviewScorecardId = milestoneReviewScorecardId;
    }
    
    /**
     * <p>Initializes this loader based on configuration parameters provided by the user.</p>
     * 
     * @param params a <code>Hashtable</code> mapping parameter names to parameter values. 
     * @return <code>true</code> always.
     */
    public boolean setParameters(Hashtable params) {
        startActivityRecording("setParameters");
        try {
            setStartDate(parseDateParameter(params, START_DATE_PARAM_NAME, 0, 0, 0, 0));
            setEndDate(parseDateParameter(params, END_DATE_PARAM_NAME, 23, 59, 59, 999));
            setContestIds(parseContestIds(params));
            setScreeningScorecardId(parseLongParameter(params, SCREENING_SCORECARD_ID_PARAM_NAME));
            setReviewScorecardId(parseLongParameter(params, REVIEW_SCORECARD_ID_PARAM_NAME));
            setMilestoneScreeningScorecardId(parseLongParameter(params, MILESTONE_SCREENING_SCORECARD_ID_PARAM_NAME));
            setMilestoneReviewScorecardId(parseLongParameter(params, MILESTONE_REVIEW_SCORECARD_ID_PARAM_NAME));
            setProjectIdGenerator(IDGeneratorFactory.getIDGenerator("project_id_seq"));
            setPhaseIdGenerator(IDGeneratorFactory.getIDGenerator("project_phase_id_seq"));
            setComponentIdGenerator(IDGeneratorFactory.getIDGenerator("COMPONENT_SEQ"));
            setComponentVersionIdGenerator(IDGeneratorFactory.getIDGenerator("COMPVERSION_SEQ"));
            setComponentCategoriesIdGenerator(IDGeneratorFactory.getIDGenerator("COMPCATEGORY_SEQ"));
            return true;
        } catch(IllegalArgumentException e) {
            logError(e);
            setReasonFailed(e.getMessage());
            return false;
        } catch (IDGenerationException e) {
            logError(e);
            setReasonFailed(e.getMessage());
            return false;
        } finally {
            stopActivityRecording();
        }
    }

    /**
     * <p>Performs the migration of data for <code>Studio</code> contests from <code>studio_oltp</code> to
     * <code>tcs_catalog</code> database.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    public void performLoad() throws Exception {
        startActivityRecording("performLoad");
        try {
            // Disable auto-commit for target connection to manage transactions explicitly
            Connection targetConnection = getOpenConnection(TARGET_DB);
            targetConnection.setAutoCommit(false);
            targetConnection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            
            // Do the migration
            doLoadStudioContests();
        } catch (Exception ex) {
            setReasonFailed(ex.getMessage());
            logError(ex);
            throw ex;
        } finally {
            stopActivityRecording();
        }
    }

    /**
     * <p>Gets the date parsed from the value of specified configuration parameter. Additionally the hours, minutes,
     * seconds and milliseconds of the date are set to specified values.</p>
     * 
     * @param parameters a <code>Hashtable</code> mapping parameter names to parameter values. 
     * @param paramName a <code>String</code> providing the name of the parameter to parse date value from.
     * @param hours an <code>int</code> providing the value for hours to be set for parsed date.
     * @param minutes an <code>int</code> providing the value for minutes to be set for parsed date.
     * @param seconds an <code>int</code> providing the value for seconds to be set for parsed date.
     * @param milliseconds an <code>int</code> providing the value for milliseconds to be set for parsed date.
     * @return a <code>Date</code> providing parsed from the specified parameter or <code>null</code> if there is no
     *         such parameter provided or if it is empty.
     * @throws IllegalArgumentException if textual value of specified parameter does not provide valid date.
     */
    private Date parseDateParameter(Hashtable parameters, String paramName, int hours, int minutes, int seconds,
                                    int milliseconds) {
        if (parameters.containsKey(paramName)) {
            String paramValue = String.valueOf(parameters.get(paramName));
            if (paramValue.trim().length() > 0) {
                try {
                    Date date = DATE_FORMAT.parse(paramValue);
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(date);
                    calendar.set(Calendar.HOUR, hours);
                    calendar.set(Calendar.MINUTE, minutes);
                    calendar.set(Calendar.SECOND, seconds);
                    calendar.set(Calendar.MILLISECOND, milliseconds);
                    return calendar.getTime();
                } catch (ParseException e) {
                    throw new IllegalArgumentException("Invalid date: " + paramValue + ". Expected format: MM/dd/yyyy");
                }
            }
        }
        return null;
    }

    /**
     * <p>Gets the numeric value parsed from the value of specified configuration parameter.</p>
     * 
     * @param parameters a <code>Hashtable</code> mapping parameter names to parameter values. 
     * @param paramName a <code>String</code> providing the name of the parameter to parse numeric value from.
     * @return a <code>long</code> providing the value of specified parameter.
     * @throws IllegalArgumentException if textual value of specified parameter does not provide valid numeric value or
     *         specified parameter is missing.
     */
    private long parseLongParameter(Hashtable parameters, String paramName) {
        if (parameters.containsKey(paramName)) {
            String paramValue = String.valueOf(parameters.get(paramName));
            try {
                return Long.parseLong(paramValue);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid numeric value: " + paramValue);
            }
        } else {
            throw new IllegalArgumentException("Parameter " + paramName + " is missing");
        }
    }

    /**
     * <p>Gets the list of IDs of contests to be migrated as provided by the {@link #CONTEST_IDS_PARAM_NAME}
     * configuration parameter. </p>
     *  
     * @param parameters a <code>Hashtable</code> mapping parameter names to parameter values. 
     * @return a <code>long</code> array providing the IDs of contests parsed from specified parameter or
     *         <code>null</code> if such a parameter is not provided or if it is empty.
     * @throws IllegalArgumentException if specified parameter does not provide valid numerical contest IDs.
     */
    private long[] parseContestIds(Hashtable parameters) {
        if (parameters.containsKey(CONTEST_IDS_PARAM_NAME)) {
            String paramValue = String.valueOf(parameters.get(CONTEST_IDS_PARAM_NAME)).trim();
            if (paramValue.length() > 0) {
                String[] paramValues = paramValue.split(",");
                if (paramValues.length > 0) {
                    long[] parsedContestIds = new long[paramValues.length];
                    for (int i = 0; i < paramValues.length; i++) {
                        String value = paramValues[i];
                        try {
                            parsedContestIds[i] = Long.parseLong(value);
                        } catch (NumberFormatException e) {
                            throw new IllegalArgumentException("Invalid contest ID: " + value);
                        }
                    }
                    return parsedContestIds;
                }
            }
        }
        return null;
    }

    /**
     * <p>Logs the specified error which has been encountered while performing the current activity.</p>
     * 
     * @param e a <code>Throwable</code> providing the details for the error to be logged. 
     */
    private void logError(Throwable e) {
        Object[] currentActivityData = this.activities.peek();
        String activity = (String) currentActivityData[0];
        LOGGER.error(activity + ": Failed due to " + e.getMessage(), e);
    }

    /**
     * <p>Records the current timestamp for starting the specified activity while migrating the data.</p>
     * 
     * @param activity a <code>String</code> providing the text for activity description and identification.
     */
    private void startActivityRecording(String activity) {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug(activity + ": Starting...");
        }
        long currentTimeStamp = System.currentTimeMillis();
        this.activities.push(new Object[] {activity, currentTimeStamp});
    }
    
    /**
     * <p>Records the current timestamp for finishing the current activity while migrating the data and logs the details
     * on the overall time taken for performing the activity.</p>
     */
    private void stopActivityRecording() {
        long currentTimeStamp = System.currentTimeMillis();
        Object[] currentActivityData = this.activities.pop();
        String activity = (String) currentActivityData[0];
        long activityStartTimestamp = (Long) currentActivityData[1];
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug(activity + ": Finished in " + (currentTimeStamp - activityStartTimestamp) + "ms");
        }
    }

    /**
     * <p>Migrates the data for studio contests matching the criteria (if any) set by the configuration from
     * <code>studio_oltp</code> database to <code>tcs_catalog</code> database.</p>
     * 
     * @throws SQLException if an unrecoverable SQL error occurs while performing the migration.
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     */
    private void doLoadStudioContests() throws SQLException, IDGenerationException {
        startActivityRecording("doLoadStudioContests");
        
        PreparedStatement selectContestsStmt = null;
        PreparedStatement insertComponentStmt = null;
        PreparedStatement insertComponentVersionStmt = null;
        PreparedStatement insertComponentCategoriesStmt = null;
        PreparedStatement insertProjectStmt = null;
        PreparedStatement insertProjectInfoStmt = null;
        PreparedStatement insertPhaseStmt = null;
        PreparedStatement insertPhaseCriteriaStmt = null;
        PreparedStatement insertPhaseDependencyStmt = null;
        ResultSet selectedContestsResult = null;
        int insertCount;
        
        try {
            // Prepare statements for querying contests for migration and inserting records into target database
            insertComponentStmt = prepareStatement(INSERT_COMPONENT_SQL, TARGET_DB);
            insertComponentVersionStmt = prepareStatement(INSERT_COMPONENT_VERSION_SQL, TARGET_DB);
            insertComponentCategoriesStmt = prepareStatement(INSERT_COMPONENT_CATEGORIES_SQL, TARGET_DB);
            insertProjectStmt = prepareStatement(INSERT_PROJECT_SQL, TARGET_DB);
            insertProjectInfoStmt = prepareStatement(INSERT_PROJECT_INFO_SQL, TARGET_DB);
            insertPhaseStmt = prepareStatement(INSERT_PHASE_SQL, TARGET_DB);
            insertPhaseCriteriaStmt = prepareStatement(INSERT_PHASE_CRITERIA_SQL, TARGET_DB);
            insertPhaseDependencyStmt = prepareStatement(INSERT_PHASE_DEPENDENCY_SQL, TARGET_DB);
            selectContestsStmt = getSelectContestsStatement();
            
            // Get the contests for migration and migrate each contest in a single separate transaction
            selectedContestsResult = selectContestsStmt.executeQuery();

            while (selectedContestsResult.next()) {
                Long contestStatusId = getLong(selectedContestsResult, "contest_status_id");
                Long contestTypeId = getLong(selectedContestsResult, "contest_type_id");
                long contestId = selectedContestsResult.getLong("contest_id");

                if (STATUS_MAPPING.containsKey(contestStatusId)) {
                    if (PROJECT_CATEGORY_MAPPING.containsKey(contestTypeId)) {
                        try {
                            startActivityRecording("Data migration for Studio contest " + contestId 
                                                   + " to Online Review project ");

                            Long contestCreateUserId = getLong(selectedContestsResult, "create_user_id");
                            Long tcDirectProjectId = getLong(selectedContestsResult, "tc_direct_project_id");
                            Long contestForumId = getLong(selectedContestsResult, "forum_id");
                            Timestamp contestStartTime = selectedContestsResult.getTimestamp("start_time");
                            Timestamp contestEndTime = selectedContestsResult.getTimestamp("end_time");
                            Timestamp contestWinnerAnnouncementTime 
                                = selectedContestsResult.getTimestamp("winner_announcement_time");
                            if (contestWinnerAnnouncementTime == null) {
                                contestWinnerAnnouncementTime 
                                    = new Timestamp(contestEndTime.getTime() + 5 * 24 * 60 * 60 * 1000);
                            }
                            Timestamp contestMilestoneTime 
                                = selectedContestsResult.getTimestamp("milestone_date");
                            String contestName = selectedContestsResult.getString("name");
                            String adminFee = selectedContestsResult.getString("admin_fee");
                            String billingProjectId = selectedContestsResult.getString("billing_project_id");
                            String contestDescription = selectedContestsResult.getString("description");
                            boolean isMultiRoundContest = selectedContestsResult.getBoolean("is_multi_round");
                            long contestDuration = contestEndTime.getTime() - contestStartTime.getTime();
                            
                            // Insert into tcs_catalog.comp_catalog
                            long newComponentId = getComponentIdGenerator().getNextID();
                            insertComponentStmt.clearParameters();
                            insertComponentStmt.setLong(1, newComponentId);
                            insertComponentStmt.setString(2, contestName);
                            insertComponentStmt.setString(3, contestName);
                            insertComponentStmt.setString(4, contestDescription);
                            insertComponentStmt.setTimestamp(5, contestStartTime);
                            insertComponentStmt.setTimestamp(6, contestStartTime);
                            insertCount = insertComponentStmt.executeUpdate();
                            if (insertCount != 1) {
                                throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                                          "comp_catalog table: " + insertCount);
                            }
                            
                            // Insert into tcs_catalog.comp_versions
                            long newComponentVersionId = getComponentVersionIdGenerator().getNextID();
                            insertComponentVersionStmt.clearParameters();
                            insertComponentVersionStmt.setLong(1, newComponentVersionId);
                            insertComponentVersionStmt.setLong(2, newComponentId);
                            insertComponentVersionStmt.setTimestamp(3, contestStartTime);
                            insertComponentVersionStmt.setTimestamp(4, contestStartTime);
                            insertComponentVersionStmt.setTimestamp(5, contestStartTime);
                            insertCount = insertComponentVersionStmt.executeUpdate();
                            if (insertCount != 1) {
                                throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                                          "comp_versions table: " + insertCount);
                            }

                            // Insert into tcs_catalog.comp_categories
                            long newComponentCategoriesId = getComponentCategoriesIdGenerator().getNextID();
                            insertComponentCategoriesStmt.clearParameters();
                            insertComponentCategoriesStmt.setLong(1, newComponentCategoriesId);
                            insertComponentCategoriesStmt.setLong(2, newComponentId);
                            insertCount = insertComponentCategoriesStmt.executeUpdate();
                            if (insertCount != 1) {
                                throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                                          "comp_categories table: " + insertCount);
                            }
                            
                            // Insert into tcs_catalog.project
                            long newProjectId = getProjectIdGenerator().getNextID();
                            insertProjectStmt.clearParameters();
                            insertProjectStmt.setLong(1, newProjectId);
                            if ((contestStatusId == 2) && (contestWinnerAnnouncementTime.before(new Date()))) {
                                insertProjectStmt.setLong(2, 7);
                            } else {
                                insertProjectStmt.setLong(2, STATUS_MAPPING.get(contestStatusId));
                            }
                            insertProjectStmt.setLong(3, PROJECT_CATEGORY_MAPPING.get(contestTypeId));
                            if (tcDirectProjectId == null) {
                                insertProjectStmt.setNull(4, Types.DECIMAL);
                            } else {
                                insertProjectStmt.setLong(4, tcDirectProjectId);
                            }
                            insertProjectStmt.setLong(5, contestCreateUserId);
                            insertProjectStmt.setTimestamp(6, contestStartTime);
                            insertProjectStmt.setLong(7, contestCreateUserId);
                            insertProjectStmt.setTimestamp(8, contestStartTime);
                            insertCount = insertProjectStmt.executeUpdate();
                            if (insertCount != 1) {
                                throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                                          "project table: " + insertCount);
                            }
                            
                            // Insert into tcs_catalog.project_info
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 1, 
                                                    String.valueOf(newComponentVersionId), 
                                                    contestCreateUserId, contestStartTime); // External Reference ID
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 2, 
                                                    String.valueOf(newComponentId), 
                                                    contestCreateUserId, contestStartTime); // Component ID
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 3, "1", 
                                                    contestCreateUserId, contestStartTime); // Version ID
                            if (contestForumId != null) {
                                insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 4, 
                                                        String.valueOf(contestForumId), 
                                                        contestCreateUserId, contestStartTime); // Forum ID
                            }
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 5, "27202915", 
                                                    contestCreateUserId, contestStartTime); // Root Catalog ID
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 6, contestName, 
                                                    contestCreateUserId, contestStartTime); // Project name
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 7, "1.0", 
                                                    contestCreateUserId, contestStartTime); // Project version
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 8, "", 
                                                    contestCreateUserId, contestStartTime); // SVN Module
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 9, "On", 
                                                    contestCreateUserId, contestStartTime); // Auto-pilot option
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 10, "On", 
                                                    contestCreateUserId, contestStartTime); // Status notification
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 11, "On", 
                                                    contestCreateUserId, contestStartTime); // Timeline notification
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 12, "Yes", 
                                                    contestCreateUserId, contestStartTime); // Public
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 13, "No", 
                                                    contestCreateUserId, contestStartTime); // Rated
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 14, "Open", 
                                                    contestCreateUserId, contestStartTime); // Eligibility
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 17, "", 
                                                    contestCreateUserId, contestStartTime); // Notes
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 26, "Yes", 
                                                    contestCreateUserId, contestStartTime); // Digital Run flag
                            if (adminFee != null) {
                                insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 31, adminFee, 
                                                        contestCreateUserId, contestStartTime); // Admin Fee
                            }
                            if (billingProjectId != null) {
                                insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 32, billingProjectId, 
                                                        contestCreateUserId, contestStartTime); // Billing Project
                            }
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 41, "No", 
                                                    contestCreateUserId, contestStartTime); // Approval Required
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 43, "Yes", 
                                                    contestCreateUserId, contestStartTime); // Send Winner Emails
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 44, "No", 
                                                    contestCreateUserId, contestStartTime); // Post-Mortem Required
                            
                            // Insert into tcs_catalog.project_phase
                            // Registration phase
                            long registrationPhaseStatusId 
                                = selectedContestsResult.getLong("registration_phase_status");
                            long registrationPhaseId 
                                = insertProjectPhase(insertPhaseStmt, newProjectId, 1, registrationPhaseStatusId, 
                                                     contestStartTime, contestStartTime, contestEndTime, 
                                                     registrationPhaseStatusId != SCHEDULED ? contestStartTime : null, 
                                                     registrationPhaseStatusId == CLOSED ? contestEndTime : null,
                                                     contestDuration, contestCreateUserId, contestStartTime);
                            insertPhaseCriteria(insertPhaseCriteriaStmt, registrationPhaseId, 2, "0", 
                                                contestCreateUserId, contestStartTime);

                            // Submission phase
                            long submissionPhaseStatusId 
                                = selectedContestsResult.getLong("submission_phase_status");
                            long submissionsPhaseId 
                                = insertProjectPhase(insertPhaseStmt, newProjectId, 2, submissionPhaseStatusId,
                                                     null, contestStartTime, contestEndTime,
                                                     submissionPhaseStatusId != SCHEDULED ? contestStartTime : null,
                                                     submissionPhaseStatusId == CLOSED ? contestEndTime : null,
                                                     contestDuration, contestCreateUserId, contestStartTime);
                            insertPhaseCriteria(insertPhaseCriteriaStmt, submissionsPhaseId, 3, "0", 
                                                contestCreateUserId, contestStartTime);

                            // Screening phase
                            long oneMinuteDuration = 60 * 1000L;
                            Timestamp contestEndTimePlus1Minute 
                                = new Timestamp(contestEndTime.getTime() + oneMinuteDuration);
                            long screeningPhaseStatusId 
                                = selectedContestsResult.getLong("screening_phase_status");
                            long screeningPhaseId 
                                = insertProjectPhase(insertPhaseStmt, newProjectId, 3, screeningPhaseStatusId,
                                                     null, contestEndTime, contestEndTimePlus1Minute,
                                                     screeningPhaseStatusId != SCHEDULED ? contestEndTime : null,
                                                     screeningPhaseStatusId == CLOSED ? contestEndTimePlus1Minute : null,
                                                     oneMinuteDuration, contestCreateUserId, contestStartTime);
                            insertPhaseCriteria(insertPhaseCriteriaStmt, screeningPhaseId, 1, 
                                                String.valueOf(getScreeningScorecardId()), 
                                                contestCreateUserId, contestStartTime);

                            // Review phase
                            long reviewPhaseStatusId 
                                = selectedContestsResult.getLong("review_phase_status");
                            long reviewPhaseDuration 
                                = contestWinnerAnnouncementTime.getTime() - contestEndTimePlus1Minute.getTime();
                            long reviewPhaseId 
                                = insertProjectPhase(insertPhaseStmt, newProjectId, 4, reviewPhaseStatusId,
                                                     null, contestEndTimePlus1Minute, contestWinnerAnnouncementTime,
                                                     reviewPhaseStatusId != SCHEDULED ? contestEndTimePlus1Minute : null,
                                                     reviewPhaseStatusId == CLOSED ? contestWinnerAnnouncementTime : null,
                                                     reviewPhaseDuration, contestCreateUserId, contestStartTime);
                            insertPhaseCriteria(insertPhaseCriteriaStmt, reviewPhaseId, 1, 
                                                String.valueOf(getReviewScorecardId()), 
                                                contestCreateUserId, contestStartTime);
                            insertPhaseCriteria(insertPhaseCriteriaStmt, reviewPhaseId, 6, 
                                                "1", contestCreateUserId, contestStartTime);
                            

                            // Insert into tcs_catalog.phase_dependency
                            long fiveMinutesDuration = 5 * 60 * 1000L;
                            insertPhaseDependency(insertPhaseDependencyStmt, registrationPhaseId, submissionsPhaseId,
                                                  true, true, fiveMinutesDuration, contestCreateUserId, 
                                                  contestStartTime);
                            insertPhaseDependency(insertPhaseDependencyStmt, submissionsPhaseId, screeningPhaseId,
                                                  false, true, 0, contestCreateUserId, contestStartTime);
                            insertPhaseDependency(insertPhaseDependencyStmt, screeningPhaseId, reviewPhaseId,
                                                  false, true, 0, contestCreateUserId, contestStartTime);

                            // Handle multi-round contest phases
                            if (isMultiRoundContest) {
                                long oneDayDuration = 24 * 60 * 60 * 1000L;
                                long contestMilestoneDuration 
                                    = contestMilestoneTime.getTime() - contestStartTime.getTime();
                                Timestamp contestMilestoneTimePlus1Minute 
                                    = new Timestamp(contestMilestoneTime.getTime() + oneMinuteDuration);
                                Timestamp contestMilestoneTimePlus1Day 
                                    = new Timestamp(contestMilestoneTime.getTime() + oneDayDuration);
                                
                                // Milestone submission phase
                                long milestoneSubmissionPhaseStatusId 
                                    = selectedContestsResult.getLong("milestone_submission_phase_status");
                                long milestoneSubmissionPhaseId 
                                    = insertProjectPhase(insertPhaseStmt, newProjectId, 15, 
                                                         milestoneSubmissionPhaseStatusId,
                                                         null, contestStartTime, contestMilestoneTime,
                                                         submissionPhaseStatusId != SCHEDULED 
                                                             ? contestStartTime : null,
                                                         submissionPhaseStatusId == CLOSED 
                                                             ? contestMilestoneTime : null,
                                                         contestMilestoneDuration, contestCreateUserId, 
                                                         contestStartTime);
                                
                                // Milestone screening phase
                                long milestoneScreeningPhaseStatusId 
                                    = selectedContestsResult.getLong("milestone_screening_phase_status");
                                long milestoneScreeningPhaseId 
                                    = insertProjectPhase(insertPhaseStmt, newProjectId, 16, 
                                                         milestoneScreeningPhaseStatusId,
                                                         null, contestMilestoneTime, contestMilestoneTimePlus1Minute,
                                                         submissionPhaseStatusId != SCHEDULED 
                                                             ? contestMilestoneTime : null,
                                                         submissionPhaseStatusId == CLOSED 
                                                             ? contestMilestoneTimePlus1Minute : null,
                                                         oneMinuteDuration, contestCreateUserId, contestStartTime);
                                
                                // Milestone review phase
                                long milestoneReviewPhaseDuration 
                                    = contestMilestoneTimePlus1Day.getTime() - contestMilestoneTimePlus1Minute.getTime();
                                long milestoneReviewPhaseStatusId 
                                    = selectedContestsResult.getLong("milestone_review_phase_status");
                                long milestoneReviewPhaseId 
                                    = insertProjectPhase(insertPhaseStmt, newProjectId, 17, 
                                                         milestoneReviewPhaseStatusId,
                                                         null, contestMilestoneTimePlus1Minute, 
                                                         contestMilestoneTimePlus1Day,
                                                         submissionPhaseStatusId != SCHEDULED 
                                                             ? contestMilestoneTimePlus1Minute : null,
                                                         submissionPhaseStatusId == CLOSED 
                                                             ? contestMilestoneTimePlus1Day : null,
                                                         milestoneReviewPhaseDuration,
                                                         contestCreateUserId, contestStartTime);

                                insertPhaseCriteria(insertPhaseCriteriaStmt, milestoneSubmissionPhaseId, 3, "0", 
                                                    contestCreateUserId, contestStartTime);
                                insertPhaseCriteria(insertPhaseCriteriaStmt, milestoneScreeningPhaseId, 1, 
                                                    String.valueOf(getMilestoneScreeningScorecardId()), 
                                                    contestCreateUserId, contestStartTime);
                                insertPhaseCriteria(insertPhaseCriteriaStmt, milestoneReviewPhaseId, 1, 
                                                    String.valueOf(getMilestoneReviewScorecardId()), 
                                                    contestCreateUserId, contestStartTime);
                                insertPhaseCriteria(insertPhaseCriteriaStmt, milestoneReviewPhaseId, 6, 
                                                    "1", contestCreateUserId, contestStartTime);
                                
                                insertPhaseDependency(insertPhaseDependencyStmt, registrationPhaseId, 
                                                      milestoneSubmissionPhaseId, true, true, fiveMinutesDuration, 
                                                      contestCreateUserId, contestStartTime);
                                insertPhaseDependency(insertPhaseDependencyStmt, milestoneSubmissionPhaseId, 
                                                      milestoneScreeningPhaseId, false, true, 0, contestCreateUserId, 
                                                      contestStartTime);
                                insertPhaseDependency(insertPhaseDependencyStmt, milestoneScreeningPhaseId, 
                                                      milestoneReviewPhaseId, false, true, 0, contestCreateUserId, 
                                                      contestStartTime);
                            }

                            // If everything went smoothly then append ID of converted project to log messages
                            Object[] currentActivity = this.activities.peek();
                            currentActivity[0] = (String) currentActivity[0] + newProjectId;
                            
                            // Commit entire transaction for migrated contest
                            getOpenConnection(TARGET_DB).commit();
                        } catch (Exception e) {
                            logError(e);
                            getOpenConnection(TARGET_DB).rollback();
                        } finally {
                            stopActivityRecording();
                        }
                    } else {
                        LOGGER.error("Can not migrate contest " + contestId + " as it's contest type " + contestTypeId 
                                     + " can not be mapped to respective project category");
                    }
                } else {
                    LOGGER.error("Can not migrate contest " + contestId + " as it's contest status " + contestStatusId 
                                 + " can not be mapped to respective project status");
                }
            }
        } finally {
            close(selectedContestsResult);
            close(insertPhaseDependencyStmt);
            close(insertPhaseCriteriaStmt);
            close(insertPhaseStmt);
            close(insertProjectStmt);
            close(insertProjectInfoStmt);
            close(insertComponentCategoriesStmt);
            close(insertComponentVersionStmt);
            close(insertComponentStmt);
            close(selectContestsStmt);
            stopActivityRecording();
        }
    }

    /**
     * <p>Inserts new record into <code>tcs_catalog.project_phase</code> table with specified values.</p>
     * 
     * @param insertPhaseStmt a <code>PreparedStatement</code> to be used for inserting new record into 
     *        <code>tcs_catalog.project_phase</code> table.
     * @param newProjectId a <code>long</code> providing the ID for new project.
     * @param phaseTypeId a <code>long</code> referencing the phase type ID.
     * @param phaseStatusId a <code>long</code> referencing the phase status ID.
     * @param fixedStartTime a <code>Timestamp</code> providing the fixed start time for phase.
     * @param scheduledStartTime a <code>Timestamp</code> providing the scheduled start time for phase.
     * @param scheduledEndTime a <code>Timestamp</code> providing the scheduled end time for phase.
     * @param actualStartTime a <code>Timestamp</code> providing the actual start time for phase.
     * @param actualEndTime a <code>Timestamp</code> providing the actual end time for phase. 
     * @param duration a <code>long</code> providing the duration of phase in milliseconds.
     * @param contestCreateUserId a <code>long</code> providing the ID for contest creator.
     * @param contestStartTime a <code>Timestamp</code> providing the contest start time.    
     * @return a <code>long</code> providing the ID for newly created project phase.
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws SQLException if an SQL error occurs.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     */
    private long insertProjectPhase(PreparedStatement insertPhaseStmt, long newProjectId, long phaseTypeId,
                                    long phaseStatusId, Timestamp fixedStartTime, Timestamp scheduledStartTime,
                                    Timestamp scheduledEndTime, Timestamp actualStartTime, Timestamp actualEndTime,
                                    long duration, long contestCreateUserId, Timestamp contestStartTime)
        throws IDGenerationException, SQLException, StudioContestMigrationException {
        
        long newPhaseId = getPhaseIdGenerator().getNextID();
        insertPhaseStmt.clearParameters();
        insertPhaseStmt.setLong(1, newPhaseId);
        insertPhaseStmt.setLong(2, newProjectId);
        insertPhaseStmt.setLong(3, phaseTypeId);
        insertPhaseStmt.setLong(4, phaseStatusId);
        insertPhaseStmt.setTimestamp(5, fixedStartTime);
        insertPhaseStmt.setTimestamp(6, scheduledStartTime);
        insertPhaseStmt.setTimestamp(7, scheduledEndTime);
        insertPhaseStmt.setTimestamp(8, actualStartTime);
        insertPhaseStmt.setTimestamp(9, actualEndTime);
        insertPhaseStmt.setLong(10, duration);
        insertPhaseStmt.setLong(11, contestCreateUserId);
        insertPhaseStmt.setTimestamp(12, contestStartTime);
        insertPhaseStmt.setLong(13, contestCreateUserId);
        insertPhaseStmt.setTimestamp(14, contestStartTime);
        int insertCount = insertPhaseStmt.executeUpdate();
        if (insertCount != 1) {
            throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                      "project_phase table: " + insertCount);
        }
        
        return newPhaseId;
    }

    /**
     * <p>Inserts new record into <code>tcs_catalog.project_info</code> table with specified values.</p>
     * 
     * @param insertProjectInfoStmt a <code>PreparedStatement</code> to be used for inserting new record into 
     *        <code>tcs_catalog.project_info</code> table.   
     * @param newProjectId a <code>long</code> providing the ID for new project.
     * @param projectInfoTypeId a <code>long</code> providing the ID for project info type.
     * @param value a <code>String</code> providing the value for project info.
     * @param contestCreateUserId a <code>long</code> providing the ID for contest creator.
     * @param contestStartTime a <code>Timestamp</code> providing the contest start time.    
     * @throws SQLException if an SQL error occurs.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     */
    private void insertSingleProjectInfo(PreparedStatement insertProjectInfoStmt,
                                         long newProjectId, long projectInfoTypeId, String value,
                                         Long contestCreateUserId,
                                         Timestamp contestStartTime)
        throws SQLException, StudioContestMigrationException {
        insertProjectInfoStmt.clearParameters();
        insertProjectInfoStmt.setLong(1, newProjectId);
        insertProjectInfoStmt.setLong(2, projectInfoTypeId);
        insertProjectInfoStmt.setString(3, value);
        insertProjectInfoStmt.setLong(4, contestCreateUserId);
        insertProjectInfoStmt.setTimestamp(5, contestStartTime);
        insertProjectInfoStmt.setLong(6, contestCreateUserId);
        insertProjectInfoStmt.setTimestamp(7, contestStartTime);
        int insertCount = insertProjectInfoStmt.executeUpdate();
        if (insertCount != 1) {
            throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                      "project_info table: " + insertCount);
        }
    }

    /**
     * <p>Inserts new record into <code>tcs_catalog.phase_criteria</code> table with specified values.</p>
     * 
     * @param insertPhaseCriteriaStmt a <code>PreparedStatement</code> to be used for inserting new record into 
     *        <code>tcs_catalog.phase_criteria</code> table.   
     * @param newPhaseId a <code>long</code> providing the ID for new phase.
     * @param phaseCriteriaTypeId a <code>long</code> providing the ID for phase criteria type.
     * @param value a <code>String</code> providing the value for phase criteria.
     * @param contestCreateUserId a <code>long</code> providing the ID for contest creator.
     * @param contestStartTime a <code>Timestamp</code> providing the contest start time.    
     * @throws SQLException if an SQL error occurs.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     */
    private void insertPhaseCriteria(PreparedStatement insertPhaseCriteriaStmt,
                                     long newPhaseId, long phaseCriteriaTypeId, String value,
                                     Long contestCreateUserId, Timestamp contestStartTime)
        throws SQLException, StudioContestMigrationException {
        insertPhaseCriteriaStmt.clearParameters();
        insertPhaseCriteriaStmt.setLong(1, newPhaseId);
        insertPhaseCriteriaStmt.setLong(2, phaseCriteriaTypeId);
        insertPhaseCriteriaStmt.setString(3, value);
        insertPhaseCriteriaStmt.setLong(4, contestCreateUserId);
        insertPhaseCriteriaStmt.setTimestamp(5, contestStartTime);
        insertPhaseCriteriaStmt.setLong(6, contestCreateUserId);
        insertPhaseCriteriaStmt.setTimestamp(7, contestStartTime);
        int insertCount = insertPhaseCriteriaStmt.executeUpdate();
        if (insertCount != 1) {
            throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                      "phase_criteria table: " + insertCount);
        }
    }

    /**
     * <p>Inserts new record into <code>tcs_catalog.phase_dependency</code> table with specified values.</p>
     * 
     * @param insertPhaseDependencyStmt a <code>PreparedStatement</code> to be used for inserting new record into 
     *        <code>tcs_catalog.phase_dependency</code> table.   
     * @param dependencyPhaseId a <code>long</code> providing the ID for dependency phase.
     * @param dependentPhaseId a <code>long</code> providing the ID for dependent phase.
     * @param dependencyStart <code>true</code> if dependency start flag is to be set; <code>false</code> otherwise.
     * @param dependentStart <code>true</code> if dependent start flag is to be set; <code>false</code> otherwise.
     * @param lagTime a <code>long</code> providing the lag time for dependency.
     * @param contestCreateUserId a <code>long</code> providing the ID for contest creator.
     * @param contestStartTime a <code>Timestamp</code> providing the contest start time.    
     * @throws SQLException if an SQL error occurs.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     */
    private void insertPhaseDependency(PreparedStatement insertPhaseDependencyStmt,
                                       long dependencyPhaseId, long dependentPhaseId, boolean dependencyStart, 
                                       boolean dependentStart, long lagTime, 
                                       Long contestCreateUserId, Timestamp contestStartTime)
        throws SQLException, StudioContestMigrationException {
        insertPhaseDependencyStmt.clearParameters();
        insertPhaseDependencyStmt.setLong(1, dependencyPhaseId);
        insertPhaseDependencyStmt.setLong(2, dependentPhaseId);
        insertPhaseDependencyStmt.setInt(3, dependencyStart ? 1 : 0);
        insertPhaseDependencyStmt.setInt(4, dependentStart ? 1 : 0);
        insertPhaseDependencyStmt.setLong(5, lagTime);
        insertPhaseDependencyStmt.setLong(6, contestCreateUserId);
        insertPhaseDependencyStmt.setTimestamp(7, contestStartTime);
        insertPhaseDependencyStmt.setLong(8, contestCreateUserId);
        insertPhaseDependencyStmt.setTimestamp(9, contestStartTime);
        int insertCount = insertPhaseDependencyStmt.executeUpdate();
        if (insertCount != 1) {
            throw new StudioContestMigrationException("Wrong number of records inserted into " +
                                                      "phase_dependency table: " + insertCount);
        }
    }

    /**
     * <p>Gets the numerical value of specified column from the current record of specified result set.</p>
     * 
     * @param resultSet a <code>ResultSet</code> providing the data retrieved from database. 
     * @param columnName a <code>String</code> providing the name of the column to get the value of.
     * @return a <code>Long</code> providing the value of specified column or <code>null</code> if the value is SQL
     *         NULL. 
     * @throws SQLException if an SQL error occurs while retrieving the value of specified column.
     */
    private Long getLong(ResultSet resultSet, String columnName) throws SQLException {
        Long value = resultSet.getLong(columnName);
        if (resultSet.wasNull()) {
            return null;
        } else {
            return value;
        }
    }

    /**
     * <p>Gets the SQL statement for selecting the <code>Studio</code> contests for migration.</p>
     * 
     * @return a <code>PreparedStatement</code> to be used for selecting the contests for migration.
     * @throws SQLException if an SQL error occurs while creating the statement.
     */
    private PreparedStatement getSelectContestsStatement() throws SQLException {
        final String SELECT_CONTESTS_SQL = "SELECT c.contest_id, c.name, c.start_time, c.end_time, " +
                                           "c.contest_status_id, c.forum_id, c.contest_type_id, " +
                                           "c.tc_direct_project_id, c.create_user_id, c.winner_announcement_time, " +
                                           "c.is_multi_round, " +
                                           "fee.property_value AS admin_fee, " +
                                           "billing.property_value AS billing_project_id, " +
                                           "descr.property_value AS description, " +
                                           "multiround.milestone_date, " +
                                           "CASE " +
                                           "  WHEN CURRENT < c.start_time THEN 1 " +
                                           "  WHEN CURRENT BETWEEN c.start_time AND c.end_time THEN 2 " +
                                           "  ELSE 3 " +
                                           "END AS registration_phase_status, " +
                                           "CASE " +
                                           "  WHEN CURRENT < c.start_time THEN 1 " +
                                           "  WHEN CURRENT BETWEEN c.start_time AND c.end_time THEN 2 " +
                                           "  ELSE 3 " +
                                           "END AS submission_phase_status, " +
                                           "CASE " +
                                           "  WHEN CURRENT < c.end_time THEN 1 " +
                                           "  ELSE 3 " +
                                           "END AS screening_phase_status, " +
                                           "CASE " +
                                           "  WHEN CURRENT < c.end_time THEN 1 " +
                                           "  WHEN CURRENT BETWEEN c.end_time AND c.winner_announcement_time THEN 2 " +
                                           "  ELSE 3 " +
                                           "END AS review_phase_status, " +
                                           "CASE " +
                                           "  WHEN CURRENT < c.start_time THEN 1 " +
                                           "  WHEN CURRENT BETWEEN c.start_time AND multiround.milestone_date THEN 2 " +
                                           "  ELSE 3 " +
                                           "END AS milestone_submission_phase_status, " +
                                           "CASE " +
                                           "  WHEN CURRENT < multiround.milestone_date THEN 1 " +
                                           "  ELSE 3 " +
                                           "END AS milestone_screening_phase_status, " +
                                           "CASE " +
                                           "  WHEN CURRENT < (multiround.milestone_date + 1 UNITS MINUTE) THEN 1 " +
                                           "  WHEN CURRENT BETWEEN (multiround.milestone_date + 1 UNITS MINUTE) " +
                                           "       AND (multiround.milestone_date + 1 UNITS DAY) THEN 2 " +
                                           "  ELSE 3 " +
                                           "END AS milestone_review_phase_status " +
                                           "FROM contest c " +
                                           "LEFT JOIN contest_config fee ON c.contest_id = fee.contest_id " +
                                           "     AND fee.property_id = 25 " +
                                           "LEFT JOIN contest_config billing ON c.contest_id = billing.contest_id " +
                                           "     AND billing.property_id = 28 " + 
                                           "LEFT JOIN contest_config descr ON c.contest_id = descr.contest_id " +
                                           "     AND descr.property_id = 1 " +  
                                           "LEFT JOIN contest_multi_round_information multiround " +
                                           "     ON c.contest_multi_round_information_id " +
                                           "     = multiround.contest_multi_round_information_id ";  
        
        boolean startDateSet = getStartDate() != null;
        boolean endDateSet = getEndDate() != null;
        boolean contestIdsSet = getContestIds() != null;
        
        if (startDateSet || endDateSet || contestIdsSet) {
            StringBuilder sql = new StringBuilder(SELECT_CONTESTS_SQL);
            sql.append("WHERE 1 = 1 ");
            if (startDateSet) {
                sql.append("AND c.start_time >= ? ");
            }
            if (endDateSet) {
                sql.append("AND c.end_time <= ? ");
            }
            if (contestIdsSet) {
                sql.append("AND c.contest_id IN (");
                long[] ids = getContestIds();
                for (int i = 0; i < ids.length; i++) {
                    if (i > 0) {
                        sql.append(", ");
                    }
                    sql.append(ids[i]);
                }
                sql.append(") ");
            }

            int endDateParamIndex = 1;
            PreparedStatement statement = prepareStatement(sql.toString(), SOURCE_DB);
            if (startDateSet) {
                endDateParamIndex++;
                statement.setTimestamp(1, new Timestamp(getStartDate().getTime()));
            }
            if (endDateSet) {
                statement.setTimestamp(endDateParamIndex, new Timestamp(getEndDate().getTime()));
            }
            return statement;
        } else {
            return prepareStatement(SELECT_CONTESTS_SQL, SOURCE_DB);
        }
    }
}
