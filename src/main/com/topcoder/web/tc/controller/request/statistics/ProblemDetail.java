package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 * User: dok
 * Date: Jul 22, 2004
 * Time: 4:02:16 PM
 */
public class ProblemDetail extends Base {

    protected void businessProcessing() throws TCWebException {

        try {
            if (!userIdentified())
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));

            Request r = new Request();
            r.setContentHandle("problem_detail");
            r.setProperty("pm", getRequest().getParameter("pm"));
            r.setProperty("rd", getRequest().getParameter("rd"));

            DataAccessInt dai = getDataAccess(true);
            r.setProperty("dn", "1");
            getRequest().setAttribute("div1Results", dai.getData(r));
            r.setProperty("dn", "2");
            getRequest().setAttribute("div2Results", dai.getData(r));

            setNextPage(Constants.PROBLEM_DETAIL);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }
}
