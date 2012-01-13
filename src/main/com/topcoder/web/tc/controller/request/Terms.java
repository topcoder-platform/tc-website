package com.topcoder.web.tc.controller.request;

import java.util.List;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 *   Version 1.1 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated to use Terms of Use DAO component instead of Terms of Use EJB.</li>
 *     <li>Added permission checking, if user has no permission to view the term, error page will be displayed.</li>
 *   </ol>
 * </p>
 * 
 * @author  dok, TCSASSEMBER
 * @version  1.1 $Revision$ $Date$
 * Create Date: Jul 24, 2005
 */
public class Terms extends Base {
    protected void businessProcessing() throws Exception {
        // Don't allow anonymous access.
        if (this.getSessionInfo().isAnonymous()) {
            throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
        }

        long termsId = Long.parseLong(StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID)));
        
        ConfigurationFileManager cm = new ConfigurationFileManager(Constants.CONFIGURATION_FILE);
        TermsOfUseDao termsOfUseDao = new TermsOfUseDaoImpl(
                cm.getConfiguration(Constants.TERMS_OF_USE_DAO_NS).getChild(Constants.TERMS_OF_USE_DAO_NS));
        UserTermsOfUseDao userTermsOfUseDao = new UserTermsOfUseDaoImpl(
                cm.getConfiguration(Constants.USER_TERMS_OF_USE_DAO_NS).getChild(Constants.USER_TERMS_OF_USE_DAO_NS));
        
        TermsOfUse terms = termsOfUseDao.getTermsOfUse(termsId);
        if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), termsId)
                && terms.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
            // user has not agreed to the term and the term is non agreeable, show error page
            throw new NavigationException("The term is not agreeable");
        }
        
        List<TermsOfUse> depTerms = termsOfUseDao.getDependencyTermsOfUse(termsId);
        for (TermsOfUse te : depTerms) {
            if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), te.getTermsOfUseId())) {
                throw new NavigationException("You can't view this terms of use before you have agreed all the dependencies terms of use");
            }
        }
        
        getResponse().setStatus(200);
        getResponse().setContentType("text/html");
        getResponse().getWriter().print(termsOfUseDao.getTermsOfUseText(termsId));
        getResponse().flushBuffer();
    }
}
