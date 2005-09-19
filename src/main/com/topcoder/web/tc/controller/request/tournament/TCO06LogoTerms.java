package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.coder.CoderImage;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.DBMS;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Sept 19, 2005
 */
public class TCO06LogoTerms extends Base {

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            UserTermsOfUse ut = (UserTermsOfUse)createEJB(getInitialContext(), UserTermsOfUse.class);
            if (ut.hasTermsOfUse(getUser().getId(), Constants.TCO06_LOGO_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME)) {
                CoderImage coderImage = (CoderImage)createEJB(getInitialContext(), CoderImage.class);
                getRequest().setAttribute("submissionCount",
                        coderImage.getImages(getUser().getId(), TCO06LogoSubmit.IMAGE_TYPE, DBMS.OLTP_DATASOURCE_NAME));
                setNextPage("/tournaments/tco06/logo_submit.jsp");
                setIsNextPageInContext(true);
            } else {
                TermsOfUse terms = (TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class);
                getRequest().setAttribute("terms", terms.getText(Constants.TCO06_LOGO_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME));
                setNextPage("/tournaments/tco06/logo_accept.jsp");
                setIsNextPageInContext(true);
            }
        }
    }

}
