/*
 * ViewClassroomDetails
 *
 * Created Sep 5, 2007
 */
package com.topcoder.web.ep.controller.request;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.algo.Round;
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

            
            List<Round> lr = DAOUtil.getFactory().getClassroomDAO().getAssignments(c.getId());
            
            // we need to tell the UI whether to show or not the edit and assign to columns            
            Boolean showEdit = false;
            Boolean showAssignTo = false;
            Timestamp now = new Timestamp((new Date()).getTime());
            for (Round r : lr) {
                if (r.getContest().getEndDate().after(now)) {
                    showAssignTo = true;
                }
                if (r.getContest().getStartDate().after(now)) {
                    showEdit = true;
                }
            }
            
            // this user is the classroom's professor
            getRequest().setAttribute("show_edit", showEdit);
            getRequest().setAttribute("show_assign_to", showAssignTo);
            getRequest().setAttribute("classroom", c);
            getRequest().setAttribute("assignments", lr);

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
