package com.topcoder.web.test;

import com.topcoder.shared.security.Authentication;
import com.topcoder.web.common.RequestProcessor;
import javax.servlet.*;
import com.topcoder.web.common.security.*;


/**
 * Helper class implementing RequestProcessor interface for
 * testing MainServlet
 * 
 * @author Mishagam
 * @date 02-Jan-2003
 */
public class RequestProcessorHelper implements RequestProcessor {
    /** Implements the processing step.
     * @throws Exception
     */    
    public void process() throws Exception {
        // here do nothing
    }
    
    /** Gets the name of the target page that the controller should
     * forward or redirect to.
     * @return The name of the next page.
     */    
    public String getNextPage() {
        return "Next_Page";
    }
    
    /** Tells whether the next page is in the same context (which
     * means the request should be forwarded) or a different
     * context (suggesting a browser redirect would be necessary).
     * @return True if the next page is in the current context,
     * or false otherwise.
     */    
    public boolean isNextPageInContext() {
        return true;
    }
    
    /** Sets the request object that the RequestProcessor should
     * process.
     * @param sr The ServletRequest object to be processed.
     */    
    public void setRequest(ServletRequest sr) {
        // do nothing
    }
    
    /** Sets the authentication object that will be used.
     * @param sr The Authentication object to be used.
     */    
    public void setAuthentication(WebAuthentication auth) {
        // do nothing
    }   
}


