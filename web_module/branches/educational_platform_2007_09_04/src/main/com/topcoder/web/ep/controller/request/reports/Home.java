/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.reports;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.controller.request.SharedBaseProcessor;

// todo: school name

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends SharedBaseProcessor {
    @Override
    protected void professorProcessing() throws Exception {
        getRequest().setAttribute("classrooms", DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(new Long(getUser().getId())));
        setNextPage("/reports/selectClassroom.jsp");
        setIsNextPageInContext(true);
        
    }

    @Override
    protected void studentProcessing() throws Exception {
        getRequest().setAttribute("classrooms", DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(new Long(getUser().getId()), StudentClassroom.ACTIVE_STATUS));
        setNextPage("/reports/selectClassroom.jsp");
        setIsNextPageInContext(true);
    }
}
