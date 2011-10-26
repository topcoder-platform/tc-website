package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.GenerateComponentPayments;

/**
 * @author  cucu
 */
public class DisplayAmounts extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {

        try {
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));
            int placed = getRequest().getParameter("placed") != null? Integer.parseInt(getRequest().getParameter("placed")) : 0;
            boolean isDesign = "true".equalsIgnoreCase(getRequest().getParameter("is_design"));
            boolean isUpdating = "true".equalsIgnoreCase(getRequest().getParameter("is_updating"));
 
            String totalAmount = StringUtils.checkNull(getRequest().getParameter("total_amount"));
            String grossAmount = StringUtils.checkNull(getRequest().getParameter("gross_amount"));
            String netAmount = StringUtils.checkNull(getRequest().getParameter("net_amount"));
            String installmentNumber = StringUtils.checkNull(getRequest().getParameter("installment_number"));
            
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

