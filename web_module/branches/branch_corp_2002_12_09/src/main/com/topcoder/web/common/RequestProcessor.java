package com.topcoder.web.common;

import javax.servlet.http.HttpServletRequest;

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
	public void setRequest(HttpServletRequest req);
	
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
	 * Returns new destination page (it differs form requested by user) if
	 * somethihg is wrong with user request. Implementor must prepare that page
	 * vhen processing request in process() method.
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
	public boolean hasNextPageSameContext();
}
