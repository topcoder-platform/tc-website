package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.Request;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 4, 2006
 */
public class ViewRegistrants extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("registrants");
            getRequest().setAttribute("resultMap", getDataAccess().getData(r));
            setNextPage("/dev/registrants.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
