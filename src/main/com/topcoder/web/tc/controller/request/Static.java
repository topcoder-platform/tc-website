package com.topcoder.web.tc.controller.request;

import com.topcoder.web.common.*;
import com.topcoder.web.tc.Constants;

/**
 * A RequestProcessor which builds a path to a static page out of a numbered series of parameters.
 *
 * @author Ambrose Feinstein
 */
public class Static extends Base {

    protected void businessProcessing() throws Exception {

        StringBuffer path = new StringBuffer(100);
        for(int i=1; ; i++) {
            String p = getRequest().getParameter(Constants.STATIC_PREFIX+i);
            if(p==null) break;
            if(!isLegal(p)) throw new NavigationException();
            path.append("/").append(p);
        }
        if(path.length()==0)
            path.append(Constants.DEFAULT_PAGE);
        else
            path.append(".jsp");

        //TODO security?
        //Resource r = new PathResource(path);

        setNextPage(path.toString());
        setIsNextPageInContext(true);
    }

    public static boolean isLegal(String s) {
        if(s==null) return false;
        if(s.equals("")) return false;
        char[] c = s.toCharArray();
        for(int i=0; i<c.length; i++)
            if(0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }
}
