/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.student;

import java.util.Set;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: SelfRegisterConfirm.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class SelfRegisterConfirm extends LongBase {

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        Set<Classroom> classrooms = getSelectedClassrooms();
        if (classrooms == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/education");
        } else {
            getRequest().setAttribute("schoolName", getSchool().getName());                

            Coder c = DAOUtil.getFactory().getCoderDAO().find(getUser().getId());
            for (Classroom classroom : classrooms) {
                classroom.addStudentClassroom(new StudentClassroom(c, classroom, StudentClassroom.PENDING_STATUS));
            }
            
            markForCommit();
            
            getRequest().setAttribute("message", "You have successfuly self registered to the selected classrooms.");                  
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, "/education/");                  
            setNextPage("/message.jsp");
            setIsNextPageInContext(true);            
        }        
    }
}
