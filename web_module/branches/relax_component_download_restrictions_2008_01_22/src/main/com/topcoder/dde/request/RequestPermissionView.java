package com.topcoder.dde.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;

/**
 * @author  pulky
 * @version  $Revision$ $Date$
 */
public class RequestPermissionView extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            setNextPage("/util/requestPermission.jsp");
            setIsNextPageInContext(true);
        }
    }
}
