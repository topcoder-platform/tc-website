<%@ page import="com.topcoder.security.*,
                 java.lang.reflect.UndeclaredThrowableException,
                 com.topcoder.util.logging.Logger,
                 javax.naming.Context,
                 javax.naming.InitialContext,
                 com.topcoder.apps.review.projecttracker.SecurityEnabledUser,
                 com.topcoder.apps.review.Constants,
                 com.topcoder.apps.review.UtilityBean,
                 com.topcoder.dde.util.Cookies,
                 com.topcoder.apps.review.projecttracker.UserManagerLocal,
                 com.topcoder.apps.review.projecttracker.UserManagerLocalHome,
                 javax.rmi.PortableRemoteObject" %>
<%@ page import="com.topcoder.security.admin.*" %>
<%@ page import="com.topcoder.security.login.*" %>
<%@ page import="com.topcoder.security.policy.*" %>

<%@ page import="com.topcoder.dde.user.*" %>
<%
	////////////////////////////////////////////
	// Load context
	////////////////////////////////////////////

	/*
	Hashtable environment = new Hashtable();
	environment.put(Context.PROVIDER_URL, "localhost:1099");
	environment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
	Context CONTEXT = new InitialContext(environment);
	*/
	Context CONTEXT = new InitialContext();


	////////////////////////////////////////////
	// Load Stateless EJB's
	////////////////////////////////////////////

	Object objUserManager = CONTEXT.lookup("dde/UserManager");
	UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome)  PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
  	UserManagerRemote USER_MANAGER = userManagerHome.create();
%>

<%
/*
 	Handle session information, redirecting if necessary
*/

//////////////////////////////////////////////
// Get current user information from session
//////////////////////////////////////////////

SecurityEnabledUser securityEnabledUser = (SecurityEnabledUser) session.getAttribute(Constants.USER_KEY);

//Attempt to log in the user via cookies
if (securityEnabledUser == null) {
    UserManagerLocal userManager = (UserManagerLocal) session.getAttribute("USER_MANAGER_LOCAL");

    if (userManager == null) {
        try {
            Context initial = new InitialContext();
            Object objref = initial.lookup(UserManagerLocalHome.EJB_REF_NAME);
            UserManagerLocalHome home = (UserManagerLocalHome) PortableRemoteObject.narrow(objref, UserManagerLocalHome.class);
            userManager = home.create();
            session.setAttribute("USER_MANAGER_LOCAL", userManager);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    TCSubject sub = Cookies.getUserFromLoginCookies(request, response, USER_MANAGER);
    if (sub!=null)
        securityEnabledUser = userManager.getUser(sub);

    try {
        if (securityEnabledUser != null) {

            session.setAttribute(Constants.USER_KEY, securityEnabledUser);
            session.setAttribute(Constants.UTILITY_KEY,
                                new UtilityBean(securityEnabledUser));
        }
    } catch (Exception e) {
//        debug.addMsg("login", "" + e);
        e.printStackTrace();
    }
}

//////////////////////////////////////////////
// Get page requested
//////////////////////////////////////////////

String requestURI = request.getRequestURI();

//////////////////////////////////////////////
// Check for permissions for the requested page
//////////////////////////////////////////////

String pagesRequiringLogin = "[][]";

//////////////////////////////////////////////
// Redirect to login page if login is required
//////////////////////////////////////////////

if (pagesRequiringLogin.indexOf(requestURI) > -1 && requestURI == null) {
	session.putValue("nav_redirect", requestURI);
	response.sendRedirect("/login.jsp");
}

//////////////////////////////////////////////
// Set current page information so that any
// attempts to login know where to go back to
//////////////////////////////////////////////

if (requestURI != null && !requestURI.endsWith("login.jsp") && !requestURI.endsWith("c_component_doc.jsp")) {
    StringBuffer navRedirect = request.getRequestURL();
    if (request.getQueryString() != null) {
        navRedirect.append("?");
        navRedirect.append(request.getQueryString());
    }
    session.putValue("nav_redirect", navRedirect.toString());
    session.removeValue("nav_redirect_msg");
}
%>
