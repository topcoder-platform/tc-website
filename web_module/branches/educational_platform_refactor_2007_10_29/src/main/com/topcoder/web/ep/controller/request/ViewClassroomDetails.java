/*
* ViewClassroomDetails
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
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
public class ViewClassroomDetails extends SharedBaseProcessor {

    private static Logger log = Logger.getLogger(ViewClassroomDetails.class);

    @Override
    protected void professorProcessing() throws Exception {
        Classroom c = getClassroom();
        log.debug("is professor");
        
        // check if the user is seeing his own classroom details
        if (c.getProfessor().getId().equals(getUser().getId())) {
            // this user is the classroom's professor
            getRequest().setAttribute("schoolName", c.getSchool().getName());                
            getRequest().setAttribute("classroom", c);
            getRequest().setAttribute("activeStudents", DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.ACTIVE_STATUS));                
            getRequest().setAttribute("pendingStudents", DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.PENDING_STATUS));
            
            setNextPage("/professor/viewClassroomDetails.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new NavigationException("You don't have permission to see this page.");
        }
    }

    @Override
    protected void studentProcessing() throws Exception {
        Classroom c = getClassroom();

        // check if this user is an active student of the classroom
        if (DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(getUser().getId(), c.getId()) != null) {
            log.debug("active student");
            // this user is an active student of the classroom
            getRequest().setAttribute("schoolName", c.getSchool().getName());                
            getRequest().setAttribute("classroom", c);
            setNextPage("/student/viewClassroomDetails.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new NavigationException("You don't have permission to see this page.");
        }
    }

    private Classroom getClassroom() throws TCWebException {
        Long classroomId = getClassroomParam();
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);
        return c;
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

}
