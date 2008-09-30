package com.topcoder.web.tc.controller.request.card;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 *         Date: Mar 15, 2004
 */
public class Downloads extends Preview {


    protected void businessProcessing() throws TCWebException {

        if (SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
            try {
                if (isRated()) {
                    setNextPage(Constants.DOWNLOADS);
                    setIsNextPageInContext(true);
                } else {
                    throw new NavigationException("Sorry you have not been rated in competition.");
                }
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        } else {
            throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
        }
    }

}
