/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestStatus;

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
 * @author dok, pulky
 * @version 1.1
 */
public class ViewRegistration extends ShortHibernateProcessor {

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
                Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(cid);
                User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());

                if (ContestStatus.ACTIVE.equals(contest.getStatus().getId())) {
                    Date now = new Date();
                    if (contest.getStartTime().before(now) && contest.getEndTime().after(now)) {
                        setDefault(Constants.CONTEST_ID, contest.getId().toString());
                        getRequest().setAttribute("contest", contest);
                    } else {
                        throw new NavigationException("Inactive contest specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }

                if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                    getRequest().setAttribute("has_global_ad", PactsServicesLocator.getService().
                        hasGlobalAD(getUser().getId()));
                }

                // process terms of use
                RegistrationHelper.processTermsOfUse(getRequest(), contest, u, RegistrationHelper.REGISTRANT_ROLE_IDS);

                setNextPage("/contestReg.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
