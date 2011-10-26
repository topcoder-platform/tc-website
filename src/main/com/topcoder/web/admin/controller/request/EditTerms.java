/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;

/**
 * <p>This class shows terms of use details and allow edition.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added support for new columns in terms_of_use table.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class EditTerms extends Base {

    /**
     * This method will retrieve the existing terms of use (if needed) and present the edition form.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        if (tId!=null) {
            TermsOfUse termsOfUse = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
            TermsOfUseEntity terms = termsOfUse.getEntity(Long.parseLong(tId), DBMS.OLTP_DATASOURCE_NAME);

            if (terms != null) {
                setDefault(Constants.TERMS_OF_USE_ID, tId);
                setDefault(Constants.TERMS_OF_USE_TYPE_ID, terms.getTermsOfUseTypeId());
                setDefault(Constants.TERMS, terms.getTermsText());
                setDefault(Constants.TERMS_TITLE, terms.getTitle());
                setDefault(Constants.TERMS_ELECTRONICALLY_SIGNABLE, terms.getElectronicallySignable().equals(1));
                setDefault(Constants.TERMS_URL, terms.getUrl());
            } else {
                addError(Constants.TERMS_OF_USE_TYPE_ID, "Could not retrieve the specified terms of use.");
            }

        }
        loadTermsTypeList();
        setNextPage("/editTerms.jsp");
        setIsNextPageInContext(true);
    }

    protected void loadTermsTypeList() throws Exception {
        Request r = new Request();
        r.setContentHandle("terms_of_use_type_list");
        getRequest().setAttribute("terms_of_use_type_list", getDataAccess().getData(r).get("terms_of_use_type_list"));
    }

}
