package com.topcoder.web.tc.controller.request.authentication;

import java.util.GregorianCalendar;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.PasswordRecovery;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;


public class RecoverEmail extends ShortHibernateProcessor {

    protected void dbProcessing() throws TCWebException {
        String userId = StringUtils.checkNull(getRequest().getParameter(Constants.CODER_ID));
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));
        String response = StringUtils.checkNull(getRequest().getParameter("resp")); // fix

        User u = DAOUtil.getFactory().getUserDAO().find(new Long(userId));
    	if (email.length() > 0) {
        	if (!u.getSecretQuestion().getResponse().equals(response)) {
        		// failed.  To do: error message
                setNextPage(Constants.SECRET_QUESTION);
                setIsNextPageInContext(true);
                return;
        	}
        } 
    	
    	GregorianCalendar expire = new GregorianCalendar();
    	expire.add(GregorianCalendar.MINUTE, 10); // FIX: use constant!
    	
    	PasswordRecovery pr = new PasswordRecovery();
    	pr.setUser(u);
    	pr.setRecoveryAddress(email.length() > 0 ? email : u.getPrimaryEmailAddress().getAddress());
    	pr.setExpireDate(expire.getTime());
    	DAOUtil.getFactory().getPasswordRecoveryDAO().saveOrUpdate(pr);
    	
    	log.info("id = " + pr.getId());
    	
        setNextPage(Constants.RECOVER_PASSWORD);
        setIsNextPageInContext(true);
    }


}
