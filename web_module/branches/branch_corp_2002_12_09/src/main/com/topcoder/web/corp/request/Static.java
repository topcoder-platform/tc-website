package com.topcoder.web.corp.request;

/**
* <p> Title: Static </p>
* <p> Description: Handles "static" pages.  Serve up jsp's in essentially 
* any directory (below the root) The request processor gets the list of 
* parameters out of the request, validates them, and then processes them. 
*
* @version   1.1.2.21
* @author    Daniel Cohn
*/

public class Static extends BaseProcessor { 

    private static final String STATIC_PREFIX = "d";  // Prefix for parameters
    private static final String VALID_PARAMETER_CHARS = 
        "_-ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    /** Constructor sets pageInContext to true since all Static pages are in
     *  the same context 
     */
    public Static() {
        pageInContext = true; 
    }

    /** process() method in BaseProcessor calls this businessProcessing() 
     *  method to define the next Page.
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

        boolean found = false;
        String cur = null;
        StringBuffer ret = new StringBuffer();

        /* start generating the return string containing the URL */
        for (int i=1; !found; i++) {
            cur = request.getParameter(STATIC_PREFIX+i);
            if (cur == null) {
                /* if there is not a (STATIC_PREFIX+1) go to home page 
                   (set in web.xml MainServlet init parameter "page-main") */
                if (i==1) {
                    return (String)request.getAttribute("homePage");
                }
                found = true;
            }
            else { 
                int check = validParameter(cur);  // returns -1 if valid.
                if (check == -1) { 
                    ret.append("/"+cur);
                }
                else {
                    char invalidChar = cur.charAt(check);
                    throw new Exception ( 
                        "parameter #" + i + ": \"" + cur + 
                        "\" invalid character found: '" + invalidChar + "'.");
                }
            }
        }
        ret.append(".jsp");
        return ret.toString();
    }

   /** If parameter is valid return -1, otherwise returns the index 
    *  of the invalid character in the request.
    * @param param parameter to check for validity.
    * @return index of invalid character, or -1 if param is valid
    */
    private int validParameter(String param) {
        for (int i=0;i<param.length();i++) {
            char curChar = param.charAt(i);
            if (VALID_PARAMETER_CHARS.indexOf(curChar) == -1)
                return i;
        }
        return -1;
    }
}