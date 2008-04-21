package com.topcoder.web.csf.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;

/**
 * Simple static processor that require login.
 * 
 * @author pulky
 * @version $Revision$ Date: 
 *          Create Date: Mar 28, 2007
 */
public class SecureStatic extends Static {
    protected void businessProcessing() throws Exception {
        if (userLoggedIn()) {
            super.businessProcessing();
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
