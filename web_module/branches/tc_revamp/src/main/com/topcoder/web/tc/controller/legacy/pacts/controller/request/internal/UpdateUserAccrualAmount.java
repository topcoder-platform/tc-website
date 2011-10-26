package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 *
 * @author  pulky
 */
public class UpdateUserAccrualAmount extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
        long userId = 0;
        double newAccrualAmount = 0;
        
        try {
            userId = getLongParameter(USER_ID);
        } catch (IllegalArgumentException iae) {
        }            

        try {
            newAccrualAmount = getDoubleParameter(ACCRUAL_AMOUNT);
        } catch (IllegalArgumentException iae) {
        }            

        if (userId + newAccrualAmount == 0) {
            throw new IllegalArgumentException("Missing parameter " + USER_ID + " or " + ACCRUAL_AMOUNT);
        }

        DataInterfaceBean dib = new DataInterfaceBean();

        dib.saveUserAccrualThreshold(userId, newAccrualAmount);

        setNextPage(Links.viewUser(userId));
        setIsNextPageInContext(false);
    }
}
