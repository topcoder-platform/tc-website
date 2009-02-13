package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.hs.common.*;

/**
 * A RequestProcessor which builds a path to a static page out of a numbered series of parameters.
 *
 * @author Ambrose Feinstein
 */
public class Static extends Base {

    protected void businessProcessing() throws Exception {

        String path = "";
        nav.setDepth(0);
        for(int i=1; ; i++) {
            String p = request.getParameter("d"+i);
            if(p==null) break;
            if(!Constants.isLegal(p)) throw new NavigationException("disallowed path component: "+p);
            path += "/"+p;
            nav.setFolder(i-1, p);
        }
        if(path.equals("")) throw new NavigationException("path must have at least one component");
        path += ".jsp";

        /* check whether the path is allowed for this type of user */
        if(!hsa.hasPermission(new PathResource(path)))
            throw new PermissionException("access to page denied", user);

        setNextPage(path);
        setIsNextPageInContext(true);
    }
}
