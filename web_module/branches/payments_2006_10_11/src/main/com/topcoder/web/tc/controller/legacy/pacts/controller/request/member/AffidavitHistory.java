package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.AffidavitBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch.PaymentBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 *
 * @author  cucu
 */
public class AffidavitHistory extends BaseProcessor implements PactsConstants {

	public static final String FULL_LIST = "full_list";
	public static final String AFFIDAVITS = "affidavits";
	
    protected void businessProcessing() throws TCWebException {
        try {
        	boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
        	
        	AffidavitBean bean = new AffidavitBean();
            Affidavit[] affidavits;

            if (fullList) {
                affidavits = bean.getAffidavitsForUser(getUser().getId());
            } else {
                affidavits = bean.getPendingAffidavitsForUser(getUser().getId());
            }

            if (affidavits == null) {
                affidavits = new Affidavit[0];
            }
            
            getRequest().setAttribute(AFFIDAVITS, affidavits);
            PaymentBean paymentBean = new PaymentBean();
            for (int i=0; i<affidavits.length; i++) {
            	if (affidavits[i].getPayment().getId() > 0) {
            		Payment payment = paymentBean.getPayment(affidavits[i].getPayment().getId());
            		affidavits[i].setPayDate(payment.getPayDate());
            	}
            }
        	getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage("pacts/client/affidavitHistoryNew.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

