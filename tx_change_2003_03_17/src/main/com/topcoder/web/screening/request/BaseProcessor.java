package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.screening.common.AnonymousUserException;
import com.topcoder.web.screening.common.Constants;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpUtils;
import javax.sql.DataSource;
import java.util.Map;


/** Provides some of the basic methods and data common to request processors.
 * @author Porgery
 */
public abstract class BaseProcessor implements RequestProcessor {
    
    private static Logger log = Logger.getLogger(BasicAuthentication.class);

    /** Holds value of property nextPageInContext. */
    private boolean nextPageInContext;
    
    /** Holds value of property nextPage. */
    private String nextPage;
    
    /** Holds value of property request. */
    private ServletRequest request;
    
    /** Holds value of property authentication. */
    private WebAuthentication authentication;
    
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
    protected WebAuthentication getAuthentication() {
        return this.authentication;
    }
    
    /** Setter for property authentication.
     * @param authentication New value of property authentication.
     */
    public void setAuthentication(WebAuthentication authentication) {
        this.authentication = authentication;
    }
    
    /** Getter for property parameterMap.
     * @return Value of property parameterMap.
     */
    protected Map getParameterMap() {
        HttpServletRequest rq = (HttpServletRequest)getRequest();
        
        return HttpUtils.parseQueryString(rq.getQueryString());
    }
    
    protected DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(Constants.DATA_SOURCE, false);
    }
    protected DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(Constants.DATA_SOURCE, cached);
    }
    
    protected DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if(datasource == null) return null;
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(datasource),
                                        DataSource.class);
        DataAccessInt dAccess = null;
        if (cached) dAccess = new CachedDataAccess(ds);
        else dAccess = new DataAccess(ds);
        return dAccess;
    }
    
    protected void requireLogin() throws Exception{
        User user = getAuthentication().getUser();
        if(user.isAnonymous()){
            HttpServletRequest request = (HttpServletRequest)getRequest();
            String redirect = request.getServletPath();
            if(request.getMethod().equals("GET") && request.getQueryString() != null){
                redirect = redirect + '?' + request.getQueryString();
            }
            request.setAttribute(Constants.REDIRECT,redirect);
            request.setAttribute(Constants.MESSAGE_PARAMETER,
                "You must be logged in to access that resource.");
            throw new AnonymousUserException(
                "Login required for " + this.getClass().getName());
        }
    }
}
