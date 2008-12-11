package com.topcoder.web.tc.controller.request.tournament;

/**
 * @author  dok
 * @version  $Revision: 43007 $ $Date$
 * Create Date: Feb 6, 2006
 */
public class TCO06VerisignTermsAgree extends TCO06SponsorTermsAgree {
    protected String getSuccessPage() {
        return "/tournaments/tco06/spon_ver_reg_success.jsp";
    }

    protected String getStartPage() {
        return "/tournaments/tco06/spon_ver_reg.jsp";
    }

}
