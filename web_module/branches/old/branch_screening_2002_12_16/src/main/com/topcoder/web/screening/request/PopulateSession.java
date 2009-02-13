package com.topcoder.web.screening.request;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.SessionInfo;

public class PopulateSession extends BaseSessionProcessor {
    public void process() throws Exception {
        requireLogin();
        Request sessionInfo = new Request();
        sessionInfo.setProperty(DataAccessConstants.COMMAND,
                Constants.SESSION_LOOKUP_COMMAND);
        sessionInfo.setProperty("uid", 
                String.valueOf(getAuthentication().getUser().getId()));

        DataAccess access = getDataAccess();

        Map map = access.getData(sessionInfo);
        SessionInfo info = getSessionInfo();

        info.setCandidateList((ResultSetContainer)
                map.get(Constants.SESSION_CANDIDATE_INFO_QUERY_KEY));
        info.setProfileList((ResultSetContainer)
                map.get(Constants.SESSION_PROFILE_INFO_QUERY_KEY));

        setNextPage(Constants.SESSION_SETUP_PAGE);
        setNextPageInContext(true);
    }
}
