/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.shared.security.LoginException;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

/**
 * 
 * <p>
 *    This action acts as the logout action for all logout requests.
 * </p>
 * @author kanakarajank
 *
 */
public class LogoutAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {
	
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
     * 
     */
    @Override
	public String execute() throws LoginException {
        Log4jUtility.logEntrance(LOGGER, CLASS_NAME + ".execute()", null, null);
        try{
	        TCRequest tcRequest = HttpObjectFactory.createSimpleRequest(servletRequest);
	        TCResponse tcResponse = servletResponse == null ? null : HttpObjectFactory.createResponse(servletResponse);
			WebAuthentication authentication = getAuth(tcRequest, tcResponse);
			authentication.logout();
			LOGGER.debug("Logged out successfully");
        }catch(Exception  e){
        	Log4jUtility.logException(LOGGER, "execute()", e);
        } finally {
        	servletRequest.getSession().removeAttribute("sessionInfo");
        }
		
		Log4jUtility.logExit(LOGGER, "execute()",new Object[]{SUCCESS});
		return SUCCESS;
	}
			
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}	
	
	/**
	 * This function will create a new BasicAuthentication with the specified  parameters
	 * 
	 * @param request
	 * @param response
	 * @return WebAuthentication
	 * @throws Exception
	 */
	private WebAuthentication getAuth(TCRequest tcRequest, TCResponse tcResponse) throws Exception {
	        return new BasicAuthentication(new SessionPersistor(tcRequest.getSession()),
	                tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
	}

	/**
	 * 
	 */
	public void setServletResponse(HttpServletResponse servletResponse) {
	 this.servletResponse = servletResponse;
		
	}
}
