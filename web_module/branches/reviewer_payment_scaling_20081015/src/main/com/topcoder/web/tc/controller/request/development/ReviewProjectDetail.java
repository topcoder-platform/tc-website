/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.apps.review.rboard.RBoardApplicationHome;
import com.topcoder.common.web.util.DateTime;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.ReviewBoardApplication;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/**
 * Shows project review details.
 * <p/>
 * <p/>
 * Version  .0.1 Change notes:
 * <ol>
 * <li>
 * RBoard related tasks were moved to a tcs bean.
 * </li>
 * </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.0.1
 */
public class ReviewProjectDetail extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("review_project_detail");
            r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
            int phase_id = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
            getRequest().setAttribute("phase_id", new Integer(phase_id));

            r.setProperty(Constants.PHASE_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
            Map results = getDataAccess().getData(r);
            ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
            getRequest().setAttribute("projectDetail", detail);

            ArrayList reviewerList = new ArrayList(3);

            if (detail.isEmpty()) {
                throw new NavigationException("Could not find information on the project selected.");
            } else {
                //set submission count to 1 for zero submissions
                int numSubmissions = detail.getIntItem(0, "submission_count");
                int numSubmissionsPassed = detail.getIntItem(0, "submission_passed_screening_count");
                if (numSubmissions == 0) {
                    numSubmissions = 1;
                    numSubmissionsPassed = 1;
                }


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
                                                 row.getIntItem("review_resp_id")));
                    } else {
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
                                                 row.getIntItem("review_resp_id")));
                    }
                }

                //if there is no primary spot in the list, put one in there
                //and make sure it's the Failure reviewer
                ReviewBoardApplication app = null;
                boolean hasPrimary = false;
                for (Iterator it = reviewerList.iterator(); it.hasNext();) {
                    app = (ReviewBoardApplication) it.next();
                    hasPrimary |= app.isPrimary();
                }
                if (!hasPrimary) {
                    if (detail.getLongItem(0, "phase_id") == SoftwareComponent.DEV_PHASE || detail.getLongItem(0, "phase_id") == 116) {

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

                getRequest().setAttribute("applicationDelayHours", new Integer((int) (applicationDelay / (1000 * 60 * 60))));
                getRequest().setAttribute("applicationDelayMinutes", new Integer((int) ((applicationDelay % (1000 * 60 * 60)) / (1000 * 60))));
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage(Constants.REVIEW_PROJECT_DETAIL);
        setIsNextPageInContext(true);

    }

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

    protected ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int numSubmissionsPassed, int phaseId,
                                             int levelId, long userId, String handle, boolean primary,
                                             long projectId, int reviewerTypeId) throws Exception {
        ReviewBoardApplication ret = makeApp(reviewerType, numSubmissions, numSubmissionsPassed, phaseId, levelId, projectId, reviewerTypeId);
        ret.setHandle(handle);
        ret.setPrimary(primary);
        ret.setUserId(userId);
        return ret;
    }

    @Deprecated
    protected ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int numSubmissionsPassed, int phaseId,
                                             int levelId, long projectId, int reviewerTypeId) throws Exception {
        //figure out if we have default money values for the reviewers
        Request r = new Request();
        r.setContentHandle("review_board_payments");
        /*
          r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
          r.setProperty(Constants.PHASE_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
        */
        r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
        //        r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));

        Map results = getDataAccess().getData(r);
        ResultSetContainer detail = (ResultSetContainer) results.get("review_board_payments");

        ReviewBoardApplication ret = null;
        if (detail.isEmpty()) {
            //we'll always assume all submission gets through screening
            ret = new ReviewBoardApplication(phaseId, levelId, numSubmissions, numSubmissionsPassed);
        } else {
            ret = new ReviewBoardApplication(phaseId, detail.getFloatItem(0, "primary_amount"), detail.getFloatItem(0, "amount"));
        }

        ret.setProjectId(projectId);
        ret.setReviewerType(reviewerType);
        ret.setReviewerTypeId(reviewerTypeId);
        return ret;
    }

    protected ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int numSubmissionsPassed, int phaseId,
                                             int levelId, long projectId, int reviewerTypeId, float prize, float drPoints) throws Exception {
        Request r = new Request();

        r.setContentHandle("review_board_payments");
        r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));

        Map results = getDataAccess().getData(r);
        ResultSetContainer detail = (ResultSetContainer) results.get("review_board_payments");

        ReviewBoardApplication ret = null;
        if (detail.isEmpty()) {
            ret = new ReviewBoardApplication(phaseId, levelId, numSubmissions, numSubmissionsPassed, prize, drPoints);
        } else {
            ret = new ReviewBoardApplication(phaseId, detail.getFloatItem(0, "primary_amount"), detail.getFloatItem(0, "amount"));
        }

        ret.setProjectId(projectId);
        ret.setReviewerType(reviewerType);
        ret.setReviewerTypeId(reviewerTypeId);

        return ret;
    }

}
