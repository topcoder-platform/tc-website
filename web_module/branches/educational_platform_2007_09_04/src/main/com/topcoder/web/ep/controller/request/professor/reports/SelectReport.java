/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.professor.reports;

import com.topcoder.web.common.NavigationException;
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
public class SelectReport extends ShortHibernateProcessor {
    @Override
    protected void dbProcessing() throws Exception {
        // get classroom parameter
        Long classroomId = getClassroomParam();
        
        // check if it's a valid classroom
        Classroom c = DAOUtil.getFactory().getClassroomDAO().find(classroomId);
        if (c == null) {
            throw new TCWebException("Couldn't find classroom");
        }
        
        // check if this classroom belongs to the logged professor
        if (!c.getProfessor().getId().equals(getUser().getId())) {
            throw new NavigationException("You don't have permission to see this page.");
        }

        // we need active students and assignments
        getRequest().setAttribute("clsid", c.getId());
        getRequest().setAttribute("students", c.getStudents(StudentClassroom.ACTIVE_STATUS));
        getRequest().setAttribute("assignments", DAOUtil.getFactory().getClassroomDAO().getAssignments(classroomId));
        
        setNextPage("/reports/selectReport.jsp");
        setIsNextPageInContext(true);
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
