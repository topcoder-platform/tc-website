package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.web.tc.model.ReviewBoardApplication;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.ArrayList;
import java.util.Map;
import java.util.Iterator;

/**
 * @author dok
 * Date: Feb 11, 2004
 */
public class ReviewProjectDetail extends Base {

    protected void developmentProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("review_project_detail");
            r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("pj")));
            r.setProperty("ph", StringUtils.checkNull(getRequest().getParameter("ph")));
            Map results = getDataAccess().getData(r);
            ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
            getRequest().setAttribute("projectDetail", detail);

            ArrayList reviewerList = new ArrayList(3);

            if (detail.isEmpty()) {
                throw new NavigationException("Could not find information on the project selected.");
            } else {
                if (detail.getLongItem(0, "phase_id") == SoftwareComponent.DEV_PHASE) {
                    ResultSetContainer reviewers = (ResultSetContainer) results.get("development_reviewers");
                    ResultSetContainer.ResultSetRow row = null;
                    //add all the positions
                    for (Iterator it = reviewers.iterator(); it.hasNext();) {
                        row = (ResultSetContainer.ResultSetRow) it.next();
                        //this one has not been assigned yet
                        if (row.getStringItem("handle") == null) {
                            reviewerList.add(makeApp(row.getStringItem("reviewer_type"),
                                    detail.getIntItem(0, "submission_count"),
                                    detail.getIntItem(0, "phase_id"),
                                    detail.getIntItem(0, "level_id"),
                                    detail.getLongItem(0, "project_id"),
                                    detail.getIntItem(0, "review_resp_id")));
                        } else {
                            //this one has been assigned
                            reviewerList.add(makeApp(row.getStringItem("reviewer_type"),
                                    detail.getIntItem(0, "submission_count"),
                                    detail.getIntItem(0, "phase_id"),
                                    detail.getIntItem(0, "level_id"),
                                    row.getLongItem("user_id"),
                                    row.getStringItem("handle"),
                                    row.getIntItem("primary") == 1,
                                    detail.getLongItem(0, "project_id"),
                                    detail.getIntItem(0, "review_resp_id")));
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
                    }

                } else {
                    ResultSetContainer reviewers = (ResultSetContainer) results.get("design_reviewers");
                    ResultSetContainer.ResultSetRow row = null;
                    int count = 0;
                    //add all the assigned positions
                    for (Iterator it = reviewers.iterator(); it.hasNext();) {
                        count++;
                        row = (ResultSetContainer.ResultSetRow) it.next();
                        reviewerList.add(makeApp("Reviewer",
                                detail.getIntItem(0, "submission_count"),
                                detail.getIntItem(0, "phase_id"),
                                detail.getIntItem(0, "level_id"),
                                row.getLongItem("user_id"),
                                row.getStringItem("handle"),
                                row.getIntItem("primary") == 1,
                                detail.getLongItem(0, "project_id"),
                                0));
                    }
                    for (int i = count; i < 3; i++) {
                        //add empty positions until the list is 3 long
                        reviewerList.add(makeApp("Reviewer",
                                detail.getIntItem(0, "submission_count"),
                                detail.getIntItem(0, "phase_id"),
                                detail.getIntItem(0, "level_id"),
                                detail.getLongItem(0, "project_id"),
                                0));
                    }

                    //if there is no primary spot in the list, put one in there
                    ReviewBoardApplication app = null;
                    boolean hasPrimary = false;
                    for (Iterator it = reviewerList.iterator(); it.hasNext();) {
                        app = (ReviewBoardApplication) it.next();
                        hasPrimary |= app.isPrimary();
                    }
                    //set a primary, but only do it to a spot that is not
                    //already taken as a non-primary
                    for (Iterator it = reviewerList.iterator(); it.hasNext() && !hasPrimary;) {
                        app = (ReviewBoardApplication) it.next();
                        if (!app.isSpotFilled()) {
                            app.setPrimary(true);
                            hasPrimary = true;
                        }
                    }
                }

                getRequest().setAttribute("reviewerList", reviewerList);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage("/dev/reviewProjectDetail.jsp");
        setIsNextPageInContext(true);

    }

    private ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int phaseId,
                                           int levelId, long userId, String handle, boolean primary,
                                           long projectId, int reviewerTypeId) {
        ReviewBoardApplication ret = makeApp(reviewerType, numSubmissions, phaseId, levelId, projectId, reviewerTypeId);
        ret.setHandle(handle);
        ret.setPrimary(primary);
        ret.setUserId(userId);
        return ret;
    }

    private ReviewBoardApplication makeApp(String reviewerType, int numSubmissions, int phaseId,
                                           int levelId, long projectId, int reviewerTypeId) {
        //we'll always assume 1 submission gets through screening
        ReviewBoardApplication ret = new ReviewBoardApplication(phaseId, levelId, numSubmissions, 1);
        ret.setProjectId(projectId);
        ret.setReviewerType(reviewerType);
        ret.setReviewerTypeId(reviewerTypeId);
        return ret;
    }


}
