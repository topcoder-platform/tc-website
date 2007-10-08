/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditAssignmentConfirm extends Base {

    private static Logger log = Logger.getLogger(EditAssignmentConfirm.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Edit assignment called...");

        if (userLoggedIn()) {
            if (!"POST".equals(getRequest().getMethod())) {
                throw new TCWebException("Cannot get here via get");
            } else {
                if (getActiveUser() == null) {
                    throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
                } else if (userLoggedIn()) {
                    // got a response, validate. 
                    // Todo: check if we have everything we need in the session and then go to the confirmation page 
                    // for example, at least one selected component
                    
                    setNextPage("/professor/editAssignmentConfirm.jsp");
                    setIsNextPageInContext(true);
                } else {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
