package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.GenerateRoundPayments;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 7, 2005
 */
public class GeneratePayments extends BaseProcessor implements PactsConstants {


    protected void businessProcessing() throws TCWebException {
        try {
            if (getRequest().getParameter(ROUND_ID)!=null) {
                GenerateRoundPayments gpr = new GenerateRoundPayments();
                gpr.generatePayments(Long.parseLong(getRequest().getParameter(ROUND_ID)), true);
                addError(ROUND_ID, "Success");
            } else {
                addError(ROUND_ID, "Missing round id");
            }
            setNextPage(INTERNAL_GENERATE_PAYMENTS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
