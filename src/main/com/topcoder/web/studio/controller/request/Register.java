/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
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
 * <p>This class will process a contest registration request.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new terms of use processing.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class Register extends ShortHibernateProcessor {

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        TCRequest request = getRequest();

        if (userLoggedIn()) {
            if ("POST".equals(request.getMethod())) {
                Long contestId;
                try {
                    contestId = new Long(request.getParameter(Constants.CONTEST_ID));
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
  //              log.debug("Coder type: " + u.getCoder().getCoderType().getDescription());
                log.debug("Bother: " + bother);

                if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                    String termsOfUseId = StringUtils.checkNull(request.getParameter(Constants.TERMS_OF_USE_ID));

                    if (!"".equals(termsOfUseId)) {
                        if ("on".equals(request.getParameter(Constants.TERMS_AGREE))) {
                            log.debug("agreed to terms");
                            // add user terms of use record
                            TermsOfUse tou = factory.getTermsOfUse().find(Integer.parseInt(termsOfUseId));
                            u.addTerms(tou);
                        } else {
                            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                        }

                        // process terms of use
                        RegistrationHelper.processTermsOfUse(request, c, u, RegistrationHelper.REGISTRANT_ROLE_IDS);
                        backToTermsResponse(request, c);
                        return;
                    } else {
                        // make sure user don't have pending terms of use (he could get here faking the URL)
                        if (RegistrationHelper.processTermsOfUse(request, c, u, RegistrationHelper.REGISTRANT_ROLE_IDS)) {
                            backToTermsResponse(request, c);
                            return;
                        }

                        //if contest is part of an event, and user is registered for the event, and
                        //they are overriding the warning then allow them to register
                        boolean isApproved = false;

                        if (bother && c.getEvent() != null) {
                            log.debug("event not null");
                            if (factory.getEventRegistrationDAO().find(getUser().getId(), c.getEvent().getId()) == null) {
                                log.debug("user not registered");
                                if (String.valueOf(true).equals(request.getParameter(Constants.REG_CONFIRM))) {
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

                            // This is done only to keep compatibility, the use of
                            // ContestRegistration's terms of use should be removed ASAP.
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

    /**
     * Private helper method to prepare request to go back to the terms page
     *
     * @param request the request being processed
     * @param contest the inquired contest
     *
     * @since 1.1
     */
    private void backToTermsResponse(TCRequest request, Contest contest) {
        setDefault(Constants.CONTEST_ID, contest.getId().toString());
        request.setAttribute("contest", contest);
        setNextPage("/contestReg.jsp");
        setIsNextPageInContext(true);
    }
}
