package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.http.HttpUtils;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * User: dok
 * Date: Nov 18, 2004
 * Time: 3:28:26 PM
 */
public class Legacy extends Base {

    protected void businessProcessing() throws TCWebException {
        log.debug("process called....");
        try {
            if (((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
                response_addr = Constants.REPORT_PROFILE_SEARCH_RESULTS_ADDR;
                Map m = parseQueryString(getRequest());
                getRequest().setAttribute("XYZ",m);
                setNextPage(Constants.JSP_ADDR + response_addr);
                setIsNextPageInContext(true);
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }


    private Map parseQueryString(TCRequest request) {
        log.debug("parseQueryString called...");
        Enumeration e = null;
        String param = null;
        String[] values = null;
        Map m = null;

        e = request.getParameterNames();

        m = new HashMap();
        while (e.hasMoreElements()) {
            param = (String) e.nextElement();
            values = request.getParameterValues(param);
            if (value != null && value.length > 0) {
                m.put(param, request.getParameter(param));
            }
        }
        return m;
    }
}
