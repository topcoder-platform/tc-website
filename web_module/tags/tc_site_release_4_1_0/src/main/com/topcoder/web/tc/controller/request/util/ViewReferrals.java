package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * @author dok
 * Date: May 6, 2004
 */
public class ViewReferrals extends Base {

    protected void businessProcessing() throws TCWebException {
        if (userIdentified()) {
            Request r = new Request();
            r.setContentHandle("referral_list");
            r.setProperty("uid", String.valueOf(getUser().getId()));
            try {
                getRequest().setAttribute("referralList", getDataAccess().getData(r).get("referral_list"));
                setNextPage(Constants.REFERRALS);
                setIsNextPageInContext(true);
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
