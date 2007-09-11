/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.User;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;
import com.topcoder.web.ep.controller.request.Home;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelfRegister extends Base {

    private static Logger log = Logger.getLogger(Home.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Self registration called...");
        if (userIdentified()) {
            log.debug("User identified - " + getUser().getUserName());
            
            // prepare stuff for the long transaction
            clearSession();

            //set up the user object we're gonna use
            User u = getActiveUser();
            if (u == null) {
                u = new User();
                setActiveUser(u);
            }
            
            setNextPage("/selectSchool.jsp");
            setIsNextPageInContext(true);            
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
