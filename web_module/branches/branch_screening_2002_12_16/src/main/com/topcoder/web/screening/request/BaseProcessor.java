package com.topcoder.web.screening.request;

import com.topcoder.web.common.RequestProcessor;

import javax.servlet.ServletRequest;
import com.topcoder.shared.security.Authentication;

/** Provides some of the basic methods and data common to request processors.
 * @author Porgery
 */
public abstract class BaseProcessor implements RequestProcessor {
    
    /** Holds value of property nextPageInContext. */
    private boolean nextPageInContext;
    
    /** Holds value of property nextPage. */
    private String nextPage;
    
    /** Holds value of property request. */
    private ServletRequest request;
    
    /** Holds value of property authentication. */
    private Authentication authentication;
    
    /** Creates a new instance of BaseProcessor */
    public BaseProcessor() {
        nextPage = null;
        nextPageInContext = true;
        request = null;
        authentication = null;
    }
    
    /** Performs the processing of the request.
     * @throws Exception
     */    
    public abstract void process() throws Exception;
    
    /** Getter for property nextPageInContext.
     * @return Value of property nextPageInContext.
     */
    public boolean isNextPageInContext() {
        return this.nextPageInContext;
    }
    
    /** Setter for property nextPageInContext.
     * @param nextPageInContext New value of property nextPageInContext.
     */
    protected void setNextPageInContext(boolean nextPageInContext) {
        this.nextPageInContext = nextPageInContext;
    }
    
    /** Getter for property nextPage.
     * @return Value of property nextPage.
     */
    public String getNextPage() {
        return this.nextPage;
    }
    
    /** Setter for property nextPage.
     * @param nextPage New value of property nextPage.
     */
    protected void setNextPage(String nextPage) {
        this.nextPage = nextPage;
    }
    
    /** Getter for property request.
     * @return Value of property request.
     */
    protected ServletRequest getRequest() {
        return this.request;
    }
    
    /** Setter for property request.
     * @param request New value of property request.
     */
    public void setRequest(ServletRequest request) {
        this.request = request;
    }
    
    /** Getter for property authentication.
     * @return Value of property authentication.
     */
    protected Authentication getAuthentication() {
        return this.authentication;
    }
    
    /** Setter for property authentication.
     * @param authentication New value of property authentication.
     */
    public void setAuthentication(Authentication authentication) {
        this.authentication = authentication;
    }
    
}
