package com.topcoder.web.admin.controller.request;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class EditTerms extends Base {

    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        if (tId!=null) {
            TermsOfUse termsOfUse = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
            setDefault(Constants.TERMS_OF_USE_ID, tId);
            setDefault(Constants.TERMS_OF_USE_TYPE_ID,
                    String.valueOf(termsOfUse.getTermsOfUseTypeId(Long.parseLong(tId), DBMS.OLTP_DATASOURCE_NAME)));
            setDefault("terms", termsOfUse.getText(Long.parseLong(tId), DBMS.OLTP_DATASOURCE_NAME));
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
