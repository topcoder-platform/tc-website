package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;

import java.util.Map;

public class BuildCandidateList extends BaseScreeningProcessor {
    private Request dataRequest;

    public BuildCandidateList() {
        dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND,
                Constants.CANDIDATE_LIST_QUERY_KEY);

    }

    protected void screeningProcessing() throws TCWebException {

        User user = getUser();

        try {
            DataAccessInt dAccess = Util.getDataAccess();
            dataRequest.setProperty("uid", String.valueOf(user.getId()));

            int startVal = 0;
            int endVal = 0;
            String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            if (start.equals(""))
                startVal = 1;
            else
                startVal = Integer.parseInt(start);

            String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            if (end.equals(""))
                endVal = Constants.SEARCH_SCROLL_SIZE;
            else
                endVal = Integer.parseInt(end);

            //make sure we like the size they they're searching for
            if (endVal - startVal > (Constants.SEARCH_SCROLL_SIZE - 1)) {
                endVal = startVal + (Constants.SEARCH_SCROLL_SIZE - 1);
            }

            dataRequest.setProperty(DataAccessConstants.START_RANK, String.valueOf(startVal));
            dataRequest.setProperty(DataAccessConstants.END_RANK, String.valueOf(endVal));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            if (sortCol.equals("")) {
                sortCol = "6";
            }
            dataRequest.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);

            Map map = dAccess.getData(dataRequest);

            if (map != null && map.size() == 2) {
                ResultSetContainer result =
                        (ResultSetContainer) map.get(Constants.CANDIDATE_LIST_QUERY_KEY);

                ResultSetContainer rscCount = (ResultSetContainer) map.get("candidateListCount");
                int count = rscCount.getIntItem(0, 0);

                if (endVal > count) {
                    endVal = count;
                }
                if (count == 0) {
                    startVal = 0;
                }

                getRequest().setAttribute(DataAccessConstants.START_RANK, String.valueOf(startVal));
                getRequest().setAttribute(DataAccessConstants.END_RANK, String.valueOf(endVal));
                getRequest().setAttribute(DataAccessConstants.NUMBER_RECORDS, String.valueOf(count));

                getRequest().setAttribute(DataAccessConstants.SORT_COLUMN, StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN)));
                getRequest().setAttribute(Constants.CANDIDATE_LIST_QUERY_KEY, result);
            }

            getRequest().setAttribute(Constants.USER_ID, String.valueOf(getUser().getId()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.CANDIDATE_LIST_PAGE);
        setIsNextPageInContext(true);
    }
}
