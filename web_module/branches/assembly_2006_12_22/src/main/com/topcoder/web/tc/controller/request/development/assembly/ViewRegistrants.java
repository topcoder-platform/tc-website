package com.topcoder.web.tc.controller.request.development.assembly;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 4, 2006
 */
public class ViewRegistrants extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("assembly_registrants");
            r.setProperty(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
            getRequest().setAttribute("resultMap", getDataAccess().getData(r));
            setNextPage("/dev/assembly/registrants.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
