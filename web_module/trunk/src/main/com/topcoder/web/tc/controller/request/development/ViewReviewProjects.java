package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Iterator;
import java.util.ArrayList;

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
