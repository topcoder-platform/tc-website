package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 */
public class NewPaymentEvent extends PaymentList implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        String[] values = getRequest().getParameterValues(CHECKED_PAYMENT_ID);
        DataInterfaceBean dib = new DataInterfaceBean();
        int wrongPayments = 0;
        int event = Integer.parseInt(getRequest().getParameter("status_id"));
        
        List<String> checkedIds = new ArrayList<String>(values.length);
        Map<Long, String> errors = null;
        try {
            errors = dib.newPaymentEvent(values, event);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        
        for (Map.Entry<Long, String> error : errors.entrySet()) {
            wrongPayments++;
            addError("err_" + error.getKey(), error.getValue());
        }

        if (!hasErrors()) {            
            getRequest().setAttribute("message_result", values.length + " payments successfully updated");
        } else {
            for (String value : values) {
                checkedIds.add(value);
            }
            getRequest().setAttribute("checked_payments", checkedIds);
            
            if (errors.containsKey(0l)) {
                getRequest().setAttribute("message_result", errors.get(0l));                
            } else {
                getRequest().setAttribute("message_result", "Your request could not be processed because " + wrongPayments + " errors have been found found, please try again");
            }
        }

        super.businessProcessing();
    }
}

