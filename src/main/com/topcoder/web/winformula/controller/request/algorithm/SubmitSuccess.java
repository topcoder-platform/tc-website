package com.topcoder.web.winformula.controller.request.algorithm;

import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Nov 29, 2005
 */
public class SubmitSuccess extends AlgorithmBase {

    protected void longContestProcessing() throws TCWebException {
        try {
            int numberOfSubmissionOnLongTestQueue = LongContestServicesLocator.getService().getNumberOfSubmissionOnLongTestQueue();
            getRequest().setAttribute(CodingConstants.QUEUE_LENGTH, new Long(numberOfSubmissionOnLongTestQueue));
            setNextPage(CodingConstants.PAGE_SUBMIT_SUCCESS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
