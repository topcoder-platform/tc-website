/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.admin.AdminConstants;

/**
 * <p>A controller for servicing the requests for viewing the list of users who have already accepted the requested
 * terms of use.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Configurable Contest Terms Release Assembly v2.0
 */
public class TermsUsersList extends Base {

    /**
     * <p>Constructs new <code>TermsUsersList</code> instance. This implementation does nothing.</p>
     */
    public TermsUsersList() {
    }

    /**
     * <p>Performs the prociessing of the request. Gets the lists of users who have already agreed to requested terms of
     * use and binds it to request. The request is forwarded to <code>Terms Of Use Users List</code> page.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {
        // Get the terms of use details from the DB
        String tuid = getRequest().getParameter(AdminConstants.TERMS_OF_USE_ID);
        TermsOfUse termsOfUse = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
        TermsOfUseEntity terms = termsOfUse.getEntity(Long.parseLong(tuid), DBMS.OLTP_DATASOURCE_NAME);

        // Raise an error if terms of use are not found
        if (terms != null) {
            getRequest().setAttribute(Constants.TERMS, terms);
            setTermsUsersList(tuid);
        } else {
            addError(com.topcoder.web.admin.Constants.TERMS_OF_USE_TYPE_ID,
                     "Could not retrieve the specified terms of use: " + tuid);
        }
        
        setNextPage("/termsUsersList.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * <p>Gets the list of terms of use users and binds it to request.</p>
     * 
     * @param termsOfUseId a <code>String</code> providing the ID of terms of use.
     * @throws Exception if an unexpected error occurs.
     */
    protected void setTermsUsersList(String termsOfUseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("terms_users_list");
        r.setProperty(Constants.TERMS_OF_USE_ID, termsOfUseId);
        getRequest().setAttribute("terms_users_list", getDataAccess().getData(r).get("terms_users_list"));
    }
}
