package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import javax.servlet.ServletRequest;
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
            Map map = dAccess.getData(dataRequest);

            if (map != null && map.size() == 1) {
                ResultSetContainer result =
                        (ResultSetContainer) map.get(Constants.CANDIDATE_LIST_QUERY_KEY);
                
                String sortBy = getRequest().getParameter(Constants.SORT_BY);
                if (sortBy != null) {
                    if(sortBy.equals("preference"))
                    {
                        result.sortByColumn(sortBy, false);
                    }
                    else
                        result.sortByColumn(sortBy, true);
                    
                    getRequest().setAttribute(Constants.SORT_BY, sortBy);
                }
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
