package com.topcoder.web.screening.request;

import java.util.Map;
import java.util.HashMap;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;

import com.topcoder.web.screening.common.Constants;

public class BuildCandidateList extends BaseProcessor {
    private Request dataRequest;
    
    public BuildCandidateList() {
        dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, 
                Constants.CANDIDATE_LIST_QUERY_KEY);

    }

    public void process() throws Exception {

        User user = getAuthentication().getActiveUser();

        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(Constants.DATA_SOURCE),
                                        DataSource.class);
        DataAccess dAccess = new DataAccess(ds);
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
        setNextPageInContext(true);
    }
}
