package com.topcoder.web.privatelabel.controller.request.googleindia06;

import com.topcoder.web.privatelabel.controller.request.BaseActivate;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(getBundle().getProperty("google_india_06_activation_page"));
        setIsNextPageInContext(true);
    }
}
