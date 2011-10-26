/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.apps.review.rboard.RBoardApplicationHome;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.ReviewBoardApplication;

/**
 * <p>A controller to handle the requests for displaying the details for the requested review project of specified type.
 * The desired project type is expected to be provided as {@link Constants#PROJECT_TYPE_ID} request parameter.</p>
 *
 * <p>
 *   Version  1.0.1 Change notes:
 *   <ol>
 *     <li>RBoard related tasks were moved to a tcs bean.</li>
 *   </ol>
 *
 *   Version 1.0.2 Change notes:
 *   <ol>
 *     <li>Added public non-argument constructor to follow the current TC standards for code development.</li>
 *     <li>Fully documented the class to follow current TC standards for code documentation.</li>
 *     <li>Refactored the logic for referencing the project types by client requests. Now the clients will
 *         pass project type/category ID instead of component project phase type ID to refer to project type.</li>
 *     <li>Refactored the logic for handling the requests to split the logic for checking the supported project
 *         types and mapping them to appropriate view into separate private methods.</li>
 *     <li>The project type requested by client is provided as parameter to <code>review_project_detail</code> query to
 *         filter the retrieved projects based on provided type.</li>
 *   </ol>
 *
 *   Version 1.0.3 Change notes:
 *   <ol>
 *     <li>Added support for <code>Architecture</code> project type/category.</li>
 *   </ol>
 *
 *   Version 1.0.4 (TCS Release 2.2.2) Change notes:
 *   <ol>
 *     <li>Added support for Conceptualization, Specification and Application Testing project types.</li>
 *   </ol>
 *
 *   Version 1.0.5 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.0.6 (Specification Review Integration 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Specification review project types.</li>
 *   </ol>
 *
 *   Version 1.0.7 (Competition Registration Eligibility v1.0) Change notes:
 *   <ol>
 *     <li>Added eligibility constraints check.</li>
 *   </ol>
 *
 *   Version 1.0.8 Change notes:
 *   <ol>
 *     <li>Added support for Specification Submission and Specificatino Review project phases.</li>
 *   </ol>
 *
 *   Version 1.0.9 Change notes:
 *   <ol>
 *     <li>Updated the review registration phase not to list more review opportunities than specified
 *         in the Review phase properties in the Online Review.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, pulky, snow01, VolodymyrK
 * @version 1.0.9
 * @since 1.0
 */
public class ReviewProjectDetail extends Base {

    /**
     * <p>Constructs new <code>ReviewProjectDetail</code> instance. This implementation does nothing.</p>
     */
    public ReviewProjectDetail() {
    }

