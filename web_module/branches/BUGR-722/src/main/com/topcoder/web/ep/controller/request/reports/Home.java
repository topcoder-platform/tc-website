/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request.reports;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.School;
import com.topcoder.web.ep.controller.request.SharedBaseProcessor;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: Home.java 66912 2007-11-06 12:27:49Z pulky $
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
        List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(new Long(getUser().getId()), StudentClassroom.ACTIVE_STATUS);
        getRequest().setAttribute("classrooms", lc);
        
        List<School> ls = new ArrayList<School>();
        for (Classroom c : lc) {
            if (!ls.contains(c.getSchool())) {
                ls.add(c.getSchool());
            }
        }
        
        // show school in header only in case the student has just one
        if (ls.size() == 1) {
            getRequest().setAttribute("schoolName", ls.iterator().next().getName());                
        }
        
        setNextPage("/reports/selectClassroom.jsp");
        setIsNextPageInContext(true);
    }
}
