package com.topcoder.dde.request;

import com.topcoder.dde.util.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;

/**
 * @author  dok
 * @version  $Revision: 37186 $ $Date$
 * Create Date: Feb 4, 2005
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
        if (path.length() == 0) {
            path.append(Constants.DEFAULT_PAGE);
            setNextPage(path.toString());
            setIsNextPageInContext(false);
        } else {
            path.append(".jsp");
            setNextPage(path.toString());
            setIsNextPageInContext(true);
        }

    }

    public static boolean isLegal(String s) {
        if (s == null) return false;
        if (s.equals("")) return false;
        char[] c = s.toCharArray();
        for (int i = 0; i < c.length; i++)
            if (0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }


}
