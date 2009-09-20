package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class ViewEditTermsUsers extends Base {
    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        try {
            if (tId!=null) {
                TermsOfUseEntity terms;
                TermsOfUse termsOfUse = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
                terms = termsOfUse.getEntity(Long.parseLong(tId), DBMS.OLTP_DATASOURCE_NAME);
  
                if (terms != null) {
                    getRequest().setAttribute(Constants.TERMS_OF_USE_ID, tId);
                    getRequest().setAttribute(Constants.TERMS_TITLE, terms.getTitle());
                } else {
                    throw new NavigationException("The specified terms of use was not found.");
                }
   
                loadExistingAgreements(tId);
                
                setNextPage("/viewEditTermsUsers.jsp");
                setIsNextPageInContext(true);
            } else {
                throw new NavigationException("Terms of use id was not specified.");
            }
        } catch (Exception e) {
            throw new NavigationException("There was an unexpected error while processing the specified terms of use.", e);
        }
    }

    private void loadExistingAgreements(String id) throws Exception {
        Request r = new Request();
        r.setContentHandle("existing_terms_agreements_list");
        r.setProperty(Constants.TERMS_OF_USE_ID, id);
        getRequest().setAttribute("existing_agreements", getDataAccess().getData(r).get("existing_terms_agreements_list"));
    }


}
