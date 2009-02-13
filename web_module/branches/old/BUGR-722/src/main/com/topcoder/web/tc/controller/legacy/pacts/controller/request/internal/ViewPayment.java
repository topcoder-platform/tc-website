package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoteHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 *
 * @author  cucu
 */
public class ViewPayment extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        long payment_id = Long.parseLong(getRequest().getParameter(PAYMENT_ID));

        try {
            DataInterfaceBean bean = new DataInterfaceBean();
            
            Payment payment = null;
            try {
                payment = new Payment(bean.getPayment(payment_id));
            } catch (Exception e) {
                throw new NavigationException("Payment no longer exist or couldn't be retrieved");
            }
            getRequest().setAttribute(PACTS_INTERNAL_RESULT, payment);


            List l = bean.findPayments(CODER_REFERRAL_PAYMENT, payment_id);
            
            if (l.size() > 0) {
            	if (l.size() > 1) {
            		log.warn("Payment " + payment.getId() + " referenced by more than 1 payment!");
            	}
            	log.info("referred payment: " + ((BasePayment) l.get(0)).getId());
            	Payment referred = new Payment(bean.getPayment(((BasePayment) l.get(0)).getId()));
                getRequest().setAttribute("referred", referred);
            	
            }
            
            Map search = new HashMap();
            search.put(PAYMENT_ID, payment_id + "");
            
            Map notes = bean.findNotes(search);
            getRequest().setAttribute(NOTE_HEADER_LIST, new NoteHeaderList(notes).getHeaderList());

            setNextPage(INTERNAL_PAYMENT_JSP);
            setIsNextPageInContext(true);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
        }
    }
}

