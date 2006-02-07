package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 4, 2006
 */
public class ViewActiveContests extends Base {

    protected void developmentProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("active_contests");
            getRequest().setAttribute("resultMap", getDataAccess().getData(r));
            setNextPage("/dev/activeContests.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
