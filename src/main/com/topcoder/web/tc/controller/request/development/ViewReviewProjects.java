/*
 * Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.tc.Constants;

/**
 * <p>A controller to handle the requests for displaying the list of active review projects of specified type. The
 * desired project type is expected to be provided as {@link Constants#PROJECT_TYPE_ID} request parameter.</p>
 *
 * <p>
 *   Version 1.0.1 Change notes:
 *   <ol>
 *     <li>RBoard related tasks were moved to a tcs bean.</li>
 *   </ol>
 *
 *   Version 1.0.2 Change notes:
 *   <ol>
 *     <li>Changed review registration to use the new variable application delay.</li>
 *   </ol>
 *
 *   Version 1.0.3 Change notes:
 *   <ol>
 *     <li>Added public non-argument constructor to follow the current TC standards for code development.</li>
 *     <li>Fully documented the class to follow current TC standards for code documentation.</li>
 *     <li>Refactored the logic for referencing the project types by client requests. Now the clients will
 *         pass project type/category ID instead of component project phase type ID to refer to project type.</li>
 *     <li>Refactored the logic for handling the requests to split the logic for checking the supported project
 *         types and mapping them to appropriate view into separate private methods.</li>
 *     <li>The project type requested by client is provided as parameter to <code>review_projects</code> query to filter
 *         the retrieved projects based on provided type.</li>
 *   </ol>
 *
 *   Version 1.0.4 Change notes:
 *   <ol>
 *     <li>Added support for <code>Architecture</code> project type/category.</li>
 *   </ol>
 *
 *   Version 1.0.5 (TCS Release 2.2.2) Change notes:
 *   <ol>
 *     <li>Added support for Conceptualization, Specification and Application Testing project types.</li>
 *   </ol>
 *
 *   Version 1.0.6 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.0.7 (Specification Review Signup Pages 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Specification review project types.</li>
 *   </ol> 
 * </p>
 *
 * @author dok, ivern, isv, pulky, snow01
 * @version 1.0.7
 */
public class ViewReviewProjects extends ReviewProjectDetail {

    /**
     * <p>Constructs new <code>ViewReviewProjects</code> instance. This implementation does nothing.</p>
     */
    public ViewReviewProjects() {
    }

    /**
     * <p>Handles the request for displaying the list of active review projects of requested type provided as
     * {@link Constants#PROJECT_TYPE_ID} request parameter.</p>
     *
     * <p>Looks up for the list of active review projects of requested project type, binds it to request and forwards
     * to the corresponding JSP depending on requested project type.</p>
     * 
     * Updated for Specification Review Integration 1.0
     *      - specification review projects are also processed/fetched. 
     *
     * @throws TCWebException if an unexpected error occurs or if requested project type is not supported.
     */
    protected void developmentProcessing() throws TCWebException {
        String projectTypeId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        if (!isProjectTypeSupported(projectTypeId)) {
            throw new TCWebException("Invalid project type specified " + projectTypeId);
        }

        int phase_id = (Integer.parseInt(projectTypeId) + (int)Constants.GENERAL_PHASE_OFFSET);
        getRequest().setAttribute("phase_id", new Integer(phase_id));

        Request r = new Request();
        r.setContentHandle("review_projects");
        r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId);

        try {
            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("review_projects");
            getRequest().setAttribute("projectList", rsc);

            ResultSetContainer.ResultSetRow rsr = null;

            ArrayList prices = new ArrayList();
            ArrayList<Boolean> waitingToReview = new ArrayList<Boolean>();
            ArrayList<Timestamp> waitingUntil = new ArrayList<Timestamp>();

            RBoardApplication rba = createRBoardApplication();
            long applicationDelay = rba.getApplicationDelay(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId());

            for (Iterator it = rsc.iterator(); it.hasNext();) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                //we don't really care what the reviewer type nor review responsibility, we really just want to know
                //what it costs.
                if (rsr.getIntItem("submission_count") == 0) {
                    //default to 1 submission if no one has submitted yet - rfairfax
                    prices.add(makeApp("", 1, 1, rsr.getIntItem("phase_id"), rsr.getIntItem("level_id"),
                                       rsr.getLongItem("project_id"), 0, rsr.getFloatItem("prize"),
                                       rsr.getFloatItem("dr_points")).getComponent());
                } else {
                    prices.add(makeApp("", rsr.getIntItem("submission_count"),
                                       rsr.getIntItem("submission_passed_screening_count"), rsr.getIntItem("phase_id"),
                                       rsr.getIntItem("level_id"), rsr.getLongItem("project_id"), 0,
                                       rsr.getFloatItem("prize"), rsr.getFloatItem("dr_points")).getComponent());
                }

                Timestamp opensOn = (Timestamp) ((TCTimestampResult) rsr.getItem("opens_on")).getResultData();

                if (System.currentTimeMillis() < opensOn.getTime() + applicationDelay) {
                    waitingToReview.add(Boolean.TRUE);
                    waitingUntil.add(new Timestamp(opensOn.getTime() + applicationDelay));
                } else {
                    waitingToReview.add(Boolean.FALSE);
                    waitingUntil.add(new Timestamp(0));
                }
            }

