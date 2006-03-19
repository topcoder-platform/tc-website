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
import com.topcoder.shared.security.LoginException;

import java.util.Arrays;

public class Wager extends Base {

    private static final Logger log = Logger.getLogger(Wager.class);

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            throw new LoginException("Handle or password incorrect.");
        }
        
        log.debug("Authenticated, go to " + Constants.WAGER_PAGE);
        setNextPage(Constants.WAGER_PAGE);
        setIsNextPageInContext(true);
    }

}
