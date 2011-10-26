/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.Priority;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.http.HttpMethod;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.HomeDataManager;
import com.topcoder.web.tc.dto.ActiveContestsSummary;
/**
 * 
 * <p>
 *    This action acts as the login action for all login requests. When the request is of type GET then it would display the login page 
 *    where the username and password would be entered. Upon clicking on the Login button, the login action would be called and if successful
 *    would be taken back to home page
 * </p>
 * @author kanakarajank
 *
 */
public class LoginAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {
	
	/**
     * Represents the serial version id of this class.
     */
    private static final long serialVersionUID = -3984483271827996144L;

    /**
     * Represents the name of the class.
     */
    private static final String CLASS_NAME = LoginAction.class
            .getName();

    /**
     * Represents the logger used to log information.
     */
    private static final Logger LOGGER = Logger
            .getLogger(LoginAction.class);
    
	/**
	 * username
	 */
	private String username;
	
	/**
	 * password
	 */
	private String password;
	
	/**
	 * 
	 */
	private boolean rememberme;
	
	 /**
     * <p>
     * The http servlet request. This is injected by Struts. It is set through
     * setter and doesn't have a getter. It cannot be null. It does not need to
     * be initialized when the instance is created.
     * </p>
     */
    private HttpServletRequest servletRequest;
    
    /**
     * <p>
     * The http servlet request. This is injected by Struts. It is set through
     * setter and doesn't have a getter. It cannot be null. It does not need to
     * be initialized when the instance is created. 
     * </p>
     */
    private HttpServletResponse servletResponse;

    /**
	 * Manager for the Data that need to be populated in the Home Page
	 */
	private HomeDataManager homeDataManager;
	
	
    /**
     * 
     */
    @Override
	public String execute() throws LoginException {
        Log4jUtility.logEntrance(LOGGER, CLASS_NAME + ".execute()", null, null);
		if (HttpMethod.GET.name().equals(servletRequest.getMethod())){
			Map<String, ActiveContestsSummary> activeContestSummaryMap = homeDataManager.retrieveActiveContestsSummary();
            for (String key :activeContestSummaryMap.keySet() ){
            	LOGGER.log(Priority.DEBUG, "Inserting " + key + " with values " + activeContestSummaryMap.get(key) + " to Request Attribute" );
            	servletRequest.setAttribute(key, activeContestSummaryMap.get(key));
            }
			LOGGER.debug("Get Method Invoked");
			return LOGIN;
		} else {
			try{
				LOGGER.debug("Post Method Invoked");
				servletRequest.getSession().removeAttribute("sessionInfo");
				TCRequest tcRequest = HttpObjectFactory.createSimpleRequest(servletRequest);
		        TCResponse tcResponse = servletResponse == null ? null : HttpObjectFactory.createResponse(servletResponse);
				WebAuthentication authentication = getAuth(tcRequest, tcResponse);
				authentication.login(new SimpleUser(0, username, password), rememberme);
				TCSubject user = getUser(authentication.getActiveUser().getId());
				SessionInfo info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
				servletRequest.getSession().setAttribute("sessionInfo", info);
				LOGGER.debug("correct user name and password");
			} catch(Exception e){
				Log4jUtility.logException(LOGGER, execute(), e);
				addActionError("UserName or Password is invalid");
				return ERROR;
			}
			Log4jUtility.logExit(LOGGER, CLASS_NAME + ".execute()", new Object[]{SUCCESS});
			return SUCCESS;

		}
	}
		
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isRememberme() {
		return rememberme;
	}

	public void setRememberme(boolean rememberme) {
		this.rememberme = rememberme;
	}

	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
		
	}

	
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	private WebAuthentication getAuth(TCRequest tcRequest, TCResponse tcResponse) throws Exception {
	        return new BasicAuthentication(new SessionPersistor(tcRequest.getSession()),
	                tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
	}
	
	/**
	 * Get the UserInfo given the ID
	 * @param id 
	 * @return TCSubject
	 * @throws Exception
	 */
	private TCSubject getUser(long id) throws Exception {
        return SecurityHelper.getUserSubject(id);
    }
	
	/**
	 * Create a SessionInfo storing the authentication information
	 * @param request
	 * @param auth
	 * @param groups
	 * @return
	 * @throws Exception
	 */
	private SessionInfo createSessionInfo(TCRequest request,
            WebAuthentication auth, Set groups) throws Exception {
		SessionInfo ret;
		ret = new SessionInfo(request, auth, groups);
		return ret;
	}
	
	/**
	 * @return the homeDataManager
	 */
	public HomeDataManager getHomeDataManager() {
		return homeDataManager;
	}

	/**
	 * @param homeDataManager the homeDataManager to set
	 */
	public void setHomeDataManager(HomeDataManager homeDataManager) {
		this.homeDataManager = homeDataManager;
	}

}
