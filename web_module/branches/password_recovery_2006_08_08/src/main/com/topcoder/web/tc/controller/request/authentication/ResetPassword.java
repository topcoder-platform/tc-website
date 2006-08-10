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


public class ResetPassword extends ShortHibernateProcessor {

    protected void dbProcessing() throws TCWebException {
        String prId = StringUtils.checkNull(getRequest().getParameter("pr"));
        String hc = StringUtils.checkNull(getRequest().getParameter("hc"));
        String pw = StringUtils.checkNull(getRequest().getParameter("password")); 

        PasswordRecovery pr = DAOUtil.getFactory().getPasswordRecoveryDAO().find(new Long(prId));
        if (pr == null) {
        	throw new TCWebException("Row not found in password_recovery: " + prId);
        }
        
        // fix refactor
    	String hash;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
	        byte[] plain = (pr.getId().toString() + pr.getUser().getHandle() + pr.getExpireDate().toString()).getBytes();
	        byte[] raw = md.digest(plain);
	        StringBuffer hex = new StringBuffer();
	        for (int i = 0; i < raw.length; i++)
	            hex.append(Integer.toHexString(raw[i] & 0xff));
	        
	        hash = hex.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new TCWebException("Can't hash with md5.", e);
		}
		
		if (hash != hc) {
			throw new TCWebException("Invalid hashcode.");
		}
		
		pr.setUsed(true);
		DAOUtil.getFactory().getPasswordRecoveryDAO().saveOrUpdate(pr);
		
		// todo, validate pwd
		User u = pr.getUser();
		u.setPassword(pw);
		DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);

		getRequest().setAttribute("confirm", "true");
        setNextPage(Constants.RESET_PASSWORD);
        setIsNextPageInContext(true);
    }


}
