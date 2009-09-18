package com.topcoder.web.admin.controller.request;

import java.util.List;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;

import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocator;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserOfTerms;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocator;

public class AddTermAgreement extends Base {

	@Override
	protected void businessProcessing() throws Exception {
		System.err.println("Enter AddTermAgreement ");
		
		UserTermsOfUse userTerms = UserTermsOfUseLocator.getService();
		TermsOfUse termsOfUse = TermsOfUseLocator.getService();
		String tid = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
		long termsOfUseId = Long.parseLong(tid);
		
		String handle = getRequest().getParameter(Constants.HANDLE);
		
		// verify the handle exists of not
		User userService = (User) createEJB(getInitialContext(), User.class);
		
		if (!userService.userExists(handle, DBMS.COMMON_OLTP_DATASOURCE_NAME)) {
			this.addError(Constants.HANDLE, "The handle doesn't exist.");
		} else {
			long userId = userService.getUserId(handle, DBMS.COMMON_OLTP_DATASOURCE_NAME);		
			if (userTerms.hasTermsOfUse(userId, termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME)){
				addError(Constants.HANDLE, "The handle has agreed to the terms.");
			} else {					
				userTerms.createUserTermsOfUse(userId, termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
			}
		}
		
		// get all users agreed this terms
		List<UserOfTerms> users = userTerms.getUsersOfTerms(termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
		getRequest().setAttribute(Constants.USERS_OF_TERMS, users);
		
		// get the terms
		
		TermsOfUseEntity terms = termsOfUse.getEntity(termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
		getRequest().setAttribute(Constants.TERMS, terms);
		
		setNextPage("/usersOfTerms.jsp");
        setIsNextPageInContext(true);
        
        System.err.println("Exit AddTermAgreement ");

	}

}
