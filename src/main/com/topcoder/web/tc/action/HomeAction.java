/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.Priority;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.HomeDataManager;
import com.topcoder.web.tc.dto.ActiveContestsSummary;
import com.topcoder.web.tc.dto.MemberInfo;
import com.topcoder.web.tc.dto.TopTenDTO;

/**
 * The action for TC home page.
 * <p>
 * <b>Thread Safety:</b> This class is not thread safe because its base class is
 * not thread safe.
 * </p>
 * 
 * @author TCSASSEMBLIER
 * @version 1.0
 */
public class HomeAction extends ActionSupport implements ServletResponseAware, ServletRequestAware {
    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be
     * that constant value It is final and won't change once it is initialized
     * as part of variable declaration to: Logger.getLogger(HomeAction.class).
     * It is used throughout the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(HomeAction.class);
    
	/**
     * 
     */
	private HttpServletResponse response;
	
	/**
	 * 
	 */
	private HttpServletRequest request;

	/**
	 * Manager for the Data that need to be populated in the Home Page
	 */
	private HomeDataManager homeDataManager;
	

	/**
     * Executes the action.
     * 
     * @return SUCCESS
     */
    public String execute() {
        final String signature = "execute";
        final long startTime = System.currentTimeMillis();
        Helper.logEntrance(LOGGER, signature, null, null);
        try{
	        TCRequest tcRequest = HttpObjectFactory.createSimpleRequest(request);
	        TCResponse tcResponse = response == null ? null : HttpObjectFactory.createResponse(response);
			WebAuthentication authentication = getAuth(tcRequest, tcResponse);
			System.out.println(" User Id : "+authentication.getActiveUser().getId());
			if (authentication.getActiveUser().getId() != SimpleUser.createGuest().getId() ){
				TCSubject user = getUser(authentication.getActiveUser().getId());
				SessionInfo info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
				request.getSession().setAttribute("sessionInfo", info);
				request.setAttribute(BaseServlet.SESSION_INFO_KEY, info);
				MemberInfo memberInfo = homeDataManager.retrieveMemberDetails(authentication.getActiveUser().getId());
				System.out.println(memberInfo);
		    	request.setAttribute("memberInfo", memberInfo);
			}
			loadPublicData();
        } catch (Exception e){
        	Log4jUtility.logException(LOGGER, execute(), e);
        }
        Helper.logExit(LOGGER, signature, startTime, new Object[] { SUCCESS });
        return SUCCESS;
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
	 * 
	 */
	private TCSubject getUser(long id) throws Exception {
        return SecurityHelper.getUserSubject(id);
    }
	
	
	/**
	 * Creates the SessionInfo object for the given authenticated user
	 */
	private SessionInfo createSessionInfo(TCRequest request,
            WebAuthentication auth, Set groups) throws Exception {
		SessionInfo ret;
		ret = new SessionInfo(request, auth, groups);
		return ret;
	}


	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		
	}
	
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	/**
	 * This function loads the Public data needed for the Home Page
	 */
    private void loadPublicData() {
    	Helper.logEntrance(LOGGER, "loadPublicData()", null, null);
    	final long startTime = System.currentTimeMillis();
        try {
            CachedDataAccess nextRoundDai = new CachedDataAccess(MaxAge.HALF_HOUR.age(), DBMS.OLTP_DATASOURCE_NAME);
            Request nextRoundReq = new Request();
            nextRoundReq.setContentHandle("next_srm");
            request.setAttribute("Next_SRM", nextRoundDai.getData(nextRoundReq).get("Next_SRM"));
            Map<String, List<TopTenDTO>> topTenDetails = homeDataManager.retrieveTop10Details();
            for( String key : topTenDetails.keySet()){
            	LOGGER.log(Priority.DEBUG, "Inserting " + key + " with values " + topTenDetails.get(key) + " to Request Attribute" );
            	request.setAttribute(key, topTenDetails.get(key));
            }
            Map<String, ActiveContestsSummary> activeContestSummaryMap = homeDataManager.retrieveActiveContestsSummary();
            for (String key :activeContestSummaryMap.keySet() ){
            	LOGGER.log(Priority.DEBUG, "Inserting " + key + " with values " + activeContestSummaryMap.get(key) + " to Request Attribute" );
            	request.setAttribute(key, activeContestSummaryMap.get(key));
            }
            Helper.logExit(LOGGER, "loadPublicData()", startTime, new Object[] { SUCCESS });
        } catch (TCWebException e) {
        	Log4jUtility.logException(LOGGER, "loadPublicData()", e);
        } catch (Exception e) {
        	Log4jUtility.logException(LOGGER, "loadPublicData()", e);
        }
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
