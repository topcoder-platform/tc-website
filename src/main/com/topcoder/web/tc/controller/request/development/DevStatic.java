package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;

/**
 * @author dok
 * Date: Apr 2, 2004
 */
public class DevStatic extends Base {

    protected void developmentProcessing() throws TCWebException {

        //todo | maybe there's a better way to inherit the functionality of
        //todo | the static processor and the default behavior of the base class

        StringBuffer path = new StringBuffer(100);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter(Constants.STATIC_PREFIX + i);
            if (p == null) break;
            if (!Static.isLegal(p)) throw new NavigationException();
            path.append("/").append(p);
        }
        if (path.length() == 0)
            path.append(Constants.DEFAULT_PAGE);
        else
            path.append(".jsp");

        //TODO security?
        //Resource r = new PathResource(path);

        setNextPage(path.toString());
        setIsNextPageInContext(true);
    }

}
