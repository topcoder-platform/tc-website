package com.topcoder.web.hs.controller.requests;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * A RequestProcessor which builds a path to a static page out of a numbered series of parameters.
 *
 * @author Ambrose Feinstein
 */
public class Static extends Base {

    public void process() throws Exception {
        super.process();

        String path = "";
        for(int i=1; ; i++) {
            String p = request.getParameter("d"+i);
            if(p==null) break;
            if(!isLegal(p)) throw new IllegalArgumentException("disallowed path component: "+p);
            path += "/"+p;
        }

        /* default path if not logged in */
        if(path.equals(""))
          path = "/home/index";  //@@@ name this
        path += ".jsp";

        /* here we should check whether the path is allowed for this type of user */

        setNextPage("/hs"+path);  //@@@ remove prefix... make relative to controller servlet
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
