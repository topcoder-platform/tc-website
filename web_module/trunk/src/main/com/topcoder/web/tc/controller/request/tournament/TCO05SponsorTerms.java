package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Static;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.shared.security.SimpleResource;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 24, 2005
 */
public class TCO05SponsorTerms extends Static {

    protected void businessProcessing() throws Exception {
        //load up the terms
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            UserTermsOfUse ut = (UserTermsOfUse)createEJB(getInitialContext(), UserTermsOfUse.class);
            super.businessProcessing();
        }

    }

}
