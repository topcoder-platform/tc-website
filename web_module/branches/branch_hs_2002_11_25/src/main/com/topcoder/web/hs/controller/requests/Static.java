package com.topcoder.web.hs.controller.requests;

import javax.servlet.*;
import javax.servlet.http.*;
import com.topcoder.shared.security.*;

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
            if(!isLegal(p)) throw new IllegalArgumentException("disallowed path component: "+p);
            path += "/"+p;
        }

        /* default path if not logged in */
        if(path.equals(""))
            path = "/home/index";  //@@@ name this, make it different if we are logged in?

        /* here we check whether the path is allowed for this type of user */
        if(!hsa.hasPermission(new SimpleResource(path)))
            throw new RuntimeException("@@@ not authorized to view this page");

        path += ".jsp";

        setNextPage(path);
        setIsNextPageInContext(true);
    }

    private String checkNull(String s) {
        return s==null?"":s;
    }

    private static boolean isLegal(String s) {
        if(s==null) return false;
        if(s.equals("")) return false;
        char[] c = s.toCharArray();
        for(int i=0; i<c.length; i++)
            if(0 > "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_".indexOf(c[i]))
                return false;
        return true;
    }
}
