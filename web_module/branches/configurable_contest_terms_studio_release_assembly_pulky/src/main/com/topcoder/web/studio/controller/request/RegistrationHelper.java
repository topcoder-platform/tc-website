/*
 * Copyright (c) 2001-2009 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Set;

import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;

/**
 * Copyright (c) 2001-2009 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Aug 14, 2009
 */
public class RegistrationHelper {

    /**
     * Constant containing submitter role id
     *
     * @since
     */
    protected static final Integer[] SUBMITTER_ROLE_IDS = new Integer[] {1};

    public static boolean processTermsOfUse(TCRequest request, Contest c, User u, Integer[] submitterRoleIds) {
        // validate that registrant has agreed to the necessary terms of use
        Set<TermsOfUse> necessaryTerms = 
            StudioDAOUtil.getFactory().getContestDAO().findNecessaryTerms(c.getId(), submitterRoleIds);
        
        Set<TermsOfUse> termsAgreed = u.getTerms();

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
