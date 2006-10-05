package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

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
            int typeId = -1;
            double grossAmount = 0.0;
            double netAmount = 0.0;
            int methodId = -1;
            int modificationRationaleId = -1;
            String dueDate = null;
            String client = null;
            
            if (getRequest().getParameter("payment_desc") != null) {
            	desc = checkNotEmptyString("payment_desc", "Please enter a description for the payment.");
            	statusId = getIntParameter("status_id");
            	typeId = getIntParameter("payment_type_id");
            	client = (String) getRequest().getParameter("client");
            	grossAmount = checkNonNegativeDouble("gross_amount", "Please enter a valid gross amount");
            	if (getRequest().getParameter("net_amount").trim().length() > 0) {
            		netAmount = checkNonNegativeDouble("net_amount", "Please enter a valid net amount");
            	}
            	methodId = getIntParameter("payment_method_id");
            	modificationRationaleId = getIntParameter("modification_rationale_id");
            	checkDate("due_date", "Please enter a valid due date");
            	dueDate = getStringParameter("due_date");
            	
            	
            	if (!hasErrors()) {
                    payment.getHeader().setDescription(desc);
                    payment.getHeader().setTypeId(typeId);
                    payment.getHeader().setMethodId(methodId);
                    payment.getHeader().setClient(client);
                    
                    payment.setStatusId(statusId);
                    payment.setGrossAmount(grossAmount);
                    payment.setNetAmount(netAmount);
                    payment.setDueDate(dueDate);
                    payment.setRationaleId(modificationRationaleId);
                    
                    dib.updatePayment(payment);
                    
            		setIsNextPageInContext(false);
            		setNextPage(Links.viewPayment(paymentId));
            		return;
            	} else {
                    setDefault("gross_amount", getRequest().getParameter("gross_amount"));
                    setDefault("net_amount", getRequest().getParameter("net_amount"));
            	}
            } else {
            	desc = payment.getHeader().getDescription();
            	typeId = payment.getHeader().getTypeId();
            	methodId = payment.getHeader().getMethodId();
            	client = payment.getHeader().getClient();
            	
            	statusId = payment.getStatusId();
            	grossAmount = payment.getGrossAmount();
            	netAmount = payment.getNetAmount();
            	dueDate = payment.getDueDate();
            	modificationRationaleId = payment.getRationaleId();
            	
                setDefault("gross_amount", grossAmount + "");
                setDefault("net_amount", netAmount + "");
            	
            }
            
            setDefault("payment_desc", desc);
            setDefault("payment_type_id", typeId + "");
            setDefault("payment_method_id", methodId + "");
            setDefault("client", client);
            
            setDefault("status_id", statusId + "");
            setDefault("due_date", dueDate);
            setDefault("modification_rationale_id", modificationRationaleId + "");
            
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

