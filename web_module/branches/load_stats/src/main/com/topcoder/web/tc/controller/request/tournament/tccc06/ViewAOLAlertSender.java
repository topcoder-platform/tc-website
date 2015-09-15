package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 8, 2006
 */
public class ViewAOLAlertSender extends BaseProcessor  {

    protected void businessProcessing() throws Exception {
        if (getSessionInfo().isAdmin()) {

            setNextPage("/tournaments/tccc06/aol_alerts_sender.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
