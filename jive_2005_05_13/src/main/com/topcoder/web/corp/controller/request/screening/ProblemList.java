package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.ProblemInfo;

import java.util.ArrayList;
import java.util.Map;

/**
 * Processor for Problem List page.
 * @author Porgery
 */
public class ProblemList extends BaseScreeningProcessor {

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void screeningProcessing() throws TCWebException {
        User user = getUser();

        Request dr = new Request();
        dr.setContentHandle("problemList");
        dr.setProperty("uid", String.valueOf(user.getId()));

        try {
            Map map = Util.getDataAccess(true).getData(dr);

            if (map == null || map.size() != 1)
                throw new ScreeningException("Data retrieval error");

            ResultSetContainer result =
                    (ResultSetContainer) map.get("problemList");

            ArrayList list = new ArrayList();
            if (result != null && result.size() > 0) {
                String round;
                int item = 0;
                /* looping twice to group problems into sets */
                while (item < result.size()) {
                    ArrayList subList = new ArrayList(3);
                    round = result.getItem(item, "session_round_id").toString();
                    while (item < result.size() &&
                            round.equals(result.getItem(item, "session_round_id").toString())) {
                        String problem = result.getItem(item, "problem_id").toString();
                        if (super.getUsageType() == Constants.USAGE_TYPE_SCREENING) {
                            subList.add(
                                    ProblemInfo.createProblemInfo(user,
                                            Long.parseLong(round),
                                            Long.parseLong(problem), true));
                        } else {
                            subList.add(
                                    ProblemInfo.createProblemInfo(user,
                                            Long.parseLong(round),
                                            Long.parseLong(problem)));
                        }
                        item++;
                    }
                    list.add(subList);
                }
            }

            getRequest().setAttribute("problemList", list);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.PROBLEM_LIST_PAGE);
        setIsNextPageInContext(true);
    }

}
