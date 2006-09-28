package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  cucu
 */
public class FillPaymentData extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            int refId = Integer.parseInt(getRequest().getParameter("reference_id"));
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));

            BasePayment payment = BasePayment.createPayment(type, 1, 0.01, refId);

            DataInterfaceBean dib = new DataInterfaceBean();

            payment = dib.fillPaymentData(payment);
            
            getRequest().setAttribute("payment", payment);
            
            setNextPage(INTERNAL_AJAX_FILL_PAYMENT_DATA);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

