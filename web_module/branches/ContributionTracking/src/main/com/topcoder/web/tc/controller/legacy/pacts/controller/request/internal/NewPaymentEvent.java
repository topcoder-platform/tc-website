package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.Date;
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
        String[] paymentIDs = getRequest().getParameterValues(CHECKED_PAYMENT_ID);
        DataInterfaceBean dib = new DataInterfaceBean();
        int wrongPayments = 0;
        int event = Integer.parseInt(getRequest().getParameter("status_id"));
        String invoiceNumber = (event == 4) ? getRequest().getParameter("new_invoice_number") : null;
        Date payDate = (event == 2) ? checkDate("pay_date", "Please enter a valid pay date") : null;
        
        List<String> checkedIds = new ArrayList<String>(paymentIDs.length);
        Map<Long, String> errors = null;
        try {
            long currentUserId = getAuthentication().getActiveUser().getId();
            errors = dib.newPaymentEvent(paymentIDs, event, invoiceNumber, payDate, currentUserId);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        
        for (Map.Entry<Long, String> error : errors.entrySet()) {
            wrongPayments++;
            addError("err_" + error.getKey(), error.getValue());
        }

        if (!hasErrors()) {
            getRequest().setAttribute("message_result", paymentIDs.length + " payments successfully updated");
        } else {
            for (String paymentID : paymentIDs) {
                checkedIds.add(paymentID);
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

