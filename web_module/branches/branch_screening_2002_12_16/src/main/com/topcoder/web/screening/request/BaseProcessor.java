package com.topcoder.web.screening.request;

import com.topcoder.web.common.RequestProcessor;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpUtils;
import java.util.Hashtable;
import java.util.Map;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.screening.common.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.DataAccess;


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
    
    protected DataAccess getDataAccess() throws Exception {
        return getDataAccess(Constants.DATA_SOURCE);
    }
    
    protected DataAccess getDataAccess(String datasource) throws Exception {
        if(datasource == null) return null;
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(datasource),
                                        DataSource.class);
        DataAccess dAccess = new DataAccess(ds);
        return dAccess;
    }
    
    protected void requireLogin() throws Exception{
        User user = getAuthentication().getUser();
        if(user.getId() == user.USER_ANONYMOUS_ID){
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
