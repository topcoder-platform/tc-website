/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.Set;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.ep.controller.request.LongBase;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditClassroomSubmit extends LongBase {

    private static Logger log = Logger.getLogger(EditClassroomSubmit.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        this.sessionPrefix = "ec_";

        Classroom classroom = getClassroom();
        if (classroom == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/education");
        } else {
            getRequest().setAttribute("schoolName", classroom.getSchool().getName());                

            boolean update = classroom.getId() != null;

            // if it's a new classroom, process students
            if (!update) {
                Set<Coder> students = getSelectedStudents();
                // four possibilities:
                // 1 - selected student is not in the collection -> add it as active
                // 2 - selected student is in the collection -> leave it and change its status to active only if it is inactive
                // 3 - not selected student is in the collection (pending or active) -> leave it and change its status to inactive
                // 4 - not selected student is not in the collection -> don't do anything
                
                for (Coder s : students) {
                    StudentClassroom sc = new StudentClassroom();
                    sc.getId().setClassroom(classroom);
                    sc.getId().setStudent(s);
                    sc.setStatusId(StudentClassroom.ACTIVE_STATUS);
                    
                    StudentClassroom existing = classroom.getStudentClassroom(sc);
                    if (existing == null) {
                        log.debug("Adding " + sc.getId().getStudent().getUser().getHandle() + " to the registered list");
                        // 1
                        classroom.addStudentClassroom(sc);
                    } else {
                        // 2
                        if (existing.getStatusId().equals(StudentClassroom.INACTIVE_STATUS)) {
                            log.debug("Changing" + sc.getId().getStudent().getUser().getHandle() + " registration status");
                            existing.setStatusId(StudentClassroom.ACTIVE_STATUS);
                        }
                    }
                }
                
                // 3
                if (classroom.getId() != null) {
                    for (Coder s : DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(classroom.getId(), StudentClassroom.ACTIVE_STATUS)) {
                        if (!students.contains(s)) {
                            log.debug("Deactivating " + s.getUser().getHandle());
                            classroom.deactivateStudent(s);
                        }
                    }
                    for (Coder s : DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(classroom.getId(), StudentClassroom.PENDING_STATUS)) {
                        if (!students.contains(s)) {
                            log.debug("Deactivating " + s.getUser().getHandle());
                            classroom.deactivateStudent(s);
                        }
                    }
                }
            }
            
            DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(classroom);

            markForCommit();
            
            getRequest().setAttribute("message", "You have successfuly " + (update ? "updated" : "added") + " classroom " + classroom.getName());                  
            getRequest().setAttribute(BaseServlet.NEXT_PAGE_KEY, "/education/");                  
            setNextPage("/message.jsp");
            setIsNextPageInContext(true);            
        }        
    }
}
