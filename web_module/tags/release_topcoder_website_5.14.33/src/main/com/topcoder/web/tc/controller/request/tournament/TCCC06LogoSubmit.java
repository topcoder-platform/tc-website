package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.ApplicationServer;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 2, 2006
 */
public class TCCC06LogoSubmit extends BaseLogoSubmit {

    static final int PATH_ID =22;
    static final int IMAGE_TYPE_ID = 17;

    protected int getPathId() {
        return PATH_ID;
    }

    protected int getImageTypeId() {
        return IMAGE_TYPE_ID;
    }

    protected int getTermsId() {
        return Constants.TCCC06_LOGO_TERMS_ID;
    }

    protected String getSuccessPage() {
        return "/tournaments/tccc06/logo_success.jsp";
    }

    protected String getTermsProcessor() {
        return "TCCC06LogoTerms";
    }

    public int getMaxSubmissions() {
        return 3;
    }


    protected String getPath() {
        return ApplicationServer.BASE_DIR + "images/tccc06logo/";
    }
}


