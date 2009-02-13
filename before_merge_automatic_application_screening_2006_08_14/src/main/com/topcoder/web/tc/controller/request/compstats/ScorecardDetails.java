/*
 * CompList.java
 *
 * Created on August 12, 2005 by Cucu
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author cucu
 */
public class ScorecardDetails extends Base {
    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String projectId = StringUtils.checkNull(getRequest().getParameter("pj"));
            String userId = StringUtils.checkNull(getRequest().getParameter("uid"));
            String reviewerId = getRequest().getParameter("rid");

            r.setContentHandle("get_scorecard");
            r.setProperty("pj", projectId);
            r.setProperty("cr", userId);

            ResultSetContainer rscScorecard = null;

            if (reviewerId == null) {
                // screening
                rscScorecard = (ResultSetContainer) getDataAccess(true).getData(r).get("get_screening_scorecard");
                reviewerId = rscScorecard.getStringItem(0, "reviewer_id");

            } else {
                // review
                r.setProperty("rw", reviewerId);
                rscScorecard = (ResultSetContainer) getDataAccess(true).getData(r).get("get_review_scorecard");
            }

            if (rscScorecard.isEmpty()) {
                throw new NavigationException("Sorry, the invalid information specified in request.");
            }
            String scorecardId = rscScorecard.getStringItem(0, "scorecard_id");
            String scorecardTemplateId = rscScorecard.getStringItem(0, "scorecard_template_id");

            r = new Request();
            r.setContentHandle("scorecard_details");
            r.setProperty("pj", projectId);
            r.setProperty("scr", scorecardId);
            r.setProperty("scrt", scorecardTemplateId);

            Map result = getDataAccess(true).getData(r);

           // check if the project is completed
            ResultSetContainer projectInfo = (ResultSetContainer) result.get("project_info");
            if ((projectInfo.getIntItem(0, "status_id") != 4) &&
                (projectInfo.getIntItem(0, "status_id") != 5) &&
                (projectInfo.getIntItem(0, "status_id") != 6)) {
                 throw new NavigationException("The project is not finished");

            }

            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("rid", reviewerId);
            getRequest().setAttribute("uid", userId);

            setNextPage("/compstats/scorecardDetails.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

