package com.topcoder.web.tc.controller.request.card;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.security.ClassResource;

/**
 * @author dok
 * Date: Mar 15, 2004
 */
public class Downloads extends Preview {


    protected void businessProcessing() throws TCWebException {

        if (userIdentified()) {
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
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
   }

}
