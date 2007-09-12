package com.topcoder.web.distui.controller.request;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;

import java.util.Collections;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 12, 2007
 */
public class Top extends Base {
    public void process() throws Exception {

        SessionInfo info = new SessionInfo(getRequest(),
                new BasicAuthentication(new SessionPersistor(getRequest().getSession()),
                        getRequest(), getResponse(), BasicAuthentication.MAIN_SITE), Collections.EMPTY_SET);

        getRequest().setAttribute(BaseServlet.SESSION_INFO_KEY, info);

        setNextPage("/top.jsp");
        setIsNextPageInContext(true);
    }
}
