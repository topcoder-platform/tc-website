/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.model.SoftwareComponent;
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
 *   Version 1.0.6 (Specification Review Signup Pages 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Specification review project types.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, ivern, isv, TCSDEVELOPER
 * @version 1.0.6
 * @since 1.0
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
     * @throws TCWebException if an unexpected error occurs or if requested project type is not supported.
     */
    protected void developmentProcessing() throws TCWebException {
        String projectTypeId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        // don't include specification review project types in the validation
        if (!isProjectTypeSupported(projectTypeId, false)) {
            throw new TCWebException("Invalid project type specified " + projectTypeId);
        }
        
        int phase_id = (Integer.parseInt(projectTypeId) + 111);
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
            int specificationReviewProjectTypeId = Integer.parseInt(projectTypeId) 
                    + Constants.SPECIFICATION_COMPETITION_OFFSET;
            getRequest().setAttribute("specificationReviewProjectTypeId", specificationReviewProjectTypeId);
            processSpecificationReviewPositions(specificationReviewProjectTypeId);
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
     * <p>This method will get information from query tool and return an <code>ArrayList<SoftwareComponent></code>
     * after processing it.</p>
     * 
     * @param projectTypeId the project type id to process
     * @throws TCWebException if any error occurs during the process
     * 
     * @since 1.0.6
     */
    private void processSpecificationReviewPositions(int projectTypeId) throws TCWebException {
        Request r = new Request();
        r.setContentHandle("review_projects");
        r.setProperty(Constants.PROJECT_TYPE_ID, String.valueOf(projectTypeId));

        try {
            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("review_projects");
            getRequest().setAttribute("specificationReviewList", rsc);

            ArrayList<SoftwareComponent> prices = new ArrayList<SoftwareComponent>(rsc.size());

            for (ResultSetRow rsr : rsc) {
                //default to 1 submission if no one has submitted yet
                if (rsr.getIntItem("submission_count") == 0) {
                    prices.add(makeApp("", 1, 1, rsr.getIntItem("phase_id"), rsr.getIntItem("level_id"),
                       rsr.getLongItem("project_id"), 0, rsr.getFloatItem("prize"),
                       rsr.getFloatItem("dr_points")).getComponent());
                } else {
                    prices.add(makeApp("", rsr.getIntItem("submission_count"),
                       rsr.getIntItem("submission_passed_screening_count"), rsr.getIntItem("phase_id"),
                       rsr.getIntItem("level_id"), rsr.getLongItem("project_id"), 0,
                       rsr.getFloatItem("prize"), rsr.getFloatItem("dr_points")).getComponent());
                }
            }

            getRequest().setAttribute("specificationReviewPrices", prices);
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
     * @param projectType a <code>String</code> referencing the project type requested by client.
     * @return a <code>String</code> referencing the view to be used for displaying the list of review opportunities for
     *         specified project type.
     * @since TCS Release 2.2.0 (TCS-54), TCS Release 2.2.1 (TCS-57)
     */
    private String getReviewOpportunitiesView(String projectType) {
        // we don't need to check for project types, they are already verified.
        if (projectType.equals(String.valueOf(WebConstants.DESIGN_PROJECT_TYPE)) ||
                projectType.equals(String.valueOf(WebConstants.DEVELOPMENT_PROJECT_TYPE))) {
            return Constants.REVIEW_PROJECTS;
        } else {
            return Constants.UNIFIED_REVIEW_PROJECTS_PAGE;
        }
    }
}
