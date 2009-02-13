package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 29, 2005
 */
public class SubmitSuccess extends Base {

    protected void longContestProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("long_queue_length");
            getRequest().setAttribute(Constants.QUEUE_LENGTH,
                    ((ResultSetContainer) getDataAccess().getData(r).get("long_queue_length")).getItem(0, "length").getResultData());
            getRequest().setAttribute(Constants.ROUND_ID, getRequest().getParameter(Constants.ROUND_ID));
            setNextPage(Constants.PAGE_SUBMIT_SUCCESS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
