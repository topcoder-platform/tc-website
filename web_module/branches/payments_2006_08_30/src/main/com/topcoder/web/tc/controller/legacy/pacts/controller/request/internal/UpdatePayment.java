package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * 
 * @author  cucu
 */
public class UpdatePayment extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {    	
        try {
        	long paymentId = getLongParameter(PAYMENT_ID);

            DataInterfaceBean dib = new DataInterfaceBean();
            Payment payment = new Payment(dib.getPayment(paymentId));
            
            String desc = null;
            int statusId = -1;
            
            if (getRequest().getParameter("payment_desc") != null) {
            	desc = checkNotEmptyString("payment_desc", "Please enter a description for the payment.");
            	statusId = getIntParameter("status_id");
            	
            	if (!hasErrors()) {
                    payment.getHeader().setDescription(desc);
                    payment.setStatusId(statusId);
                    
                    dib.updatePayment(payment);
                    
            		setIsNextPageInContext(false);
            		setNextPage(Links.viewPayment(paymentId));
            		return;
            	}
            } else {
            	desc = payment.getHeader().getDescription();
            	statusId = payment.getStatusId();
            }
            
            setDefault("payment_desc", desc);
            setDefault("statusId", statusId + "");
            
            
        	getRequest().setAttribute(PAYMENT, payment);
        	getRequest().setAttribute(USER, payment.getHeader().getUser());
            getRequest().setAttribute(MODIFICATION_RATIONALE_LIST, dib.getModificationRationales().get(MODIFICATION_RATIONALE_LIST));
            getRequest().setAttribute(PAYMENT_TYPE_LIST, dib.getPaymentTypes().get(PAYMENT_TYPE_LIST));
            getRequest().setAttribute(PAYMENT_METHOD_LIST, dib.getPaymentMethods().get(PAYMENT_METHOD_LIST));
            getRequest().setAttribute(STATUS_CODE_LIST, dib.getStatusCodes(PactsConstants.PAYMENT_OBJ).get(STATUS_CODE_LIST));
        
            setNextPage("/pacts/internal/editPayment.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

