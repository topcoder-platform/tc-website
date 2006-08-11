package com.topcoder.web.tc.controller.request.authentication;

import java.util.GregorianCalendar;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
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
        	if (!u.getSecretQuestion().getResponse().equalsIgnoreCase(response)) {
        		addError("error", "Incorrect response");
        		
        		getRequest().setAttribute("sq", u.getSecretQuestion().getQuestion());
        		getRequest().setAttribute(Constants.CODER_ID, userId);
        		
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
    	
		
		try {
            StringBuffer msgText = new StringBuffer(1000);
            msgText.append("In order to reset your password please go to the following URL: \n\n");
            msgText.append("http://");
            msgText.append(ApplicationServer.SERVER_NAME);
            msgText.append("/tc?module=Static&d1=authentication&d2=resetPassword&pr=" + pr.getId() + "&hc=" + pr.hash());
            
	        TCSEmailMessage mail = new TCSEmailMessage();
	        mail.setSubject("TopCoder Password Recovery");
	        mail.setBody(msgText.toString());
	        		
	        mail.setToAddress(pr.getRecoveryAddress(), TCSEmailMessage.TO);
	        mail.setFromAddress("no_reply@topcoder.com");
	        EmailEngine.send(mail);
		} catch (Exception e) {
			throw new TCWebException("Couldn't send the email to the user.", e);
		}


		getRequest().setAttribute("email", pr.getRecoveryAddress());
        setNextPage(Constants.RECOVER_PASSWORD_CONFIRM);
        setIsNextPageInContext(true);
    }


}
