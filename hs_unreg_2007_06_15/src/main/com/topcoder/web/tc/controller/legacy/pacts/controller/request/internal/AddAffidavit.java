package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Map;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 *
 * @author  cucu
 */
public class AddAffidavit extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            long paymentId = getOptionalLongParameter(PAYMENT_ID);
            long userId = getLongParameter(USER_ID);

            DataInterfaceBean dib = new DataInterfaceBean();

            Payment payment = null;
            if (paymentId > 0) {
                payment = new Payment(dib.getPayment(paymentId));
            }

            if (getRequest().getParameter("affidavit_desc") != null) {
                String desc = (String) getRequest().getParameter("affidavit_desc");
                int typeId = Integer.parseInt(getRequest().getParameter("affidavit_type_id"));

                if (desc.trim().length() == 0) {
                    addError("error", "Please enter a description for the affidavit.");
                }
                if (typeId < 0) {
                    addError("error", "Please select a type");
                }

                if (hasErrors()) {
                    setDefault("affidavit_desc", desc);
                    setDefault("affidavit_type_id", typeId + "");
                    setDefault("text", getRequest().getParameter("text"));
                } else {
                    long roundId = getOptionalLongParameter(ROUND_ID);

                    // Save the Affidavit
                    Affidavit a = new Affidavit(
                            roundId < 0 ? null : new Long(roundId),
                            userId, AFFIDAVIT_STATUS_PENDING, desc, typeId, false, false);

                    if (payment != null) {
                        a.setPayment(payment.getHeader());
                    }
                    String text = "".equals(StringUtils.checkNull(getRequest().getParameter("text"))) ? null : getRequest().getParameter("text");
                    long affidavitId = dib.addAffidavit(a, text, null);
                    setNextPage(Links.viewAffidavit(affidavitId));
                    setIsNextPageInContext(false);
                    return;
                }

            } else {
                setDefault("affidavit_type_id", ALGORITHM_AFFIDAVIT_TYPE + "");
            }


            getRequest().setAttribute("user", getUserProfileHeader(userId));

            // Give the JSP the list of Affidavit Types
            Map map = dib.getAffidavitTypes();
            getRequest().setAttribute(AFFIDAVIT_TYPE_LIST, map.get(AFFIDAVIT_TYPE_LIST));

            // Give the JSP the list of Rounds
            map = dib.getRounds();
            getRequest().setAttribute(ROUND_LIST, map.get(ROUND_LIST));

            if (payment != null) {
                getRequest().setAttribute("payment", payment);
                setDefault("affidavit_desc", "Affidavit for " + payment.getHeader().getDescription());
            }

            setNextPage(INTERNAL_ADD_AFFIDAVIT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

