package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.Util;
import com.topcoder.web.common.BaseProcessor;

import javax.servlet.ServletRequest;
import java.util.Map;

public class BuildCandidateList extends BaseProcessor {
    private Request dataRequest;
    
    public BuildCandidateList() {
        dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, 
                Constants.CANDIDATE_LIST_QUERY_KEY);

    }

    protected void businessProcessing() throws Exception {

        User user = getUser();

        DataAccessInt dAccess = Util.getDataAccess();
        dataRequest.setProperty("uid", String.valueOf(user.getId()));
        Map map = dAccess.getData(dataRequest);

        if(map != null && map.size() == 1)
        {
            ResultSetContainer result = 
                (ResultSetContainer)map.get(Constants.CANDIDATE_LIST_QUERY_KEY);
            ServletRequest request = getRequest();
            request.setAttribute(Constants.CANDIDATE_LIST_QUERY_KEY, result);
        }

        setNextPage(Constants.CANDIDATE_LIST_PAGE);
        setIsNextPageInContext(true);
    }
}
