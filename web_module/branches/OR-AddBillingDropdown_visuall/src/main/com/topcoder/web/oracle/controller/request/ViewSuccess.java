package com.topcoder.web.oracle.controller.request;

import com.topcoder.web.common.ShortHibernateProcessor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2007
 */
public class ViewSuccess extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        //figure out if there are any room in the round the the user hasn't already done
        //if so, give them a link to be assigned
        //else don't give them a link
    }
}
