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
    
    /** Attempts to authorize the current user for access to this
     * processor.
     * @throws ScreeningException For general failures
     * @throws AnonymousUserException When the user is not logged in and anonymous access is not allowed
     * @throws PermissionDeniedException When the user is logged in but does not have the necessary permission
     */    
    protected void authorize()
    throws ScreeningException, AnonymousUserException, PermissionDeniedException{
        authorize(null);
    }
    
    /** Attempts to authorize the current user for access to this
     * processor.
     * @param redirect URL to be passed to login page so it can redirect back here after login succeeds
     * @throws ScreeningException For general failures
     * @throws AnonymousUserException When the user is not logged in and anonymous access is not allowed
     * @throws PermissionDeniedException When the user is logged in but does not have the necessary permission
     */    
    protected void authorize(String redirect)
    throws ScreeningException, AnonymousUserException, PermissionDeniedException{
        boolean permitted;
        long userId = getAuthentication().getUser().getId();
        Resource r = new ClassResource(this.getClass());
        try{
            log.debug("Getting PrincipalMgr bean");
            Hashtable env = new Hashtable();
            env.put(Context.INITIAL_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_FACTORY);
            env.put(Context.PROVIDER_URL,
                ApplicationServer.SECURITY_PROVIDER_URL);
            InitialContext context = new InitialContext(env);
            
            PrincipalMgrRemoteHome pmHome = (PrincipalMgrRemoteHome)
                context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote principalMgr = pmHome.create();
        
            log.debug("Getting TCSubject");
            TCSubject sub = 
                principalMgr.getUserSubject(userId);
        
            Authorization auth = new TCSAuthorization(sub);
            
            permitted = auth.hasPermission(r);
        }catch(Exception e){
            log.error("Authorization failed");
            throw new ScreeningException(e);
        }
        if(!permitted){
            log.debug("User " + userId +
                " not authorized to access resource " + r.getName());
            if(userId == User.USER_ANONYMOUS_ID){
                getRequest().setAttribute(Constants.REDIRECT,redirect);
                getRequest().setAttribute(Constants.MESSAGE_PARAMETER,
                    "You must be logged in to access that resource.");
                throw new AnonymousUserException("Login required for "+r.getName());
            }else{
                throw new PermissionDeniedException("Access denied for "+r.getName());
            }
        }
    }
    
    /** Builds a URL that can be used to redirect back to the
     * current processor with all parameters intact.
     * @return A context-relative URL
     */    
    protected String getSelfRedirect(){
        return getSelfRedirect(null);
    }
    
    /** Builds a URL that can be used to redirect back to the
     * current processor with current parameters intact.
     * @param parameters Additional parameters to be added to the end of the URL
     * @return A context-relative URL
     */    
    protected String getSelfRedirect(String parameters){
        HttpServletRequest rq = (HttpServletRequest)getRequest();
        
        String basicUrl = Constants.CONTROLLER_URL + "?" + rq.getQueryString();
        if(parameters != null && !parameters.equals("")){
            if(parameters.startsWith("&") || basicUrl.endsWith("&")){
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
    
    /** Getter for property parameterMap.
     * @return Value of property parameterMap.
     */
    public Map getParameterMap() {
        HttpServletRequest rq = (HttpServletRequest)getRequest();
        
        return HttpUtils.parseQueryString(rq.getQueryString());
    }
    
    protected DataAccess getDataAccess() throws Exception {
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(Constants.DATA_SOURCE),
                                        DataSource.class);
        DataAccess dAccess = new DataAccess(ds);
        return dAccess;
    }
}
