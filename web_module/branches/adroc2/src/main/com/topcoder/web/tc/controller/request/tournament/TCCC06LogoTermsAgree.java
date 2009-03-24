package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 2, 2006
 */
public class TCCC06LogoTermsAgree extends BaseLogoTermsAgree {
    protected int getTermsId() {
        return Constants.TCCC06_LOGO_TERMS_ID;
    }

    protected int getImageTypeId() {
        return TCCC06LogoSubmit.IMAGE_TYPE_ID;
    }

    protected void setNextPage() {
        setNextPage("/tournaments/tccc06/logo_submit.jsp");
    }
}
