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

    protected void businessProcessing() throws TCWebException {

        String path = "";
        nav.setDepth(0);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter("d" + i);
            if (p == null) break;
            if (!Constants.isLegal(p)) throw new NavigationException();
            path += "/" + p;
            nav.setFolder(i - 1, p);
        }
        if (path.length() == 0) throw new NavigationException();
        path += ".jsp";

        /* check whether the path is allowed for this type of user */
        Resource r = new PathResource(path);
        try {
            if (!hsa.hasPermission(r))
                throw new PermissionException(user, r);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(path);
        setIsNextPageInContext(true);
    }
}
