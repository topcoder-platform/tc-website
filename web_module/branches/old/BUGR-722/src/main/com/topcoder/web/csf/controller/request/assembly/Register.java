package com.topcoder.web.csf.controller.request.assembly;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.csf.Constants;

import java.util.Calendar;
import java.util.Date;

/**
 * @author pulky
 * @version $Revision: 59527 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Register extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        if ("POST".equals(getRequest().getMethod())) {
            String contestName = StringUtils.checkNull(getRequest().getParameter(Constants.CONTEST_NAME));

            if ("".equals(contestName)) {
                throw new NavigationException("No contest specified");
            }
            
            if (userLoggedIn()) {
                try {
                    DAOFactory factory = DAOUtil.getFactory();
                    
                    User u = factory.getUserDAO().find(new Long(getUser().getId()));
                    sendEmail(contestName, u.getHandle(), u.getPrimaryEmailAddress().getAddress());
    
                    setNextPage("/assembly/regSuccess.jsp");
                    setIsNextPageInContext(true);
                } catch (Exception e) {
                    throw new NavigationException("An error occured during registration.");
                }
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } else {
            throw new NavigationException("Invalid request type.");
        }

    }

    private void sendEmail(String contestName, String handle, String email) throws Exception {

        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject("New registrant for " + contestName + " : " + handle);

        StringBuffer msgText = new StringBuffer(3000);

        msgText.append("The following member has registered for the ");
        msgText.append(contestName);
        msgText.append(" assembly competition:\n\n");
        msgText.append("Handle: ");
        msgText.append(handle);
        msgText.append("\nEmail: ");
        msgText.append(email);

        ObjectFormatter formatter = ObjectFormatterFactory.getEmptyFormatter();
        formatter.setFormatMethodForClass(Calendar.class,
                new CalendarDateFormatMethod("EEEE, MMMM d, yyyy 'at' HH:mm z"), true);

        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date(System.currentTimeMillis()));

        msgText.append("\n\nTimestamp: ");
        msgText.append(formatter.format(cal));
        msgText.append("\n\n");

        mail.setBody(msgText.toString());
        mail.addToAddress(Constants.ASSEMBLY_COMPETITION_EMAIL, TCSEmailMessage.TO);

        mail.setFromAddress(email, email);
        EmailEngine.send(mail);
    }
}
