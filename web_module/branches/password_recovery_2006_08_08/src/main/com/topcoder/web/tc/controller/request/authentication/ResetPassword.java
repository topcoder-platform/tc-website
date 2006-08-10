package com.topcoder.web.tc.controller.request.authentication;

import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.PasswordRecovery;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.PasswordValidator;
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

		if (!hc.equals(pr.hash())) {
			throw new TCWebException("Invalid hashcode.");
		}

	
        if (pr.isUsed()) {
        	addError("error", "The password was already changed.");
        }
        
        log.info("expires: " + pr.getExpireDate());
        log.info("now: " + new Date());
        
        if (pr.getExpireDate().before(new Date())) {
        	addError("error", "The time for changing the password has expired. Please require password change again.");
        }
        
        ValidationResult vr = new PasswordValidator().validate(new StringInput(pw));
        if (!vr.isValid()) {
        	addError("error", vr.getMessage());
        }
       
        if (hasErrors()) {
            setNextPage(Constants.RESET_PASSWORD);
            setIsNextPageInContext(true);
        	return;        	
        }
        
		
		pr.setUsed(true);
		DAOUtil.getFactory().getPasswordRecoveryDAO().saveOrUpdate(pr);
		
		// todo, validate pwd
		User u = pr.getUser();
		u.setPassword(pw);
		Set s = u.getEmailAddresses();
		for (Iterator it = s.iterator(); it.hasNext(); ) {
            Email e = (Email) it.next();
            if (e.isPrimary()) {
            	e.setAddress(pr.getRecoveryAddress());
            	break;
            }
		}
		u.setEmailAddresses(s);
		
		DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);

        setNextPage(Constants.RESET_PASSWORD_CONFIRM);
        setIsNextPageInContext(true);
    }


}
