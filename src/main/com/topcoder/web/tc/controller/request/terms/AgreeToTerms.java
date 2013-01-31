/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.terms;

import java.util.List;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;

/**
 * This class is the controller for terms agreement.
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class AgreeToTerms extends Base {
    protected void businessProcessing() throws Exception {
        // Don't allow anonymous access.
        if (this.getSessionInfo().isAnonymous()) {
            throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
        }
        long userId = getLoggedInUser().getId();

        long termsOfUseId = Long.parseLong(StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID)));
        
        ConfigurationFileManager cm = new ConfigurationFileManager(Constants.CONFIGURATION_FILE);
        TermsOfUseDao termsOfUseDao = new TermsOfUseDaoImpl(
                cm.getConfiguration(Constants.TERMS_OF_USE_DAO_NS).getChild(Constants.TERMS_OF_USE_DAO_NS));
        UserTermsOfUseDao userTermsOfUseDao = new UserTermsOfUseDaoImpl(
                cm.getConfiguration(Constants.USER_TERMS_OF_USE_DAO_NS).getChild(Constants.USER_TERMS_OF_USE_DAO_NS));
        
        TermsOfUse terms = termsOfUseDao.getTermsOfUse(termsOfUseId);
        if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), termsOfUseId)
                && terms.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
            throw new NavigationException("The term is not agreeable");
        }
        if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), termsOfUseId)
                && terms.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() != Constants.ELEC_AGREEABLE_TERMS_TYPE_ID) {
            throw new NavigationException("The term is not electronically agreeable");
        }
        
        List<TermsOfUse> depTerms = termsOfUseDao.getDependencyTermsOfUse(termsOfUseId);
        for (TermsOfUse te : depTerms) {
            if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), te.getTermsOfUseId())) {
                throw new NavigationException("You can't agree to this terms of use before you have agreed to all the dependencies terms of use");
            }
        }

        if (!"".equals(termsOfUseId)) {
            boolean agreed = "on".equals(getRequest().getParameter(Constants.TERMS_AGREE));
            if (agreed) {
                System.out.println("User " + userId + " agreed to terms " + termsOfUseId);
                if (userTermsOfUseDao.hasTermsOfUseBan(userId, termsOfUseId)) {
                    addError(Constants.TERMS_AGREE, "Sorry, you can not agree to this terms of use.");
                } else {
                    if (!userTermsOfUseDao.hasTermsOfUse(getUser().getId(), termsOfUseId)) {
                        userTermsOfUseDao.createUserTermsOfUse(userId, termsOfUseId);
                    }
                    if (hasPrePendingTerm()) {
                        return;
                    } else {
                        setNextPage(determineNextPage());
                        return;
                    }
                }
            } else {
                addError(Constants.TERMS_AGREE, "You must agree to the terms in order to proceed.");
            }            
        }
    }

    private boolean hasPrePendingTerm() {
        String prePendingTerms = getRequest().getParameter(Constants.PRE_PENDING_TERMS);
        if (prePendingTerms == null || prePendingTerms.trim().length() == 0) {
            // no pre-pending term
            return false;
        }
        
        String[] terms = prePendingTerms.split(",");
        if (terms.length == 0) {
            return false;
        }
        long term = Long.valueOf(terms[terms.length - 1]);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < terms.length - 1; i++) {
            if (i > 0) {
                sb.append(",");
            }
            sb.append(terms[i]);
        }
        getRequest().setAttribute(Constants.PRE_PENDING_TERMS, sb.toString());
        
        // redirect to agree the pre-pending term
        StringBuilder url = new StringBuilder();
        url.append("/tc?").append(Constants.MODULE_KEY).append("=Terms");
        url.append("&").append(Constants.TERMS_OF_USE_ID).append("=").append(term);
        url.append("&").append(Constants.PRE_PENDING_TERMS).append("=").append(sb.toString());
        url.append("&").append(Constants.IS_AGREE).append("=true");
        setNextPage(url.toString());
        setIsNextPageInContext(false);
        
        return true;
    }

    private String determineNextPage() {
        String nextPage = (String) getRequest().getSession().getAttribute(Constants.TERMS_ORIGIN_PAGE_KEY);
        if (nextPage == null) {
            nextPage = Constants.AGREE_TO_TERMS_DEFAULT_PAGE;
        }
        return nextPage;
    }

}
