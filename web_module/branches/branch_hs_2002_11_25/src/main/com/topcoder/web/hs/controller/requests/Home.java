package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.web.hs.common.*;

/**
 * A RequestProcessor which selects a front page depending on whether the session is logged in.
 *
 * @author Ambrose Feinstein
 */
public class Home extends Base {

    protected void businessProcessing() throws Exception {

        String path;
        if(user.getId()==-1) //@@@
            path = Constants.public_home;
        else
            path = Constants.member_home;

        /* check whether the path is allowed for this type of user; should be superfluous in this case */
        if(!hsa.hasPermission(new PathResource(path)))
            throw new PermissionException("You must login to view this page.");

        setNextPage(path);
        setIsNextPageInContext(true);
    }
}
