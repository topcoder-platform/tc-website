package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * @version $Revision: 72449 $ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 29, 2005
 */
public class SubmitSuccess extends Base {

    protected void longContestProcessing() throws TCWebException {
        try {
            int numberOfSubmissionOnLongTestQueue = LongContestServicesLocator.getService().getNumberOfSubmissionOnLongTestQueue();
            getRequest().setAttribute(Constants.QUEUE_LENGTH, new Long(numberOfSubmissionOnLongTestQueue));
            getRequest().setAttribute(Constants.ROUND_ID, getRequest().getParameter(Constants.ROUND_ID));
            getRequest().setAttribute(Constants.COMPONENT_ID, getRequest().getParameter(Constants.COMPONENT_ID));
            getRequest().setAttribute(Constants.CONTEST_ID, getRequest().getParameter(Constants.CONTEST_ID));
            getRequest().setAttribute(Constants.MESSAGE, getRequest().getSession().getAttribute(Constants.MESSAGE));
            getRequest().getSession().removeAttribute(Constants.MESSAGE);
            setNextPage(Constants.PAGE_SUBMIT_SUCCESS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
