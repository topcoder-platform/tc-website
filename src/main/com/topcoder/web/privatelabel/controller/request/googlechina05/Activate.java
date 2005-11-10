package com.topcoder.web.privatelabel.controller.request.googlechina05;

import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.shared.util.TCResourceBundle;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        TCResourceBundle bundle = new TCResourceBundle("PrivateLabel", regInfo.getLocale());
        setNextPage(bundle.getProperty("google_china_05_activation_page"));
        setIsNextPageInContext(true);
    }
}

