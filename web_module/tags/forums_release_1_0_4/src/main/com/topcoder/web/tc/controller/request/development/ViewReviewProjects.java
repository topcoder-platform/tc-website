package com.topcoder.web.tc.controller.request.development;

import com.topcoder.common.web.util.DateTime;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.rboard.RBoardApplication;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.ProjectReviewApply;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author dok
 * Date: Feb 10, 2004
 */
public class ViewReviewProjects extends ReviewProjectDetail {

    protected void developmentProcessing() throws TCWebException {
        Request r = new Request();
        r.setContentHandle("review_projects");
        try {
            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("review_projects");
            getRequest().setAttribute("projectList", rsc);

            ResultSetContainer.ResultSetRow rsr = null;
            ArrayList prices = new ArrayList();
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                //we don't really care what the reviewer type nor review responsibility, we really just want to know
                //what it costs.
                if (rsr.getIntItem("submission_count") == 0) {
                    //default to 1 submission if no one has submitted yet - rfairfax
                    prices.add(makeApp("", 1, 1,
                            rsr.getIntItem("phase_id"), rsr.getIntItem("level_id"), rsr.getLongItem("project_id"), 0).getComponent());
                } else {
                    prices.add(makeApp("", rsr.getIntItem("submission_count"), rsr.getIntItem("submission_passed_screening_count"),
                            rsr.getIntItem("phase_id"), rsr.getIntItem("level_id"), rsr.getLongItem("project_id"), 0).getComponent());
                }
            }
            getRequest().setAttribute("prices", prices);

            RBoardApplication rba = (RBoardApplication) createEJB(getInitialContext(), RBoardApplication.class);
            Timestamp ts = rba.getLatestReviewApplicationTimestamp(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId());
            if (ts != null && System.currentTimeMillis() < ts.getTime() + ProjectReviewApply.APPLICATION_DELAY) {
                getRequest().setAttribute("waitingToReview", Boolean.TRUE);
                getRequest().setAttribute("waitingUntil",
                        DateTime.timeStampToString(new Timestamp(ts.getTime() + ProjectReviewApply.APPLICATION_DELAY)));
            } else {
                getRequest().setAttribute("waitingToReview", Boolean.FALSE);
                getRequest().setAttribute("waitingUntil", new String(""));
            }

            //getRequest().setAttribute("tournamentProjectList", getDataAccess().getData(r).get("tournament_review_projects"));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage(Constants.REVIEW_PROJECTS);
        setIsNextPageInContext(true);
    }


}
