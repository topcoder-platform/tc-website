package com.topcoder.web.ep.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;

/*
* @author dok
* @version $Revision: 66662 $Date:  11:27:53 AM
*          Create Date: Oct 12, 2007
*/
public class Static extends BaseProcessor {
    protected void businessProcessing() throws Exception {

        StringBuffer path = new StringBuffer(100);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter(Constants.STATIC_PREFIX + i);
            if (p == null) break;
            if (!isLegal(p)) throw new NavigationException();
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

    public static boolean isLegal(String s) {
        return StringUtils.containsOnly(s, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_", false);
    }


}


