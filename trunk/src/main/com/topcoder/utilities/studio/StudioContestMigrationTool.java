/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.studio;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;
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
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;


import com.topcoder.shared.util.dwload.TCLoad;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

/**
 * <p>An extension to <code>TCLoad</code> tool which migrates the data for <code>Studio</code> contests from
 * <code>studio_oltp</code> database to <code>tcs_catalog</code> database.</p>
 * 
 * <p><b>Thread safety:</b> This class is NOT thread-safe and it is not intended to be called by multiple threads.</p>
 * 
 * <p>
 * Version 1.1 (Data Migration Replatforming Release 2 assembly) change notes:
 * Add logic to load the other data related to the studio contest as described in the wiki page.
 * </p>
 * 
 * @author isv, TCSASSEMBER
 * @version 1.1 (Re-platforming Data Migration Release 1 assembly)
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
     * <p>A <code>DateFormat</code> to be used for parsing the dates to resource registration format.</p>
     * 
     * @since 1.1
     */
    private static final DateFormat RESOURCE_DATE_FORMAT = new SimpleDateFormat("MM.dd.yyyy hh:mm a");

    /**
     * <p>A <code>DateFormat</code> to be used for parsing the dates to project_info 21 completion timestamp format.</p>
     * 
     * @since 1.1
     */
    private static final DateFormat PROJECT_INFO_COMPLETION_DATE_FORMAT = new SimpleDateFormat("MM.dd.yyyy HH:mm z");

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
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of screening
     * scorecard question.</p>
     * 
     * @since 1.1
     */
    private static final String SCREENING_SCORECARD_QUESTION_ID_PARAM_NAME = "screening_scorecard_question_id";
    
    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of review
     * scorecard question.</p>
     * 
     * @since 1.1
     */
    private static final String REVIEW_SCORECARD_QUESTION_ID_PARAM_NAME = "review_scorecard_question_id";
    
    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of milestone
     * screening scorecard question.</p>
     * 
     * @since 1.1
     */
    private static final String MILESTONE_SCREENING_SCORECARD_QUESTION_ID_PARAM_NAME = "milestone_screening_scorecard_question_id";
    
    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the ID of milestone
     * review scorecard question.</p>
     * 
     * @since 1.1
     */
    private static final String MILESTONE_REVIEW_SCORECARD_QUESTION_ID_PARAM_NAME = "milestone_review_scorecard_question_id";
    
    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the location to save the
     * documents for software contests.</p>
     * 
     * @since 1.1
     */
    private static final String SOFTWARE_DOCUMENTS_ROOT_PARAM_NAME = "software_documents_root";
    

    /**
     * <p>A <code>String</code> providing the name of configuration parameter to be used to provide the location to save the
     * studio submissions.</p>
     * 
     * @since 1.1
     */
    private static final String STUDIO_SUBMISSIONS_ROOT_PARAM_NAME = "studio_submissions_root";


    /**
     * <p>A <code>long</code> referencing the <code>Scheduled</code> phase status.</p>
     */
    private static final long SCHEDULED = 1;

    /**
     * <p>A <code>long</code> referencing the <code>Closed</code> phase status.</p>
     */
    private static final long CLOSED = 3;

    /**
     * <p>A <code>long</code> providing the size of buffer to be used when coping files.</p>
     * 
     * @since 1.1
     */
    private static final int BUFFER_SIZE = 8192;

    /**
     * <p>A <code>long</code> referencing the <code>Other</code> document type.</p>
     * 
     * @since 1.1
     */
    private static final long OTHER_DOCUMENT_TYPE_ID = 6L;
    
    /**
     * <p>A <code>long</code> referencing the ID of <code>Milestone Prize</code>.</p>
     * 
     * @since 1.1
     */
    private static final long MILESTONE_PRIZE_TYPE_ID = 14L;
    
    /**
     * <p>A <code>long</code> referencing the ID of <code>Contest Prize</code>.<p>
     * 
     * @since 1.1
     */
    private static final long CONTEST_PRIZE_TYPE_ID = 15L;
    
    /**
     * <p>A <code>long</code> referencing the ID of <code>Submitter</code> role.</p>
     * 
     * @since 1.1
     */
    private static final long SUBMITTER_RESOURCE_ROLE_ID = 1L;
    
    /**
     * <p>A <code>long</code> referencing the ID of <code>Primary Screener</code> role.</p>
     * 
     * @since 1.1
     */
    private static final long PRIMARY_SCREENER_RESOURCE_ROLE_ID = 2L;
    
    /**
     * <p>A <code>long</code> referencing the ID of <code>Reviewer</code> role.</p>
     * 
     * @since 1.1
     */
    private static final long REVIEWER_RESOURCE_ROLE_ID = 4L;
    
    /**
     * <p>A <code>long</code> referencing the ID of <code>Milestone Screener</code> role.</p>
     * 
     * @since 1.1
     */
    private static final long MILESTONE_SCREENER_RESOURCE_ROLE_ID = 19L;
    
    /**
     * <p>A <code>long</code> referencing the ID of <code>Milestone Reviewer</code> role.</p>
     * 
     * @since 1.1
     */
    private static final long MILESTONE_REVIEWER_RESOURCE_ROLE_ID = 20L;
    
    /**
     * <p>A <code>long</code> referencing the <code>Active</code> submission status.</p>
     * 
     * @since 1.1
     */
    private static final long ACTIVE_SUBMISSION_STATUS_ID = 1L;
    
    /**
     * <p>A <code>long</code> referencing the <code>Contest Submission</code> type.</p>
     * 
     * @since 1.1
     */
    private static final long CONTEST_SUBMISSISON_TYPE_ID = 1L;
    
    /**
     * <p>A <code>long</code> referencing the <code>Screening</code> phase type.</p>
     * 
     * @since 1.1
     */
    private static final long SCREENING_PHASE_TYPE_ID = 3L;
    
    /**
     * <p>A <code>long</code> referencing the <code>Review</code> phase type.</p>
     * 
     * @since 1.1
     */
    private static final long REVIEW_PHASE_TYPE_ID = 4L;
    
    /**
     * <p>A <code>long</code> referencing the <code>Milestone Screening</code> phase type.</p>
     * 
     * @since 1.1
     */
    private static final long MILESTONE_SCREENING_PHASE_TYPE_ID = 16L;
    
    /**
     * <p>A <code>long</code> referencing the <code>Milestone Review</code> phase type.</p>
     * 
     * @since 1.1
     */
    private static final long MILESTONE_REVIEW_PHASE_TYPE_ID = 17L;
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.comp_catalog</code> table.</p>
     */
    private static final String INSERT_COMPONENT_SQL 
        = "INSERT INTO comp_catalog (component_id, current_version, short_desc, " +
                                  "component_name, description, function_desc, status_id, root_category_id, " +
                                  "public_ind, create_time, modify_date) " +
                                  "VALUES (?, 1, ?, ?, ?, NULL, 102, 26887152, 0, ?, ?)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.comp_versions</code> table.</p>
     */
    private static final String INSERT_COMPONENT_VERSION_SQL 
        = "INSERT INTO comp_versions (comp_vers_id, component_id, version, version_text, create_time, phase_id, " +
          "phase_time, price, comments, modify_date, suspended_ind) VALUES (?, ?, 1, '1.0', ?, ?, ?, 0, NULL, ?, 0)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.comp_categories</code> table.</p>
     */
    private static final String INSERT_COMPONENT_CATEGORIES_SQL 
        = "INSERT INTO comp_categories (comp_categories_id, component_id, category_id) VALUES (?, ?, 26887152)";
        
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into 
     * <code>tcs_catalog.project</code> table.</p>
     */
    private static final String INSERT_PROJECT_SQL = "INSERT INTO project (project_id, project_status_id, " +
                                "project_category_id, project_studio_spec_id, tc_direct_project_id, " +
                                "create_user, create_date, modify_user, modify_date) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
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
     * <p>A <code>String</code> providing the SQL statement for selecting contest documentations
     * from <code>studio_oltp</code> database for a specified contest.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_STUDIO_CONTEST_DOCUMENTS_SQL
        = "SELECT dtl.document_type_desc, d.original_file_name, p.path, d.system_file_name " +
            "FROM document_type_lu dtl, " +
            "document d, " + 
            "path p, " +
            "contest_document_xref cdx " +
            "WHERE dtl.document_type_id = d.document_type_id " +
            "AND d.path_id = p.path_id " +
            "AND cdx.document_id = d.document_id " +
            "AND cdx.contest_id = ?";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.comp_documentation</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_COMP_DOCUMENTATION_SQL
        = "INSERT INTO comp_documentation (document_id, comp_vers_id, document_type_id, document_name, url) " +
            "VALUES (?, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for selecting project file types
     * from <code>studio_oltp.contest_file_type_xref</code> table for a specified contest.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_CONTEST_FILE_TYPES_SQL
        = "SELECT file_type_id FROM contest_file_type_xref WHERE contest_id = ?";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.project_file_type_xref</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_PROJECT_FILE_TYPES_SQL
        = "INSERT INTO project_file_type_xref (project_id, file_type_id) VALUES (?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.project_studio_specification</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_PROJECT_STUDIO_SPECIFICATION_SQL
        = "INSERT INTO project_studio_specification (project_studio_spec_id, goals, target_audience, branding_guidelines, " +
                                                    "disliked_design_websites, other_instructions, winning_criteria, " +
                                                    "submitters_locked_between_rounds, round_one_introduction, round_two_introduction, " +
                                                    "colors, fonts, layout_and_size, contest_introduction, contest_description, " +
                                                    "content_requirements, general_feedback, " +
                                                    "create_user, create_date, modify_user, modify_date) " +
                                                    "VALUES (?, ?, ?, ?, ?, ?, ?, 'f', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
 
    /**
     * <p>A <code>String</code> providing the SQL statement for selecting contest prizes from
     * <code>studio_oltp</code> database for a specified contest. Only <code>Contest Prize</code> and
     * <code>Milestone Prize</code> are retrieved.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_PRIZE_SQL
        = "SELECT p.prize_id, p.place, p.amount AS prize_amount, 15 AS prize_type_id, 1 AS number_of_submissions, p.create_date " +
            "FROM prize p, contest_prize_xref cpx " +
            "WHERE p.prize_id = cpx.prize_id " +
            "  AND cpx.contest_id = ? and p.amount > 0 and p.prize_type_id = 1 " +
            "UNION " +
            "SELECT mp.contest_milestone_prize_id as prize_id, 1 AS place, mp.amount AS prize_amount, " +
            "14 AS prize_type_id, mp.number_of_submissions, mp.create_date " +
            "FROM contest_milestone_prize mp, contest c " +
            "WHERE mp.contest_milestone_prize_id = c.contest_milestone_prize_id " +
            "AND c.contest_id = ? and mp.amount > 0";

    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.prize</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_PRIZE_SQL
        = "INSERT INTO prize (prize_id, place, prize_amount, prize_type_id, number_of_submissions, " +
            "create_user, create_date, modify_user, modify_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.project_prize_xref</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_PROJECT_PRIZE_XREF_SQL
        = "INSERT INTO project_prize_xref (project_id, prize_id) values (?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for selecting registrations from
     * <code>studio_oltp</code> database for a specified contest.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_CONTEST_REGISTRATION_SQL
        = "SELECT cr.user_id, u.handle, cr.create_date, " +
            "     NVL((SELECT SUM(p.price) FROM submission_payment p, submission s " +
            "          WHERE p.submission_id = s.submission_id AND p.payment_status_id = 1 " +
            "            AND s.submitter_id = cr.user_id and s.contest_id = cr.contest_id), 0) AS prizes " +
            "FROM contest_registration cr " +
            "LEFT JOIN user u ON cr.user_id = u.user_id " +
            "WHERE cr.contest_id = ?";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.resource</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_RESOURCE_SQL
        = "INSERT INTO resource (resource_id, resource_role_id, project_id, project_phase_id, " +
            "                    create_user, create_date, modify_user, modify_date) " +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.resource_info</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_RESOURCE_INFO_SQL
        = "INSERT INTO resource_info (resource_id, resource_info_type_id, value, create_user, create_date, modify_user, modify_date) " +
            "VALUES(?, ?, ?, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for selecting studio contest specification data from
     * <code>studio_oltp</code> database for a specified contest.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_CONTEST_SPECIFICATION_SQL
        = "SELECT gi.goals, gi.target_audience, gi.branding_guidelines, gi.disliked_designs_websites AS disliked_design_websites, " +
            "gi.other_instructions, gi.winning_criteria, multiround.round_one_introduction, multiround.round_two_introduction, " + 
            "multiround.general_feedback_text AS general_feedback_text, " + 
            "colors_r.property_value::lvarchar(500) AS colors, " +
            "fonts_r.property_value::lvarchar(500) AS fonts, " +
            "layout_and_size_r.property_value::lvarchar(400) AS layout_and_size, " +
            "contest_introduction_r.property_value::lvarchar(2000) AS contest_introduction, " +
            "contest_description_r.property_value::lvarchar(10000) AS contest_description, " +
            "content_requirements_r.property_value::lvarchar(1200) AS content_requirements " +
            "FROM contest c " +
            "LEFT JOIN contest_config colors_r ON c.contest_id = colors_r.contest_id AND colors_r.property_id = 14 " +
            "LEFT JOIN contest_config fonts_r ON c.contest_id = fonts_r.contest_id AND fonts_r.property_id = 15 " +
            "LEFT JOIN contest_config layout_and_size_r ON c.contest_id = layout_and_size_r.contest_id " +
            "      AND layout_and_size_r.property_id = 16 " +
            "LEFT JOIN contest_config contest_introduction_r ON c.contest_id = contest_introduction_r.contest_id " +
            "     AND contest_introduction_r.property_id = 1 " +
            "LEFT JOIN contest_config contest_description_r ON c.contest_id = contest_description_r.contest_id " +
            "     AND contest_description_r.property_id = 13 " +
            "LEFT JOIN contest_config content_requirements_r ON c.contest_id = content_requirements_r.contest_id " +
            "     AND content_requirements_r.property_id = 17 " +
            "LEFT JOIN contest_multi_round_information multiround " +
            "     ON c.contest_multi_round_information_id = multiround.contest_multi_round_information_id " +
            "LEFT JOIN contest_general_info gi ON gi.contest_general_info_id = c.contest_general_info_id " +
            "WHERE c.contest_id = ?";

    /**
     * <p>A <code>String</code> providing the SQL statement for selecting submissions from
     * <code>studio_oltp</code> database for a specified contest.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_SUBMISSION_SQL
        = "SELECT s.submission_id, s.submitter_id, s.submission_status_id, s.submission_type_id, s.award_milestone_prize,  " +
            "     s.modify_date, s.user_rank, s.original_file_name, s.system_file_name, s.file_size, s.view_count, s.submission_date, s.create_date, " +
            "     p.path, s.feedback_text, sr.text as review_text, sr.review_status_id, " +
            "     (SELECT pr.prize_id FROM submission_prize_xref pz, prize pr " +
            "       WHERE pz.prize_id = pr.prize_id AND pr.prize_type_id = 1 " +
            "         AND pz.submission_id = s.submission_id) AS prize_id, " +
            "     (SELECT contest_milestone_prize_id FROM submission_milestone_prize_xref where submission_id = s.submission_id) AS milestone_prize_id, " +
            "     (SELECT pr.prize_id FROM submission_prize_xref pz, prize pr " +
            "       WHERE pz.prize_id = pr.prize_id AND pr.prize_type_id = 2 " +
            "         AND pz.submission_id = s.submission_id) AS client_selection_prize_id " +
            "FROM submission s " +
            "LEFT JOIN path p ON p.path_id = s.path_id " +
            "LEFT JOIN submission_review sr on sr.submission_id = s.submission_id " +
            "WHERE s.contest_id = ?";

    
    /**
     * <p>A <code>String</code> providing the SQL statement for selecting submission images from
     * <code>studio_oltp</code> database for a specified submission id.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_SUBMISSION_IMAGE_SQL
        = "SELECT si.submission_id, si.image_id, si.sort_order, " +
            "     si.modify_date, si.create_date " +
            "FROM submission_image si " +
            "WHERE si.submission_id = ?";

     /**
     * <p>A <code>String</code> providing the SQL statement for insert submission images into
     * <code>tcs_catalog.submission_image</code> database for a specified submission id.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_SUBMISSION_IMAGE_SQL
        = "INSERT INTO submission_image (submission_id, image_id, sort_order, modify_date, create_date )" +
           "VALUES(?, ?, ?, ?, ?)";

    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.resource_submission</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_RESOURCE_SUBMISSION_SQL
        = "INSERT INTO resource_submission (resource_id, submission_id, create_user, create_date, modify_user, modify_date) " +
            "VALUES(?, ?, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.upload</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_UPLOAD_SQL
        = "INSERT INTO upload (upload_id, project_id, resource_id, upload_type_id, upload_status_id, parameter, upload_desc, " +
            "                  create_user, create_date, modify_user, modify_date) " +
            "VALUES(?, ?, ?, 1, ?, ?, NULL, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.submission</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_SUBMISSION_SQL
        = "INSERT INTO submission (submission_id, upload_id, submission_status_id, screening_score, initial_score, final_score, " +
            "                      placement, submission_type_id, create_user, create_date, modify_user, modify_date, " +
            "                      user_rank, mark_for_purchase, prize_id, file_size, view_count) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for selecting submission declaration data from
     * <code>studio_oltp</code> database for a specified submission.</p>
     * 
     * @since 1.1
     */
    private static final String SELECT_SUBMISSION_DECLARATION_SQL
        = "SELECT sd.submission_declaration_id, sd.comment, sd.has_external_content, " +
            "     sec.external_content_id, sec.external_content_type_id, sec.display_position, " +
            "     ecp.external_content_property_id, ecp.name, ecp.value " +
            "FROM submission_declaration sd " +
            "LEFT JOIN submission_external_content sec " +
            "       ON sec.submission_declaration_id = sd.submission_declaration_id " +
            "LEFT JOIN external_content_property ecp " +
            "       ON ecp.external_content_id = sec.external_content_id " +
            "WHERE sd.submission_id = ? " +
            "ORDER BY sd.submission_declaration_id, sec.external_content_id";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.submission_declaration</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_SUBMISSION_DECLARATION_SQL
        = "INSERT INTO submission_declaration (submission_declaration_id, submission_id, comment, has_external_content) " +
            "VALUES (?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.submission_external_content</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_SUBMISSION_EXTERNAL_CONTENT_SQL
        = "INSERT INTO submission_external_content (external_content_id, external_content_type_id, display_position, submission_declaration_id) " +
            "VALUES (?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.external_content_property</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_EXTERNAL_CONTENT_PROPERTY_SQL
        = "INSERT INTO external_content_property (external_content_property_id, external_content_id, name, value) " +
            "VALUES (?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.review</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_REVIEW_SQL
        = "INSERT INTO review (review_id, resource_id, submission_id, scorecard_id, committed, score, initial_score, " +
            "                  create_user, create_date, modify_user, modify_date) " +
            "VALUES (?, ?, ?, ?, 1, ?, ?, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.review_item</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_REVIEW_ITEM_SQL
        = "INSERT INTO review_item (review_item_id, review_id, scorecard_question_id, upload_id, answer, sort, " +
            "                  create_user, create_date, modify_user, modify_date) " +
            "VALUES (?, ?, ?, NULL, ?, 0, ?, ?, ?, ?)";
    
    /**
     * <p>A <code>String</code> providing the SQL statement for inserting new records into
     * <code>tcs_catalog.review_item_comment</code> table.</p>
     * 
     * @since 1.1
     */
    private static final String INSERT_REVIEW_ITEM_COMMENT_SQL
        = "INSERT INTO review_item_comment (review_item_comment_id, resource_id, review_item_id, comment_type_id, content, extra_info, " +
            "                               sort, create_user, create_date, modify_user, modify_date) " +
            "VALUES (?, ?, ?, 1, ?, NULL, 0, ?, ?, ?, ?)";

     /**
     * <p> A <code>String</code> providing the SQL statement for updating payments info in
     * <code>informixoltp:payment_detail</code> table with new project ids.</p>
     *
     * @since 1.2
     */
    private static final String UPDATE_PAYMENT_INFO_SQL
        = "UPDATE informixoltp:payment_detail SET component_project_id = ?, studio_contest_id=null WHERE " +
          "studio_contest_id = ?";
    
    /**
    * <p> A <code>String</code> providing the SQL statement for updating dr poins in
    * <code>dr_points</code> table with new project ids.</p>
    */
    private static final String UPDATE_DR_POINTS_SQL
        = "UPDATE dr_points SET reference_id = ? WHERE reference_id = ?";


   /**
    * <p> A <code>String</code> providing the SQL statement for getting contest payment.</p>
    */
    private static final String SELECT_CONTEST_PAYMENT_SQL
        = "select payment_status_id, price, paypal_order_id, create_date, sale_reference_id, sale_type_id  from contest_payment " +
            " where contest_id = ?";
    
    /**
    * <p> A <code>String</code> providing the SQL statement for inserting contest_sale.</p>
    */
    private static final String INSERT_CONTEST_SALE_SQL
        = "insert into contest_sale (contest_sale_id, contest_id,  sale_status_id, price, paypal_order_id, create_date, sale_reference_id, sale_type_id) " +
            " values (?, ?, ?, ?, ?, ?, ?, ?)";

    /**
     * <p>A <code>Map</code> mapping the IDs for contest statuses from <code>Studio</code> database to <code>Online
     * Review</code> database.</p>
     */
    private static final Map<Long, Long> STATUS_MAPPING = new HashMap<Long, Long>();


      /**
     * <p>A <code>Map</code> mapping the IDs for contest detailed statuses from <code>Studio</code> database to <code>Online
     * Review</code> database.</p>
     */
    private static final Map<Long, Long> DETAILED_STATUS_MAPPING = new HashMap<Long, Long>();

    /**
     * <p>A <code>Map</code> mapping the IDs for project types/categories from <code>Studio</code> database to
     * <code>Online Review</code> database.</p>
     */
    private static final Map<Long, Long> PROJECT_CATEGORY_MAPPING = new HashMap<Long, Long>();

    /**
     * <p>A <code>Map</code> mapping the IDs from project category to phase.</p>
     * 
     * @since 1.1
     */
    private static final Map<Long, Long> PROJECT_CATEGORY_PHASE_MAPPING = new HashMap<Long, Long>();

    /**
     * <p>A <code>Map</code> mapping the IDs for submission status from <code>Studio</code> database to
     * <code>Online Review</code> database.</p>
     * 
     * @since 1.1
     */
    private static final Map<Long, Long> SUBMISSION_STATUS_MAPPING = new HashMap<Long, Long>();
    
    /**
     * <p>A <code>Map</code> mapping the IDs for submission types from <code>Studio</code> database to
     * <code>Online Review</code> database.</p>
     * 
     * @since 1.1
     */
    private static final Map<Long, Long> SUBMISSION_TYPE_MAPPING = new HashMap<Long, Long>();
    
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

        DETAILED_STATUS_MAPPING.put(2L, 1L);
        DETAILED_STATUS_MAPPING.put(5L, 1L);
        DETAILED_STATUS_MAPPING.put(6L, 1L);
        DETAILED_STATUS_MAPPING.put(7L, 9L);
        DETAILED_STATUS_MAPPING.put(8L, 7L);
        DETAILED_STATUS_MAPPING.put(10L, 1L);
        DETAILED_STATUS_MAPPING.put(11L, 6L);
        DETAILED_STATUS_MAPPING.put(12L, 1L);
        DETAILED_STATUS_MAPPING.put(13L, 6L);
        DETAILED_STATUS_MAPPING.put(14L, 9L);
        
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
        
        // Banners/Icons
        PROJECT_CATEGORY_PHASE_MAPPING.put(16L, 127L);
        // Web Design
        PROJECT_CATEGORY_PHASE_MAPPING.put(17L, 128L);
        // Wireframes
        PROJECT_CATEGORY_PHASE_MAPPING.put(18L, 129L);
        // Logo Design
        PROJECT_CATEGORY_PHASE_MAPPING.put(20L, 131L);
        // Print/Presentation
        PROJECT_CATEGORY_PHASE_MAPPING.put(21L, 132L);
        // Idea Generation
        PROJECT_CATEGORY_PHASE_MAPPING.put(22L, 133L);
        // Widget or Mobile Screen Design
        PROJECT_CATEGORY_PHASE_MAPPING.put(30L, 141L);
        // Front-End Flash
        PROJECT_CATEGORY_PHASE_MAPPING.put(31L, 142L);
        // Application Front-End Design
        PROJECT_CATEGORY_PHASE_MAPPING.put(32L, 143L);
        // Other
        PROJECT_CATEGORY_PHASE_MAPPING.put(34L, 145L);
        
        // Active
        SUBMISSION_STATUS_MAPPING.put(1L, 1L);
        // Deleted
        SUBMISSION_STATUS_MAPPING.put(2L, 5L);
        
        // Contest Submission
        SUBMISSION_TYPE_MAPPING.put(2L, 1L);
        // Milestone Submission
        SUBMISSION_TYPE_MAPPING.put(1L, 3L);
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
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.comp_documentation</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator documentIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.project_studio_specification</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator projectStudioSpecIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.prize</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator prizeIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.resource</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator resourceIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.upload</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator uploadIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.submission</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator submissionIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.submission_declaration</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator submissionDeclarationIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.submission_external_content</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator externalContentIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.external_content_property</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator externalContentPropertyIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.review</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator reviewIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.review_item</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator reviewItemIdGenerator;
    
    /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.review_item_comment</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator reviewItemCommentIdGenerator;

     /**
     * <p>A <code>IDGenerator</code> providing the generator for IDs for records inserted into
     * <code>tcs_catalog.contest_sale</code> table.</p>
     * 
     * @since 1.1
     */
    private IDGenerator contestSaleIdGenerator;
    
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
     * <p>A <code>long</code> providing the ID of a screening scorecard question.</p>
     * 
     * @since 1.1
     */
    private long screeningScorecardQuestionId;
    
    /**
     * <p>A <code>long</code> providing the ID of review scorecard question.</p>
     * 
     * @since 1.1
     */
    private long reviewScorecardQuestionId;
    
    /**
     * <p>A <code>long</code> providing the ID of milestone screening scorecard question.</p>
     * 
     * @since 1.1
     */
    private long milestoneScreeningScorecardQuestionId;
    
    /**
     * <p>A <code>long</code> providing the ID of milestone review scorecard question.</p>
     * 
     * @since 1.1
     */
    private long milestoneReviewScorecardQuestionId;
    
    /**
     * <p>A <code>String</code> providing the location to save the documents for software contests in Online Review.</p>
     * 
     * @since 1.1
     */
    private String softwareDocumentsRoot;

    /**
     * <p>A <code>String</code> providing the location to studio submissions.</p>
     * 
     * @since 1.1
     */
    private String studioSubmissionsRoot;
    
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
     * <p>Gets the root directory location to save documents for software contests in Online Review.</p>
     * 
     * @return a <code>String</code> providing the root directory location to save documents for software contests in Online Review.
     * @since 1.1
     */
    public String getSoftwareDocumentsRoot() {
        return softwareDocumentsRoot;
    }

    /**
     * <p>Sets the root directory location to save documents for software contests in Online Review.</p>
     * 
     * @param softwareDocumentsRoot a <code>String</code> providing the root directory location to save documents for software contests in Online Review.
     * @since 1.1
     */
    public void setSoftwareDocumentsRoot(String softwareDocumentsRoot) {
        if (softwareDocumentsRoot == null || softwareDocumentsRoot.trim().length() == 0) {
            throw new IllegalArgumentException("The software documents root can not be null or empty.");
        }
        File dir = new File(softwareDocumentsRoot);
        if (dir.exists() && !dir.isDirectory()) {
            throw new IllegalArgumentException("The software documents root must be a directory.");
        }
        this.softwareDocumentsRoot = softwareDocumentsRoot;
    }

    /**
     * <p>Gets the root directory location to save documents for software contests in Online Review.</p>
     * 
     * @return a <code>String</code> providing the root directory location to save documents for software contests in Online Review.
     * @since 1.1
     */
    public String getStudioSubmissionsRoot() {
        return studioSubmissionsRoot;
    }

    /**
     * <p>Sets the root directory location to save documents for software contests in Online Review.</p>
     * 
     * @param softwareDocumentsRoot a <code>String</code> providing the root directory location to save documents for software contests in Online Review.
     * @since 1.1
     */
    public void setStudioSubmissionssRoot(String studioSubmissionsRoot) {
        if (studioSubmissionsRoot == null || studioSubmissionsRoot.trim().length() == 0) {
            throw new IllegalArgumentException("The studioSubmissionsRoot can not be null or empty.");
        }
        File dir = new File(studioSubmissionsRoot);
        if (dir.exists() && !dir.isDirectory()) {
            throw new IllegalArgumentException("The studioSubmissionsRoot must be a directory.");
        }
        this.studioSubmissionsRoot = studioSubmissionsRoot;
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
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.comp_documentation</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.comp_documentation</code> table.
     * @since 1.1
     */
    public IDGenerator getDocumentIdGenerator() {
        return documentIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.comp_documentation</code> table.</p>
     * 
     * @param documentIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.comp_documentation</code> table.
     * @since 1.1
     */
    public void setDocumentIdGenerator(IDGenerator documentIdGenerator) {
        this.documentIdGenerator = documentIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.project_studio_specification</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.project_studio_specification</code> table.
     * @since 1.1
     */
    public IDGenerator getProjectStudioSpecIdGenerator() {
        return projectStudioSpecIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.project_studio_specification</code> table.</p>
     * 
     * @param projectStudioSpecIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.project_studio_specification</code> table.
     * @since 1.1
     */
    public void setProjectStudioSpecIdGenerator(IDGenerator projectStudioSpecIdGenerator) {
        this.projectStudioSpecIdGenerator = projectStudioSpecIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.prize</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.prize</code> table.
     * @since 1.1
     */
    public IDGenerator getPrizeIdGenerator() {
        return prizeIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.prize</code> table.</p>
     * 
     * @param prizeIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.prize</code> table.
     * @since 1.1
     */
    public void setPrizeIdGenerator(IDGenerator prizeIdGenerator) {
        this.prizeIdGenerator = prizeIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.resource</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.resource</code> table.
     * @since 1.1
     */
    public IDGenerator getResourceIdGenerator() {
        return resourceIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.resource</code> table.</p>
     * 
     * @param resourceIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.resource</code> table.
     * @since 1.1
     */
    public void setResourceIdGenerator(IDGenerator resourceIdGenerator) {
        this.resourceIdGenerator = resourceIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.upload</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.upload</code> table.
     * @since 1.1
     */
    public IDGenerator getUploadIdGenerator() {
        return uploadIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.upload</code> table.</p>
     * 
     * @param uploadIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.upload</code> table.
     * @since 1.1
     */
    public void setUploadIdGenerator(IDGenerator uploadIdGenerator) {
        this.uploadIdGenerator = uploadIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.submission</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.submission</code> table.
     * @since 1.1
     */
    public IDGenerator getSubmissionIdGenerator() {
        return submissionIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.submission</code> table.</p>
     * 
     * @param submissionIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.submission</code> table.
     * @since 1.1
     */
    public void setSubmissionIdGenerator(IDGenerator submissionIdGenerator) {
        this.submissionIdGenerator = submissionIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.submission_declaration</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.submission_declaration</code> table.
     * @since 1.1
     */
    public IDGenerator getSubmissionDeclarationIdGenerator() {
        return submissionDeclarationIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.submission_declaration</code> table.</p>
     * 
     * @param submissionDeclarationIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.submission_declaration</code> table.
     * @since 1.1
     */
    public void setSubmissionDeclarationIdGenerator(IDGenerator submissionDeclarationIdGenerator) {
        this.submissionDeclarationIdGenerator = submissionDeclarationIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.submission_external_content</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.submission_external_content</code> table.
     * @since 1.1
     */
    public IDGenerator getExternalContentIdGenerator() {
        return externalContentIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.submission_external_content</code> table.</p>
     * 
     * @param externalContentIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.submission_external_content</code> table.
     * @since 1.1
     */
    public void setExternalContentIdGenerator(IDGenerator externalContentIdGenerator) {
        this.externalContentIdGenerator = externalContentIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.external_content_property</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.external_content_property</code> table.
     * @since 1.1
     */
    public IDGenerator getExternalContentPropertyIdGenerator() {
        return externalContentPropertyIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.external_content_property</code> table.</p>
     * 
     * @param externalContentPropertyIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.external_content_property</code> table.
     * @since 1.1
     */
    public void setExternalContentPropertyIdGenerator(IDGenerator externalContentPropertyIdGenerator) {
        this.externalContentPropertyIdGenerator = externalContentPropertyIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.review</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.review</code> table.
     * @since 1.1
     */
    public IDGenerator getReviewIdGenerator() {
        return reviewIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.review</code> table.</p>
     * 
     * @param reviewIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.review</code> table.
     * @since 1.1
     */
    public void setReviewIdGenerator(IDGenerator reviewIdGenerator) {
        this.reviewIdGenerator = reviewIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.review_item</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.review_item</code> table.
     * @since 1.1
     */
    public IDGenerator getReviewItemIdGenerator() {
        return reviewItemIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.review_item</code> table.</p>
     * 
     * @param reviewItemIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.review_item</code> table.
     * @since 1.1
     */
    public void setReviewItemIdGenerator(IDGenerator reviewItemIdGenerator) {
        this.reviewItemIdGenerator = reviewItemIdGenerator;
    }

    /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.review_item_comment</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.review_item_comment</code> table.
     * @since 1.1
     */
    public IDGenerator getReviewItemCommentIdGenerator() {
        return reviewItemCommentIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.review_item_comment</code> table.</p>
     * 
     * @param reviewItemCommentIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.review_item_comment</code> table.
     * @since 1.1
     */
    public void setReviewItemCommentIdGenerator(IDGenerator reviewItemCommentIdGenerator) {
        this.reviewItemCommentIdGenerator = reviewItemCommentIdGenerator;
    }

     /**
     * <p>Gets the generator for IDs for records inserted into <code>tcs_catalog.contest_sale</code> table.</p>
     * 
     * @return a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.contest_sale</code> table.
     * @since 1.1
     */
    public IDGenerator getContestSaleIdGenerator() {
        return contestSaleIdGenerator;
    }

    /**
     * <p>Sets the generator for IDs for records inserted into <code>tcs_catalog.contest_sale</code> table.</p>
     * 
     * @param contestSaleIdGenerator a <code>IDGenerator</code> providing the generator for IDs for records inserted into
     *          <code>tcs_catalog.contest_sale</code> table.
     * @since 1.1
     */
    public void setContestSaleIdGenerator(IDGenerator contestSaleIdGenerator) {
        this.contestSaleIdGenerator = contestSaleIdGenerator;
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
     * <p>Gets the ID of screening scorecard question.</p>
     *
     * @return a <code>long</code> providing the ID of screening scorecard question.
     * @since 1.1
     */
    public long getScreeningScorecardQuestionId() {
        return screeningScorecardQuestionId;
    }

    /**
     * <p>Sets the ID of screening scorecard question.</p>
     *
     * @param screeningScorecardQuestionId a <code>long</code> providing the ID of screening scorecard question.
     * @since 1.1
     */
    public void setScreeningScorecardQuestionId(long screeningScorecardQuestionId) {
        this.screeningScorecardQuestionId = screeningScorecardQuestionId;
    }

    /**
     * <p>Gets the ID of review scorecard question.</p>
     *
     * @return a <code>long</code> providing the ID of review scorecard question.
     * @since 1.1
     */
    public long getReviewScorecardQuestionId() {
        return reviewScorecardQuestionId;
    }

    /**
     * <p>Sets the ID of review scorecard question.</p>
     *
     * @param reviewScorecardQuestionId a <code>long</code> providing the ID of review scorecard question.
     * @since 1.1
     */
    public void setReviewScorecardQuestionId(long reviewScorecardQuestionId) {
        this.reviewScorecardQuestionId = reviewScorecardQuestionId;
    }

    /**
     * <p>Gets the ID of milestone screening scorecard question.</p>
     *
     * @return a <code>long</code> providing the ID of milestone screening scorecard question.
     * @since 1.1
     */
    public long getMilestoneScreeningScorecardQuestionId() {
        return milestoneScreeningScorecardQuestionId;
    }

    /**
     * <p>Sets the ID of milestone screening scorecard question.</p>
     *
     * @param milestoneScreeningScorecardQuestionId a <code>long</code> providing the ID of milestone screening scorecard question.
     * @since 1.1
     */
    public void setMilestoneScreeningScorecardQuestionId(long milestoneScreeningScorecardQuestionId) {
        this.milestoneScreeningScorecardQuestionId = milestoneScreeningScorecardQuestionId;
    }

    /**
     * <p>Gets the ID of milestone review scorecard question.</p>
     *
     * @return a <code>long</code> providing the ID of milestone review scorecard question.
     * @since 1.1
     */
    public long getMilestoneReviewScorecardQuestionId() {
        return milestoneReviewScorecardQuestionId;
    }

    /**
     * <p>Sets the ID of milestone review scorecard question.</p>
     *
     * @param milestoneScreeningScorecardQuestionId a <code>long</code> providing the ID of milestone review scorecard question.
     * @since 1.1
     */
    public void setMilestoneReviewScorecardQuestionId(long milestoneReviewScorecardQuestionId) {
        this.milestoneReviewScorecardQuestionId = milestoneReviewScorecardQuestionId;
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
            setScreeningScorecardQuestionId(parseLongParameter(params, SCREENING_SCORECARD_QUESTION_ID_PARAM_NAME));
            setReviewScorecardQuestionId(parseLongParameter(params, REVIEW_SCORECARD_QUESTION_ID_PARAM_NAME));
            setMilestoneScreeningScorecardQuestionId(parseLongParameter(params, MILESTONE_SCREENING_SCORECARD_QUESTION_ID_PARAM_NAME));
            setMilestoneReviewScorecardQuestionId(parseLongParameter(params, MILESTONE_REVIEW_SCORECARD_QUESTION_ID_PARAM_NAME));
            setSoftwareDocumentsRoot((String) params.get(SOFTWARE_DOCUMENTS_ROOT_PARAM_NAME));
            setStudioSubmissionssRoot((String) params.get(STUDIO_SUBMISSIONS_ROOT_PARAM_NAME));
            setProjectIdGenerator(IDGeneratorFactory.getIDGenerator("project_id_seq"));
            setPhaseIdGenerator(IDGeneratorFactory.getIDGenerator("project_phase_id_seq"));
            setComponentIdGenerator(IDGeneratorFactory.getIDGenerator("COMPONENT_SEQ"));
            setComponentVersionIdGenerator(IDGeneratorFactory.getIDGenerator("COMPVERSION_SEQ"));
            setComponentCategoriesIdGenerator(IDGeneratorFactory.getIDGenerator("COMPCATEGORY_SEQ"));
            setDocumentIdGenerator(IDGeneratorFactory.getIDGenerator("COMPDOCUMENT_SEQ"));
            setProjectStudioSpecIdGenerator(IDGeneratorFactory.getIDGenerator("studio_spec_id_seq"));
            setPrizeIdGenerator(IDGeneratorFactory.getIDGenerator("prize_id_seq"));
            setResourceIdGenerator(IDGeneratorFactory.getIDGenerator("resource_id_seq"));
            setUploadIdGenerator(IDGeneratorFactory.getIDGenerator("upload_id_seq"));
            setSubmissionIdGenerator(IDGeneratorFactory.getIDGenerator("submission_id_seq"));
            setSubmissionDeclarationIdGenerator(IDGeneratorFactory.getIDGenerator("submission_declaration_id_seq"));
            setExternalContentIdGenerator(IDGeneratorFactory.getIDGenerator("external_content_id_seq"));
            setExternalContentPropertyIdGenerator(IDGeneratorFactory.getIDGenerator("external_content_property_id_seq"));
            setReviewIdGenerator(IDGeneratorFactory.getIDGenerator("review_id_seq"));
            setReviewItemIdGenerator(IDGeneratorFactory.getIDGenerator("review_item_id_seq"));
            setReviewItemCommentIdGenerator(IDGeneratorFactory.getIDGenerator("review_item_comment_id_seq"));
            setContestSaleIdGenerator(IDGeneratorFactory.getIDGenerator("contest_sale_id_seq"));

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
            targetConnection.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
            
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
        PreparedStatement selectContestSpecStmt = null;
        PreparedStatement insertComponentStmt = null;
        PreparedStatement insertComponentVersionStmt = null;
        PreparedStatement insertComponentCategoriesStmt = null;
        PreparedStatement insertProjectStmt = null;
        PreparedStatement insertProjectInfoStmt = null;
        PreparedStatement insertPhaseStmt = null;
        PreparedStatement insertPhaseCriteriaStmt = null;
        PreparedStatement insertPhaseDependencyStmt = null;
        PreparedStatement selectContestFileTypesStmt = null;
        PreparedStatement insertProjectFileTypeStmt = null;
        PreparedStatement selectContestDocumentsStmt = null;
        PreparedStatement insertCompDocumentationStmt = null;
        PreparedStatement insertProjectStudioSpecStmt = null;
        PreparedStatement selectPrizesStmt = null;
        PreparedStatement insertPrizeStmt = null;
        PreparedStatement insertProjectPrizeXrefStmt = null;
        PreparedStatement selectContestRegistrationsStmt = null;
        PreparedStatement insertResourceStmt = null;
        PreparedStatement insertResourceInfoStmt = null;
        PreparedStatement selectSubmissionStmt = null;
        PreparedStatement insertResourceSubmissionStmt = null;
        PreparedStatement insertUploadStmt = null;
        PreparedStatement insertSubmissionStmt = null;
        PreparedStatement selectSubmissionDeclarationStmt = null;
        PreparedStatement insertSubmissionDeclarationStmt = null;
        PreparedStatement selectSubmissionImageStmt = null;
        PreparedStatement insertSubmissionImageStmt = null;
        PreparedStatement insertSubmissionExternalContentStmt = null;
        PreparedStatement insertExternalContentPropertyStmt = null;
        PreparedStatement insertReviewStmt = null;
        PreparedStatement insertReviewItemStmt = null;
        PreparedStatement insertReviewItemCommentStmt = null;
        PreparedStatement selectContestPaymentStmt = null;
        PreparedStatement insertContestSaleStmt = null;
        ResultSet selectedContestsResult = null;
        PreparedStatement updatePaymentDetailsStmt = null;
        PreparedStatement updateDrPointsStmt = null;
        Map<Long, Prize> contestPrizes = new HashMap<Long, Prize>();
        List<Prize> milestonePrizes = new ArrayList<Prize>();
        
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
            selectContestFileTypesStmt = prepareStatement(SELECT_CONTEST_FILE_TYPES_SQL, SOURCE_DB);
            insertProjectFileTypeStmt = prepareStatement(INSERT_PROJECT_FILE_TYPES_SQL, TARGET_DB);
            selectContestDocumentsStmt = prepareStatement(SELECT_STUDIO_CONTEST_DOCUMENTS_SQL, SOURCE_DB);
            insertCompDocumentationStmt = prepareStatement(INSERT_COMP_DOCUMENTATION_SQL, TARGET_DB);
            insertProjectStudioSpecStmt = prepareStatement(INSERT_PROJECT_STUDIO_SPECIFICATION_SQL, TARGET_DB);
            selectPrizesStmt = prepareStatement(SELECT_PRIZE_SQL, SOURCE_DB);
            insertPrizeStmt = prepareStatement(INSERT_PRIZE_SQL, TARGET_DB);
            insertProjectPrizeXrefStmt = prepareStatement(INSERT_PROJECT_PRIZE_XREF_SQL, TARGET_DB);
            selectContestRegistrationsStmt = prepareStatement(SELECT_CONTEST_REGISTRATION_SQL, SOURCE_DB);
            insertResourceStmt = prepareStatement(INSERT_RESOURCE_SQL, TARGET_DB);
            insertResourceInfoStmt = prepareStatement(INSERT_RESOURCE_INFO_SQL, TARGET_DB);
            selectContestSpecStmt = prepareStatement(SELECT_CONTEST_SPECIFICATION_SQL, SOURCE_DB);
            selectSubmissionStmt = prepareStatement(SELECT_SUBMISSION_SQL, SOURCE_DB);
            insertResourceSubmissionStmt = prepareStatement(INSERT_RESOURCE_SUBMISSION_SQL, TARGET_DB);
            insertUploadStmt = prepareStatement(INSERT_UPLOAD_SQL, TARGET_DB);
            insertSubmissionStmt = prepareStatement(INSERT_SUBMISSION_SQL, TARGET_DB);
            selectSubmissionDeclarationStmt = prepareStatement(SELECT_SUBMISSION_DECLARATION_SQL, SOURCE_DB);
            insertSubmissionDeclarationStmt = prepareStatement(INSERT_SUBMISSION_DECLARATION_SQL, TARGET_DB);
            selectSubmissionImageStmt = prepareStatement(SELECT_SUBMISSION_IMAGE_SQL, SOURCE_DB);
            insertSubmissionImageStmt = prepareStatement(INSERT_SUBMISSION_IMAGE_SQL, TARGET_DB);
            insertSubmissionExternalContentStmt = prepareStatement(INSERT_SUBMISSION_EXTERNAL_CONTENT_SQL, TARGET_DB);
            insertExternalContentPropertyStmt = prepareStatement(INSERT_EXTERNAL_CONTENT_PROPERTY_SQL, TARGET_DB);
            insertReviewStmt = prepareStatement(INSERT_REVIEW_SQL, TARGET_DB);
            insertReviewItemStmt = prepareStatement(INSERT_REVIEW_ITEM_SQL, TARGET_DB);
            insertReviewItemCommentStmt = prepareStatement(INSERT_REVIEW_ITEM_COMMENT_SQL, TARGET_DB);
            selectContestsStmt = getSelectContestsStatement();
            updatePaymentDetailsStmt = prepareStatement(UPDATE_PAYMENT_INFO_SQL, TARGET_DB);
            updateDrPointsStmt = prepareStatement(UPDATE_DR_POINTS_SQL, TARGET_DB);
            selectContestPaymentStmt = prepareStatement(SELECT_CONTEST_PAYMENT_SQL, SOURCE_DB);
            insertContestSaleStmt = prepareStatement(INSERT_CONTEST_SALE_SQL, TARGET_DB);
            
            // Get the contests for migration and migrate each contest in a single separate transaction
            selectedContestsResult = selectContestsStmt.executeQuery();

            long count = 0;
            long failedCount = 0;

            while (selectedContestsResult.next()) {
                Long contestStatusId = getLong(selectedContestsResult, "contest_status_id");
                Long contestDetailedStatusId = getLong(selectedContestsResult, "contest_detailed_status_id");
                Long contestTypeId = getLong(selectedContestsResult, "contest_type_id");
                long contestId = selectedContestsResult.getLong("contest_id");

                if (STATUS_MAPPING.containsKey(contestStatusId)) {
                    if (PROJECT_CATEGORY_MAPPING.containsKey(contestTypeId)) {
                        try {
                            startActivityRecording("Data migration for Studio contest " + contestId 
                                                   + " to Online Review project ");

                            Long contestCreateUserId = getLong(selectedContestsResult, "create_user_id");
                            String contestCreateUserHandle = selectedContestsResult.getString("create_user_handle");
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
                            String drpoints = selectedContestsResult.getString("dr_points");
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
                            insertRecord(insertComponentStmt, "comp_catalog");
                            
                            // project_category_id
                            Long projectCategoryId = PROJECT_CATEGORY_MAPPING.get(contestTypeId);
                            
                            // Insert into tcs_catalog.comp_versions
                            long newComponentVersionId = getComponentVersionIdGenerator().getNextID();
                            insertComponentVersionStmt.clearParameters();
                            insertComponentVersionStmt.setLong(1, newComponentVersionId);
                            insertComponentVersionStmt.setLong(2, newComponentId);
                            insertComponentVersionStmt.setTimestamp(3, contestStartTime);
                            // phase_id
                            insertComponentVersionStmt.setLong(4, PROJECT_CATEGORY_PHASE_MAPPING.get(projectCategoryId));
                            insertComponentVersionStmt.setTimestamp(5, contestStartTime);
                            insertComponentVersionStmt.setTimestamp(6, contestStartTime);
                            insertRecord(insertComponentVersionStmt, "comp_versions");

                            // Insert into tcs_catalog.comp_categories
                            long newComponentCategoriesId = getComponentCategoriesIdGenerator().getNextID();
                            insertComponentCategoriesStmt.clearParameters();
                            insertComponentCategoriesStmt.setLong(1, newComponentCategoriesId);
                            insertComponentCategoriesStmt.setLong(2, newComponentId);
                            insertRecord(insertComponentCategoriesStmt, "comp_categories");
                            
                            // Insert into tcs_catalog.project_studio_specification
                            selectContestSpecStmt.clearParameters();
                            selectContestSpecStmt.setLong(1, contestId);
                            ResultSet selectedContestSpecResult = selectContestSpecStmt.executeQuery();
                            long newProjectStudioSpecId = 0;
                            try {
                                if (!selectedContestSpecResult.next()) {
                                    throw new StudioContestMigrationException("Cannot find contest specification for contest: " + contestId);
                                }
                                newProjectStudioSpecId = getProjectStudioSpecIdGenerator().getNextID();
                                insertProjectStudioSpecStmt.clearParameters();
                                insertProjectStudioSpecStmt.setLong(1, newProjectStudioSpecId);
                                insertProjectStudioSpecStmt.setString(2, selectedContestSpecResult.getString("goals"));
                                insertProjectStudioSpecStmt.setString(3, selectedContestSpecResult.getString("target_audience"));
                                insertProjectStudioSpecStmt.setString(4, selectedContestSpecResult.getString("branding_guidelines"));
                                insertProjectStudioSpecStmt.setString(5, selectedContestSpecResult.getString("disliked_design_websites"));
                                insertProjectStudioSpecStmt.setString(6, selectedContestSpecResult.getString("other_instructions"));
                                insertProjectStudioSpecStmt.setString(7, selectedContestSpecResult.getString("winning_criteria"));
                                insertProjectStudioSpecStmt.setString(8, selectedContestSpecResult.getString("round_one_introduction"));
                                insertProjectStudioSpecStmt.setString(9, selectedContestSpecResult.getString("round_two_introduction"));
                                insertProjectStudioSpecStmt.setString(10, selectedContestSpecResult.getString("colors"));
                                insertProjectStudioSpecStmt.setString(11, selectedContestSpecResult.getString("fonts"));
                                insertProjectStudioSpecStmt.setString(12, selectedContestSpecResult.getString("layout_and_size"));
                                insertProjectStudioSpecStmt.setString(13, selectedContestSpecResult.getString("contest_introduction"));
                                insertProjectStudioSpecStmt.setString(14, selectedContestSpecResult.getString("contest_description"));
                                insertProjectStudioSpecStmt.setString(15, selectedContestSpecResult.getString("content_requirements"));
                                insertProjectStudioSpecStmt.setString(16, selectedContestSpecResult.getString("general_feedback_text"));
                                insertProjectStudioSpecStmt.setLong(17, contestCreateUserId);
                                insertProjectStudioSpecStmt.setTimestamp(18, contestStartTime);
                                insertProjectStudioSpecStmt.setLong(19, contestCreateUserId);
                                insertProjectStudioSpecStmt.setTimestamp(20, contestStartTime);
                                insertRecord(insertProjectStudioSpecStmt, "project_studio_specification");
                            } finally {
                                close(selectedContestSpecResult);
                            }
                            
                            // Insert into tcs_catalog.project
                            long newProjectId = getProjectIdGenerator().getNextID();
                            insertProjectStmt.clearParameters();
                            insertProjectStmt.setLong(1, newProjectId);
                            if (contestStatusId == 2) {
                                if (contestDetailedStatusId == null)
                                {
                                    contestDetailedStatusId = 8L;
                                }
                                insertProjectStmt.setLong(2, DETAILED_STATUS_MAPPING.get(contestDetailedStatusId));
                            } else {
                                if (contestDetailedStatusId == null)
                                {
                                    contestDetailedStatusId = 17L;
                                }
                                insertProjectStmt.setLong(2, STATUS_MAPPING.get(contestStatusId));
                            }
                            insertProjectStmt.setLong(3, projectCategoryId);
                            insertProjectStmt.setLong(4, newProjectStudioSpecId);
                            if (tcDirectProjectId == null) {
                                insertProjectStmt.setNull(5, Types.DECIMAL);
                            } else {
                                insertProjectStmt.setLong(5, tcDirectProjectId);
                            }
                            insertProjectStmt.setLong(6, contestCreateUserId);
                            insertProjectStmt.setTimestamp(7, contestStartTime);
                            insertProjectStmt.setLong(8, contestCreateUserId);
                            insertProjectStmt.setTimestamp(9, contestStartTime);
                            insertRecord(insertProjectStmt, "project");
                            
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
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 5, "26887152", 
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
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 26, "On", 
                                                    contestCreateUserId, contestStartTime); // Digital Run flag
                            // Old Studio Contest Id
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 50, String.valueOf(contestId), contestCreateUserId, contestStartTime);
                            // Viewable Submissions Flag
                            String viewableSubmissionsFlag = selectedContestsResult.getString("viewable_submissions_flag");
                            if (viewableSubmissionsFlag != null) {
                                insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 53, viewableSubmissionsFlag,
                                        contestCreateUserId, contestStartTime);
                            }

                             // complated, set completion timestamp to winner annoucement date
                            if (contestDetailedStatusId == 8)
                            {
                                insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 21, PROJECT_INFO_COMPLETION_DATE_FORMAT.format(new Date(contestWinnerAnnouncementTime.getTime())), 
                                                    contestCreateUserId, contestStartTime); // Completion Timestamp
                            }

                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 22, PROJECT_INFO_COMPLETION_DATE_FORMAT.format(new Date(contestEndTime.getTime())), 
                                                    contestCreateUserId, contestStartTime); // Rating Timestamp
                            
                            if (adminFee != null) {
                                insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 31, adminFee, 
                                                        contestCreateUserId, contestStartTime); // Admin Fee
                            }
                            if (billingProjectId != null) {
                                insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 32, billingProjectId, 
                                                        contestCreateUserId, contestStartTime); // Billing Project
                            }

                            if (drpoints != null)
                            {
                                 insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 30, drpoints, 
                                                        contestCreateUserId, contestStartTime); // DR points
                            }

                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 41, "No", 
                                                    contestCreateUserId, contestStartTime); // Approval Required
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 43, "Yes", 
                                                    contestCreateUserId, contestStartTime); // Send Winner Emails
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 44, "No", 
                                                    contestCreateUserId, contestStartTime); // Post-Mortem Required
                            insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 46, "true", 
                                                    contestCreateUserId, contestStartTime); // Member Payments Eligible
                           

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
                            if (contestDetailedStatusId == 11 || contestDetailedStatusId == 13)
                            {
                                screeningPhaseStatusId = SCHEDULED;
                            }
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
                            if (contestDetailedStatusId == 11 || contestDetailedStatusId == 13)
                            {
                                reviewPhaseStatusId = SCHEDULED;
                            }
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
                            long milestoneReviewPhaseId = 0;
                            long milestoneScreeningPhaseId = 0;
                            long milestoneScreeningPhaseStatusId = 0;
                            long milestoneReviewPhaseStatusId = 0;
                            Timestamp contestMilestoneTimePlus1Minute  = null;
                            Timestamp contestMilestoneTimePlus1Day = null;
                            if (isMultiRoundContest) {
                                long oneDayDuration = 24 * 60 * 60 * 1000L;
                                long contestMilestoneDuration 
                                    = contestMilestoneTime.getTime() - contestStartTime.getTime();
                                contestMilestoneTimePlus1Minute 
                                    = new Timestamp(contestMilestoneTime.getTime() + oneMinuteDuration);
                                contestMilestoneTimePlus1Day 
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
                                milestoneScreeningPhaseStatusId 
                                    = selectedContestsResult.getLong("milestone_screening_phase_status");
                                milestoneScreeningPhaseId 
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
                                milestoneReviewPhaseStatusId 
                                    = selectedContestsResult.getLong("milestone_review_phase_status");
                                milestoneReviewPhaseId 
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

                            // load Component Documentation
                            loadCompDocumentations(selectContestDocumentsStmt, insertCompDocumentationStmt, contestId, newComponentVersionId, newComponentId);
                            
                            // load Project File Types
                            selectContestFileTypesStmt.clearParameters();
                            selectContestFileTypesStmt.setLong(1, contestId);
                            ResultSet selectedContestFileTypesResult = selectContestFileTypesStmt.executeQuery();
                            try {
                                while (selectedContestFileTypesResult.next()) {
                                    insertProjectFileTypeStmt.clearParameters();
                                    insertProjectFileTypeStmt.setLong(1, newProjectId);
                                    insertProjectFileTypeStmt.setLong(2, selectedContestFileTypesResult.getLong("file_type_id"));
                                    insertRecord(insertProjectFileTypeStmt, "project_file_type_xref");
                                }
                            } finally {
                                close(selectedContestFileTypesResult);
                            }
                            
                            // Get prizes
                            getPrizes(selectPrizesStmt, contestId, contestPrizes, milestonePrizes);
                            
                            // Load contest prizes to tcs_catalog.prize table
                            for (Map.Entry<Long, Prize> entry : contestPrizes.entrySet()) {
                                Prize prize = (Prize) entry.getValue();
                                insertSinglePrize(insertPrizeStmt, insertProjectPrizeXrefStmt, newProjectId, contestCreateUserId, prize);

                                if (prize.place == 1)
                                {
                                    insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 16, prize.prizeAmount.toString(), 
                                                    contestCreateUserId, contestStartTime); 
                                    
                                    insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 36, prize.prizeAmount.toString(), 
                                                    contestCreateUserId, contestStartTime); 
                                }

                                if (prize.place == 2)
                                {
                                    insertSingleProjectInfo(insertProjectInfoStmt, newProjectId, 37, prize.prizeAmount.toString(), 
                                                    contestCreateUserId, contestStartTime); 
                                }
                            }
                            if (isMultiRoundContest) { 
                        
                                insertSinglePrize(insertPrizeStmt, insertProjectPrizeXrefStmt, newProjectId, contestCreateUserId, (Prize)milestonePrizes.get(0));
                                
                            }
                            
                            Map<Long, Long> submitterResources = new HashMap<Long, Long>();
                            // Load submitters
                            selectContestRegistrationsStmt.clearParameters();
                            selectContestRegistrationsStmt.setLong(1, contestId);
                            ResultSet selectedContestRegistrationsResult = selectContestRegistrationsStmt.executeQuery();
                            try {
                                while (selectedContestRegistrationsResult.next()) {
                                    long userId = selectedContestRegistrationsResult.getLong("user_id");
                                    submitterResources.put(userId, insertSingleResource(insertResourceStmt, insertResourceInfoStmt,
                                            userId, selectedContestRegistrationsResult.getString("handle"),
                                            SUBMITTER_RESOURCE_ROLE_ID, newProjectId, -1, contestCreateUserId,
                                            selectedContestRegistrationsResult.getTimestamp("create_date"),
                                            selectedContestRegistrationsResult.getDouble("prizes"), contestStartTime));
                                }
                            } finally {
                                close(selectedContestRegistrationsResult);
                            }
                            
                            // Load Reviewer resource
                            long reviewerResource = insertSingleResource(insertResourceStmt, insertResourceInfoStmt, contestCreateUserId, contestCreateUserHandle,
                                    REVIEWER_RESOURCE_ROLE_ID, newProjectId, reviewPhaseId, contestCreateUserId, null, 0, contestStartTime);
                            Long screenerUserId = getLong(selectedContestsResult, "milestone_screener_id");
                            String screenerUserHandler = selectedContestsResult.getString("milestone_screener_handle");
                            if (screenerUserId == null) {
                                screenerUserId = contestCreateUserId;
                                screenerUserHandler = contestCreateUserHandle;
                            }
                            // Load Screener resource
                            long screenerResource = 0;
                            if (screenerUserId != null) {
                                screenerResource = insertSingleResource(insertResourceStmt, insertResourceInfoStmt, screenerUserId, screenerUserHandler,
                                        PRIMARY_SCREENER_RESOURCE_ROLE_ID, newProjectId, screeningPhaseId, contestCreateUserId, null, 0, contestStartTime);
                            }
                            // Load Milestone Screener resource
                            long milestoneScreenerResource = 0;
                            if (screenerUserId != null && isMultiRoundContest) {
                                milestoneScreenerResource = insertSingleResource(insertResourceStmt, insertResourceInfoStmt, screenerUserId, screenerUserHandler,
                                        MILESTONE_SCREENER_RESOURCE_ROLE_ID, newProjectId, milestoneScreeningPhaseId, contestCreateUserId, null, 0, contestStartTime);
                            }
                            long milestoneReviewerResource = 0;
                            if (isMultiRoundContest) {
                                // Load Milestone Reviewer Resource
                                milestoneReviewerResource = insertSingleResource(insertResourceStmt, insertResourceInfoStmt, contestCreateUserId, contestCreateUserHandle,
                                        MILESTONE_REVIEWER_RESOURCE_ROLE_ID, newProjectId, milestoneReviewPhaseId, contestCreateUserId, null, 0, contestStartTime);
                            }

                            Map<String, String> submissionMap = new HashMap<String, String>();
                            
                            // Load submissions
                            List<Submission> submissions = getContestSubmissions(selectSubmissionStmt, contestId, contestMilestoneTime, contestPrizes, milestonePrizes);
                            for (Submission sub : submissions) {
                                // Load basic submission data
                                insertSingleSubmission(insertUploadStmt, insertSubmissionStmt, insertResourceSubmissionStmt, sub, newProjectId,
                                        submitterResources.get(sub.submitterId), contestPrizes, milestonePrizes);
                                
                                // Load submission declaration data
                                insertSubmissionDeclaration(selectSubmissionDeclarationStmt, insertSubmissionDeclarationStmt,
                                       insertSubmissionExternalContentStmt, insertExternalContentPropertyStmt, sub);

                                // Load submission image data
                                insertSubmissionImage(selectSubmissionImageStmt, insertSubmissionImageStmt, sub);
                                
                                // Create review for active submission
                                if (ACTIVE_SUBMISSION_STATUS_ID == SUBMISSION_STATUS_MAPPING.get(sub.submissionStatusId)) {
                                    // only create review for active submission
                                    if (CONTEST_SUBMISSISON_TYPE_ID == SUBMISSION_TYPE_MAPPING.get(sub.submissionTypeId)) {
                                        // contest submission
                                        if (screeningPhaseStatusId == CLOSED) {
                                            // create review for Screening phase
                                            insertSubmissionReview(insertReviewStmt, insertReviewItemStmt, insertReviewItemCommentStmt, sub,
                                                    screenerResource, screenerUserId, screeningScorecardId, screeningScorecardQuestionId,
                                                    sub.passedScreening ? 100.0 : 0, contestEndTimePlus1Minute, SCREENING_PHASE_TYPE_ID);
                                        }
                                        if (reviewPhaseStatusId == CLOSED) {
                                            // create review for Review phase
                                            insertSubmissionReview(insertReviewStmt, insertReviewItemStmt, insertReviewItemCommentStmt, sub,
                                                    reviewerResource, contestCreateUserId, reviewScorecardId, reviewScorecardQuestionId,
                                                    sub.score, contestWinnerAnnouncementTime, REVIEW_PHASE_TYPE_ID);
                                        }
                                    } else if (isMultiRoundContest) {
                                        // milestone submission
                                        if (milestoneScreeningPhaseStatusId == CLOSED) {
                                            // create review for Milestone Screening phase
                                            insertSubmissionReview(insertReviewStmt, insertReviewItemStmt, insertReviewItemCommentStmt, sub,
                                                    milestoneScreenerResource, screenerUserId, milestoneScreeningScorecardId, milestoneScreeningScorecardQuestionId,
                                                    sub.passedScreening ? 100.0 : 0, contestMilestoneTimePlus1Minute, MILESTONE_SCREENING_PHASE_TYPE_ID);
                                        }
                                        if (milestoneReviewPhaseStatusId == CLOSED) {
                                            // create review for Milestone Review phase
                                            insertSubmissionReview(insertReviewStmt, insertReviewItemStmt, insertReviewItemCommentStmt, sub,
                                                    milestoneReviewerResource, contestCreateUserId, milestoneReviewScorecardId, milestoneReviewScorecardQuestionId,
                                                    sub.score, contestMilestoneTimePlus1Day, MILESTONE_REVIEW_PHASE_TYPE_ID);
                                        }
                                    }
                                }
                                submissionMap.put(sub.originalSubmissionId.toString(), sub.newSubmissionId.toString());

                            }


                            copyContestPayment(selectContestPaymentStmt, insertContestSaleStmt, contestId, newProjectId);

                            // update payment details
                            updatePaymentDetailsStmt.clearParameters();
                            updatePaymentDetailsStmt.setLong(1, newProjectId);
                            updatePaymentDetailsStmt.setLong(2, contestId);
                            updateRecord(updatePaymentDetailsStmt, "informixoltp:payment_detail");
                            
                            //update digital run points
                            updateDrPointsStmt.clearParameters();
                            updateDrPointsStmt.setLong(1, newProjectId);
                            updateDrPointsStmt.setLong(2, contestId);
                            updateRecord(updateDrPointsStmt, "dr_points");

                            String submissionSrc = getStudioSubmissionsRoot() + System.getProperty("file.separator") + contestId;
                            String submissionDest = getStudioSubmissionsRoot() + System.getProperty("file.separator") + newProjectId;

                            File srcFolder = new File (submissionSrc);
                            File destFolder = new File (submissionDest);

                            // Commit entire transaction for migrated contest
                            getOpenConnection(TARGET_DB).commit();

                            if (srcFolder.exists())
                            {
                                copyFolder(srcFolder,destFolder, submissionMap);                 
                            }

                            
                                     
                            // If everything went smoothly then append ID of converted project to log messages
                            Object[] currentActivity = this.activities.peek();
                            currentActivity[0] = (String) currentActivity[0] + newProjectId;
                            count++;
                            
                        } catch (Exception e) {  failedCount++;
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
            }  System.out.println("Processed " +count +" contests, failed = " + failedCount);
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
            close(selectContestSpecStmt);
            close(selectContestFileTypesStmt);
            close(insertProjectFileTypeStmt);
            close(insertCompDocumentationStmt);
            close(selectContestDocumentsStmt);
            close(insertProjectStudioSpecStmt);
            close(selectPrizesStmt);
            close(insertPrizeStmt);
            close(insertProjectPrizeXrefStmt);
            close(selectContestRegistrationsStmt);
            close(insertResourceStmt);
            close(insertResourceInfoStmt);
            close(selectSubmissionStmt);
            close(insertResourceSubmissionStmt);
            close(insertUploadStmt);
            close(insertSubmissionStmt);
            close(selectSubmissionDeclarationStmt);
            close(insertSubmissionDeclarationStmt);
            close(insertSubmissionImageStmt);
            close(insertSubmissionExternalContentStmt);
            close(insertExternalContentPropertyStmt);
            close(insertReviewStmt);
            close(insertReviewItemStmt);
            close(insertReviewItemCommentStmt);
            close(updatePaymentDetailsStmt);
            close(updateDrPointsStmt);
            close(selectContestPaymentStmt);
            close(insertContestSaleStmt);
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
        insertRecord(insertPhaseStmt, "project_phase");
        
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
        insertRecord(insertProjectInfoStmt, "project_info");
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
        insertRecord(insertPhaseCriteriaStmt, "phase_criteria");
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
        insertRecord(insertPhaseDependencyStmt, "phase_dependency");
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
                                           "c.contest_status_id, c.contest_detailed_status_id, c.forum_id, c.contest_type_id, " +
                                           "c.tc_direct_project_id, c.create_user_id, u.handle as create_user_handle, c.winner_announcement_time, " +
                                           "c.is_multi_round, " +
                                           "(cast(nvl(fee.property_value, '0') as varchar(255))) admin_fee, " +
                                           "(cast(nvl(billing.property_value, '0') as varchar(255))) billing_project_id, " +
                                           "descr.property_value AS description, " +
                                           "multiround.milestone_date, " +
                                           "(cast(nvl(viewable_submissions_flag_r.property_value, '0') as varchar(255))) viewable_submissions_flag, " +
                                           "(cast(nvl(viewable_submitters_r.property_value, '0') as varchar(255))) viewable_submitters, " +
                                           "ms.reviewer_id AS milestone_screener_id," +
                                           "ms.handle AS milestone_screener_handle," +
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
                                           "END AS milestone_review_phase_status, " +
                                           "(cast(nvl(drpoints.property_value, '0') as varchar(255))) dr_points " + 
                                           "FROM contest c " +
                                           "LEFT JOIN contest_config fee ON c.contest_id = fee.contest_id " +
                                           "     AND fee.property_id = 25 " +
                                           "LEFT JOIN contest_config drpoints ON c.contest_id = drpoints.contest_id " +
                                           "     AND drpoints.property_id = 24 " +
                                           "LEFT JOIN contest_config billing ON c.contest_id = billing.contest_id " +
                                           "     AND billing.property_id = 28 " + 
                                           "LEFT JOIN contest_config descr ON c.contest_id = descr.contest_id " +
                                           "     AND descr.property_id = 1 " +  
                                           "LEFT JOIN contest_config viewable_submissions_flag_r ON c.contest_id = viewable_submissions_flag_r.contest_id " +
                                           "     AND viewable_submissions_flag_r.property_id = 3 " +
                                           "LEFT JOIN contest_config viewable_submitters_r ON c.contest_id = viewable_submitters_r.contest_id " +
                                           "     AND viewable_submitters_r.property_id = 9 " +
                                           "LEFT JOIN contest_multi_round_information multiround " +
                                           "     ON c.contest_multi_round_information_id " +
                                           "     = multiround.contest_multi_round_information_id " +
                                           "LEFT JOIN user u " +
                                           "     ON u.user_id = c.create_user_id " +
                                           "LEFT JOIN table(multiset(SELECT mcr.contest_id, mcr.reviewer_id, u.handle " +
                                           "           FROM table(multiset(SELECT s.contest_id, min(sr.reviewer_id) as reviewer_id " +
                                           "                 FROM submission s, submission_review sr " +
                                           "                 WHERE s.submission_id = sr.submission_id GROUP BY s.contest_id)) mcr " +
                                           "           LEFT JOIN user u ON mcr.reviewer_id = u.user_id )) ms " +
                                           "     ON ms.contest_id = c.contest_id ";
        boolean startDateSet = getStartDate() != null;
        boolean endDateSet = getEndDate() != null;
        boolean contestIdsSet = getContestIds() != null;
        
        if (startDateSet || endDateSet || contestIdsSet) {
            StringBuilder sql = new StringBuilder(SELECT_CONTESTS_SQL);
            sql.append("WHERE 1 = 1 ");
            if (startDateSet) {
                sql.append("AND c.end_time >= ? ");
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
    
    /**
     * <p>Loads the contest documents from <code>studio</code> database to <code>OnlineReview</code> database.
     *
     * @param selectContestDocumentsStmt the <code>PreparedStatement</code> to retrieve contest documents from
     * <code>studio</code> database.
     * @param insertCompDocumentationStmt the <code>PreparedStatement</code> to insert contest documents to
     * <code>Online Review</code> database.
     * @param contestId the contest id in <code>studio</code> database.
     * @param compVersId the comp_version_id in <code>Online Review</code> database.
     * @throws SQLException if an SQL error occurs.
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @since 1.1
     */
    private void loadCompDocumentations(PreparedStatement selectContestDocumentsStmt, PreparedStatement insertCompDocumentationStmt,
            long contestId, long compVersId, long componentId) throws SQLException, IDGenerationException, StudioContestMigrationException {
        ResultSet resultSet = null;
        
        String compVersIdString = String.valueOf(compVersId);
        String componentIdString = String.valueOf(componentId);

        File dir = new File(new File(softwareDocumentsRoot, componentIdString), compVersIdString);
        try {
            dir.mkdirs();
        } catch (SecurityException e) {
            // ignore
            LOGGER.error("Can't make diretory: " + dir.getAbsolutePath());
        }
        
        try {
            selectContestDocumentsStmt.clearParameters();
            selectContestDocumentsStmt.setLong(1, contestId);
            resultSet = selectContestDocumentsStmt.executeQuery();
            while (resultSet.next()) {
                String originalFileName = resultSet.getString("original_file_name");
                File sourceFile = new File(resultSet.getString("path"), resultSet.getString("system_file_name"));
                File destFile = new File(dir, originalFileName);
                try {
                    copyFile(sourceFile, destFile);
                } catch (Exception e) {
                    // ignore
                    LOGGER.error("Can't copy file from " + sourceFile.getAbsolutePath() + " to " + destFile.getAbsolutePath());
                }
                
                insertCompDocumentationStmt.clearParameters();
                // document_id
                insertCompDocumentationStmt.setLong(1, getDocumentIdGenerator().getNextID());
                // comp_vers_id
                insertCompDocumentationStmt.setLong(2, compVersId);
                // document_type_id
                insertCompDocumentationStmt.setLong(3, OTHER_DOCUMENT_TYPE_ID);
                // document_name
                insertCompDocumentationStmt.setString(4, resultSet.getString("document_type_desc"));
                // url
                insertCompDocumentationStmt.setString(5, componentIdString + "/" + compVersIdString + "/" + originalFileName);
                insertRecord(insertCompDocumentationStmt, "comp_documentation");
            }
        } finally {
            close(resultSet);
        }
    }
    
    /**
     * <p>Gets the <code>Contest Prize</code> and <code>Milestone Prize</code> for a specified contest
     * from <code>studio</code> database.</p>
     * 
     * @param selectPrizesStmt the <code>PreparedStatement</code> to retrieve prizes from <code>studio</code> database.
     * @param contestId the id of contest in <code>studio</code> database.
     * @param contestPrizes a <code>Map</code> providing the <code>Contest Prize</code>s for the contest.
     * @param milestonePrizes <code>Milestone Prize</code> for the contest.
     * @throws SQLException if an SQL error occurs.
     * @since 1.1
     */
    private void getPrizes(PreparedStatement selectPrizesStmt, long contestId, Map<Long, Prize> contestPrizes, List<Prize> milestonePrizes)
        throws SQLException {
        contestPrizes.clear();
        milestonePrizes.clear(); 
        
        ResultSet prizesResultSet = null;
        
        try {
            selectPrizesStmt.clearParameters();
            selectPrizesStmt.setLong(1, contestId);
            selectPrizesStmt.setLong(2, contestId);
            prizesResultSet = selectPrizesStmt.executeQuery();
            while (prizesResultSet.next()) {
                Prize prize = new Prize();
                prize.originalPrizeId = getLong(prizesResultSet, "prize_id");
                prize.place = getLong(prizesResultSet, "place");
                prize.prizeAmount = prizesResultSet.getDouble("prize_amount");
                prize.prizeTypeId = getLong(prizesResultSet, "prize_type_id");
                prize.numberOfSubmissions = getLong(prizesResultSet, "number_of_submissions");
                prize.createDate = prizesResultSet.getTimestamp("create_date");
                if (prize.prizeTypeId == CONTEST_PRIZE_TYPE_ID) {
                    contestPrizes.put(prize.originalPrizeId, prize);
                }
                if (prize.prizeTypeId == MILESTONE_PRIZE_TYPE_ID) {   
                    milestonePrizes.add(prize);
                }
            }
        } finally {
            close(prizesResultSet);
        }
    }
    
    /**
     * <p>Insert a prize record to <code>Online Review</code> database.</p>
     * 
     * @param insertPrizeStmt the <code>PreparedStatement</code> used to insert prize record
     * to <code>Online Review</code> database.
     * @param insertProjectPrizeXrefStmt the <code>PreparedStatement</code> used to insert project_prize_xref record
     * to <code>Online Review</code> database.
     * @param projectId the id of the new project in <code>Online Review</code> database.
     * @param contestCreateUserId the user id who create the contest.
     * @param prize a <code>Prize</code> providing the prize to be inserted to database.
     * @throws SQLException if a SQL error occurs
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @since 1.1
     */
    private void insertSinglePrize(PreparedStatement insertPrizeStmt, PreparedStatement insertProjectPrizeXrefStmt, long projectId, long contestCreateUserId, Prize prize)
        throws SQLException, IDGenerationException, StudioContestMigrationException {
        // Insert into tcs_catalog.prize table
        insertPrizeStmt.clearParameters();
        prize.newPrizeId = getPrizeIdGenerator().getNextID();
        insertPrizeStmt.setLong(1, prize.newPrizeId);
        insertPrizeStmt.setLong(2, prize.place);
        insertPrizeStmt.setDouble(3, prize.prizeAmount);
        insertPrizeStmt.setLong(4, prize.prizeTypeId);
        insertPrizeStmt.setLong(5, prize.numberOfSubmissions);
        insertPrizeStmt.setLong(6, contestCreateUserId);
        insertPrizeStmt.setTimestamp(7, prize.createDate);
        insertPrizeStmt.setLong(8, contestCreateUserId);
        insertPrizeStmt.setTimestamp(9, prize.createDate);
        insertRecord(insertPrizeStmt, "prize");
        
        // Insert into tcs_catalog.project_prize_xref table
        insertProjectPrizeXrefStmt.clearParameters();
        insertProjectPrizeXrefStmt.setLong(1, projectId);
        insertProjectPrizeXrefStmt.setLong(2, prize.newPrizeId);
        insertRecord(insertProjectPrizeXrefStmt, "project_prize_xref");
    }
    
    /**
     * <p>Insert a resource to <code>Online Review</code> database.</p>
     * 
     * @param insertResourceStmt the <code>PreparedStatement</code> used to insert record to
     * <code>tcs_catalog.resource</code> table.
     * @param insertResourceInfoStmt the <code>PreparedStatement</code> used to insert record to
     * <code>tcs_catalog.resource_info</code> table.
     * @param userId the user id of the resource.
     * @param userHandle the user handle of the resource.
     * @param resourceRoleId the id of the resource role type .
     * @param projectId the new project id which the resource belongs to.
     * @param projectPhaseId the id of the project phase which the resource associated to.
     * @param contestCreateUserId the user id who create the contest.
     * @param submitterRegistrationTime the registration time of the submitter resource.
     * @param prizes the total prizes of the resource.
     * @param contestStartTime the start time of the contest.
     * @return the id of the new created resource.
     * @throws SQLException if a SQL error occurs
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @since 1.1
     */
    private long insertSingleResource(PreparedStatement insertResourceStmt, PreparedStatement insertResourceInfoStmt,
            long userId, String userHandle, long resourceRoleId, long projectId, long projectPhaseId, long contestCreateUserId,
            Timestamp submitterRegistrationTime, double prizes, Timestamp contestStartTime)
        throws SQLException, IDGenerationException, StudioContestMigrationException {
        // Insert into tcs_catalog.resource table
        long newResourceId = getResourceIdGenerator().getNextID();
        insertResourceStmt.clearParameters();
        insertResourceStmt.setLong(1, newResourceId);
        insertResourceStmt.setLong(2, resourceRoleId);
        insertResourceStmt.setLong(3, projectId);
        if (projectPhaseId == -1) {
            // no project phase associated with this resource
            insertResourceStmt.setNull(4, Types.DECIMAL);
        } else {
            insertResourceStmt.setLong(4, projectPhaseId);
        }
        insertResourceStmt.setLong(5, contestCreateUserId);
        insertResourceStmt.setTimestamp(6, contestStartTime);
        insertResourceStmt.setLong(7, contestCreateUserId);
        insertResourceStmt.setTimestamp(8, contestStartTime);
        insertRecord(insertResourceStmt, "resource");
        
        // Load resource info
        boolean isSubmitter = resourceRoleId == SUBMITTER_RESOURCE_ROLE_ID;
        Map<Long, String> values = new LinkedHashMap<Long, String>();
        values.put(1L, String.valueOf(userId));
        values.put(2L, userHandle == null ? "does_not_exist" : userHandle);
        values.put(6L, isSubmitter ? RESOURCE_DATE_FORMAT.format((Date) submitterRegistrationTime)
                : RESOURCE_DATE_FORMAT.format((Date) contestStartTime));
        if (isSubmitter) {
            if (prizes > 0) {
                values.put(7L, String.valueOf(prizes));
                values.put(8L, "Yes");
            } else {
                values.put(8L, "N/A");
            }
        } else {
            values.put(8L, "N/A");
        }
        for (Map.Entry<Long, String> entry : values.entrySet()) {
            String value = entry.getValue();
            if (value != null) {
                insertResourceInfoStmt.clearParameters();
                insertResourceInfoStmt.setLong(1, newResourceId);
                insertResourceInfoStmt.setLong(2, entry.getKey());
                insertResourceInfoStmt.setString(3, entry.getValue());
                insertResourceInfoStmt.setLong(4, contestCreateUserId);
                insertResourceInfoStmt.setTimestamp(5, contestStartTime);
                insertResourceInfoStmt.setLong(6, contestCreateUserId);
                insertResourceInfoStmt.setTimestamp(7, contestStartTime);
                insertRecord(insertResourceInfoStmt, "resource_info");
            }
        }
        return newResourceId;
    }
    
    /**
     * <p>Gets contest submissions for a specified contest from <code>studio</code> database.</p>
     * 
     * @param selectSubmissionStmt the <code>PreparedStatement</code> used to retrieve submissions
     * from <code>studio</code> database.
     * @param contestId the id of contest in <code>studio</code> database.
     * @param contestPrizes the <code>Contest Prize</code> of the contest.
     * @param milestonePrizes the <code>Milestone Prize</code> of the contest.
     * @return the retrieved <code>Submission</code>s.
     * @throws SQLException if a SQL error occurs.
     * @since 1.1
     */
    private List<Submission> getContestSubmissions(PreparedStatement selectSubmissionStmt, long contestId, Timestamp contestMilestoneDate,
            Map<Long, Prize> contestPrizes, List<Prize> milestonePrizes) throws SQLException {
        selectSubmissionStmt.clearParameters();
        selectSubmissionStmt.setLong(1, contestId);
        ResultSet selectedSubmissionsResult = selectSubmissionStmt.executeQuery();
        List<Submission> submissions = new ArrayList<Submission>();
        try {
            // the number of contest submissions which have been paid
            int paidSubmissionCount = 0;
            // the number of milestone submissions which have been paid
            int paidMilestoneSubmissionCount = 0;
            while (selectedSubmissionsResult.next()) {
                Submission sub = new Submission();
                sub.originalSubmissionId = getLong(selectedSubmissionsResult, "submission_id");
                sub.submitterId = getLong(selectedSubmissionsResult, "submitter_id");
                sub.submissionStatusId = getLong(selectedSubmissionsResult, "submission_status_id");
                Timestamp submissionDate = selectedSubmissionsResult.getTimestamp("create_date");
                
                // sub.submissionTypeId = getLong(selectedSubmissionsResult, "submission_type_id");
                if (contestMilestoneDate != null && submissionDate.before(contestMilestoneDate)) {
                    // milestone submission
                    sub.submissionTypeId = 1L;
                } else {
                    // contest submission
                    sub.submissionTypeId = 2L;
                }
                sub.modifyDate = selectedSubmissionsResult.getTimestamp("create_date");
                sub.userRank = getLong(selectedSubmissionsResult, "user_rank");
                sub.originalFileName = selectedSubmissionsResult.getString("original_file_name");
                sub.systemFileName = selectedSubmissionsResult.getString("system_file_name");
                sub.viewCount = getLong(selectedSubmissionsResult, "view_count");
                sub.fileSize = getLong(selectedSubmissionsResult, "file_size");
                sub.path = selectedSubmissionsResult.getString("path");
                sub.feedbackText = selectedSubmissionsResult.getString("feedback_text");
                sub.reviewText = selectedSubmissionsResult.getString("review_text");
                sub.hasExtraPurcharse = (getLong(selectedSubmissionsResult, "client_selection_prize_id") != null);
                Long reviewStatusId = getLong(selectedSubmissionsResult, "review_status_id");

                sub.awardMilestone = selectedSubmissionsResult.getBoolean("award_milestone_prize");
                sub.passedScreening = (reviewStatusId == null || reviewStatusId != 2);

                if (CONTEST_SUBMISSISON_TYPE_ID == SUBMISSION_TYPE_MAPPING.get(sub.submissionTypeId)) {
                    // contest submission
                    sub.prizeId = getLong(selectedSubmissionsResult, "prize_id");
                } else {
                    // milestone submission
                    sub.prizeId = getLong(selectedSubmissionsResult, "milestone_prize_id");
                }
                if (sub.prizeId != null) {
                    if (CONTEST_SUBMISSISON_TYPE_ID == SUBMISSION_TYPE_MAPPING.get(sub.submissionTypeId)) {
                        // contest submission
                        Prize prize = contestPrizes.get(sub.prizeId);
                        if (prize != null && prize.place != null) {
                            sub.placement = prize.place;
                            paidSubmissionCount++;
                        } else {
                            sub.prizeId = null;
                        }
                    } 
                }
                submissions.add(sub);
            }
            
            // set placements
            long currentContestPlacement = paidSubmissionCount;
            long currentMilestonePlacement = paidMilestoneSubmissionCount;
            for (Submission sub : submissions) {
                if (ACTIVE_SUBMISSION_STATUS_ID == SUBMISSION_STATUS_MAPPING.get(sub.submissionStatusId)
                        && sub.placement == null) {
                    // Only set placement for active submission
                    if (CONTEST_SUBMISSISON_TYPE_ID == SUBMISSION_TYPE_MAPPING.get(sub.submissionTypeId)) {
                        sub.placement = ++currentContestPlacement;
                    } else {
                        sub.placement = ++currentMilestonePlacement;
                    }
                }
            }
            return submissions;
        } finally {
            close(selectedSubmissionsResult);
        }
    }
    
    /**
     * <p>Insert a submission record to <code>Online Review</code> database.<p>
     * 
     * @param insertUploadStmt the <code>PreparedStatement</code> used to insert record to
     * <code>tcs_catalog.upload</code> table.
     * @param insertSubmissionStmt the <code>PreparedStatement</code> used to insert record to
     * <code>tcs_catalog.submission</code> table.
     * @param insertResourceSubmissionStmt the <code>PreparedStatement</code> used to insert record to
     * <code>tcs_catalog.resource_submission</code> table.
     * @param sub the <code>Submission</code> to insert into database.
     * @param projectId the new project id in <code>Online Review</code> database.
     * @param submitterResourceId the resource id of the submitter.
     * @param contestPrizes the <code>Contest Prize</code> of the contest.
     * @param milestonePrizes the <code>Milestone Prize</code> of the contest.
     * @throws SQLException if a SQL error occurs
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @since 1.1
     */
    private void insertSingleSubmission(PreparedStatement insertUploadStmt, PreparedStatement insertSubmissionStmt, PreparedStatement insertResourceSubmissionStmt, 
            Submission sub, long projectId, long submitterResourceId, Map<Long, Prize> contestPrizes, List<Prize> milestonePrizes)
        throws SQLException, IDGenerationException, StudioContestMigrationException {
        // Insert into tcs_catalog.upload table
        long newUploadId = getUploadIdGenerator().getNextID();
        String destFileName = sub.systemFileName;
     
        insertUploadStmt.clearParameters();
        // upload_id
        insertUploadStmt.setLong(1, newUploadId);
        // project_id
        insertUploadStmt.setLong(2, projectId);
        // resource_id
        insertUploadStmt.setLong(3, submitterResourceId);
        // upload_status_id
        insertUploadStmt.setLong(4, sub.submissionStatusId);
        // parameter
        insertUploadStmt.setString(5, destFileName);
        // create_user
        insertUploadStmt.setLong(6, sub.submitterId);
        // create_date
        insertUploadStmt.setTimestamp(7, sub.modifyDate);
        // modify_user
        insertUploadStmt.setLong(8, sub.submitterId);
        // modify-date
        insertUploadStmt.setTimestamp(9, sub.modifyDate);
        insertRecord(insertUploadStmt, "upload");
        
        // Insert into tcs_catalog.submission table
        long newSubmissionId = getSubmissionIdGenerator().getNextID();
        Long newSubmissionStatusId = SUBMISSION_STATUS_MAPPING.get(sub.submissionStatusId);

        if (!sub.passedScreening)
        {
            if (CONTEST_SUBMISSISON_TYPE_ID == SUBMISSION_TYPE_MAPPING.get(sub.submissionTypeId))
            {
                newSubmissionStatusId = 2L;  //faile screening
            }
            else 
            {
                 newSubmissionStatusId = 6L;  //faile milstone screening
            }
        }
        

        Long newSubmissionTypeId = SUBMISSION_TYPE_MAPPING.get(sub.submissionTypeId);
        insertSubmissionStmt.clearParameters();
        // submission_id
        insertSubmissionStmt.setLong(1, newSubmissionId);
        // upload_id
        insertSubmissionStmt.setLong(2, newUploadId);
        // submission_status_id
        insertSubmissionStmt.setLong(3, newSubmissionStatusId);

        if (newSubmissionStatusId == ACTIVE_SUBMISSION_STATUS_ID) {
            // screening_score, 100 if submission passed review, 0 if submission not passed review
            insertSubmissionStmt.setDouble(4, sub.passedScreening ? 100 : 0);
            double initialScore = 0;
            if (sub.prizeId != null) {
                initialScore = Math.max(0, 110 - 10 * sub.placement);
            }
            sub.score = initialScore;
            // initial_score
            insertSubmissionStmt.setDouble(5, initialScore);
            // final_score
            insertSubmissionStmt.setDouble(6, initialScore);
            // placement
            insertSubmissionStmt.setLong(7, sub.placement);
        } else {
            // screening_score
            insertSubmissionStmt.setNull(4, Types.DECIMAL);
            // initial_score
            insertSubmissionStmt.setNull(5, Types.DECIMAL);
            // final_score
            insertSubmissionStmt.setNull(6, Types.DECIMAL);
            // placement
            insertSubmissionStmt.setNull(7, Types.DECIMAL);
        }
        // submission_type_id
        insertSubmissionStmt.setLong(8, newSubmissionTypeId);
        // create_user
        insertSubmissionStmt.setLong(9, sub.submitterId);
        // create_date
        insertSubmissionStmt.setTimestamp(10, sub.modifyDate);
        // modify_user
        insertSubmissionStmt.setLong(11, sub.submitterId);
        // modify_date
        insertSubmissionStmt.setTimestamp(12, sub.modifyDate);
        // user_rank
        if (sub.userRank == null) {
            insertSubmissionStmt.setLong(13, 0);
        } else {
            insertSubmissionStmt.setLong(13, sub.userRank);
        }
        // mark_for_purchase
        insertSubmissionStmt.setBoolean(14, sub.hasExtraPurcharse);
        // prize_id
        Prize p = null;
        if (sub.prizeId != null) {
            if (CONTEST_SUBMISSISON_TYPE_ID == newSubmissionTypeId) {
                // contest submission
                p = contestPrizes.get(sub.prizeId);
            }
        }
        

        if (sub.awardMilestone)
        { 
            p = (Prize)milestonePrizes.get(0); 
        }

        if (p == null) {
            insertSubmissionStmt.setNull(15, Types.DECIMAL);
        } else {  
            insertSubmissionStmt.setLong(15, p.newPrizeId);
        }
        
        // file_size
        if (sub.fileSize != null) {
            insertSubmissionStmt.setLong(16, sub.fileSize);
        } else {
            insertSubmissionStmt.setNull(16, Types.DECIMAL);
        }
        // view_count
        if (sub.viewCount != null) {
            insertSubmissionStmt.setLong(17, sub.viewCount);
        } else {
            insertSubmissionStmt.setNull(17, Types.DECIMAL);
        }
        insertRecord(insertSubmissionStmt, "submission");
        
        sub.newSubmissionId = newSubmissionId;
        
        // Insert into tcs_catalog.resource_submission table
        insertResourceSubmissionStmt.clearParameters();
        // resource_id
        insertResourceSubmissionStmt.setLong(1, submitterResourceId);
        // submission_id
        insertResourceSubmissionStmt.setLong(2, newSubmissionId);
        // create_user
        insertResourceSubmissionStmt.setLong(3, sub.submitterId);
        // create_date
        insertResourceSubmissionStmt.setTimestamp(4, sub.modifyDate);
        // modify_user
        insertResourceSubmissionStmt.setLong(5, sub.submitterId);
        // modify_date
        insertResourceSubmissionStmt.setTimestamp(6, sub.modifyDate);
        insertRecord(insertResourceSubmissionStmt, "resource_submission");        
    }
    
    /**
     * <p>Load submission declaration data for a specified submission.</p>
     * 
     * @param selectSubmissionDeclarationStmt the <code>PreparedStatement</code> used to retrieve the
     * submission declaration data from <code>studio</code> database.
     * @param insertSubmissionDeclarationStmt the <code>PreparedStatement</code> used to insert record
     * to <code>tcs_catalog.submission_declaration</code> table.
     * @param insertExternalContentStmtthe <code>PreparedStatement</code> used to insert record
     * to <code>tcs_catalog.submission_external_content</code> table.
     * @param insertExternalPropertyStmt the <code>PreparedStatement</code> used to insert record
     * to <code>tcs_catalog.external_content_property</code> table.
     * @param sub the <code>Submission</code> to load submission declaration data.
     * @throws SQLException if a SQL error occurs
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @since 1.1
     */
    private void insertSubmissionDeclaration(PreparedStatement selectSubmissionDeclarationStmt, PreparedStatement insertSubmissionDeclarationStmt,
            PreparedStatement insertExternalContentStmt, PreparedStatement insertExternalPropertyStmt, Submission sub) 
        throws SQLException, IDGenerationException, StudioContestMigrationException {
        selectSubmissionDeclarationStmt.clearParameters();
        selectSubmissionDeclarationStmt.setLong(1, sub.originalSubmissionId);
        ResultSet selectedSubmissionDeclarationResult = selectSubmissionDeclarationStmt.executeQuery();
        try {
            long currentSubmissionDeclarationId = -1;
            long currentExternalContentId = -1;
            long currentNewSubmissionDeclarationId = -1;
            long currentNewExternalContentId = -1;
            while (selectedSubmissionDeclarationResult.next()) {
                Long submissionDeclarationId = getLong(selectedSubmissionDeclarationResult, "submission_declaration_id");
                if (submissionDeclarationId != currentSubmissionDeclarationId) {
                    // insert into tcs_catalog.submission_declaration table
                    currentSubmissionDeclarationId = submissionDeclarationId;
                    currentNewSubmissionDeclarationId = getSubmissionDeclarationIdGenerator().getNextID();
                    insertSubmissionDeclarationStmt.clearParameters();
                    // submission_declaration_id
                    insertSubmissionDeclarationStmt.setLong(1, currentNewSubmissionDeclarationId);
                    // submission_id
                    insertSubmissionDeclarationStmt.setLong(2, sub.newSubmissionId);
                    // comment
                    insertSubmissionDeclarationStmt.setString(3, selectedSubmissionDeclarationResult.getString("comment"));
                    // has_external_content
                    insertSubmissionDeclarationStmt.setBoolean(4, selectedSubmissionDeclarationResult.getBoolean("has_external_content"));
                    insertRecord(insertSubmissionDeclarationStmt, "submission_declaration");
                }
                Long externalContentId = getLong(selectedSubmissionDeclarationResult, "external_content_id");
                if (externalContentId != null && externalContentId != currentExternalContentId) {
                    // insert into tcs_catalog.submission_external_content table
                    currentExternalContentId = externalContentId;
                    currentNewExternalContentId = getExternalContentIdGenerator().getNextID();
                    insertExternalContentStmt.clearParameters();
                    // external_content_id
                    insertExternalContentStmt.setLong(1, currentNewExternalContentId);
                    // external_content_type_id
                    insertExternalContentStmt.setLong(2, getLong(selectedSubmissionDeclarationResult, "external_content_type_id"));
                    // display_position
                    insertExternalContentStmt.setLong(3, getLong(selectedSubmissionDeclarationResult, "display_position"));
                    // submission_declaration_id
                    insertExternalContentStmt.setLong(4, currentNewSubmissionDeclarationId);
                    insertRecord(insertExternalContentStmt, "submission_external_content");
                }
                if (getLong(selectedSubmissionDeclarationResult, "external_content_property_id") != null) {
                    // insert into tcs.external_content_property table
                    insertExternalPropertyStmt.clearParameters();
                    // external_content_property_id
                    insertExternalPropertyStmt.setLong(1, getExternalContentPropertyIdGenerator().getNextID());
                    // external_content_id
                    insertExternalPropertyStmt.setLong(2, currentNewExternalContentId);
                    // name
                    insertExternalPropertyStmt.setString(3, selectedSubmissionDeclarationResult.getString("name"));
                    // value
                    insertExternalPropertyStmt.setString(4, selectedSubmissionDeclarationResult.getString("value"));
                    insertRecord(insertExternalPropertyStmt, "external_content_property");
                }
            }
        } finally {
            close(selectedSubmissionDeclarationResult);
        }
    }
    
    /**
     * <p>Load submission image data for a specified submission.</p>
     * 
     * @param selectSubmissionImageStmt the <code>PreparedStatement</code> used to retrieve the
     * submission image data from <code>studio</code> database.
     * @param insertSubmissionDeclarationStmt the <code>PreparedStatement</code> used to insert record
     * to <code>tcs_catalog.submission_image</code> table.
     * @param sub the <code>Submission</code> to load submission declaration data.
     * @throws SQLException if a SQL error occurs
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @since 1.1
     */
    private void insertSubmissionImage(PreparedStatement selectSubmissionImageStmt, PreparedStatement insertSubmissionImageStmt, Submission sub) 
        throws SQLException, IDGenerationException, StudioContestMigrationException {
        selectSubmissionImageStmt.clearParameters();
        selectSubmissionImageStmt.setLong(1, sub.originalSubmissionId);
        ResultSet selectedSubmissionImageResult = selectSubmissionImageStmt.executeQuery();
        try {

            while (selectedSubmissionImageResult.next()) {
                Long imageId = getLong(selectedSubmissionImageResult, "image_id");
                Long sortOrder = getLong(selectedSubmissionImageResult, "sort_order");
                Timestamp modifyDate = selectedSubmissionImageResult.getTimestamp("modify_date");
                Timestamp createDate = selectedSubmissionImageResult.getTimestamp("create_date");

                insertSubmissionImageStmt.clearParameters();
                // submission id
                insertSubmissionImageStmt.setLong(1, sub.newSubmissionId);
                // image Id
                insertSubmissionImageStmt.setLong(2, imageId);
                // sort order
                insertSubmissionImageStmt.setLong(3, sortOrder);
                // dates
                insertSubmissionImageStmt.setTimestamp(4, modifyDate);
                insertSubmissionImageStmt.setTimestamp(5, createDate);
                insertRecord(insertSubmissionImageStmt, "submission_image");
               
            }
        } finally {
            close(selectedSubmissionImageResult);
        }
    }
    

    /**
     * <p>Create a review for a submission.</p>
     * 
     * @param insertReviewStmt the the <code>PreparedStatement</code> used to insert record
     * to <code>tcs_catalog.review</code> table.
     * @param insertReviewItemStmt the <code>PreparedStatement</code> used to insert record
     * to <code>tcs_catalog.review_item</code> table.
     * @param insertReviewItemCommentStmt the <code>PreparedStatement</code> used to insert record
     * to <code>tcs_catalog.review_item_comment</code> table.
     * @param sub the specified <code>Submission</code>.
     * @param reviewerResourceId the id of the reviewer resource. 
     * @param reviewerUserId the user id of the reviewer.
     * @param scorecardId the id of the scorecard to be used.
     * @param scorecardQuestionId the id of the scorecard question to be used.
     * @param score the review score.
     * @param phaseEndTime the end time of the phase associated with the review.
     * @param phaseTypeId the id of the phase type associated with the review.
     * @throws SQLException if a SQL error occurs
     * @throws IDGenerationException if an error occurs while attempting to generate ID for newly added record.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @since 1.1
     */
    private void insertSubmissionReview(PreparedStatement insertReviewStmt, PreparedStatement insertReviewItemStmt, PreparedStatement insertReviewItemCommentStmt,
            Submission sub, long reviewerResourceId, long reviewerUserId, long scorecardId, long scorecardQuestionId, double score, Timestamp phaseEndTime, long phaseTypeId)
        throws SQLException, IDGenerationException, StudioContestMigrationException {
        // Insert into tcs_catalog.review table
        insertReviewStmt.clearParameters();
        long newReviewId = getReviewIdGenerator().getNextID();
        // review_id
        insertReviewStmt.setLong(1, newReviewId);
        // resource_id
        insertReviewStmt.setLong(2, reviewerResourceId);
        // submission_id
        insertReviewStmt.setLong(3, sub.newSubmissionId);
        // scorecard_id
        insertReviewStmt.setLong(4, scorecardId);
        // score
        insertReviewStmt.setDouble(5, score);
        // initial_score
        insertReviewStmt.setDouble(6, score);
        // create_user
        insertReviewStmt.setLong(7, reviewerUserId);
        // create_date
        insertReviewStmt.setTimestamp(8, phaseEndTime);
        // modify_user
        insertReviewStmt.setLong(9, reviewerUserId);
        // modify_date
        insertReviewStmt.setTimestamp(10, phaseEndTime);
        insertRecord(insertReviewStmt, "review");
        
        // Insert into tcs_catalog.review_item table
        insertReviewItemStmt.clearParameters();
        long newReviewItemId = getReviewItemIdGenerator().getNextID();
        // review_item_id
        insertReviewItemStmt.setLong(1, newReviewItemId);
        // review_id
        insertReviewItemStmt.setLong(2, newReviewId);
        // scorecard_question_id
        insertReviewItemStmt.setLong(3, scorecardQuestionId);
        // answer
        if (phaseTypeId == SCREENING_PHASE_TYPE_ID || phaseTypeId == MILESTONE_SCREENING_PHASE_TYPE_ID) {
            insertReviewItemStmt.setString(4, sub.passedScreening ? "1" : "0");
        } else {
            insertReviewItemStmt.setString(4, (((int) score) / 10) + "/10");
        }
        // create_user
        insertReviewItemStmt.setLong(5, reviewerUserId);
        // create_date
        insertReviewItemStmt.setTimestamp(6, phaseEndTime);
        // modify_user
        insertReviewItemStmt.setLong(7, reviewerUserId);
        // modify_date
        insertReviewItemStmt.setTimestamp(8, phaseEndTime);
        insertRecord(insertReviewItemStmt, "review_item");
        
        // Insert into tcs_catalog.review_item_comment table
        insertReviewItemCommentStmt.clearParameters();
        // review_item_comment_id
        insertReviewItemCommentStmt.setLong(1, getReviewItemCommentIdGenerator().getNextID());
        // resource_id
        insertReviewItemCommentStmt.setLong(2, reviewerResourceId);
        // review_item_id
        insertReviewItemCommentStmt.setLong(3, newReviewItemId);
        // content
        if (phaseTypeId == SCREENING_PHASE_TYPE_ID) {
            insertReviewItemCommentStmt.setString(4, sub.reviewText == null ? "" : sub.reviewText);
        } else if (phaseTypeId == MILESTONE_REVIEW_PHASE_TYPE_ID) {
            insertReviewItemCommentStmt.setString(4, sub.feedbackText == null ? "" : sub.feedbackText);
        } else {
            insertReviewItemCommentStmt.setString(4, "");
        }
        // create_user
        insertReviewItemCommentStmt.setLong(5, reviewerUserId);
        // create_date
        insertReviewItemCommentStmt.setTimestamp(6, phaseEndTime);
        // modify_user
        insertReviewItemCommentStmt.setLong(7, reviewerUserId);
        // modify_date
        insertReviewItemCommentStmt.setTimestamp(8, phaseEndTime);
        insertRecord(insertReviewItemCommentStmt, "review_item_comment");
    }


    private void copyContestPayment(PreparedStatement selectContestPaymentStmt, PreparedStatement insertContestSaleStmt, 
                                    long contestId, long newProjectId)
        throws IDGenerationException, SQLException, StudioContestMigrationException {

        selectContestPaymentStmt.clearParameters();
        selectContestPaymentStmt.setLong(1, contestId);

        double price = 0.0d;
        long paymentStatusId = 0;
        String paypalOrderId = "";
        Timestamp createDate = new Timestamp(new Date().getTime());
        String saleRefId = "";
        long saleTypeId = 0;

        boolean hasPayment = false;

        ResultSet contestPaymentSet = selectContestPaymentStmt.executeQuery();
        while (contestPaymentSet.next()) {
            hasPayment = true;
            paymentStatusId = getLong(contestPaymentSet, "payment_status_id");
            price = price + contestPaymentSet.getDouble("price");
            paypalOrderId = contestPaymentSet.getString("paypal_order_id");
            createDate = contestPaymentSet.getTimestamp("create_date");
            saleRefId = contestPaymentSet.getString("sale_reference_id");
            saleTypeId = getLong(contestPaymentSet, "sale_type_id");

        }

        contestPaymentSet.close();
      
        if (hasPayment)
        {
            long newContestSaleId = getContestSaleIdGenerator().getNextID();
            insertContestSaleStmt.clearParameters();
            insertContestSaleStmt.setLong(1, newContestSaleId);
            insertContestSaleStmt.setLong(2, newProjectId);
            insertContestSaleStmt.setLong(3, paymentStatusId);
            insertContestSaleStmt.setDouble(4, price);
            insertContestSaleStmt.setString(5, paypalOrderId);
            insertContestSaleStmt.setTimestamp(6, createDate);
            insertContestSaleStmt.setString(7, saleRefId);
            insertContestSaleStmt.setLong(8, saleTypeId);

            insertRecord(insertContestSaleStmt, "contest_sale");
        }
        
        


    }
    
    /**
     * <p>Copy a file from source location to destination location.</p>
     * 
     * @param sourceFile the location of the source file.
     * @param destFile the location of the destination file.
     * @throws IOException if IO error occurs when coping file.
     * @since 1.1
     */
    private static void copyFile(File sourceFile, File destFile) throws IOException {
        if (!sourceFile.exists()) {
            return;
        }
        
        BufferedInputStream inputStream = null;
        BufferedOutputStream outputStream = null;
        try {
            byte[] buffer = new byte[BUFFER_SIZE];
            inputStream = new BufferedInputStream(new FileInputStream(sourceFile));
            outputStream = new BufferedOutputStream(new FileOutputStream(destFile));
            int len;
            while ((len = inputStream.read(buffer, 0, BUFFER_SIZE)) != -1) {
                outputStream.write(buffer, 0, len);
            }
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    // ignore
                }
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    // ignore
                }
            }
        }
    }
    
    /**
     * <p>Execute the SQL statement to insert a single record to database.</p>
     * 
     * @param insertStmt the SQL statement to be executed.
     * @param table the table name.
     * @throws StudioContestMigrationException if wrong number of records has been inserted into target table.
     * @throws SQLException if a SQL error occurs.
     * @since 1.1
     */
    private static void insertRecord(PreparedStatement insertStmt, String table) throws StudioContestMigrationException, SQLException {
        int insertCount = insertStmt.executeUpdate();
        if (insertCount != 1) {
            throw new StudioContestMigrationException("Wrong number of records inserted into " + table +
                                                      " table: " + insertCount);
        }
    }
    
    /**
    * <p> Execute the SQL statement to update records in the database. </p>
    *
    * @param updStmt the SQL statement to be executed.
    * @param table the table name.
    * @throws SQLException if a SQL error occurs.
    * @since 1.1
    */ 
    private static void updateRecord(PreparedStatement updStmt, String table) throws SQLException {
        int updateCount = updStmt.executeUpdate();
        LOGGER.debug(updateCount+" records updated in table: " + table);
    }

    /**
     * <p>This class represents a prize associated with a contest.</p>
     * 
     * @author TCSASSEMBER
     * @version 1.0
     * @sicne 1.1
     */
    class Prize {
        /**
         * Represents the id of the original prize record in <code>studio</code> database.
         */
        Long originalPrizeId;
        
        /**
         * Represents the id of the new prize record in <code>Online Review</code> database.
         */
        long newPrizeId;
        
        /**
         * Represents the placement of the prize.
         */
        Long place;
        
        /**
         * Represents the amount prize associated with this prize record.
         */
        Double prizeAmount;
        
        /**
         * Represents the prize type id.
         */
        Long prizeTypeId;
        
        /**
         * Represents the number of submissions.
         */
        Long numberOfSubmissions;
        
        /**
         * Represents the create date of the record.
         */
        Timestamp createDate;
    }
    
    /**
     * <p>This class represents a submission associated with a contest.</p>
     * 
     * @author TCSASSEMBER
     * @version 1.0
     * @since 1.1
     */
    class Submission {
        /**
         * Represents the id of the original submission record in <code>studio</code> database.
         */
        Long originalSubmissionId;
        
        /**
         * Represents the id of the new submission record in <code>Online Review</code> database.
         */
        Long newSubmissionId;
        
        /**
         * Represents the author of the submission.
         */
        Long submitterId;
        
        /**
         * Represents the id of the submission status.
         */
        Long submissionStatusId;
        
        /**
         * Represents the id of the submission type.
         */
        Long submissionTypeId;
        
        /**
         * Represents the modify date of this record.
         */
        Timestamp modifyDate;
        
        /**
         * Represents the user rank of the submission.
         */
        Long userRank;
        
        /**
         * Represents the original file name of the submission.
         */
        String originalFileName;
        
        /**
         * Represents the system file name of the submission.
         */
        String systemFileName;
        
        /**
         * Represents the location path of the submission.
         */
        String path;
        
        /**
         * Represents the prize id of the submission.
         */
        Long prizeId;
        
        /**
         * Represents the placement of the submission.
         */
        Long placement;
        
        /**
         * Represents the score of the submission.
         */
        double score;

        /**
         * Represents the file size of the submission.
         */
        Long fileSize;
        
        /**
         * Represents the view count of the submission.
         */
        Long viewCount;
        
        /**
         * Represents the feedback of the submission.
         */
        String feedbackText;
        
        /**
         * Represents the review text of the submission.
         */
        String reviewText;
        
        /**
         * A flag represents whether the review has extra purchase.
         */
        boolean hasExtraPurcharse;
        
        /**
         * A flag indicate whether the submission has passed screening.
         */
        private boolean passedScreening;

        // whether the submission is milestone winner
        private boolean awardMilestone;
    }


    public static void copyFolder(File src, File dest, Map<String, String> submap)
        throws Exception{
 
        if(src.isDirectory()){
 
            //if directory not exists, create it
            if(!dest.exists()){
               dest.mkdir();
               System.out.println("Directory copied from " 
                              + src + "  to " + dest);
            }
 
            //list all the directory contents
            String files[] = src.list();
 
            for (String file : files) {
               
                   //construct the src and dest file structure
                   File srcFile = new File(src, file);
                   File destFile = new File(dest, file);
                    //recursive copy
                   copyFolder(srcFile,destFile, submap);
               }
              
 
        }else{
            
                String srcFileName = src.getName();
                // only copy zip files
               if (srcFileName.endsWith(".zip"))
               {
                   String destFileName = srcFileName;

                    // if submissionid-preview.zip, rename to newsubmissionid-preview.zip
                   if (srcFileName.endsWith("_preview.zip"))
                   {
                        String oldsubid = srcFileName.substring(0,  srcFileName.lastIndexOf("_preview.zip"));
                        if (submap.get(oldsubid) != null)
                        {
                            destFileName = (String)submap.get(oldsubid) + "_preview.zip";
                        }

                        dest = new File(dest.getParentFile(), destFileName);

                        
                   }

                   InputStream in = new FileInputStream(src);
                   OutputStream out = new FileOutputStream(dest); 
             
                   byte[] buffer = new byte[1024];
         
                   int length;
                   //copy the file content in bytes 
                   while ((length = in.read(buffer)) > 0){
                       out.write(buffer, 0, length);
                   }
         
                   in.close();
                   out.close();

                   System.out.println("File copied from " + src + " to " + dest);
                }

                
        }
    }


}
