package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.common.Util;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.ArrayList;
import java.util.Map;

/**
 * Processor for Problem List page.
 * @author Porgery
 */
public class ProblemList extends BaseProcessor {

    /** Implements the processing step.
     * @throws TCWebException
     */
    protected void businessProcessing() throws TCWebException {
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
                        subList.add(
                                ProblemInfo.createProblemInfo(user,
                                        Long.parseLong(round),
                                        Long.parseLong(problem)));
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
