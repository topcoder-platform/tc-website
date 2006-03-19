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

import java.util.Arrays;

public class Logout extends Base {

    protected void businessProcessing() throws TCWebException {

        getAuthentication().logout();
        getRequest().getSession().invalidate();
        setNextPage(getNextPage());
        setIsNextPageInContext(false);
        log.debug("on successful login, going to " + getNextPage());
    }
}
