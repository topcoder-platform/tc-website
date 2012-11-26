/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.model.TermsOfUse;
import com.cronos.termsofuse.model.TermsOfUseAgreeabilityType;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;

/**
 * <p>This class processes update/create requests for terms of use.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added support for new columns in terms_of_use table.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated to use the Terms of Use DAO component instead of Terms of Use EJB.</li>
 *     <li>Updated method {@link #businessProcessing()} to create/update terms of use dependencies.</li>
 *     <li>Updated method {@link #businessProcessing()} to update the terms agree-ability type.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, TCSASSEMBER
 * @version 1.2
 */
public class UpdateTerms extends EditTerms {

    /**
     * This method will create/update the specified terms of use after validation.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.admin.controller.request.EditTerms#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        String termsText = getRequest().getParameter(Constants.TERMS);
        String ttId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_TYPE_ID));

        String termsTitle = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_TITLE));
        String tatId  = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_AGREE_TYPE_ID));
        String termsUrl = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_URL));
        String[] depTermsIds = getRequest().getParameterValues(Constants.DEPENDENCIES_TERMS_IDS);
        if (depTermsIds == null) {
            depTermsIds = new String[0];
        }

        TransactionManager tm = null;
        try {

            if (!valid(ttId, termsTitle, tatId, termsUrl)) {
                loadTermsTypeList();
                loadTermsAgreeTypeList();
                loadTermsDependenciesList(tId, depTermsIds);
                setDefault(Constants.TERMS_OF_USE_TYPE_ID, ttId);
                setDefault(Constants.TERMS_OF_USE_ID, tId);
                setDefault(Constants.TERMS, termsText);
                setDefault(Constants.TERMS_TITLE, termsTitle);
                setDefault(Constants.TERMS_AGREE_TYPE_ID, tatId);
                setDefault(Constants.TERMS_URL, termsUrl);
                setNextPage("/editTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                TermsOfUseDao termsOfUseDao = getTermsOfUseDao();
                TermsOfUse terms;
                
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                if (StringUtils.checkNull(tId).equals("")) {
                    // create
                    terms = new TermsOfUse();
                    TermsOfUseAgreeabilityType tat = new TermsOfUseAgreeabilityType();
                    tat.setTermsOfUseAgreeabilityTypeId(Integer.parseInt(tatId));
                    terms.setAgreeabilityType(tat);
                    terms.setTermsOfUseTypeId(Integer.parseInt(ttId));
                    terms.setTitle(termsTitle);
                    terms.setUrl(termsUrl);
                    termsOfUseDao.createTermsOfUse(terms, termsText);
                } else {
                    // update
                    terms = termsOfUseDao.getTermsOfUse(Long.parseLong(tId));
                    terms.getAgreeabilityType().setTermsOfUseAgreeabilityTypeId(Integer.parseInt(tatId));
                    terms.setTermsOfUseTypeId(Integer.parseInt(ttId));
                    terms.setTitle(termsTitle);
                    terms.setUrl(termsUrl);
                    termsOfUseDao.updateTermsOfUse(terms);
                    termsOfUseDao.setTermsOfUseText(terms.getTermsOfUseId(), termsText);
                }
                
                // update dependencies
                termsOfUseDao.deleteAllDependencyRelationshipsForDependent(terms.getTermsOfUseId());
                if (depTermsIds != null) {
                    for (String depId : depTermsIds) {
                        termsOfUseDao.createDependencyRelationship(terms.getTermsOfUseId(), Long.parseLong(depId));
                    }
                }
                tm.commit();

                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?module=EditTerms&" + Constants.TERMS_OF_USE_ID + "=" +
                        terms.getTermsOfUseId());
                setIsNextPageInContext(false);
            }
        } catch (Exception e) {
            if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE ||
                    tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                tm.rollback();
            }
            throw e;
        }
    }

    /**
     * This method validates the terms of use data
     *
     * @param ttId the terms type id field content
     * @param termsTitle the terms title field content
     * @param tatId the ID of the terms agree-ability type
     * @param termsUrl the terms url field content
     *
     * @return true if the form data is valid
     *
     * @since 1.1
     */
    private boolean valid(String ttId, String termsTitle, String tatId, String termsUrl) {
        if (ttId.equals("")) {
            addError(Constants.TERMS_OF_USE_TYPE_ID, "You must choose a terms of use type");
        }

        if (termsTitle.length() == 0) {
            addError(Constants.TERMS_TITLE, "You must enter a terms title");
        }

        if (tatId.equals("")) {
            addError(Constants.TERMS_AGREE_TYPE_ID, "You must choose a terms of use agreeability type");
        }
        if (tatId.equals(String.valueOf(Constants.NON_ELEC_AGREEABLE_TYPE)) && termsUrl.length() == 0) {
            addError(Constants.TERMS_URL, "If the terms is not electronically signable you must provide a terms URL");
        }

        return !hasErrors();
    }
}
