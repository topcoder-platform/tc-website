package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.web.hs.common.*;

/**
 * A RequestProcessor which builds a path to a static page out of a numbered series of parameters.
 *
 * @author Ambrose Feinstein
 */
public class Static extends Base {

    protected void businessProcessing() throws Exception {

        String path = "";
        for(int i=1; ; i++) {
            String p = request.getParameter("d"+i);
            if(p==null) break;
            if(!Constants.isLegal(p)) throw new IllegalArgumentException("disallowed path component: "+p);
            path += "/"+p;
        }
        if(path.equals("")) throw new IllegalArgumentException("path must have at least one component");
        path += ".jsp";

        /* check whether the path is allowed for this type of user */
        if(!hsa.hasPermission(new PathResource(path)))
            throw new PermissionException("You must login to view this page.");

        setNextPage(path);
        setIsNextPageInContext(true);
    }
}
