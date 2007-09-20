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
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public abstract class StudentActivationBase extends ShortHibernateProcessor {

    private static Logger log = Logger.getLogger(StudentActivationBase.class);

    protected abstract void process(StudentClassroom sc);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userIdentified()) {
            
            Long classroomId = getClassroomParam();
            Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);

            if (c != null && c.getProfessor().getId().equals(getUser().getId())) {
                log.debug("is professor");
                // this user is the classroom's professor

                Long studentId = getStudentParam();
                
                StudentClassroom sc = c.getStudentClassroom(studentId);

                if (sc != null) {
                    process(sc);
                } else {
                    throw new TCWebException("The selected student is not registered to this class");
                }
            } else {
                throw new NavigationException("You don't have permission to see this page.");
            }
                
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
    

    private Long getClassroomParam() throws TCWebException {
        String classroomId = StringUtils.checkNull(getRequest().getParameter(Constants.CLASSROOM_ID));
        
        if (classroomId == "") {
            throw new TCWebException("Invalid classroom id");
        }

        Long id;
        try {
            id = Long.parseLong(classroomId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid classroom id");
        }
        
        return id;
    }

    private Long getStudentParam() throws TCWebException {
        String studentId = StringUtils.checkNull(getRequest().getParameter(Constants.STUDENT_ID));
        
        if (studentId == "") {
            throw new TCWebException("Invalid student id");
        }

        Long id;
        try {
            id = Long.parseLong(studentId);
        } catch (NumberFormatException e) {
            throw new TCWebException("Invalid student id");
        }
        
        return id;
    }

}
