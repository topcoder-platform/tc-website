package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;

/**
 * @author dok
 * @version $Revision: 59253 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 28, 2007
 */
public class ViewBallBugSubmit extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        if (userIdentified()) {
            setNextPage("/sponsors/ballSubmitBug.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
