/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.ep.Constants;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public abstract class StudentActivationBase extends ShortHibernateProcessor {

    private static Logger log = Logger.getLogger(StudentActivationBase.class);

    protected abstract void process(Classroom c, List<StudentClassroom> lsc);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.ShortHibernateProcessor#dbProcessing()
     */
    @Override
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            
            Long classroomId = getClassroomParam();
            Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);

            if (c != null && c.getProfessor().getId().equals(getUser().getId())) {
                getRequest().setAttribute("schoolName", c.getSchool().getName());                

                log.debug("is professor");
                // this user is the classroom's professor

                List<Long> studentIds = getStudentParam();
                
                List<StudentClassroom> lsc = new ArrayList<StudentClassroom>();
                for (Long studentId : studentIds) {
                    StudentClassroom sc = c.getStudentClassroom(studentId);
                    if (sc != null) {
                        lsc.add(sc);
                    } else {
                        log.warn("The user is trying to activate/deactivate " + studentId + " but there is no such registration in the classroom");
                    }
                }
                
                if (lsc.size() > 0) {
                    process(c, lsc);
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
        
        if (classroomId.equals("")) {
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

    private List<Long> getStudentParam() throws TCWebException {
        String[] values = getRequest().getParameterValues(Constants.STUDENT_ID);
        
        if (values == null) {
            throw new TCWebException("Invalid student ids");
        }

        List<Long> ids = new ArrayList<Long>();
        for (String value : values) {
            Long id;
            try {
                id = Long.parseLong(value);
            } catch (NumberFormatException e) {
                throw new TCWebException("Invalid student id");
            }
            ids.add(id);
        }
        
        return ids;
    }

}
