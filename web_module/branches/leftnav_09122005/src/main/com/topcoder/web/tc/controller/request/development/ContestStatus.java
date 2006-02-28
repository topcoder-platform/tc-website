package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 28, 2006
 */
public class ContestStatus extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("contest_status");
            r.setProperties(getRequest().getParameterMap());
            r.setProperty(DataAccessConstants.SORT_QUERY, "contest_status");
            getRequest().setAttribute("contests", getDataAccess().getData(r).get("contest_status"));

            setDefault(Constants.ROUND_ID, getRequest().getParameter(Constants.ROUND_ID));

            SortInfo s = new SortInfo();
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setNextPage("/dev/contestStatus.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }
}
