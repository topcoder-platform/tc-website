package com.topcoder.web.tc.controller.request.authentication;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.GregorianCalendar;

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
    	
    	String hash;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
	        byte[] plain = (pr.getId().toString() + u.getHandle() + expire.toString()).getBytes();
	        byte[] raw = md.digest(plain);
	        StringBuffer hex = new StringBuffer();
	        for (int i = 0; i < raw.length; i++)
	            hex.append(Integer.toHexString(raw[i] & 0xff));
	        
	        hash = hex.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new TCWebException("Can't hash with md5.", e);
		}
		
		try {
	        TCSEmailMessage mail = new TCSEmailMessage();
	        mail.setSubject("TopCoder Password Recovery");
	        mail.setBody("www.topcoder.com/tc?module=ResetPassword&pr=" + pr.getId() + "&hc=" + hash);
	        mail.setToAddress(pr.getRecoveryAddress(), TCSEmailMessage.TO);
	        mail.setFromAddress("no_reply@topcoder.com");
	        EmailEngine.send(mail);
		} catch (Exception e) {
			throw new TCWebException("Couldn't send the email to the user.", e);
		}


        setNextPage(Constants.RECOVER_PASSWORD);
        setIsNextPageInContext(true);
    }


}
