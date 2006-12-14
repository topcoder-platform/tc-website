package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  cucu
 */
public class DisplayAmounts extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {

        try {
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));
            int placed = Integer.parseInt(getRequest().getParameter("placed"));
            boolean isDesign = "true".equalsIgnoreCase(getRequest().getParameter("is_design"));
            boolean isUpdating = "true".equalsIgnoreCase(getRequest().getParameter("is_updating"));
 
            String totalAmount = getRequest().getParameter("total_amount") != null? (String) getRequest().getParameter("total_amount") : "";
            String grossAmount = getRequest().getParameter("gross_amount") != null? (String) getRequest().getParameter("gross_amount") : "";
            String netAmount = getRequest().getParameter("net_amount") != null? (String) getRequest().getParameter("net_amount") : "";
            String installmentNumber = getRequest().getParameter("installment_number") != null? (String) getRequest().getParameter("installment_number") : "";
            
            getRequest().setAttribute("type", type + "");
            getRequest().setAttribute("placed", placed + "");
            getRequest().setAttribute("isDesign", String.valueOf(isDesign));
            getRequest().setAttribute("isUpdating", String.valueOf(isUpdating));

			setDefault("total_amount", totalAmount);
			setDefault("gross_amount", grossAmount);
			setDefault("net_amount", netAmount);
			setDefault("installment_number", installmentNumber);

            setNextPage(INTERNAL_AJAX_DISPLAY_AMOUNTS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

