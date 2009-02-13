package com.topcoder.web.tc.controller.request.hs;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * @author cucu
 */
public class ProblemSolution extends Base {
    protected void businessProcessing() throws TCWebException {
        try {
            if (!userIdentified()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }

            if (!hasParameter("pm") || !hasParameter("rd") || !hasParameter("cr")) {
                throw new TCWebException("pm, rd and cr parameters are required");
            }

            Request r = new Request();
            r.setContentHandle("problem_solution");
            r.setProperty("pm", getRequest().getParameter("pm"));
            r.setProperty("rd", getRequest().getParameter("rd"));
            r.setProperty("cr", getRequest().getParameter("cr"));

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);


            getRequest().setAttribute("REQUEST_BEAN", r);
            getRequest().setAttribute("QUERY_RESPONSE", result);

            lookupSeason(Integer.parseInt(getRequest().getParameter("rd")));
            setNextPage(Constants.HS_PROBLEM_SOLUTION);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * Set the seasonId and seasonName request attributes by looking them up from the round.
     *
     * @param roundId round to lookup its season.
     * @throws Exception
     */
    private void lookupSeason(int roundId) throws Exception {
        Request r = new Request();
        r.setContentHandle("lookup_season");
        r.setProperty("rd", "" + roundId);
        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) result.get("lookup_season");
        if (rsc.getRowCount() < 1) {
            getRequest().setAttribute("seasonName", "");
            getRequest().setAttribute("seasonId", "-1");
        } else {
            getRequest().setAttribute("seasonName", rsc.getItem(0, "name").toString());
            getRequest().setAttribute("seasonId", rsc.getItem(0, "season_id").toString());
        }

    }


}
