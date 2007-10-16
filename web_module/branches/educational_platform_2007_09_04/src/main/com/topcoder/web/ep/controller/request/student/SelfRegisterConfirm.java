/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.controller.request.LongBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class SelfRegisterConfirm extends LongBase {

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
            
            getRequest().setAttribute("message", "You have successfuly self registered to the selected classrooms.");                  
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, "/ep/");                  
            setNextPage("/message.jsp");
            setIsNextPageInContext(true);            
        }        
    }
}
