package com.topcoder.web.tc.controller.request.authentication;

import java.util.List;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;


public class FindUser extends ShortHibernateProcessor {

	public static final String LOST_EMAIL = "le";
	public static final String GOOD_EMAIL = "ge";
	public static final String NEEDS_HANDLE = "nh";
	
    protected void dbProcessing() throws TCWebException {
    	String handle = StringUtils.checkNull(getRequest().getParameter(Constants.HANDLE));
        String firstName = StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME));
        String lastName = StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME));
        String regEmail = StringUtils.checkNull(getRequest().getParameter(Constants.REGISTERED_EMAIL));
        String currEmail = StringUtils.checkNull(getRequest().getParameter(Constants.CURRENT_EMAIL));
        
        if (currEmail.length() > 0) {
        	List l = DAOUtil.getFactory().getUserDAO().find(handle, null, null, currEmail);
       	        	
        	if(l.size() == 1) {
        		User u = (User) l.get(0);
        		
                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

                setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=RecoverEmail&"
                		+ Constants.CODER_ID + "=" + u.getId());
                setIsNextPageInContext(false);
        	} else {       	
         	    if(l.size() == 0) { 
	        	    addError(GOOD_EMAIL, "No user found with that email address."); 
	        	} else {
		     		addError(GOOD_EMAIL, "More than one user found with this email address.  Please provide the handle.");
		     		getRequest().setAttribute(NEEDS_HANDLE, "true");
	        	}
                setNextPage(Constants.RECOVER_PASSWORD);
                setIsNextPageInContext(true);
        	}

        } else {
        	List l = DAOUtil.getFactory().getUserDAO().find(handle, firstName, lastName, regEmail);

        	if(l.size() == 1) {
        		User u = (User) l.get(0);

        		if (u.getSecretQuestion() == null) {
	        	    addError(LOST_EMAIL, "You don't have a secret question. Password recovery is not possible."); 
                    setNextPage(Constants.RECOVER_PASSWORD);
                    setIsNextPageInContext(false);
                    return;
        		}
        		getRequest().setAttribute("", u.getSecretQuestion().getQuestion());
                setNextPage(Constants.SECRET_QUESTION);
                setIsNextPageInContext(true);
        	} else {       	
         	    if(l.size() == 0) { 
	        	    addError(LOST_EMAIL, "No user found."); 
	        	} else {
		     		addError(LOST_EMAIL, "More than one user found. Please provide additional data.");
	        	}
                setNextPage(Constants.RECOVER_PASSWORD);
                setIsNextPageInContext(true);

        	}

        }
    }


}
