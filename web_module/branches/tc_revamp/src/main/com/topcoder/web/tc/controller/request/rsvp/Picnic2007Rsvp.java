package com.topcoder.web.tc.controller.request.rsvp;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * @author pulky
 * @version $Revision: 61846 $Date:
 */
public class Picnic2007Rsvp extends Base {
    
    protected void businessProcessing() throws Exception {
        if ("POST".equals(getRequest().getMethod())) {
            String attending = StringUtils.checkNull(getRequest().getParameter("attending"));
            String name = StringUtils.checkNull(getRequest().getParameter("name"));
            String email = StringUtils.checkNull(getRequest().getParameter("email"));
            String guests = StringUtils.checkNull(getRequest().getParameter("guests"));
            String activities = StringUtils.checkNull(getRequest().getParameter("activities"));
            
            sendEmail(attending, name, email, activities, guests);
            
            setNextPage("/rsvp/picnic2007Success.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new NavigationException("Invalid request type.");
        }
    }
    
    private void sendEmail(String attending, String name, String email, String activities, String guests) throws Exception {

        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject("2007 TopCoder Retreat");

        StringBuffer msgText = new StringBuffer(3000);

        msgText.append("I will ");
        msgText.append(attending);
        msgText.append("be attending:\n");
        msgText.append("Name: ");
        msgText.append(name + "\n");
        msgText.append("Email: ");
        msgText.append(email + "\n");
        msgText.append("Guests: ");
        msgText.append(guests + "\n");
        msgText.append("Activities: ");
        msgText.append(activities + "\n");

        msgText.append("\n\n");

        mail.setBody(msgText.toString());
        mail.addToAddress(Constants.RSVP_TO_ADDRESS, TCSEmailMessage.TO);

        mail.setFromAddress("service@topcoder.com");
        EmailEngine.send(mail);
        
        TCSEmailMessage confirmationMail = new TCSEmailMessage();
        confirmationMail.setSubject("2007 TopCoder Retreat - RSVP confirmation");

        confirmationMail.setBody(msgText.toString());
        confirmationMail.addToAddress(email, TCSEmailMessage.TO);

        confirmationMail.setFromAddress("service@topcoder.com");
        EmailEngine.send(confirmationMail);
        
    }
}
