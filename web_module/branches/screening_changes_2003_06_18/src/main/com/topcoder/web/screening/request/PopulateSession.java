package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.Util;
import com.topcoder.web.screening.model.SessionInfo;
import com.topcoder.web.common.PermissionException;

import java.util.Map;

public class PopulateSession extends BaseSessionProcessor {
    protected void businessProcessing() throws Exception {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        Request sessionInfo = new Request();
        sessionInfo.setProperty(DataAccessConstants.COMMAND,
                Constants.SESSION_LOOKUP_COMMAND);
        sessionInfo.setProperty("uid", 
                String.valueOf(getAuthentication().getUser().getId()));

        DataAccessInt access = Util.getDataAccess();

        Map map = access.getData(sessionInfo);
        SessionInfo info = getSessionInfo();

        info.setCandidateList((ResultSetContainer)
                map.get(Constants.SESSION_CANDIDATE_INFO_QUERY_KEY));
        info.setProfileList((ResultSetContainer)
                map.get(Constants.SESSION_PROFILE_INFO_QUERY_KEY));

        setNextPage(Constants.SESSION_SETUP_PAGE);
        setIsNextPageInContext(true);
    }
}
