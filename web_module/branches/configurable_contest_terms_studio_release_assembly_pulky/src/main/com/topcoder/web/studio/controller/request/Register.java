package com.topcoder.web.studio.controller.request;

import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestRegistration;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Register extends ShortHibernateProcessor {
    /**
     * Constant containing submitter role id
     *
     * @since
     */
    protected static final Integer[] SUBMITTER_ROLE_IDS = new Integer[] {1};

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            if ("POST".equals(getRequest().getMethod())) {
                Long contestId;
                try {
                    contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid Contest Specified");
                }

                StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
                DAOFactory factory = DAOUtil.getFactory();

                Contest c = cFactory.getContestDAO().find(contestId);
                User u = factory.getUserDAO().find(getUser().getId());
                
                boolean bother = true; 
                
                // only bother if the user is not a professional (tccc)
                // comment this line if not needed
//                bother = !CoderType.PROFESSIONAL.equals(u.getCoder().getCoderType().getId()); 
                log.debug("Coder type: " + u.getCoder().getCoderType().getDescription());
                log.debug("Bother: " + bother);

                if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                    String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));

                    if (!"".equals(termsOfUseId)) {
                        TermsOfUse tou = factory.getTermsOfUse().find(Integer.parseInt(termsOfUseId));
                        if ("on".equals(getRequest().getParameter(Constants.TERMS_AGREE))) {
                            log.debug("agreed to terms");
                            
                            // add user terms of use record
                            u.addTerms(tou);

                            // process terms of use
                            processTermsOfUse(c, u, SUBMITTER_ROLE_IDS);
                        } else {
                            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                            setDefault(Constants.CONTEST_ID, contestId.toString());
                            getRequest().setAttribute("contest", c);
                            setNextPage("/contestReg.jsp");
                            setIsNextPageInContext(true);
                        }
                    } else {
                        // make sure they don't have pending terms of use (they could get here faking the URL)
                        if (processTermsOfUse(c, u, SUBMITTER_ROLE_IDS)) {
                            setDefault(Constants.CONTEST_ID, contestId.toString());
                            getRequest().setAttribute("contest", c);
                            setNextPage("/contestReg.jsp");
                            setIsNextPageInContext(true);
                            return;
                        }

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

                            StudioDAOUtil.getFactory().getContestRegistrationDAO().saveOrUpdate(cr);

                        } else {
                            addError(Constants.REG_CONFIRM, "");
                            setDefault(Constants.CONTEST_ID, c.getId());
                            setDefault(Constants.REG_CONFIRM, String.valueOf(true));
                            setNextPage("/eventConfirm.jsp");
                            setIsNextPageInContext(true);
                        }                        
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

    private boolean processTermsOfUse(Contest c, User u, Integer[] submitterRoleIds) {
        // validate that registrant has agreed to the necessary terms of use
        Set<TermsOfUse> necessaryTerms = 
            StudioDAOUtil.getFactory().getContestDAO().findNecessaryTerms(c.getId(), submitterRoleIds);
        
        Set<TermsOfUse> termsAgreed = u.getTerms();

        for (TermsOfUse tou : necessaryTerms) {
            if (!termsAgreed.contains(tou)) {
                getRequest().setAttribute(Constants.TERMS, tou);
                return true;
            }
        }

        // the user agreed to all necessary terms
        getRequest().setAttribute(Constants.TERMS_AGREED, necessaryTerms);
        return false;
    }
}
