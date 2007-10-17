/*
* Home
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller.request;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
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
    protected void professorProcessing(User u) throws Exception {
        getRequest().setAttribute("classrooms", u.getProfessor().getClassrooms());

        setNextPage("/professor/home.jsp");
        setIsNextPageInContext(true);

    }

    @Override
    protected void studentProcessing(User u) throws Exception {
        // add active classrooms
        Map<Long, StudentHomeRow> schools = new HashMap<Long, StudentHomeRow>(); 
        for (Classroom c : u.getCoder().getClassrooms(StudentClassroom.ACTIVE_STATUS)) {
            Long schoolId = c.getSchool().getId();
            if (!schools.containsKey(schoolId)) {
                schools.put(schoolId, new StudentHomeRow(schoolId, c.getSchool().getName()));
            }
            schools.get(schoolId).getDetails().add(new StudentHomeDetailRow(c.getId(), c.getName(), Boolean.TRUE));
        }

        // add pending classrooms
        for (Classroom c : u.getCoder().getClassrooms(StudentClassroom.PENDING_STATUS)) {
            Long schoolId = c.getSchool().getId();
            if (!schools.containsKey(schoolId)) {
                schools.put(schoolId, new StudentHomeRow(schoolId, c.getSchool().getName()));
            }
            schools.get(schoolId).getDetails().add(new StudentHomeDetailRow(c.getId(), c.getName(), Boolean.FALSE));
        }

        if (DAOUtil.getFactory().getProfessorDAO().hasActiveProfessors(u.getId())) {
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
