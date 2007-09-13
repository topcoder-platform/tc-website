/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelfRegisterSubmit extends Base {

    private static Logger log = Logger.getLogger(SelfRegisterSubmit.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("Self register submit called...");
            if (getActiveUser() == null) {
                log.debug("user is null");
            } else if (getActiveUser().isNew()) {
                log.debug("user is new");
            } else {
                log.debug("handle : " + getActiveUser().getHandle());
                log.debug("name: " + getActiveUser().getFirstName() + " " + getActiveUser().getLastName());
            }
        }
        if (getActiveUser() == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
        } else if (userLoggedIn()) {
            
            User u = getActiveUser();
            
            List<Classroom> classrooms = getSelectedClassrooms();
            
            u.getCoder().addClassrooms(classrooms);

            getFactory().getUserDAO().saveOrUpdate(u);

            markForCommit();
            
            getRequest().setAttribute("classrooms", u.getCoder().getClassrooms());                
            getRequest().setAttribute("user", u);
            setNextPage("/home.jsp");
            setIsNextPageInContext(true);            
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
