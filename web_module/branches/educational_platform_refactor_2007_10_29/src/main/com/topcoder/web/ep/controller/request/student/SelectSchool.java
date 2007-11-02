/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ep.controller.request.LongBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelectSchool extends LongBase {

    private static Logger log = Logger.getLogger(SelectSchool.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongBase#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("User identified - " + getUser().getUserName());

        setNextPage("/student/selectSchool.jsp");
        setIsNextPageInContext(true);
    }
}
