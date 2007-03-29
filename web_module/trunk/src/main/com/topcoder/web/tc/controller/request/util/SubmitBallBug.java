package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 28, 2007
 */
public class SubmitBallBug extends ShortHibernateProcessor {
    public static final String BUG_DESC = "desc";
    public static final String HOW_TO = "howto";

    protected void dbProcessing() throws Exception {

        String desc = StringUtils.checkNull(getRequest().getParameter(BUG_DESC)).trim();
        if ("".equals(desc)) {
            addError(BUG_DESC, "Please fill in the description of the bug.");
        }
        String howTo = StringUtils.checkNull(getRequest().getParameter(HOW_TO)).trim();
        if ("".equals(howTo)) {
            addError(HOW_TO, "Please fill in how to replicate the bug.");
        }

        if (hasErrors()) {
            setDefault(BUG_DESC, desc);
            setDefault(HOW_TO, howTo);
            setNextPage("/sponsors/ballSubmitBug.jsp");
            setIsNextPageInContext(true);
        } else {
            User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());


            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("Ball Bug Report from " + u.getHandle());
            StringBuffer msgText = new StringBuffer(3000);


            msgText.append("Hello Ball Admin,\n\n");
            msgText.append("I would like to report the following problem:\n\n");
            msgText.append(desc);
            msgText.append("\n\n");
            msgText.append("In order to replicate this problem, you'll need to:\n\n");
            msgText.append(howTo);

            msgText.append("\n\n");
            msgText.append("Thank you,\n");
            msgText.append(u.getFirstName()).append(" ").append(u.getLastName()).append(" aka ").append(u.getHandle());
            msgText.append("PS. Where's my T-Shirt?\n\n");


            mail.setBody(msgText.toString());
            if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
                mail.addToAddress("service@theball.com", TCSEmailMessage.TO);
            } else {
                mail.addToAddress("dok@topcoder.com", TCSEmailMessage.TO);
            }
            mail.setFromAddress(u.getPrimaryEmailAddress().getAddress());
            EmailEngine.send(mail);


        }


    }
}
