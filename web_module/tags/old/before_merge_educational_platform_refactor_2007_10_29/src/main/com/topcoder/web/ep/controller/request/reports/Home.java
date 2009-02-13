/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.reports;

import java.util.List;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.controller.request.SharedBaseProcessor;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends SharedBaseProcessor {
    @Override
    protected void professorProcessing() throws Exception {
        getRequest().setAttribute("classrooms", DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(new Long(getUser().getId())));

        List<School> ls = DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingProfessorId(getUser().getId());
        // show school in header only in case the professor has just one
        if (ls.size() == 1) {
            getRequest().setAttribute("schoolName", ls.iterator().next().getName());                
        }

        setNextPage("/reports/selectClassroom.jsp");
        setIsNextPageInContext(true);
        
    }

    @Override
    protected void studentProcessing() throws Exception {
        getRequest().setAttribute("classrooms", DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(new Long(getUser().getId()), StudentClassroom.ACTIVE_STATUS));
        
        List<School> ls = DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingStudentId(getUser().getId());
        // show school in header only in case the professor has just one
        if (ls.size() == 1) {
            getRequest().setAttribute("schoolName", ls.iterator().next().getName());                
        }
        
        setNextPage("/reports/selectClassroom.jsp");
        setIsNextPageInContext(true);
    }
}
