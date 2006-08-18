package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 28, 2006
 */
public class ContestStatus extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            String phaseId = getRequest().getParameter(Constants.PHASE_ID);
            if (String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId)||String.valueOf(SoftwareComponent.DEV_PHASE).equals(phaseId)) {
                Request r = new Request();
                r.setContentHandle("contest_status");
                r.setProperties(getRequest().getParameterMap());
                r.setProperty(DataAccessConstants.SORT_QUERY, "contest_status");
                getRequest().setAttribute("contests", getDataAccess().getData(r).get("contest_status"));

                getRequest().setAttribute(Constants.PHASE_ID, phaseId);

                SortInfo s = new SortInfo();
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                setNextPage("/dev/contestStatus.jsp");
                setIsNextPageInContext(true);
            } else {
                throw new TCWebException("Invalid phase specified " + phaseId);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }
}
