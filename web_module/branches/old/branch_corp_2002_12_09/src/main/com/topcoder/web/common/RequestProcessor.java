package com.topcoder.web.common;

import javax.servlet.ServletRequest;

import com.topcoder.web.common.security.WebAuthentication;

/**
 * Depending on user's request type Controller will instantiate corresponding
 * RequestProcessor implementor, call setRequest(..) method of it, then issue
 * process() signal. Upon receiving that signal RequestProcess determines what
 * actions must be taken, performs they and returns to caller. If some of
 * actions has failed (illegal username/password combination, one has not enough
 * priveleges) then processor must set appropriate nextPage attribute and throw
 * related exception.
 * 
 * Actions to be performed will contain some business logic. Upon login, for
 * example, user information must be retrieved from DB, user's authorization
 * token created and stored in HttpSession etc.
 * 
 * CAUTION. As it was stated in classes overview it is _request_processor_
 * (and neither _response_processor_ nor _request_response_processor_) so I
 * have removed response parameter. Sorry for any inconviences caused by this.
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public interface RequestProcessor {
	/**
	 * This method just stores request given for later processing.
	 * 
	 * @param req request issued by user  
	 */
	public void setRequest(ServletRequest req);
    
    /**
     * Sets up authentication token for current http session.
     * 
     * @param auth
     */
    public void setAuthToken(WebAuthentication auth);
	
	/**
	 * Based on the request (received via setRequest(..)) performs some actions
	 * required to get user ready to go on the destination page. They may
	 * include population of busines logic beans from db, setting up required
	 * attributes of user HttpSession, probably some work with Cookies etc.
	 * 
	 * If user failed to fulfil some set of reqirements, then this method will
	 * set new destination page to be returned by getNextPage() and throw
	 * corresponding exception.
	 * 
	 * Also it will include setting up either request or session attributes to
	 * be used by jsp tags on the destination page.
	 * 
	 * @throws Exception for the moment exceptions set is not defined yet, but
	 * it will be something like to the AuthorizationFailedException,
	 * ResourceUnavailableException, NotAuthorizedException etc.
	 */
	public void process() throws Exception; 
	
	/**
	 * Returns new destination page to be returned as a result of request
	 * processing. The controller does not know what is right workflow
	 * (processor may to be or not tobe successful when processing given
	 * request, in which cases destination pages will be different). So given
	 * method will be called by controller to decide where go to after request
	 * processing. Implementor must prepare that page vhen processing request in
	 * process() method.<br>
	 * 
	 * <b>PLEASE NOTE</b>. Description above was changed from very first
	 * revision of interface.<br>
	 * 
	 * Also it is supposed, that for every user request received there will be
	 * an unique instance of processor (ensured by controller).
	 * 
	 * In theory, there are able situations when user will be required to walk
	 * through a tree of pages to fulfill the requirements set, so it is
	 * possible that there must be even stack of next pages however for now the
	 * only page is enough.
	 * 
	 * @return String new destination when user was unsuccessful by some reason.
	 */
	public String getNextPage();
	
	/**
	 * Reports to controller if the destination page rececived from
	 * getNextPage() is in same context or not. Same context pages are
	 * <b>forwarded</b> by controller, while others are <b>redirected</b>.
	 * 
	 * In general, the difference beetween redirected and forwarded request is
	 * next. Redirected ones will immediately return HTTP message to client's
	 * browser saying where new page must be taken from. After this browser will
	 * send new request and it will passed again through request dispatcher,
	 * controller, and processor (may differs from that which forced given
	 * redirection). In contrast, forwarded requests will not back to the user
	 * immediately, but possible will take some additional internal processing
	 * either in controller or dispatcher and only after this some http content
	 * will be fed to the client.
	 * 
	 * @return boolean before 
	 */
	public boolean isNextPageInContext();
}
