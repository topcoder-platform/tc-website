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
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.ep.Constants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewClassroomAssignments extends SharedBaseProcessor {

    private static Logger log = Logger.getLogger(ViewClassroomAssignments.class);

    @Override
    protected void professorProcessing() throws Exception {
        Classroom c = getClassroom();
        getRequest().setAttribute("schoolName", c.getSchool().getName());                
        if (c.getProfessor().getId().equals(getUser().getId())) {
            log.debug("is professor");

            // this user is the classroom's professor
            getRequest().setAttribute("classroom", c);
            getRequest().setAttribute("assignments", DAOUtil.getFactory().getClassroomDAO().getAssignments(c.getId()));

            setNextPage("/professor/viewClassroomAssignments.jsp");
            setIsNextPageInContext(true);
        }
    }


    @Override
    protected void studentProcessing() throws Exception {
        Classroom c = getClassroom();
        getRequest().setAttribute("schoolName", c.getSchool().getName());                
        Coder s = DAOUtil.getFactory().getCoderDAO().getActiveStudentUsingClassroomId(getUser().getId(), c.getId());
        if (s != null) {
            log.debug("active student");

            getRequest().setAttribute("classroom", c);
            getRequest().setAttribute("assignments", DAOUtil.getFactory().getClassroomDAO().getAssignmentsForStudent(c.getId(), s.getId()));
            setNextPage("/student/viewClassroomAssignments.jsp");
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
