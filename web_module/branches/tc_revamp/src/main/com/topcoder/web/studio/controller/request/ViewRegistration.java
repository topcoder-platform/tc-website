/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.ProjectPhase;

/**
 * <p>This class will process a contest registration application request.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new terms of use processing.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Re-platforming Studio Release 2 Assembly) Change notes:
 *   <ol>
 *     <li>Updated {@link #dbProcessing()} method to perform registration over contests hosted in
 *     <code>tcs_catalog</code> instead of <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, isv, TCSASSEMBER
 * @version 1.3
 */
public class ViewRegistration extends ShortHibernateProcessor {
    
    /**
     * <p>Constructs new <code>ViewRegistration</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.2
     */
    public ViewRegistration() {
    }

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {

        if (userLoggedIn()) {
            String contestId = getRequest().getParameter(Constants.CONTEST_ID);
            if ("".equals(StringUtils.checkNull(contestId))) {
                throw new NavigationException("No contest specified");
            } else {
                Long cid;
                try {
                    cid = new Long(contestId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid contest specified");
                }
                
                DAOFactory factory = DAOUtil.getFactory();
        
                // Check project for presence
                Project contest = factory.getProjectDAO().find(cid.intValue());
                if (contest == null) {
                    throw new NavigationException("The specified project doesn't exist");
                }

                long userId = getUser().getId();
                User u = factory.getUserDAO().find(userId);

                if (Project.STATUS_ACTIVE.equals(contest.getStatusId())) {
                    ProjectPhase registrationPhase = contest.getPhase(1);
                    if (registrationPhase.getStatusId() == 2) {
                        setDefault(Constants.CONTEST_ID, contest.getId().toString());
                        getRequest().setAttribute("contest", contest);
                    } else {
                        throw new NavigationException("Registration phase is not active");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }

                if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                    getRequest().setAttribute("has_global_ad", PactsServicesLocator.getService().hasGlobalAD(userId));
                }

                // process terms of use
                RegistrationHelper.processTermsOfUse(getRequest(), contest.getId().longValue(), u, 
                                                     RegistrationHelper.REGISTRANT_ROLE_IDS);

                setNextPage("/contestReg.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
