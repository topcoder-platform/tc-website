package com.topcoder.web.common;

import javax.servlet.ServletRequest;
import com.topcoder.web.common.security.WebAuthentication;

/** Interface for classes that process a servlet request.
 * @author Porgery
 */
public interface RequestProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */    
    public void process() throws Exception;
    
    /** Gets the name of the target page that the controller should
     * forward or redirect to.
     * @return The name of the next page.
     */    
    public String getNextPage();
    
    /** Tells whether the next page is in the same context (which
     * means the request should be forwarded) or a different
     * context (suggesting a browser redirect would be necessary).
     * @return True if the next page is in the current context,
     * or false otherwise.
     */    
    public boolean isNextPageInContext();
    
    /** Sets the request object that the RequestProcessor should
     * process.
     * @param sr The ServletRequest object to be processed.
     */    
    public void setRequest(ServletRequest sr);
    
    /** Sets the authentication object that will be used.
     * @param sr The Authentication object to be used.
     */    
    public void setAuthentication(WebAuthentication auth);
    
}
