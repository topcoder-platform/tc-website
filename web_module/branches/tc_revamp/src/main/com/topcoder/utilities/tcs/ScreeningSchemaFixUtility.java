/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.tcs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

/**
 * <strong>Purpose</strong>:
 * Utility to adjust the new screening schema
 *
 * This utility loads the old data and transforms it to fit the new schema.
 *
 * @author pulky
 * @version 1.0.0
 */
public class ScreeningSchemaFixUtility extends DBUtility{
    /**
     * Runs the ScreeningSchemaFixUtility.
     */
    public void runUtility() throws Exception {
        PreparedStatement psSelOldScreeningResults = null;
        PreparedStatement psInsScreeningTask = null;
        PreparedStatement psInsScreeningResults = null;
        ResultSet rs = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(200);
            query.append(" select ");
            query.append(" sro.screening_result_id, sro.dynamic_response_text, sro.screening_response_id, sro.create_user, ");
            query.append(" sro.create_date,  sro.submission_v_id, s.submission_url, p.project_type_id, cc.root_category_id ");
            query.append(" from screening_result_old sro, submission s, project p, comp_versions cv, comp_catalog cc ");
            query.append(" where sro.submission_v_id = s.submission_v_id and p.project_id = s.project_id ");
            query.append(" and p.cur_version = 1 and cv.comp_vers_id = p.comp_vers_id ");
            query.append(" and cv.component_id = cc.component_id ");
            query.append(" order by sro.submission_v_id asc ");
            psSelOldScreeningResults = prepareStatement("tcs_catalog", query.toString());

            query = new StringBuffer(200);
            query.append(" insert into screening_task ");
            query.append(" (screening_task_id, submission_path, screening_project_type_id, ");
            query.append(" screener_id, screening_attempts, submission_v_id, specification_id, screened_ind) ");
            query.append(" values (?, ?, ?, null, 0, ?, null, 1)");
            psInsScreeningTask = prepareStatement("tcs_catalog", query.toString());

            query = new StringBuffer(200);
            query.append(" insert into screening_result ");
            query.append(" (screening_result_id, dynamic_response_text, screening_response_id, ");
            query.append(" create_user, create_date, screening_task_id) ");
            query.append(" values (?, ?, ?, ?, ?, ?)");
            psInsScreeningResults = prepareStatement("tcs_catalog", query.toString());

            rs = psSelOldScreeningResults.executeQuery();

            log.debug("");
            log.debug("-----------------------------------------------");
            long oldSubmissionVId = -1;
            long taskId = -1;
            int i;
            int j = 0;
            for (i = 1; rs.next(); i++ ) {
                if (rs.getLong("submission_v_id") != oldSubmissionVId) {
                    oldSubmissionVId = rs.getLong("submission_v_id");

                    psInsScreeningTask.clearParameters();
                    taskId = generateNewID();

                    log.debug("Moving data for submission: " + oldSubmissionVId + " new taskId: " + taskId);

                    psInsScreeningTask.setLong(1, taskId);
                    psInsScreeningTask.setString(2, rs.getString("submission_url"));

                    long projectTypeId = rs.getLong("project_type_id");
                    if (rs.getLong("root_category_id") == 5801777 ||
                            rs.getLong("root_category_id") == 5801779) {
                        projectTypeId += 2;
                    }

                    psInsScreeningTask.setLong(3, projectTypeId);
                    psInsScreeningTask.setLong(4, oldSubmissionVId);
                    psInsScreeningTask.executeUpdate();
                    j++;
                }

                psInsScreeningResults.clearParameters();
                psInsScreeningResults.setLong(1, rs.getLong("screening_result_id"));
                psInsScreeningResults.setString(2, rs.getString("dynamic_response_text"));
                psInsScreeningResults.setLong(3, rs.getLong("screening_response_id"));
                psInsScreeningResults.setLong(4, rs.getLong("create_user"));
                psInsScreeningResults.setDate(5, rs.getDate("create_date"));
                psInsScreeningResults.setLong(6, taskId);
                psInsScreeningResults.executeUpdate();
            }
            log.debug("---------------  " + i +" rows processed (" + j + " tasks.) ---------------");
            DBMS.close(rs);
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("ScreeningSchemaFixUtility failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psInsScreeningResults);
            DBMS.close(psInsScreeningTask);
            DBMS.close(psSelOldScreeningResults);
            DBMS.close(rs);
        }
    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();
    }

    /**
     * Gets next Id
     *
     * @return the next Id
     * @throws IDGenerationException if id generation fails.
     */
    private static long generateNewID() throws IDGenerationException {
        IDGenerator gen = IDGeneratorFactory.getIDGenerator("SCREENING_TASK_SEQ");
        return gen.getNextID();
    }

    /**
     * Show usage of the ScreeningSchemaFixUtility.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ScreeningSchemaFixUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -sourcedb URL : URL of source database.\n");
        fatal_error();
    }
}
