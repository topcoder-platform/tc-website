package com.topcoder.web.tc.controller.request.tournament;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TermsOfUseUtil;
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
            UserTermsOfUseDao ut = TermsOfUseUtil.getUserTermsOfUseDao();
            if (ut.hasTermsOfUse(getUser().getId(), Constants.TCO06_LOGO_TERMS_ID)) {
                CoderImage coderImage = (CoderImage)createEJB(getInitialContext(), CoderImage.class);
                getRequest().setAttribute("submissionCount",
                        new Integer(coderImage.getImages(getUser().getId(), TCO06LogoSubmit.IMAGE_TYPE, DBMS.OLTP_DATASOURCE_NAME).size()));
                setNextPage("/tournaments/tco06/logo_submit.jsp");
                setIsNextPageInContext(true);
            } else {
                TermsOfUseDao terms = TermsOfUseUtil.getTermsOfUseDao();
                getRequest().setAttribute("terms", terms.getTermsOfUseText(Constants.TCO06_LOGO_TERMS_ID));
                setNextPage("/tournaments/tco06/logo_accept.jsp");
                setIsNextPageInContext(true);
            }
        }
    }

}
