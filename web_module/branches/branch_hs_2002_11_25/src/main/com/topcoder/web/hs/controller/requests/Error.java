package com.topcoder.web.hs.controller.requests;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * A RequestProcessor which handles an exception which occured during a previous attempt at dispatching a request.
 *
 * @author Ambrose Feinstein
 */

public class Error extends Base {

    public void process() {
        super.process();

        setNextPage("/hs"+"/error.jsp");  //@@@ remove prefix... make relative to controller servlet
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
