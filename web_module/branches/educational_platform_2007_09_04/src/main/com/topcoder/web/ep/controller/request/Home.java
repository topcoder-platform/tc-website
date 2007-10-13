/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends ShortHibernateProcessor {

    private static Logger log = Logger.getLogger(Home.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            User u  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

            
            // check whether student or professor
            getRequest().setAttribute("user", u);
            if (u.isProfessor()) {
                // since it's a shared processor check if he has permission
                if (!Helper.hasProfessorPermission(getLoggedInUser())) {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }
                log.debug(u.getHandle() + " is a professor");
                getRequest().setAttribute("classrooms", u.getProfessor().getClassrooms());
                setNextPage("/professor/home.jsp");
                setIsNextPageInContext(true);
            } else {
                log.debug(u.getHandle() + " is a student");

                // since it's a shared processor check if he has permission
                if (!Helper.hasStudentPermission(getLoggedInUser())) {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                }

                // look for student's details
                if (u.getCoder() == null) {
                    throw new TCWebException("Could not get user information");
                }
                
                if (u.getCoder().getProfessors().size() > 0) {
                    log.debug("student with registration");
                    // user already registered
                    getRequest().setAttribute("activeClassrooms", u.getCoder().getClassrooms(StudentClassroom.ACTIVE_STATUS));                
                    getRequest().setAttribute("pendingClassrooms", u.getCoder().getClassrooms(StudentClassroom.PENDING_STATUS));                
                    setNextPage("/student/home.jsp");
                    setIsNextPageInContext(true);
                } else {
                    log.debug("first time - self register");
                    setNextPage("/student/selfRegister.jsp");
                    setIsNextPageInContext(true);
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}
