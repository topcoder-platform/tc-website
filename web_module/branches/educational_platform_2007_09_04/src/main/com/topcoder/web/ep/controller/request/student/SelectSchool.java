/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelectSchool extends Base {

    private static Logger log = Logger.getLogger(SelectSchool.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            log.debug("User identified - " + getUser().getUserName());
    
            // prepare stuff for the long transaction
            clearSession();
    
            if (getActiveUser().isProfessor()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
            
            setNextPage("/student/selectSchool.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
