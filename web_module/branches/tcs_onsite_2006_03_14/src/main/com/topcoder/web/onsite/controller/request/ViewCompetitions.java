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

import java.util.Arrays;

public class ViewCompetitions extends Base {

    private static final Logger log = Logger.getLogger(ViewCompetitions.class);

    private ResultSetContainer findCurrentCompetitions(String userId) throws Exception {
        ProjectWagerLocal projectWagerLocal = 
            (ProjectWagerLocal) createLocalEJB(getInitialContext(), ProjectWager.class); 
        return projectWagerLocal.findCurrentCompetitions(userId);
    }

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
            
        ResultSetContainer comp = findCurrentCompetitions("");

        /*if (ResultSetContainer.size() == 0) {
            throw new TCWebException("Current competition not found.");
        }*/

        getRequest().setAttribute("result", comp);        
        
        log.debug("Authenticated, go to " + Constants.VIEW_COMPETITIONS_PAGE);
        setNextPage(Constants.VIEW_COMPETITIONS_PAGE);
        setIsNextPageInContext(true);
    }

}
