/*
 * Copyright (C) 2006-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

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
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;

/**
 * <p>A controller for handling the requests for viewing the terms of use which user has accepted.</p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Re-factored the logic for terms processing.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (Release Assembly - TopCoder Studio CCA Integration) change notes:
 *   <ol>
 *     <li>Updated {@link #dbProcessing()} to check permission and use the new term_of_use component
 *     instead of EJB.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, TCSDEVELOPER
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public class Terms extends ShortHibernateProcessor {

    /**
     * <p>Implements the business logic for request processing.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        // Don't allow anonymous access.
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        Integer termsId = new Integer(StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID)));
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
