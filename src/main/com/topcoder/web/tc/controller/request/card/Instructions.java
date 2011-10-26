package com.topcoder.web.tc.controller.request.card;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * @author dok
 *         Date: Mar 10, 2004
 */
public class Instructions extends Base {

    protected void businessProcessing() throws TCWebException {

        if (SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
            try {
                UserPreference up = (UserPreference) createEJB(getInitialContext(), UserPreference.class);
                boolean cardUnlocked = false;
                try {
                    up.getValue(getUser().getId(), Constants.UNLOCK_CARD_PREFERENCE_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    cardUnlocked = true;
                } catch (RowNotFoundException e) {
                    throw e;
                }
                getRequest().setAttribute("cardUnlocked", new Boolean(cardUnlocked));
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }

            setNextPage(Constants.CARD_INSTRUCTIONS);
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
        }
    }

}
