package com.topcoder.web.onsite.controller.request;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.onsite.Constants;
import com.topcoder.web.onsite.controller.request.Base;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.ejb.project.ProjectWagerLocal;
import com.topcoder.web.ejb.project.ProjectWager;
import com.topcoder.shared.dataAccess.DataAccess;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;


import java.util.Map;
import java.util.Arrays;

public class ViewCompetitions extends Base {

    private static final Logger log = Logger.getLogger(ViewCompetitions.class);

    private Map getViewCompetitionsData(long userId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.VIEW_WAGER_COMPETITIONS_COMMAND);
        request.setProperty(Constants.USER_ID, String.valueOf(userId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

        return dai.getData(request);
    }

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        
        Map m = getViewCompetitionsData(getUser().getId());
        ResultSetContainer comp = (ResultSetContainer)m.get(Constants.ACTUAL_TCO_CONTESTS_QUERY);

        getRequest().setAttribute(Constants.CURRENT_COMPETITION_RESULT_KEY, m.get(Constants.ACTUAL_TCO_CONTESTS_QUERY));        
        getRequest().setAttribute(Constants.WAGER_HISTORY_KEY, m.get(Constants.WAGER_HISTORY_QUERY));        
        
        log.debug("Authenticated, go to " + Constants.VIEW_COMPETITIONS_PAGE);
        setNextPage(Constants.VIEW_COMPETITIONS_PAGE);
        setIsNextPageInContext(true);
    }

}
