package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.DBMS;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public class TCO05LogoTerms extends Base {

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            UserTermsOfUse ut = (UserTermsOfUse)createEJB(getInitialContext(), UserTermsOfUse.class);
            if (ut.hasTermsOfUse(getUser().getId(), Constants.TCO05_LOGO_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME)) {
                setNextPage("/tournaments/tco05/logo_submit.jsp");
                setIsNextPageInContext(true);
            } else {
                TermsOfUse terms = (TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class);
                getRequest().setAttribute("terms", terms.getText(Constants.TCO05_LOGO_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME));
                setNextPage("/tournaments/tco05/logo_accept.jsp");
                setIsNextPageInContext(true);
            }
        }
    }

}
