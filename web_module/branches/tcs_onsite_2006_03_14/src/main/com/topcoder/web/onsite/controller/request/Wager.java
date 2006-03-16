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

import java.util.Arrays;

public class Wager extends Base {

    public static final String USER_ID = "userid";
    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";
    public static final String STATUS = "status";

    public static final String STATUS_START = "start";
    
    private static final Logger log = Logger.getLogger(Wager.class);

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            log.debug("Anonymous, go to " + Constants.LOGIN);
            setNextPage(Constants.LOGIN);
        } else {
            log.debug("Authenticated, go to " + Constants.WAGER_PAGE);
            setNextPage(Constants.WAGER_PAGE);
        }
        setIsNextPageInContext(true);
    }

}
