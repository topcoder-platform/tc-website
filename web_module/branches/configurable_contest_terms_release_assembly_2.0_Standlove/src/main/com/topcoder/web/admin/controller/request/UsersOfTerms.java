/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
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

/**
 * <p>
 * Version 1.0 (Other Configurable Contest Terms Release Assembly 2.0 )
 * This controller gets the list of users who agreed the terms and display them. 
 * 
 * TCWEB-666  Administrator tool to list user terms agreements. 
 * </p>
 * 
 * @author ASSEMBLER
 * @version 1.0
 */
public class UsersOfTerms extends Base {

	/**
	 * Process the request to gets the list of users who agreed the terms and display them. 
	 * 
	 * @throws Exception if error occurs when processing the request.
	 */
	protected void businessProcessing() throws Exception {	
		UserTermsOfUse userTerms = UserTermsOfUseLocator.getService();
		TermsOfUse termsOfUse = TermsOfUseLocator.getService();
		String tid = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
		long termsOfUseId = Long.parseLong(tid);
		
		// get all users agreed this terms
		List<UserOfTerms> users = userTerms.getUsersOfTerms(termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
		getRequest().setAttribute(Constants.USERS_OF_TERMS, users);
		
		// get the terms
		TermsOfUseEntity terms = termsOfUse.getEntity(termsOfUseId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
		getRequest().setAttribute(Constants.TERMS, terms);
		setNextPage("/usersOfTerms.jsp");
        setIsNextPageInContext(true);
	}

}
