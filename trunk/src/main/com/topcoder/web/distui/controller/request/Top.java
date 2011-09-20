package com.topcoder.web.distui.controller.request;

import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.security.LightAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 12, 2007
 */
public class Top extends Base {
    public void process() throws Exception {

        String userId = StringUtils.checkNull(getRequest().getParameter(WebConstants.USER_ID));
        WebAuthentication auth = new LightAuthentication(new SessionPersistor(getRequest().getSession(true)),
            getRequest(), getResponse(), LightAuthentication.MAIN_SITE);
        if (!"".equals(userId.trim())) {
            try {
                User u = new SimpleUser(new Long(userId),"", "");
                auth.login(u,false);
            } catch (NumberFormatException e) {
                //ignore
            }
        }

        SessionInfo info = new SessionInfo(getRequest(), auth, Collections.EMPTY_SET);

        getRequest().setAttribute(BaseServlet.SESSION_INFO_KEY, info);

        setNextPage("/top.jsp");
        setIsNextPageInContext(true);
    }
}
