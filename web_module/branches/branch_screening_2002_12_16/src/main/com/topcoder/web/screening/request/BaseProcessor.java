package com.topcoder.web.screening.request;

import com.topcoder.web.common.RequestProcessor;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;

import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.security.*;
import com.topcoder.web.screening.common.*;

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
    
    protected void authorize() throws Exception{
        authorize(null);
    }
    
    protected void authorize(String redirect) throws Exception{
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY,
            "org.jnp.interfaces.NamingContextFactory");
        env.put(Context.PROVIDER_URL,
            ApplicationServer.SECURITY_PROVIDER_URL);
        InitialContext context = new InitialContext(env);
            
        PrincipalMgrRemoteHome pmHome = (PrincipalMgrRemoteHome)
            context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote principalMgr = pmHome.create();
        
        TCSubject sub = 
            principalMgr.getUserSubject(getAuthentication().getUser().getId());
        
        Authorization auth = new TCSAuthorization(sub);
        Resource r = new ClassResource(this.getClass());
        
        if(!auth.hasPermission(r)){
            if(getAuthentication().getUser().getId() == User.USER_ANONYMOUS_ID){
                getRequest().setAttribute(Constants.REDIRECT,redirect);
                getRequest().setAttribute(Constants.MESSAGE_PARAMETER,
                    "You must be logged in to access that resource.");
                throw new AnonymousUserException("Login required for "+r.getName());
            }else{
                throw new PermissionDeniedException("Access denied for "+r.getName());
            }
        }
    }
    
    protected String getSelfRedirect(){
        return getSelfRedirect(null);
    }
    
    protected String getSelfRedirect(String parameters){
        HttpServletRequest rq = (HttpServletRequest)getRequest();
        
        String servletUrl = rq.getContextPath() + Constants.CONTROLLER_URL;
        String className = this.getClass().getName();
        className = className.substring(className.lastIndexOf('.')+1);
        String basicUrl = servletUrl + "?" +
            Constants.REQUEST_PROCESSOR + "=" + className;
        if(parameters != null && !parameters.equals("")){
            if(parameters.startsWith("&")){
                return basicUrl + parameters;
            }else{
                return basicUrl + "&" + parameters;
            }
        }
        return basicUrl;
    }
    
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
