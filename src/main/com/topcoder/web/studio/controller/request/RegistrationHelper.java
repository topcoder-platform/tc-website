/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Set;

import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.comp.ResourceRole;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;

/**
 * <p>This helper class provides common functionality among registration processors.</p>
 *
 * <p>
 *   Version 1.0 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added generic terms of use processing.</li>
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.0
 * @since Configurable Contest Terms-Studio Release Assembly v1.0
 */
public class RegistrationHelper {

    /**
     * An <code>Integer[]</code> containing resource role ids for a submitter.
     */
    protected static final Integer[] REGISTRANT_ROLE_IDS = new Integer[] {ResourceRole.SUBMITTER_RESOURCE_ROLE_ID};

    /**
     * <p>This helper method provides terms of use processing for Studio contest registration requests.</p>
     *
     * <p>The code will go through all necessary terms of use for this particular contest and resource roles and
     * verify the user has already agreed to them. If it finds a terms of use the user has not agreed to yet, it will
     * add it to the request so that it is presented as corresponds. If all terms of use are correct, the list is
     * added to the request so it can showed in the confirmation page before actual registration.</p>
     *
     * <p>Note: Even though Studio will only use Submitter role for now, it's likely to change in the future to
     * support reviewer registration or any other kind of resources so it's important to prepare for that change.
     * This is why this method accepts an array of roles and not just a single role id.</p>
     *
     * @param request the request being processed
     * @param contest the contest the user is registering to
     * @param user the user applying to this contest
     * @param roleIds an array of role ids corresponding to the user
     *
     * @throws IllegalArgumentException if any of the arguments is null (including contest.id) or roleIds is empty
     *
     * @return true if there are pending terms of use to agree to.
     */
    protected static boolean processTermsOfUse(TCRequest request, Contest contest, User user, Integer[] roleIds) {
        if (request == null) {
            throw new IllegalArgumentException("request cannot be null");
        }

        if (contest == null || contest.getId() == null) {
            throw new IllegalArgumentException("contest.id cannot be null");
        }

        if (user == null) {
            throw new IllegalArgumentException("user cannot be null");
        }

        if (roleIds == null || roleIds.length == 0) {
            throw new IllegalArgumentException("roleIds cannot be null or empty");
        }

        Set<TermsOfUse> necessaryTerms =
            StudioDAOUtil.getFactory().getContestDAO().findNecessaryTerms(contest.getId(), roleIds);
        Set<TermsOfUse> termsAgreed = user.getTerms();

        // validate the user has agreed to the necessary terms of use
        for (TermsOfUse tou : necessaryTerms) {
            if (!termsAgreed.contains(tou)) {
                request.setAttribute(Constants.TERMS, tou);
                return true;
            }
        }

        // the user agreed to all necessary terms
        request.setAttribute(Constants.TERMS_AGREED, necessaryTerms);
        return false;
    }
}
