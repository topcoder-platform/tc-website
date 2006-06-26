/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.common.web.util.DateTime;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Shows active review projects.
 * <p/>
 * <p/>
 * Version 1.0.1 Change notes:
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
public class ViewReviewProjects extends ReviewProjectDetail {

    private String PHASE_ID_KEY = Constants.PHASE_ID;

    protected void developmentProcessing() throws TCWebException {
        int phase_id = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(PHASE_ID_KEY)));
        if (!(phase_id == SoftwareComponent.DESIGN_PHASE || phase_id == SoftwareComponent.DEV_PHASE)) {
            throw new TCWebException("Missing or invalid phase_id parameter (" + PHASE_ID_KEY + " expected)");
        }
        getRequest().setAttribute("phase_id", new Integer(phase_id));

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

            RBoardApplication rba = createRBoardApplication();
            Timestamp ts = rba.getLatestReviewApplicationTimestamp(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId());
            if (ts != null && System.currentTimeMillis() < ts.getTime() + RBoardApplication.APPLICATION_DELAY) {
                getRequest().setAttribute("waitingToReview", Boolean.TRUE);
                getRequest().setAttribute("waitingUntil",
                        DateTime.timeStampToString(new Timestamp(ts.getTime() + RBoardApplication.APPLICATION_DELAY)));
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
