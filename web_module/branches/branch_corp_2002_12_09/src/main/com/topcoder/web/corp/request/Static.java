package com.topcoder.web.corp.request;

/**
* <p>Title: Static </p>
* <p> Description: Handles "static" pages.  Serve up jsp's in essentially 
* any directory (below the root), constant STATIC_PREFIX="d".  A request 
* might look like: 
* corp/?module=Static&d1=statistics&d2=tourney_overview&d3=myPage
* The request processor gets the list of parameters out of the request, 
* validates them, and then begin to process them.  In the above example, 
* that would mean the static processor should serve up
* <document_root>/statistics/tourney_overview/myPage.jsp
* @version   1.2
* @author    Daniel Cohn
*/
public class Static extends BaseProcessor { 
    
    /** Constructor sets pageInContext to true since all Static pages are in
     * the same context 
     */
    public Static() {
        pageInContext = true; 
    }

    private final String STATIC_PREFIX = "d";  // Prefix for parameters

    /** process() method in BaseProcessor calls this businessProcessing() 
     *  method to define the next Page.  set next page to the Error Page 
     *  if there is an error when processing the next page request.  
     *  @throws Exception 
     */
    void businessProcessing() throws Exception {
        nextPage = requestProcessor();
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
        
        /* Check to make sure that if dx (where x = levelsDeep) is
         * in the request, then d(x-1), d(x-2), ... , d1 must also
         * exist in the request.  Throws IllegalArgumentException if
         * this test fails.
         */
        StringBuffer paramNums = new StringBuffer(STATIC_PREFIX + 
                                                  levelsDeep);
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
            throw new IllegalArgumentException 
                   ("no page specified in request.");
        }

        /* start generating the return string containing the URL.    */
        StringBuffer ret = new StringBuffer("/");
        for (int i=1; i<levelsDeep; i++) {
            String cur = request.getParameter(STATIC_PREFIX+i);
            int check = validParameter(cur);  // returns -1 if valid.
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


   /** returns -1 if parameter is valid, otherwise returns the index 
    *  of the invalid character in the request.
    * @param param parameter to check for validity.
    * @return index of invalid character, or -1 if param is valid
    */
    private int validParameter(String param) {
        for (int i=0;i<param.length();i++) {
            char curChar = param.charAt(i);
            if ( ("_-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" + 
                  "0123456789").indexOf(curChar) == -1)
                return i;
        }
        return -1;
    }


    /** Determine how many STATIC_PREFIX levels the static address has, 
     *  ie: /statistics/tourney_overview/myPage.jsp page is 3 
     *  static levels deep.                                       
     * @param request String representing URL request
     * @return total levels deep of request (int).
     */
    private int levelsDeep(String request) {
        int lastIndex = request.lastIndexOf("&"+STATIC_PREFIX) 
                        + STATIC_PREFIX.length()+1;
        if (lastIndex == 1) { 
            if (request.startsWith(STATIC_PREFIX+"1")) { 
                return 1; 
            } else {
                return -1; 
            }
        }
        int parseTill = request.indexOf("=",lastIndex);
        String deepest = request.substring(lastIndex, parseTill);
        return Integer.parseInt(deepest);
    }
}