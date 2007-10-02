/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelfRegisterConfirm extends Base {

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        User u = getActiveUser(); 
        if (u == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/ep");
        } else if (u.isProfessor()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Set<Classroom> classrooms = getSelectedClassrooms();
            u.getCoder().addClassrooms(classrooms);
            getFactory().getUserDAO().saveOrUpdate(u);
            markForCommit();
            
            getRequest().setAttribute("activeClassrooms", u.getCoder().getClassrooms(StudentClassroom.ACTIVE_STATUS));                
            getRequest().setAttribute("pendingClassrooms", u.getCoder().getClassrooms(StudentClassroom.PENDING_STATUS));                
            getRequest().setAttribute("user", u);
            setNextPage("/student/home.jsp");
            setIsNextPageInContext(true);            
        }        
    }
}