    /**
     * <p>Handles the request for displaying the details for review project of requested type provided as
     * {@link Constants#PROJECT_TYPE_ID} request parameter. The ID of requested project is expected to be provided as
     * {@link Constants#PROJECT_ID} request parameter.</p>
     *
     * <p>Looks up for the details of requested review project, binds it to request and forwards to the corresponding
     * JSP depending on requested project type.</p>
     * 
     * Updated for Specification Review Integration 1.0
     *      - Refactored to differently handle normal project and specification review project details.
     *
     * @throws TCWebException if an unexpected error occurs or if requested project type is not supported.
     */
    protected void developmentProcessing() throws TCWebException {
        String projectTypeId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        
        // include specification review project types in the validation
        if (!isProjectTypeSupported(projectTypeId, true)) {
            throw new TCWebException("Invalid project type specified " + projectTypeId);
        }

        int phaseId = (Integer.parseInt(projectTypeId) + (int) Constants.GENERAL_PHASE_OFFSET);
        String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));

        // check eligibility constraints
        if (checkEligibilityConstraints(projectId, new ClassResource(this.getClass())) != 0) {
            throw new NavigationException("Could not find project information.");
        }

        if (phaseId > Constants.SPECIFICATION_COMPETITION_OFFSET) {
            retrieveSpecReviewProjectDetail(projectId, phaseId);
        } else {
            retrieveReviewProjectDetail(projectId, phaseId, projectTypeId);
        }

        setNextPage(getReviewProjectDetailView(projectTypeId));
        setIsNextPageInContext(true);
    }
    
    /**
     * <p>Looks up for the details of requested review project, binds it to request.</p>
     * 
     * In this version refactored from developmentProcessing method.
     * 
     * @param projectId project id to look for.
     * @param phaseId phase id of the project
     * @param projectTypeId identifier of the type of project
     * @throws TCWebException if an unexpected error occurs
     * @since 1.0.9
     */
    private void retrieveReviewProjectDetail(String projectId, int phaseId, String projectTypeId) throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("review_project_detail");
            r.setProperty(Constants.PROJECT_ID, projectId);
            r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));
            r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId);
            getRequest().setAttribute("phase_id", new Integer(phaseId));

            Map results = getDataAccess().getData(r);
            ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
            getRequest().setAttribute("projectDetail", detail);

            getRequest().setAttribute("specReviewExtensionNeeded", (Boolean) false);
            getRequest().setAttribute("screeningExtensionNeeded", (Boolean) detail.getBooleanItem(0, "screening_extension_needed"));
            getRequest().setAttribute("reviewExtensionNeeded", (Boolean) detail.getBooleanItem(0, "review_extension_needed"));

            // Check if each relevant phase exists, and insert that information into the request.
            checkAllPhaseExistence(detail);

            ArrayList reviewerList = new ArrayList(3);

            if (detail.isEmpty()) {
                throw new NavigationException("Could not find information on the project selected.");
            } else {
                // set submission count to 1 for zero submissions
                int numSubmissions = detail.getIntItem(0, "submission_count");
                int numSubmissionsPassed = detail.getIntItem(0, "submission_passed_screening_count");
                if (numSubmissions == 0) {
                    numSubmissions = 1;
                    numSubmissionsPassed = 1;
                }

                int reviewers_required = detail.getIntItem(0, "reviewers_required");
                int reviewers_registered = 0;

                ResultSetContainer reviewers = (ResultSetContainer) results.get("reviewers");
                ResultSetContainer.ResultSetRow row = null;
                //add all the positions
                for (Iterator it = reviewers.iterator(); it.hasNext();) {
                    row = (ResultSetContainer.ResultSetRow) it.next();
                    //this one has not been assigned yet
                    if (row.getStringItem("handle") == null) {
                        reviewerList.add(makeApp(row.getStringItem("reviewer_type"),
                                                 numSubmissions,
                                                 numSubmissionsPassed,
                                                 detail.getIntItem(0, "phase_id"),
                                                 detail.getIntItem(0, "level_id"),
                                                 detail.getLongItem(0, "project_id"),
                                                 row.getIntItem("review_resp_id"),
                                                 detail.getFloatItem(0, "prize"),
                                                 detail.getFloatItem(0, "dr_points")));
                    } else {
                        reviewers_registered++;

                        //this one has been assigned
                        reviewerList.add(makeApp(row.getStringItem("reviewer_type"),
                                                 numSubmissions,
                                                 numSubmissionsPassed,
                                                 detail.getIntItem(0, "phase_id"),
                                                 detail.getIntItem(0, "level_id"),
                                                 row.getLongItem("user_id"),
                                                 row.getStringItem("handle"),
                                                 row.getIntItem("primary") == 1,
                                                 detail.getLongItem(0, "project_id"),
                                                 row.getIntItem("review_resp_id"),
                                                 detail.getFloatItem(0, "prize"),
                                                 detail.getFloatItem(0, "dr_points")));
                    }
                }

                //Remove excessive review opportunities.
                ReviewBoardApplication app = null;
                for (Iterator it = reviewerList.iterator(); it.hasNext();) {
                    app = (ReviewBoardApplication) it.next();
                    if (!app.isSpotFilled()) {
                        if (reviewers_registered >= reviewers_required) {
                            it.remove();
                        } else {
                            reviewers_registered++;
                        }
                    }
                }

                //if there is no primary spot in the list, put one in there
                //and make sure it's the Failure reviewer
                boolean hasPrimary = false;
                for (Iterator it = reviewerList.iterator(); it.hasNext();) {
                    app = (ReviewBoardApplication) it.next();
                    hasPrimary |= app.isPrimary();
                }
                if (!hasPrimary) {
                    if (detail.getLongItem(0, "phase_id") == SoftwareComponent.DEV_PHASE
                        || detail.getLongItem(0, "phase_id") == 116) {

                        for (Iterator it = reviewerList.iterator(); it.hasNext();) {
                            app = (ReviewBoardApplication) it.next();

                            //set a primary to be the failure test spot, but only do it
                            //if it's not filled.  perhaps we put someone in there
                            //who didn't want to be primary, failure is primary is just
                            //a convention, not a rule.  in this case, someone would have to
                            //be set primary manually
                            if (app.getReviewerType().equals("Failure") && !app.isSpotFilled())
                                app.setPrimary(true);
                        }
                    } else {
                        for (Iterator it = reviewerList.iterator(); it.hasNext() && !hasPrimary;) {
                            app = (ReviewBoardApplication) it.next();
                            if (!app.isSpotFilled()) {
                                app.setPrimary(true);
                                hasPrimary = true;
                            }
                        }
                    }
                }

                getRequest().setAttribute("reviewerList", reviewerList);

                RBoardApplication rba = createRBoardApplication();
                long applicationDelay = rba.getApplicationDelay(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId());
                Timestamp opensOn = (Timestamp) ((TCTimestampResult) detail.getItem(0, "opens_on")).getResultData();

                if (System.currentTimeMillis() < opensOn.getTime() + applicationDelay) {
                    getRequest().setAttribute("waitingToReview", Boolean.TRUE);
                    getRequest().setAttribute("waitingUntil", new Timestamp(opensOn.getTime() + applicationDelay));
                } else {
                    getRequest().setAttribute("waitingToReview", Boolean.FALSE);
                    getRequest().setAttribute("waitingUntil", new Timestamp(0));
                }

                getRequest().setAttribute("applicationDelayHours",
                                          new Integer((int) (applicationDelay / (1000 * 60 * 60))));
                getRequest().setAttribute("applicationDelayMinutes",
                                          new Integer((int) ((applicationDelay % (1000 * 60 * 60)) / (1000 * 60))));
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

 /**
     * <p>Looks up for the details of requested spec review project, binds it to request.</p>
     * 
     * @param projectId project id to look for.
     * @param phaseId phase id of the project
     * @throws TCWebException if an unexpected error occurs
     * 
     * @since 1.0.6
     */
    @SuppressWarnings("unchecked")
    private void retrieveSpecReviewProjectDetail(String projectId, int phaseId) throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("spec_review_project_detail");
            r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
            getRequest().setAttribute("phase_id", new Integer(phaseId));

            Map results = getDataAccess().getData(r);
            ResultSetContainer detail = (ResultSetContainer) results.get("spec_review_project_detail");
            if (detail.isEmpty()) {
                throw new NavigationException("Could not find information on the project selected.");
            }

            getRequest().setAttribute("projectDetail", detail);

            getRequest().setAttribute("specReviewExtensionNeeded", (Boolean) detail.getBooleanItem(0, "spec_review_extension_needed"));
            getRequest().setAttribute("screeningExtensionNeeded", (Boolean) false);
            getRequest().setAttribute("reviewExtensionNeeded", (Boolean) false);

            // Check if each relevant phase exists, and insert that information into the request.
            checkAllPhaseExistence(detail);

            ArrayList reviewerList = new ArrayList(1);

            ReviewBoardApplication app = makeSpecReviewApp(detail.getIntItem(0, "phase_id"), detail.getIntItem(0,
                    "level_id"), detail.getLongItem(0, "project_id"), detail.getFloatItem(0, "prize"), detail
                    .getIntItem(0, "reviewer_type_id"), Constants.SPECIFICATION_REVIEWER_TYPE);
            
            String reviewUserHandle = detail.getStringItem(0, "review_user_handle");
            if (reviewUserHandle != null && !reviewUserHandle.equals("")) {
                app.setHandle(reviewUserHandle);
            }
            
            long reviewUserId = detail.getLongItem(0, "review_user_id");
            if (reviewUserId > 0) {
                app.setUserId(reviewUserId);
            }
            
            reviewerList.add(app);

            getRequest().setAttribute("reviewerList", reviewerList);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void checkAllPhaseExistence(ResultSetContainer detail) {
        // Setting any of these to FALSE will now prevent the phase in question from showing in the view.  The
        // easiest way to achieve this is to modify the query to return an empty string for the phase's submission
        // start.
        getRequest().setAttribute("hasSpecificationSubmission", checkPhaseExistence(detail, "specification_submission_start"));
        getRequest().setAttribute("hasSpecificationReview", checkPhaseExistence(detail, "specification_review_start"));
        getRequest().setAttribute("hasSubmission", checkPhaseExistence(detail, "submission_start"));
        getRequest().setAttribute("hasScreening", checkPhaseExistence(detail, "screening_start"));
        getRequest().setAttribute("hasReview", checkPhaseExistence(detail, "review_start"));
        getRequest().setAttribute("hasAppeals", checkPhaseExistence(detail, "appeals_start"));
        getRequest().setAttribute("hasAggregation", checkPhaseExistence(detail, "aggregation_start"));
        getRequest().setAttribute("hasAggregationReview", checkPhaseExistence(detail, "agg_review_start"));
        getRequest().setAttribute("hasFinalFixes", checkPhaseExistence(detail, "final_fix_start"));
        getRequest().setAttribute("hasFinalReview", checkPhaseExistence(detail, "final_review_start"));
    }

    private Boolean checkPhaseExistence(ResultSetContainer rsc, String columnName) {
	    if (rsc.isValidColumn(columnName) == false) {
            return Boolean.FALSE;		
		}
		
        String columnValue = rsc.getStringItem(0, columnName);
        if (columnValue == null || columnValue.trim().equals("")) {
            return Boolean.FALSE;
        } else {
            return Boolean.TRUE;
        }
    }

    /**
     * <p>Creates new <code>RBoardApplication</code> EJB instance. Looks up for home interface in <code>JNDI</code>
     * context and creates new EJB instance.</p>
     *
     * @return a <code>RBoardApplication</code> EJB instance.
     * @throws CreateException if an unexpected error occurs.
     */
    protected RBoardApplication createRBoardApplication() throws CreateException {
        InitialContext ctx = null;
        RBoardApplication rBoardApplication = null;
        try {

            ctx = TCContext.getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            if (log.isDebugEnabled()) {
                log.debug("context: " + ctx.getEnvironment().toString());
            }

            Object objRBoardApplication = ctx.lookup(RBoardApplicationHome.class.getName());
            RBoardApplicationHome rBoardApplicationHome =
                (RBoardApplicationHome) PortableRemoteObject.narrow(objRBoardApplication, RBoardApplicationHome.class);

            rBoardApplication = rBoardApplicationHome.create();
        } catch (Exception e) {
            try {
                ctx.close();
            } catch (Exception ex) {
            }
            throw new CreateException("Could not find bean!" + e);
        }
        try {
            ctx.close();
        } catch (Exception ex) {
        }
        return rBoardApplication;
    }

    /**
     * <p>Creates new review board application for specified project.</p>
     *
     * @param reviewerType a <code>String</code> referencing the reviewer type.
     * @param numSubmissions a <code>int</code> providing the total number of submissions for project.
     * @param numSubmissionsPassed a <code>int</code> providing the number of submissions passed review.
     * @param phaseId a <code>int</code> providing the phase ID.
     * @param levelId a <code>int</code> referencing the project difficulty level.
     * @param userId a <code>long</code> providing the ID of a user.
     * @param handle a <code>long</code> providing the handler for the user.
     * @param primary <code>true</code> if reviewer type corresponds to primary reviewer; <code>false</code> otherwise.
     * @param projectId a <code>long</code> providing the ID of a project.
     * @param reviewerTypeId a <code>int</code> referencing the reviewer type.
     * @return a <code>ReviewBoardApplication</code> providing the reviewer payments for the specified project.
     * @throws Exception if an unexpected error occurs.
     */
    @Deprecated
    protected ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int numSubmissionsPassed,
                                             int phaseId, int levelId, long userId, String handle, boolean primary,
                                             long projectId, int reviewerTypeId) throws Exception {
        ReviewBoardApplication ret = makeApp(reviewerType, numSubmissions, numSubmissionsPassed, phaseId, levelId,
                                             projectId, reviewerTypeId);
        ret.setHandle(handle);
        ret.setPrimary(primary);
        ret.setUserId(userId);
        return ret;
    }

    /**
     * <p>Creates new review board application for specified project.</p>
     *
     * @param reviewerType a <code>String</code> referencing the reviewer type.
     * @param numSubmissions a <code>int</code> providing the total number of submissions for project.
     * @param numSubmissionsPassed a <code>int</code> providing the number of submissions passed review.
     * @param phaseId a <code>int</code> providing the phase ID.
     * @param levelId a <code>int</code> referencing the project difficulty level.
     * @param userId a <code>long</code> providing the ID of a user.
     * @param handle a <code>long</code> providing the handler for the user.
     * @param primary <code>true</code> if reviewer type corresponds to primary reviewer; <code>false</code> otherwise.
     * @param projectId a <code>long</code> providing the ID of a project.
     * @param reviewerTypeId a <code>int</code> referencing the reviewer type.
     * @param prize a <code>float</code> providing the prize amount for contest.
     * @param drPoints a <code>float</code> providing the DR points amount.
     * @return a <code>ReviewBoardApplication</code> providing the reviewer payments for the specified project.
     * @throws Exception if an unexpected error occurs.
     */
    protected ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int numSubmissionsPassed,
                                             int phaseId, int levelId, long userId, String handle, boolean primary,
                                             long projectId, int reviewerTypeId, float prize, float drPoints)
        throws Exception {

        ReviewBoardApplication ret = makeApp(reviewerType, numSubmissions, numSubmissionsPassed, phaseId, levelId,
                                             projectId, reviewerTypeId, prize, drPoints);
        ret.setHandle(handle);
        ret.setPrimary(primary);
        ret.setUserId(userId);
        return ret;
    }

    /**
     * <p>Creates new review board application for specified project.</p>
     *
     * @param reviewerType a <code>String</code> referencing the reviewer type.
     * @param numSubmissions a <code>int</code> providing the total number of submissions for project.
     * @param numSubmissionsPassed a <code>int</code> providing the number of submissions passed review.
     * @param phaseId a <code>int</code> providing the phase ID.
     * @param levelId a <code>int</code> referencing the project difficulty level.
     * @param projectId a <code>long</code> providing the ID of a project.
     * @param reviewerTypeId a <code>int</code> referencing the reviewer type.
     * @return a <code>ReviewBoardApplication</code> providing the reviewer payments for the specified project.
     * @throws Exception if an unexpected error occurs.
     */
    @Deprecated
    protected ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int numSubmissionsPassed,
                                             int phaseId, int levelId, long projectId, int reviewerTypeId)
        throws Exception {

        //figure out if we have default money values for the reviewers
        Request r = new Request();
        r.setContentHandle("review_board_payments");

        r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
        r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));

        Map results = getDataAccess().getData(r);
        ResultSetContainer detail = (ResultSetContainer) results.get("review_board_payments");

        ReviewBoardApplication ret = null;
        if (detail.isEmpty()) {
            //we'll always assume all submission gets through screening
            ret = new ReviewBoardApplication(phaseId, levelId, numSubmissions, numSubmissionsPassed);
        } else {
            ret = new ReviewBoardApplication(phaseId, detail.getFloatItem(0, "primary_amount"),
                                             detail.getFloatItem(0, "amount"), 0);
        }

        ret.setProjectId(projectId);
        ret.setReviewerType(reviewerType);
        ret.setReviewerTypeId(reviewerTypeId);
        return ret;
    }

    /**
     * <p>Creates new review board application for specified project.</p>
     *
     * @param reviewerType a <code>String</code> referencing the reviewer type.
     * @param numSubmissions a <code>int</code> providing the total number of submissions for project.
     * @param numSubmissionsPassed a <code>int</code> providing the number of submissions passed review.
     * @param phaseId a <code>int</code> providing the phase ID.
     * @param levelId a <code>int</code> referencing the project difficulty level.
     * @param projectId a <code>long</code> providing the ID of a project.
     * @param reviewerTypeId a <code>int</code> referencing the reviewer type.
     * @param prize a <code>float</code> providing the prize amount for contest.
     * @param drPoints a <code>float</code> providing the DR points amount.
     * @return a <code>ReviewBoardApplication</code> providing the reviewer payments for the specified project.
     * @throws Exception if an unexpected error occurs.
     */
    protected ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int numSubmissionsPassed,
                                             int phaseId, int levelId, long projectId, int reviewerTypeId, float prize,
                                             float drPoints) throws Exception {
        Request r = new Request();

        r.setContentHandle("review_board_payments");
        r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
        r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));		

        Map results = getDataAccess().getData(r);
        ResultSetContainer detail = (ResultSetContainer) results.get("review_board_payments");

        ReviewBoardApplication ret = null;
        if (detail.isEmpty()) {
            ret = new ReviewBoardApplication(phaseId, levelId, numSubmissions, numSubmissionsPassed, prize, drPoints);
        } else {
            ret = new ReviewBoardApplication(phaseId, detail.getFloatItem(0, "primary_amount"),
                                             detail.getFloatItem(0, "amount"), 0);
        }

        ret.setProjectId(projectId);
        ret.setReviewerType(reviewerType);
        ret.setReviewerTypeId(reviewerTypeId);

        return ret;
    }

    /**
     * <p>Creates new spec review board application for specified project.</p>
     *
     * @param phaseId a <code>int</code> providing the phase ID.
     * @param levelId a <code>int</code> referencing the project difficulty level.
     * @param projectId a <code>long</code> providing the ID of a project.
     * @param prize a <code>float</code> providing the prize amount for contest.
     * @param reviewerTypeId the id of the reviewer type.
     * @param reviewerType the name of the reviewer type.
     * @return a <code>ReviewBoardApplication</code> providing the reviewer payments for the specified project.
     * @throws Exception if an unexpected error occurs.
     * 
     * @since 1.0.6
     */
    @SuppressWarnings("unchecked")
    protected ReviewBoardApplication makeSpecReviewApp(int phaseId, int levelId, long projectId, float prize, int reviewerTypeId, String reviewerType) throws Exception {
        Request r = new Request();

        r.setContentHandle("spec_review_board_payments");
        r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
        r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));

        Map results = getDataAccess().getData(r);
        ResultSetContainer detail = (ResultSetContainer) results.get("spec_review_board_payments");

        ReviewBoardApplication ret = null;
        if (detail.isEmpty()) {
            // creates default price component
            // we default num submissions and num passed submissions to 1
            // dr points is also default to 0
            ret = new ReviewBoardApplication(phaseId-Constants.SPECIFICATION_COMPETITION_OFFSET, levelId, 1, 1, prize, 0);
        } else {
            // creates custom price component.
            ret = new ReviewBoardApplication(phaseId-Constants.SPECIFICATION_COMPETITION_OFFSET, 0, 0, detail.getFloatItem(0, "amount"));
        }

        ret.setProjectId(projectId);
        ret.setReviewerType(reviewerType);
        ret.setReviewerTypeId(reviewerTypeId);
        ret.setSpecificationReviewer(true);

        return ret;
    }

    /**
     * <p>Gets the logical name for the view which is to be used for displaying the list of review opportunities of
     * specified type requested by client.</p>
     * 
     * Updated for Version 1.0.6 - now review details are viewable through unified page.
     *
     * @param projectType a <code>String</code> referencing the project type requested by client.
     * @return a <code>String</code> referencing the view to be used for displaying the review details for projects of
     *         specified type.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private String getReviewProjectDetailView(String projectType) {
        return Constants.UNIFIED_REVIEW_PROJECT_DETAIL_PAGE;
    }
}
