package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 4, 2005
 */
public class TimeOut extends Base {

    protected void techAssessProcessing() throws Exception {
        throw new NavigationException("Sorry, your request has timed out.");
    }

}
