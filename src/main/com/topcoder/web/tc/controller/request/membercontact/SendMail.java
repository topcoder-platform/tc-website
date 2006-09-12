package com.topcoder.web.tc.controller.request.membercontact;

import java.util.Arrays;
import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.MemberContactMessage;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

/**
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 26, 2006
 */
public class SendMail extends ShortHibernateProcessor {

    public static String TO_HANDLE = "th";
    public static String TEXT = "txt";
    public static String SEND_COPY = "sc";
    public static String SEND = "send";

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User sender  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        if (!Helper.isRated(getUser().getId())) {
            getRequest().setAttribute(Helper.NOT_RATED, String.valueOf(true));
            setNextPage(Constants.MEMBER_CONTACT);
            setIsNextPageInContext(true);
            return;
        }
        if (Helper.isBanned(getUser().getId())
        	|| (Arrays.binarySearch(WebConstants.ACTIVE_STATI, sender.getStatus()) < 0)) {
            getRequest().setAttribute(Helper.BANNED, String.valueOf(true));
            setNextPage(Constants.MEMBER_CONTACT);
            setIsNextPageInContext(true);
            return;
        }


        String toHandle = getRequest().getParameter(TO_HANDLE);
        String message = getRequest().getParameter(TEXT);
        boolean sendCopy = getRequest().getParameter(SEND_COPY) != null;

        // Check again that the user is valid, in case that someone has tweaked the jsp
        // or some kind of hack
        ValidationResult result = new HandleValidator(sender).validate(new StringInput(toHandle));
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

        MemberContactMessage m = new MemberContactMessage();
        m.setSender(sender);
        m.setRecipient(recipient);
        m.setText(message);
        m.setCopy(sendCopy);
        m.setSentDate(new Date());

        DAOUtil.getFactory().getMemberContactMessageDAO().saveOrUpdate(m);

        SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

        setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=MemberContact&" + MemberContact.CONFIRM + "=true");
        setIsNextPageInContext(false);
    }


}
