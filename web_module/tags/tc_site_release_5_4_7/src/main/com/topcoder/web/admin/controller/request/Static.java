package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.BaseProcessor;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 12, 2005
 */

public class Static extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        StringBuffer path = new StringBuffer(100);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter("d" + i);
            if (p == null) break;
            if (!isLegal(p)) throw new NavigationException();
            path.append("/").append(p);
        }
        if (path.length() == 0)
            path.append("/home.jsp");
        else
            path.append(".jsp");

        //TODO security?
        //Resource r = new PathResource(path);

        setNextPage(path.toString());
        setIsNextPageInContext(true);
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
