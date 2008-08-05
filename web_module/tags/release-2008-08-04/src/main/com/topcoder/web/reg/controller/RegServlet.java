package com.topcoder.web.reg.controller;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.WebAuthentication;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class RegServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(RegServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        if (log.isDebugEnabled())
            log.debug("hasPermission called " + auth.getActiveUser().getUserName() + " " + r.getName());
        return true;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        //dont' use the SSO session.  it just causes trouble.  they almost always have to
        //login to update their information anyway.
        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response,
                BasicAuthentication.REG_SITE, DBMS.JTS_OLTP_DATASOURCE_NAME);
    }

    protected Authorization createAuthorization(User user) throws Exception {
        return new TCSAuthorization(SecurityHelper.getUserSubject(user.getId(), DBMS.JTS_OLTP_DATASOURCE_NAME));
    }

    protected TCSubject getUser(long id) throws Exception {
        return SecurityHelper.getUserSubject(id, DBMS.JTS_OLTP_DATASOURCE_NAME);
    }
}
