package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import java.text.SimpleDateFormat;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ComponentProjectReferencePayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.ReviewBoardPayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  cucu
 */
public class FillPaymentData extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        SimpleDateFormat format = new SimpleDateFormat(PactsConstants.DATE_FORMAT_STRING);

        try {
            long refId = Long.parseLong(getRequest().getParameter("reference_id"));
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));
            long coderId = Long.parseLong(getRequest().getParameter("user_id"));
            int placed = 0;
            if (getRequest().getParameter("placed") != null) {
            	placed = Integer.parseInt(getRequest().getParameter("placed"));
            }
            int installment = 1;
            if (getRequest().getParameter("installment_number") != null) {
            	installment = Integer.parseInt(getRequest().getParameter("installment_number"));
            }
            
            BasePayment payment = BasePayment.createPayment(type, coderId, 0.01, refId, placed);
            payment.setInstallmentNumber(installment);

            DataInterfaceBean dib = new DataInterfaceBean();

            payment = dib.fillPaymentData(payment);

            getRequest().setAttribute("description", payment.getDescription());
            getRequest().setAttribute("dueDate", format.format(payment.getDueDate()));
            //getRequest().setAttribute("statusId", payment.getStatusId() + "");
            getRequest().setAttribute("referenceDescription", payment.getReferenceDescription());

            if (payment instanceof ComponentWinningPayment || payment instanceof ReviewBoardPayment) {
            	getRequest().setAttribute("isDesign", ((ComponentProjectReferencePayment) payment).isDesign() + "");
            } else {
            	getRequest().setAttribute("isDesign", "");
            }
            
            setNextPage(INTERNAL_AJAX_FILL_PAYMENT_DATA);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

