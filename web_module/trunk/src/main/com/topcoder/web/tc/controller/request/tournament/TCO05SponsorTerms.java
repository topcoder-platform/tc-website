package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Static;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.DBMS;

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
            TermsOfUse terms = (TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class);
            getRequest().setAttribute("terms", terms.getText(Constants.TCO05_SPONSOR_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME));
            super.businessProcessing();
        }

    }

}
