package com.topcoder.web.corp.request;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.topcoder.web.common.RequestProcessor;

/**
* <p>Title: Static </p>
* <p> Description: Handles "static" pages.  Serve up jsp's in essentially 
* any directory (below the root), constant STATIC_PREFIX="d".  A request 
* might look like: 
* http://www.topcoder.com/corp/hs?d1=statistics&d2=tourney_overview&d3=myPage
* The request processor gets the list of parameters out of the request, 
* validates them, and then begin to process them.  In the above example, 
* that would mean the static processor should serve up
* <document_root>/statistics/tourney_overview/myPage.jsp
* @version   1.1
* @author    Daniel Cohn
*/

public class Static extends BaseProcessor { 
    
    private String url;  // Next page to go to

    private final String STATIC_PREFIX = "d";  // Prefix for parameters

    /* Return the next page once process() has been called.  */
    public String getNextPage() {
        return url; 
    }

    /* process() method in BaseProcessor calls method 
     * businessProcessing()                                         */
    void businessProcessing() throws Exception {
        try {
            url = requestProcessor();
        }
        catch (Exception e) {
            /* TEMPORARY CODE: not sure yet how to handle illegal page 
             * requests.  Send to error page for now.
             */
            url = ("/errorPage.jsp?message=" + e);
        }
    }

    public boolean isNextPageInContext() {
        return false;
    }
    /**
     * method for processesing a page request and checking to make sure it 
     * is valid then returning the "served up" page containing a valid URI 
     * to display.
     * 
     * @return String - the actual URI of where to send the browser
     * @throws Exception 
     */ 
    private String requestProcessor() throws Exception {

        String staticRequest = request.getQueryString();
        int levelsDeep = levelsDeep(staticRequest);  // see method below
        
        /* Check to make sure that if d_x (where x = levelsDeep) is
         * in the request, then d_(x-1), d_(x-2), ... , d_1 must also
         * exist in the request.  Throws IllegalArgumentException if
         * this test fails.
         */
        StringBuffer paramNums = new StringBuffer(STATIC_PREFIX + 
                                                  levelsDeep + "=");
        for (int i=levelsDeep-1; i>0; i--) { 
            String lookFor = STATIC_PREFIX + i;
            String requestDirectory = request.getParameter(lookFor);
            if (requestDirectory.equals("") || requestDirectory == null) {
                throw new IllegalArgumentException (
                       "parameter(s) \"" + paramNums + 
                       "\" found, but paramater \"" + lookFor + 
                       "\" was not found in request: \"" + request +
                       "\".");
            }
            paramNums.append(", " + lookFor);
        }

        String page = request.getParameter(STATIC_PREFIX+levelsDeep);
        if (page == null) {
            throw new IllegalArgumentException ("no page specified in request.");
        }

        /* start generating the return string containing the URL.    */
        StringBuffer ret = new StringBuffer("/");
        for (int i=1; i<levelsDeep; i++) {
            String cur = request.getParameter(STATIC_PREFIX+i);
            int check = validParameter(cur);  // returns -1 if parameter IS valid.
            if (check == -1) { 
                ret.append(cur+"/");
            }
            else {
                char invalidChar = cur.charAt(check);
                throw new IllegalArgumentException ( 
                    "parameter #" + i + ": \"" + cur + 
                    "\" invalid character found: '" + invalidChar + "'.");
            }
        }
        ret.append(page + ".jsp");
        return ret.toString();
    }


   /* returns -1 if parameter is valid, otherwise returns the index 
    *  of the invalid character in the request.                      */
    private int validParameter(String param) {
        for (int i=0;i<param.length();i++) {
            char curChar = param.charAt(i);
            if ("_-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".indexOf(curChar) == -1)
                return i;
        }
        return -1;
    }


    /* Determine how many STATIC_PREFIX levels the static address has, 
     *  ie: /statistics/tourney_overview/myPage.jsp page is 3 
     *  static levels deep.                                       */
    private int levelsDeep(String request) {
        int lastIndex = request.lastIndexOf("&"+STATIC_PREFIX) 
                        + STATIC_PREFIX.length()+1;
        if (lastIndex == 1) { 
            if (request.startsWith(STATIC_PREFIX+"1")) { 
                return 1; 
            } else {
                return -1; 
            }
        int parseTill = request.indexOf("=",lastIndex);
        String deepest = request.substring(lastIndex, parseTill);
        return Integer.parseInt(deepest);
    }
}