            getRequest().setAttribute("prices", prices);
            getRequest().setAttribute("waitingToReview", waitingToReview);
            getRequest().setAttribute("waitingUntil", waitingUntil);
            getRequest().setAttribute("applicationDelayHours",
                                      new Integer((int) (applicationDelay / (1000 * 60 * 60))));
            getRequest().setAttribute("applicationDelayMinutes",
                                      new Integer((int) ((applicationDelay % (1000 * 60 * 60)) / (1000 * 60))));

            // getRequest().setAttribute("tournamentProjectList", getDataAccess().getData(r).
            //             get("tournament_review_projects"));

            // process specification review positions
            processSpecificationReviewPositions(projectTypeId);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage(getReviewOpportunitiesView(projectTypeId));
        setIsNextPageInContext(true);
    }

    /**
     * <p>Private helper method to process specification review positions for the specified project type id.</p>
     *
     * @param projectTypeId the project type id to process
     * @throws TCWebException if any error occurs during the process
     *
     * @since 1.0.7
     */
    @SuppressWarnings("unchecked")
    private void processSpecificationReviewPositions(String projectTypeId) throws TCWebException {
        String specificationReviewProjectTypeId = Integer.toString(Integer.parseInt(projectTypeId)
                + Constants.SPECIFICATION_COMPETITION_OFFSET);
        if (!isProjectTypeSupported(specificationReviewProjectTypeId, true)) {
            // simply return from here.
            return;
        }

        Request r = new Request();
        r.setContentHandle("spec_review_projects");
        r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId);

        try {
            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("spec_review_projects");
            getRequest().setAttribute("specReviewList", rsc);

            ResultSetContainer.ResultSetRow rsr = null;

            ArrayList prices = new ArrayList();
            ArrayList<Boolean> waitingToReview = new ArrayList<Boolean>();
            ArrayList<Timestamp> waitingUntil = new ArrayList<Timestamp>();

            RBoardApplication rba = createRBoardApplication();
            long applicationDelay = rba.getSpecReviewApplicationDelay(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId());

            for (Iterator it = rsc.iterator(); it.hasNext();) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                // default to 1 submission, dr points is not applicable so default to zero.
                prices.add(makeSpecReviewApp(rsr.getIntItem("phase_id"), rsr.getIntItem("level_id"),
                        rsr.getLongItem("project_id"), rsr.getFloatItem("prize"), 0,
                        Constants.SPECIFICATION_REVIEWER_TYPE).getComponent());

                Timestamp opensOn = (Timestamp) ((TCTimestampResult) rsr.getItem("opens_on")).getResultData();

                if (System.currentTimeMillis() < opensOn.getTime() + applicationDelay) {
                    waitingToReview.add(Boolean.TRUE);
                    waitingUntil.add(new Timestamp(opensOn.getTime() + applicationDelay));
                } else {
                    waitingToReview.add(Boolean.FALSE);
                    waitingUntil.add(new Timestamp(0));
                }
            }

            getRequest().setAttribute("specReviewPrices", prices);
            getRequest().setAttribute("specReviewProjectTypeId", specificationReviewProjectTypeId);

            getRequest().setAttribute("specReviewWaitingToReview", waitingToReview);
            getRequest().setAttribute("specReviewWaitingUntil", waitingUntil);
            getRequest().setAttribute("specReviewApplicationDelayHours",
                                      new Integer((int) (applicationDelay / (1000 * 60 * 60))));
            getRequest().setAttribute("specReviewApplicationDelayMinutes",
                                      new Integer((int) ((applicationDelay % (1000 * 60 * 60)) / (1000 * 60))));

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>Gets the logical name for the view which is to be used for displaying the list of review opportunities of
     * specified type requested by client.</p>
     * 
     * Updated for Version 1.0.7 - now all review opportunities are viewable through unified page.
     *
     * @param projectType a <code>String</code> referencing the project type requested by client.
     * @return a <code>String</code> referencing the view to be used for displaying the list of review opportunities for
     *         specified project type.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private String getReviewOpportunitiesView(String projectType) {
        return Constants.UNIFIED_REVIEW_PROJECTS_PAGE;
    }
}
