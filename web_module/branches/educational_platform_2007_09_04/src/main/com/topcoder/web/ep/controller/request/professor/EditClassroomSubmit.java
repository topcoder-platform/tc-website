/*
* SelfRegister
*
* Created Sep 11, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.controller.request.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EditClassroomSubmit extends Base {

    private static Logger log = Logger.getLogger(EditClassroomSubmit.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("Edit classroom submit called...");
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
            
            Classroom classroom = getClassroom();
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
            for (Coder s : classroom.getStudents(StudentClassroom.ACTIVE_STATUS)) {
                if (!students.contains(s)) {
                    log.debug("Deactivating " + s.getUser().getHandle());
                    classroom.deactivateStudent(s);
                }
            }
            for (Coder s : classroom.getStudents(StudentClassroom.PENDING_STATUS)) {
                if (!students.contains(s)) {
                    log.debug("Deactivating " + s.getUser().getHandle());
                    classroom.deactivateStudent(s);
                }
            }

            u.getProfessor().addClassrooms(classroom);
            
            getFactory().getUserDAO().saveOrUpdate(u);

            markForCommit();
            
            getRequest().setAttribute("classrooms", u.getProfessor().getClassrooms());                
            getRequest().setAttribute("user", u);
            setNextPage("/professor/home.jsp");
            setIsNextPageInContext(true);            
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }        
    }
}
