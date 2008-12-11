package com.topcoder.web.aolicq.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.aolicq.Constants;
import com.topcoder.web.aolicq.dao.AolicqDAOFactory;
import com.topcoder.web.aolicq.dao.AolicqDAOUtil;
import com.topcoder.web.aolicq.model.Contest;
import com.topcoder.web.aolicq.model.ContestRegistration;
import com.topcoder.web.common.SecurityHelper;

/**
 * @author dok
 * @version $Revision: 73744 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Register extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            if ("POST".equals(getRequest().getMethod())) {
                Long contestId;
                try {
                    contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid Contest Specified");
                }

                AolicqDAOFactory cFactory = AolicqDAOUtil.getFactory();
                DAOFactory factory = DAOUtil.getFactory();

                Contest c = cFactory.getContestDAO().find(contestId);
                User u = factory.getUserDAO().find(getUser().getId());

                boolean bother = true;

                if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                    if ("on".equals(getRequest().getParameter(Constants.TERMS_AGREE))) {

                        //if contest is part of an event, and user is registered for the event, and
                        //they are overriding the warning then allow them to register

                        boolean isApproved = false;

                        if (bother && c.getEvent() != null) {
                            log.debug("event not null");
                            if (factory.getEventRegistrationDAO().find(getUser().getId(), c.getEvent().getId()) == null) {
                                log.debug("user not registered");
                                if (String.valueOf(true).equals(getRequest().getParameter(Constants.REG_CONFIRM))) {
                                    log.debug("user confirmed");
                                    isApproved = true;
                                }
                            } else {
                                log.debug("user registered");
                                isApproved = true;
                            }
                        } else {
                            log.debug("no event");
                            isApproved = true;
                        }

                        if (isApproved) {
                            ContestRegistration cr = new ContestRegistration();
                            cr.setContest(c);
                            cr.setUser(u);
                            cr.setTerms(DAOUtil.getFactory().getTermsOfUse().find(Constants.CONTEST_TERMS_OF_USE_ID));
                            cr.getId().setContest(c);
                            cr.getId().setUser(u);

                            AolicqDAOUtil.getFactory().getContestRegistrationDAO().saveOrUpdate(cr);

                            SecurityHelper.addUserToGroup(u.getId(), Constants.AOLICQ_SECURITY_GROUP_ID);
/*
                            SecurityGroup openAimSg = factory.getSecurityGroupDAO().find(new Long(Constants.OPEN_AIM_SECURITY_GROUP_ID));
                            if (!u.getSecurityGroups().contains(openAimSg)) {
                                UserGroup ug = new UserGroup();
                                ug.setUser(u);
                                ug.setSecurityGroup(openAimSg);
                                ug.setSecurityStatusId(1);
                                ug.setCreateUserId(new Long(Constants.ADMIN_USER_ID));

                                factory.getUserGroupDAO().saveOrUpdate(ug);
                            }*/

                        } else {
                            addError(Constants.REG_CONFIRM, "");
                            setDefault(Constants.CONTEST_ID, c.getId());
                            setDefault(Constants.REG_CONFIRM, String.valueOf(true));
                            setNextPage("/eventConfirm.jsp");
                            setIsNextPageInContext(true);
                        }
                    } else {
                        addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                        setDefault(Constants.CONTEST_ID, contestId.toString());
                        getRequest().setAttribute("contest", c);
                        setNextPage("/contestReg.jsp");
                        setIsNextPageInContext(true);
                    }
                }

                if (!hasErrors()) {
                    StringBuffer buf = new StringBuffer(50);
                    buf.append(getSessionInfo().getServletPath());
                    buf.append("?" + Constants.MODULE_KEY + "=ViewContestDetails&");
                    buf.append(Constants.CONTEST_ID + "=").append(contestId);
                    setNextPage(buf.toString());
                    setIsNextPageInContext(false);

                }

            } else {
                throw new NavigationException("Invalid request type.");
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
