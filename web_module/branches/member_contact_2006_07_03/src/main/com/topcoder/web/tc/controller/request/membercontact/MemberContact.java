package com.topcoder.web.tc.controller.request.membercontact;

import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.MemberContactMessage;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

/**
 * Processor for Member Contact page.
 * This processor is used both for displaying the input page and for sending email.
 * If there is no parameter TO_HANDLE, then it just displays the input page.
 * If that parameter is present, it sends an email. 
 * 
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 14, 2006
 */
public class MemberContact extends HibernateProcessor {
    
    public static String TO_HANDLE = "th";
    public static String TEXT = "txt";
    public static String SEND_COPY = "sc";
    public static String CONFIRM = "conf";
    public static String SEND = "send";
    public static String CAN_RECEIVE = "cr";
    
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String toHandle = getRequest().getParameter(TO_HANDLE);
        String message = getRequest().getParameter(TEXT);
        boolean sendCopy = getRequest().getParameter(SEND_COPY) != null;
        User sender  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        // if a handle is specified, send an email
        if (toHandle != null) {
        	
        	// Check again that the user is valid, in case that someone has tweaked the jsp
        	// or some kind of hack
            ValidationResult result = new HandleValidator().validate(new StringInput(toHandle));
            if (!result.isValid()) {
                throw new Exception("Can't contact that user.");
            }
            
            User recipient  = DAOUtil.getFactory().getUserDAO().find(toHandle, true, true);
            String senderEmail = sender.getPrimaryEmailAddress().getAddress();
            String recipientEmail = recipient.getPrimaryEmailAddress().getAddress();
            
            // send the original message
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(Constants.MEMBER_CONTACT_SUBJECT.replaceAll("%", sender.getHandle()));
            mail.setBody(message);
            mail.setToAddress(recipientEmail, TCSEmailMessage.TO); 
            mail.setFromAddress(Constants.MEMBER_CONTACT_FROM_ADDRESS);
            EmailEngine.send(mail);
            
            // send a copy to the user if requested
            if (sendCopy) {
                mail.setSubject(Constants.MEMBER_CONTACT_SUBJECT_COPY.replaceAll("%", recipient.getHandle()));
                mail.setToAddress(senderEmail, TCSEmailMessage.TO); 
                mail.setFromAddress(Constants.MEMBER_CONTACT_FROM_ADDRESS);
                EmailEngine.send(mail);
            }
            getRequest().setAttribute(CONFIRM, "true");
            
        	MemberContactMessage m = new MemberContactMessage();
        	m.setSender(sender);
        	m.setRecipient(recipient);
        	m.setText(message);
        	m.setCopy(sendCopy);
        	m.setSentDate(new Date());
        	
            DAOUtil.getFactory().getMemberContactMessageDAO().saveOrUpdate(m);
            
            markForCommit();
        }
        
        if (!sender.isMemberContactEnabled()) {
        	getRequest().setAttribute(CAN_RECEIVE, String.valueOf(true));
        }
        
        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);        
    }


}
