package com.topcoder.web.tc.controller.request;

import java.util.List;
import java.util.ArrayList;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;
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
 * <p>
 *   Version 1.2 Change notes:
 *   <ol>
 *     <li>Updated to add support for terms agreement.</li>
 *   </ol>
 * </p>
 * 
 * @author  dok, TCSASSEMBER, jpy
 * @version  1.2 $Revision$ $Date$
 * Create Date: Jul 24, 2005
 */
public class Terms extends Base {
    protected void businessProcessing() throws Exception {
        // Don't allow anonymous access.
        if (this.getSessionInfo().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
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

        // set the origin page in session
        String origin = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_ORIGIN_PAGE_KEY));
        if (origin != null && origin.trim().length() > 0) {
            getRequest().getSession().setAttribute(Constants.TERMS_ORIGIN_PAGE_KEY, origin);
        }

        List<TermsOfUse> depTerms = termsOfUseDao.getDependencyTermsOfUse(termsId);
        
        boolean isAgree = "true".equalsIgnoreCase(this.getRequest().getParameter(Constants.IS_AGREE));
        if (!isAgree) {
            for (TermsOfUse te : depTerms) {
                if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), te.getTermsOfUseId())) {
                    throw new NavigationException("You can't view this terms of use before you have agreed all the dependencies terms of use");
                }
            }
            getResponse().setStatus(200);
            getResponse().setContentType("text/html");
            getResponse().getWriter().print(termsOfUseDao.getTermsOfUseText(termsId));
            getResponse().flushBuffer();
        } else {
            long userId = getUser().getId();
            // if user already agreed to this term, simply redirect him to the original page
            if (userTermsOfUseDao.hasTermsOfUse(getUser().getId(), termsId)) {
                setNextPage(determineNextPage());
                return;
            }

            // otherwise, show user the terms agreement page
            List<TermsOfUse> unagreedDepTerms = new ArrayList<TermsOfUse>();
            for (TermsOfUse tou : depTerms) {
                if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), tou.getTermsOfUseId())) {
                    unagreedDepTerms.add(tou);
                }
            }
            String prePendingTerms = getRequest().getParameter(Constants.PRE_PENDING_TERMS);
            if (unagreedDepTerms.size() > 0) {
                if (prePendingTerms == null || prePendingTerms.trim().length() == 0) {
                    prePendingTerms = termsId + "";
                } else {
                    prePendingTerms = termsId + "," + prePendingTerms;
                }
            }

            getRequest().setAttribute(Constants.PRE_PENDING_TERMS, prePendingTerms);
            getRequest().setAttribute(Constants.DEPENDENCIES_TERMS_PENDING, unagreedDepTerms);
            getRequest().setAttribute(Constants.TERMS, terms);
            getRequest().setAttribute(Constants.TERMS_CONTENT, termsOfUseDao.getTermsOfUseText(termsId));
            setNextPage(Constants.AGREE_TO_TERMS_PAGE);
            setIsNextPageInContext(true);
        }
    }

    /**
     * Determines the next page.
     */
    private String determineNextPage() {
        String nextPage = (String) getRequest().getSession().getAttribute(Constants.TERMS_ORIGIN_PAGE_KEY);
        if (nextPage == null) {
            nextPage = Constants.AGREE_TO_TERMS_DEFAULT_PAGE;
        }
        return nextPage;
    }

}
