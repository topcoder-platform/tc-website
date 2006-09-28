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
            long refId = Long.parseLong(getRequest().getParameter("reference_id"));
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));
            long coderId = Long.parseLong(getRequest().getParameter("cr"));

            BasePayment payment = BasePayment.createPayment(type, coderId, 0.01, refId);

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

