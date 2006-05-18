package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.model.RegistrationType;

import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Submit extends Base {

    protected void registrationProcessing() throws Exception {
        User u = getRegUser();
        if (getRegUser() == null) {
            throw new NavigationException("Sorry, your session has timed out.");
        } else if (u.isNew() || userLoggedIn()) {
            //todo check if the handle is taken again

            getRequest().setAttribute(END_OF_CONVERSATION_FLAG, String.valueOf(true));

            boolean newUser = u.isNew();
            getFactory().getUserDAO().saveOrUpdate(u);
            if (newUser) {
                Long newUserId = u.getId();
                closeConversation();
                //have to wrap up the last stuff, and get into new stuff.  we don't want
                //sending email to be in the transaction
                beginCommunication();
                User newUserObj = getFactory().getUserDAO().find(newUserId);
                String activationCode = StringUtils.getActivationCode(newUserId.longValue());
                newUserObj.setActivationCode(activationCode);
                getFactory().getUserDAO().saveOrUpdate(newUserObj);
                getRequest().setAttribute(END_OF_CONVERSATION_FLAG, String.valueOf(true));
                String email = newUserObj.getPrimaryEmailAddress().getAddress();

                RegistrationTypeDAO dao = getFactory().getRegistrationTypeDAO();

                RegistrationType comp  =dao.getCompetitionType();
                RegistrationType tcs = dao.getSoftwareType();
                RegistrationType hs = dao.getHighSchoolType();
                RegistrationType corp = dao.getCorporateType();
                RegistrationType min = dao.getMinimalType();

                closeConversation();
                sendEmail(activationCode, email, getRequestedTypes(), comp, tcs, hs, corp, min);
            }

            clearSession();

            setNextPage("/success.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }


    private void sendEmail(String activationCode, String email, Set regTypes, RegistrationType comp,
                           RegistrationType tcs, RegistrationType hs, RegistrationType corp,
                           RegistrationType min) throws Exception {
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject("TopCoder Activation");
        StringBuffer msgText = new StringBuffer(3000);


        msgText.append("Thank you for registering with TopCoder!\n\n");

        msgText.append("Your TopCoder activation code is ");
        msgText.append(activationCode).append("\n\n");

        msgText.append("To activate your account, navigate to the following WWW URL:\n");
        msgText.append(getSessionInfo().getAbsoluteServletPath());
        msgText.append("?module=Activate&");
        msgText.append(Constants.ACTIVATION_CODE);
        msgText.append("=");

        msgText.append(activationCode).append("\n\n");
        msgText.append("If you cannot click on the web address above, please copy the address ");
        msgText.append("into your web browser to continue.  If the address spans two lines, ");
        msgText.append("please make sure you copy and paste both sections without any spaces ");
        msgText.append("between them.\n\n");

        if (regTypes.contains(comp)) {
            msgText.append("You may utilize your activated TopCoder handle and password in order to ");
            msgText.append("access your member home page on TopCoder's web site.  Your handle and ");
            msgText.append("password will also provide you with access to the TopCoder Competition ");
            msgText.append("Arena, where you can practice, chat, and compete in rated algorithm ");
            msgText.append("events.\n\n");

            msgText.append("TOPCODER DESIGN AND DEVELOPMENT COMPETITIONS\n\n");

            msgText.append("Participating in TopCoder rated component competitions (held weekly) ");
            msgText.append("will allow you to establish a TopCoder design or development rating.  ");
            msgText.append("Members earn monetary prizes and royalties by creating winning designs ");
            msgText.append("and implementations - competing in a single rated event is all it takes ");
            msgText.append("to become a rated member.   Gain valuable real world design and ");
            msgText.append("development experience, learn best practices, and improve your skills ");
            msgText.append("through feedback from the TopCoder Peer Review Boards.\n\n");

            msgText.append("You can get started in TopCoder component competitions here: ");
            msgText.append("http://www.topcoder.com/?t=development&c=getting_started\n\n");

            msgText.append("TOPCODER ALGORITHM COMPETITIONS\n\n");

            msgText.append("Participating in TopCoder algorithm competitions (held weekly) will ");
            msgText.append("allow you to establish a TopCoder algorithm rating.  Competing in a ");
            msgText.append("single rated event is all it takes to become a rated member, however ");
            msgText.append("most major tournaments will require that you have participated in at ");
            msgText.append("least three rated events.  You can view a schedule of TopCoder events ");
            msgText.append("here: ");
            msgText.append("http://www.topcoder.com/tc?module=Static&d1=calendar&d2=thisMonth\n\n");

            msgText.append("We also suggest that you read up on the rules and competition process ");
            msgText.append("from the FAQs and links that are available here: ");
            msgText.append("http://www.topcoder.com/?t=support&c=index\n\n\n");


            msgText.append("PRACTICING AT TOPCODER\n\n");

            msgText.append("TopCoder provides a number of practice rooms that will allow you to ");
            msgText.append("become acclimated with our competition environment before you ");
            msgText.append("participate in your first rated algorithm competition.  Each practice ");
            msgText.append("room has a problem set that was actually used in a previous rated event.  ");
            msgText.append("In addition, participating in a practice room is a very similar ");
            msgText.append("experience to competing in an actual rated event.  The practice rooms ");
            msgText.append("are always available.\n\n");

            msgText.append("You can download and run the TopCoder Competition Arena Applet from ");
            msgText.append("here: ");
            msgText.append("http://www.topcoder.com/tc?module=Static&d1=help&d2=pracArena\n\n");

            msgText.append("If you have any questions about how to participate, please email them to ");
            msgText.append("service@topcoder.com\n\n");
        } else if (regTypes.contains(hs)) {
            msgText.append("\n\n\nHIGH SCHOOL REG TEXT GOES HERE\n\n\n");
        } else if (regTypes.contains(tcs)) {
            msgText.append("\n\n\nSOFTWARE REG TEXT GOES HERE\n\n\n");
        } else if (regTypes.contains(corp)) {
            msgText.append("\n\n\nCORPORATE REG TEXT GOES HERE\n\n\n");
        } else if (regTypes.contains(min)) {
            msgText.append("\n\n\nMINIMAL REG TEXT GOES HERE\n\n\n");
        }




        msgText.append("Thank you again for registering with TopCoder");

        mail.setBody(msgText.toString());
        mail.addToAddress(email, TCSEmailMessage.TO);

        mail.setFromAddress("service@topcoder.com");
        EmailEngine.send(mail);
    }

}
