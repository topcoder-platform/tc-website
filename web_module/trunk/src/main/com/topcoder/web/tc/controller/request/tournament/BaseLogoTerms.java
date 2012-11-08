package com.topcoder.web.tc.controller.request.tournament;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.web.ejb.coder.CoderImage;
import com.topcoder.web.tc.controller.request.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 2, 2006
 */
abstract class BaseLogoTerms extends Base {

    protected void businessProcessing() throws Exception {
        if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getLoggedInUser(), new SimpleResource(this.getClass().getName()));
        } else {
            UserTermsOfUseDao ut = TermsOfUseUtil.getUserTermsOfUseDao();
            if (ut.hasTermsOfUse(getUser().getId(), getTermsId())) {
                CoderImage coderImage = (CoderImage) createEJB(getInitialContext(), CoderImage.class);
                getRequest().setAttribute("submissionCount",
                        new Integer(coderImage.getImages(getUser().getId(), getImageTypeId(), DBMS.OLTP_DATASOURCE_NAME).size()));
                setNextPage(true);
                setIsNextPageInContext(true);
            } else {
                TermsOfUseDao terms = TermsOfUseUtil.getTermsOfUseDao();
                getRequest().setAttribute("terms", terms.getTermsOfUseText(getTermsId()));
                setNextPage(false);
                setIsNextPageInContext(true);
            }
        }
    }

    protected abstract int getTermsId();

    protected abstract int getImageTypeId();

    protected abstract void setNextPage(boolean hasTerms);


}