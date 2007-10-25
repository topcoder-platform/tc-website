/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.ep.controller.request.student.StudentHomeDetailRow;
import com.topcoder.web.ep.controller.request.student.StudentHomeRow;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Home extends SharedBaseProcessor {

    private static Logger log = Logger.getLogger(Home.class);

    /* (non-Javadoc)
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    @Override
    protected void professorProcessing() throws Exception {
        getRequest().setAttribute("classrooms", DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(new Long(getUser().getId())));

        List<School> ls = DAOUtil.getFactory().getSchoolDAO().findSchoolsUsingProfessorId(getUser().getId());
        // show school in header only in case the professor has just one
        if (ls.size() == 1) {
            getRequest().setAttribute("schoolName", ls.iterator().next().getName());                
        }
        
        setNextPage("/professor/home.jsp");
        setIsNextPageInContext(true);

    }

    @Override
    protected void studentProcessing() throws Exception {
        // add active classrooms
        Map<Long, StudentHomeRow> schools = new HashMap<Long, StudentHomeRow>(); 
        for (Classroom c : DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(getUser().getId(), StudentClassroom.ACTIVE_STATUS)) {
            Long schoolId = c.getSchool().getId();
            if (!schools.containsKey(schoolId)) {
                schools.put(schoolId, new StudentHomeRow(schoolId, c.getSchool().getName()));
            }
            schools.get(schoolId).getDetails().add(new StudentHomeDetailRow(c.getId(), c.getName(), Boolean.TRUE));
        }

        // add pending classrooms
        for (Classroom c : DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(getUser().getId(), StudentClassroom.PENDING_STATUS)) {
            Long schoolId = c.getSchool().getId();
            if (!schools.containsKey(schoolId)) {
                schools.put(schoolId, new StudentHomeRow(schoolId, c.getSchool().getName()));
            }
            schools.get(schoolId).getDetails().add(new StudentHomeDetailRow(c.getId(), c.getName(), Boolean.FALSE));
        }

        // show school in header only in case the student has just one
        if (schools.size() == 1) {
            getRequest().setAttribute("schoolName", schools.values().iterator().next().getSchoolName());                
        }

        if (DAOUtil.getFactory().getProfessorDAO().hasActiveProfessors(getUser().getId())) {
            log.debug("student with registration");
            // user already registered
            getRequest().setAttribute("schools", schools.values());                
            setNextPage("/student/home.jsp");
            setIsNextPageInContext(true);
        } else {
            log.debug("first time - self register");
            setNextPage("/student/selfRegister.jsp");
            setIsNextPageInContext(true);
        }
    }
}
