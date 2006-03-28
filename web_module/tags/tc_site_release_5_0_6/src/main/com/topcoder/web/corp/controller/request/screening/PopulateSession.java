package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.TestSessionInfo;

import java.util.Map;

public class PopulateSession extends BaseSessionProcessor {
    protected void screeningProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        Request sessionInfo = new Request();
        sessionInfo.setProperty(DataAccessConstants.COMMAND,
                Constants.SESSION_LOOKUP_COMMAND);
        sessionInfo.setProperty("uid",
                String.valueOf(getAuthentication().getUser().getId()));
        try {
            DataAccessInt access = Util.getDataAccess();

            Map map = access.getData(sessionInfo);
            TestSessionInfo info = getTestSessionInfo();

            info.setCandidateList((ResultSetContainer)
                    map.get(Constants.SESSION_CANDIDATE_INFO_QUERY_KEY));
            info.setProfileList((ResultSetContainer)
                    map.get(Constants.SESSION_PROFILE_INFO_QUERY_KEY));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.SESSION_SETUP_PAGE);
        setIsNextPageInContext(true);
    }
}
