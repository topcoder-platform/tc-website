package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 *
 * @author  pulky
 */
public class EditUserAccrualAmount extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
        long userId = 0;
        
        try {
            userId = getLongParameter(USER_ID);
        } catch (IllegalArgumentException iae) {
        }            

        if (userId == 0) {
            throw new IllegalArgumentException("Missing parameter " + USER_ID);
        }

        DataInterfaceBean dib = new DataInterfaceBean();

        double accrualValue = dib.getUserAccrualThreshold(userId);
        setDefault(ACCRUAL_AMOUNT, accrualValue);
        getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(userId)));

        setNextPage(INTERNAL_EDIT_ACCRUAL_AMOUNT_JSP);
        setIsNextPageInContext(true);
    }
}
