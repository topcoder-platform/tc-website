package com.topcoder.web.reg.controller.request;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.SecurityGroup;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserSchool;
import com.topcoder.web.reg.Constants;

import javax.ejb.CreateException;
import javax.naming.Context;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Submit extends Base {

    protected void registrationProcessing() throws Exception {
        User u = getRegUser();
        boolean newReg = isNewRegistration();
        if (getRegUser() == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/reg");
        } else if (newReg || userLoggedIn()) {
            //todo check if the handle is taken again
            getFactory().getUserDAO().saveOrUpdate(u);

            HSRegistrationHelper rh = new HSRegistrationHelper(getRequest(), (Map<String, Response>) getRequest().getSession().getAttribute(Constants.HS_RESPONSES));

            if (hasRequestedType(RegistrationType.HIGH_SCHOOL_ID) &&
                    !isCurrentlyRegistered(u, RegistrationType.HIGH_SCHOOL_ID)) {
                rh.registerForSeason(u);
            }

            securityStuff(newReg, u);

            if (getRequest().getSession().getAttribute(Constants.INACTIVATE_HS) != null) {
                rh.inactivateUser(u);
            }


            if (log.isDebugEnabled()) {
                for (UserSchool sc : u.getSchools()) {
                    if (sc.getSchool() == null) {
                        log.debug("school null");
                    }
                    if (sc.getUser() == null) {
                        log.debug("user null");
                    }
                    if (sc.getAssociationType() == null) {
                        log.debug("ass null");
                    }
                    if (sc.isPrimary() == null) {
                        log.debug("primary null");
                    }
                }
            }

            markForCommit();
            closeConversation();
            beginCommunication();
            if (newReg) {
                try {
                    Long newUserId = u.getId();
                    //have to wrap up the last stuff, and get into new stuff.  we don't want
                    //sending email to be in the transaction
                    User newUserObj = getFactory().getUserDAO().find(newUserId);

                    String activationCode = StringUtils.getActivationCode(newUserId.longValue());
                    newUserObj.setActivationCode(activationCode);
                    getFactory().getUserDAO().saveOrUpdate(newUserObj);
                    markForCommit();
                    String email = newUserObj.getPrimaryEmailAddress().getAddress();

                    RegistrationTypeDAO dao = getFactory().getRegistrationTypeDAO();
                    RegistrationType comp = dao.getCompetitionType();
                    RegistrationType tcs = dao.getSoftwareType();
                    RegistrationType hs = dao.getHighSchoolType();
                    RegistrationType corp = dao.getCorporateType();
                    RegistrationType min = dao.getMinimalType();
                    RegistrationType studio = dao.getStudioType();
                    RegistrationType teacher = dao.getTeacherType();
                    RegistrationType openAIM = dao.getOpenAIMType();
                    RegistrationType truveo = dao.getTruveoType();

                    closeConversation();
                    try {
                        sendEmail(activationCode, email, getRequestedTypes(), comp, tcs, hs, corp, min, studio, teacher, openAIM, truveo);
                    } catch (Exception e) {
                        //we don't want whatever happened to affect the registration.
                        e.printStackTrace();
                    }
                } catch (Throwable e) {
                    if (u != null && u.getId() != null) {
                        Context ctx = null;
                        try {
                            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
                            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                            PrincipalMgrRemote pmr = pmrh.create();
                            pmr.removeUser(new UserPrincipal("", u.getId().longValue()), new TCSubject(132456));

                        } catch (Throwable ex) {
                            log.error("problem in exception callback for user: " + u.getId() + " " + e.getMessage());
                        } finally {
                            close(ctx);
                        }
                    }
                }
            }

            HashSet h = new HashSet();
            for (Iterator it = getRequestedTypes().iterator(); it.hasNext();) {
                h.add(((RegistrationType) it.next()).getId());
            }

            //set these in the request for the success page, cuz we're about to kill the session
            getRequest().setAttribute(Constants.REG_TYPES, h);
            getRequest().setAttribute(Constants.USER, u);
            getRequest().setAttribute(Constants.NEW_REG_FLAG, newReg);
            getRequest().getSession().invalidate();


            if (DAOUtil.useQueryToolFactory && !newReg) {
                // clear preferences from cache
                HashSet<String> s = new HashSet<String>();
                s.add("user_preference");
                s.add("user_preference_all");
                CacheClearer.removelike(s);
            }

            setNextPage("/success.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }

    private void registerHsSeason(User u) {
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        Event event = DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON).getEvent();

        log.debug("User " + u.getId() + " registered for HS season in event " + event.getId());
        if (event != null) {
            u.addEventRegistration(event, null, true);
            userDAO.saveOrUpdate(u);
            markForCommit();
        }

    }

    private void securityStuff(boolean newUser, User u) throws Exception, RemoteException, CreateException, GeneralSecurityException {

        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            UserPrincipal myPrincipal;
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();

            String password = (String) getRequest().getSession().getAttribute("password");
            if (newUser) {
                //create the security user entry
                myPrincipal = pmr.createUser(u.getId(), u.getHandle(), password, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            } else {
                myPrincipal = new UserPrincipal("", u.getId());
                pmr.editPassword(myPrincipal, password, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }

            List<SecurityGroup> types = getFactory().getSecurityGroupDAO().getSecurityGroups(getRequestedTypes());
            for (SecurityGroup type : types) {
                pmr.addUserToGroup(pmr.getGroup(type.getId(), DBMS.JTS_OLTP_DATASOURCE_NAME),
                        myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }

            //add them to these two as well.  eventually i'm guessing we'll rearrange security and this'll change
            Collection groups = pmr.getGroups(tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            GroupPrincipal anonGroup = null;
            GroupPrincipal userGroup = null;
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                anonGroup = (GroupPrincipal) iterator.next();
                if (anonGroup.getName().equals("Anonymous")) {
                    break;
                }
            }
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                userGroup = (GroupPrincipal) iterator.next();
                if (userGroup.getName().equals("Users")) {
                    break;
                }
            }
            pmr.addUserToGroup(anonGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            pmr.addUserToGroup(userGroup, myPrincipal, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
        } finally {
            close(ctx);
        }

    }


    private void sendEmail(String activationCode, String email, Set regTypes, RegistrationType comp,
                           RegistrationType tcs, RegistrationType hs, RegistrationType corp,
                           RegistrationType min, RegistrationType studio, RegistrationType teacher,
                           RegistrationType openAIM, RegistrationType truveo) throws Exception {


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

        if (regTypes.contains(comp) && !regTypes.contains(hs)) {
            msgText.append("You may utilize your activated TopCoder user name and password in order to access your member home page on TopCoder's web site.  Your user name and password will also provide you with access to the TopCoder Marathon Match and Algorithm Competition Arenas, where you can practice, chat, and compete in events, as well as to the Component Competition Forums, where you can read about and discuss component projects.\n\n");
        }

        if (regTypes.contains(comp) && regTypes.contains(hs)) {
            msgText.append("You may utilize your activated TopCoder user name and password in order to access your member home page on TopCoder's web site.  Your user name and password will also provide you with access to the following areas within the TopCoder website: High School Competition Arena, where you can practice, chat, and compete in rated events; TopCoder Marathon Match and Algorithm Competition Arenas, where you can practice, chat, and compete in those events; the Component Competition Forums, where you can read about and discuss component projects.\n\n");
        }

        if (!regTypes.contains(comp) && regTypes.contains(hs)) {
            msgText.append("You may utilize your activated TopCoder user name and password in order to access your member home page on TopCoder's web site.  Your user name and password will also provide you with access to the High School Competition Arena, where you can practice, chat, and compete in rated events.\n\n");
        }

        if (regTypes.contains(studio)) {
            msgText.append("You may utilize your activated TopCoder Studio user name and password in order to access the TopCoder Studio web site.  Your user name and password will also provide you with access to the Active Contests posted on the TopCoder Studio website, where you can compete in design projects, as well as to the Forums, where you can read about and discuss the projects.\n\n");
        }

        if (regTypes.contains(openAIM)) {
            msgText.append("Your newly created TopCoder account will provide you with the ability to compete in the TopCoder Open AIM Competition.  Please check out the competition area to learn how to compete. http://" + ApplicationServer.OPENAIM_SERVER_NAME+"\n\n");
        }

        if (regTypes.contains(truveo)) {
            msgText.append("Your newly created TopCoder account will provide you with the ability to compete in the TopCoder Truveo Competition.  Please check out the competition area to learn how to compete. http://" + ApplicationServer.TRUVEO_SERVER_NAME+"\n\n");
        }

        if (regTypes.contains(hs)) {
            msgText.append("TOPCODER HIGH SCHOOL COMPETITIONS\n\n");
            msgText.append("Participating in TopCoder High School competitions (held weekly) will allow you to establish a TopCoder rating.  Competing in a single rated event is all it takes to become a rated member, however the TopCoder High School tournament requires that you and/or your team have participated in at least four rated events.  You can view a schedule of High School events here:\n\n");
            msgText.append("http://www.topcoder.com/tc?module=Static&d1=calendar&d2=thisMonth\n\n");
            msgText.append("We also suggest that you read up on the rules and competition process from the FAQs and links that are available here:\n");
            msgText.append("http://www.topcoder.com/tc?module=Static&d1=hs&d2=support&d3=index\n\n");
            msgText.append("PRACTICING AT TOPCODER\n\n");
            msgText.append("TopCoder provides a number of practice rooms that will allow you to become acclimated with our competition environment before you participate in your first rated competition.  Each practice room has a problem set that was actually used in a previous rated event.  In addition, participating in a practice room is a very similar experience to competing in an actual rated event.  The practice rooms are always available.\n\n");
            msgText.append("You can download and run the High School Competition Arena Applet from here: http://www.topcoder.com/tc?module=Static&d1=help&d2=pracArena\n\n");
        }

        if (regTypes.contains(comp)) {
            msgText.append("TOPCODER DESIGN AND DEVELOPMENT COMPETITIONS\n\n");
            msgText.append("Participating in TopCoder rated component competitions (held weekly) will allow you to establish a TopCoder design or development rating.  Members earn monetary prizes and royalties by creating winning designs and implementations - competing in a single rated event is all it takes to become a rated member.  Gain valuable real world design and development experience, learn best practices, and improve your skills through feedback from the TopCoder Peer Review Boards.\n\n");
            msgText.append("You can get started in TopCoder component competitions here:\n");
            msgText.append("http://www.topcoder.com/wiki/display/tc/Getting+Started+in+Component+Development+Competitions\n\n");
            msgText.append("Be sure to read the details of the Digital Run, where you can compete for large quarterly prizes and a chance to attend the next TopCoder Open.\n\n");
            msgText.append("http://www.topcoder.com/dr\n\n");
            msgText.append("TOPCODER MARATHON MATCH COMPETITIONS\n");
            msgText.append("TopCoder has created Marathon Matches in an effort to provide a more flexible competition format with an extended timeline that offers different types of problems than what can be offered in a traditional TopCoder Algorithm round.\n\n");
            msgText.append("To learn about how to compete in Marathon Matches, read here: http://www.topcoder.com/longcontest/?module=Static&d1=instructions\n\n");
            msgText.append("TOPCODER ALGORITHM COMPETITIONS\n\n");
            msgText.append("Participating in TopCoder algorithm competitions (held weekly) will allow you to establish a TopCoder algorithm rating.  Competing in a single rated event is all it takes to become a rated member, however most major tournaments will require that you have participated in at least three rated events.  You can view a schedule of TopCoder events here: http://www.topcoder.com/tc?module=Static&d1=calendar&d2=thisMonth\n\n");
            msgText.append("We also suggest that you read up on the rules and competition process from the FAQs and links that are available here: http://www.topcoder.com/tc?module=Static&d1=help&d2=index\n\n");
            msgText.append("PRACTICING AT TOPCODER\n\n");
            msgText.append("TopCoder provides a number of practice rooms that will allow you to become acclimated with our competition environment before you participate in your first Marathon Match or Algorithm competition.  Each practice room has a problem set that was actually used in a previous rated event.  In addition, participating in a practice room is a very similar experience to competing in an actual event.  The practice rooms are always available.\n\n");
            msgText.append("You can download and run the TopCoder Marathon Match Competition Arena Applet from here: http://www.topcoder.com/longcontest/?module=ViewPractice&rt=14\n\n");
            msgText.append("You can download and run the TopCoder Algorithm Competition Arena Applet from here: http://www.topcoder.com/tc?module=Static&d1=help&d2=pracArena\n\n");
        }

        if (regTypes.contains(teacher)) {
            msgText.append("TOPCODER EDUCATIONAL PLATFORM\n\n");
            msgText.append("Computer Science and programming professors at universities and colleges around the world have expressed their desire for an academic version of the TopCoder Algorithm arena customized for the classroom.\n\n");
            msgText.append("Our answer to that request is the Educational Platform.  Professors have access to on-demand practice rooms and virtual classrooms, and can able to select, configure and assign problems and view reports.\n\n");
            msgText.append("You MUST have your account approved by a TopCoder administrator before you will be granted access to the Educational Platform.  Please email education@topcoder.com with your information (name, school and user name) so that your account can be fully activated.\n\n");
            msgText.append("If you have any questions about how to use the Educational Platform, please email them to service@topcoder.com.\n\n");
        }

        if (regTypes.size() > 1 || !regTypes.contains(teacher)) {
            msgText.append("If you have any questions about how to participate, please email them to service@topcoder.com.\n\n");
        }
        if (regTypes.contains(hs) || regTypes.contains(comp)) {
            msgText.append("Thank you again for registering with TopCoder and we look forward to seeing you in the arena!");
        } else {
            msgText.append("Thank you again for registering with TopCoder!");
        }


        mail.setBody(msgText.toString());
        mail.addToAddress(email, TCSEmailMessage.TO);

        mail.setFromAddress("service@topcoder.com");
        EmailEngine.send(mail);
    }

}