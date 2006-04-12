package com.topcoder.web.tc.controller.request.tournament;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 1, 2005
 */
public class TCO05VerisignTermsAgree extends TCO05SponsorTermsAgree {
    protected String getSuccessPage() {
        return "/tournaments/tco05/spon_ver_reg_success.jsp";
    }

    protected String getStartPage() {
        return "/tournaments/tco05/spon_ver_reg.jsp";
    }

}
