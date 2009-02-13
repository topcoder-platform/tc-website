package com.topcoder.web.common;

/*
* @author dok
* @version $Id$
*          Create Date: May 10, 2008
*/
public class Static extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        StringBuffer path = new StringBuffer(100);
        for (int i = 1; ; i++) {
            String p = getRequest().getParameter(WebConstants.STATIC_PREFIX + i);
            if (p == null) break;
            if (!isLegal(p)) throw new NavigationException();
            path.append("/").append(p);
        }
        if (path.length() == 0)
            path.append("/index.jsp");
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