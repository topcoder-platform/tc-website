package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 9, 2005
 */
public class Static extends Base {

    protected void businessProcessing() throws Exception {

        StringBuffer path = new StringBuffer(100);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter(Constants.STATIC_PREFIX + i);
            if (p == null) break;
            if (!isLegal(p)) {
                throw new NavigationException();
            }
            path.append("/").append(p);
        }
        setIsNextPageInContext(true);
        if (path.length() == 0) {
            path.append("");
            setIsNextPageInContext(false);
        } else {
            path.append(".jsp");
        }
        setNextPage(path.toString());

    }

    protected void longContestProcessing() throws Exception {

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

