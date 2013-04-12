/*
 * Copyright (C) 2010-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.LinkedHashMap;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.dto.Project;

/**
 * <p>This class will process a request to view checkpoint feedback texts for requested contest.</p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * @author isv, TCSDEVELOPER
 * @version 1.1 (Studio Contest Detail Pages assembly)
 */
public class ViewCheckpointFeedback extends ViewContestDetails {

    /**
     * <p>Constructs new <code>ViewCheckpointFeedback</code> instance. This implementation does nothing.</p>
     */
    public ViewCheckpointFeedback() {
    }

    /**
     * <p>Implements the business logic for processing the request.</p>
     *
     * @throws Exception if any error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        super.dbProcessing();
        Project contest = (Project) getRequest().getAttribute("contest");
        if (contest != null) {
            if (!contest.getCheckpointFeedbackAvailable()) {
                throw new NavigationException("Contest with no checkpoint round or available feedback is requested");
            }
        }

        // Handle checkpoint
        Boolean canViewCheckpoint = (Boolean) getRequest().getAttribute("canViewCheckpoint");
        if (canViewCheckpoint) {
            getRequest().setAttribute("canViewCheckpoint", true);

            DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Request r = new Request();
            r.setContentHandle("studio_milestone_prize_awarded_submissions_feedback");
            r.setProperty("pj", String.valueOf(contest.getId()));

            ResultSetContainer submissionsResult 
                = (ResultSetContainer) da.getData(r).get("studio_milestone_prize_awarded_submissions_feedback");
            int recordNum = submissionsResult.size();
            Map<Integer, String> checkpointSubmissionFeedback = new LinkedHashMap<Integer, String>();
            for (int i = 0; i < recordNum; i++) {
                String feedbackText = submissionsResult.getStringItem(i, "feedback_text");
                Integer submissionId = submissionsResult.getIntItem(i, "submission_id");
                checkpointSubmissionFeedback.put(submissionId, feedbackText.replaceAll("\n", "<br />"));
            }

            getRequest().setAttribute("checkpointPrizedSubmissions", checkpointSubmissionFeedback);
        }

        setNextPage("/checkpointFeedback.jsp");
        setIsNextPageInContext(true);
    }
}
