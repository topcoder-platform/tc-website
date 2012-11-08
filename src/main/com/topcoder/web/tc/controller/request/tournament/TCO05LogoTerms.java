package com.topcoder.web.tc.controller.request.tournament;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.shared.security.SimpleResource;

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
            UserTermsOfUseDao ut = TermsOfUseUtil.getUserTermsOfUseDao();
            if (ut.hasTermsOfUse(getUser().getId(), Constants.TCO05_LOGO_TERMS_ID)) {
                setNextPage("/tournaments/tco05/logo_submit.jsp");
                setIsNextPageInContext(true);
            } else {
                TermsOfUseDao terms = TermsOfUseUtil.getTermsOfUseDao();
                getRequest().setAttribute("terms", terms.getTermsOfUseText(Constants.TCO05_LOGO_TERMS_ID));
                setNextPage("/tournaments/tco05/logo_accept.jsp");
                setIsNextPageInContext(true);
            }
        }
    }

}
