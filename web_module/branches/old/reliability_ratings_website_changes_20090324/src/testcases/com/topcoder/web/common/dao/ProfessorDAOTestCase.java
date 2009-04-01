/*
* ProfessorDAOTestCase
*
* Created Sep 28, 2007
*/
package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ProfessorDAOTestCase extends TCHibernateTestCase {

    /**
     * Test method for {@link com.topcoder.web.common.dao.GenericDAO#find(java.io.Serializable)}.
     */
    public void testFindSaveOrUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        Professor delete = u.getProfessor(); 
        if (delete != null) {
            u.setProfessor(null);
            
            // delete all professor's classrooms
            List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(delete.getId());

            for (Classroom c : lc) {
                DAOUtil.getFactory().getClassroomDAO().delete(c);
            }
            
            DAOUtil.getFactory().getProfessorDAO().delete(delete);
        }

        tearDown();
        setUp();

        // add p

        Professor p = new Professor();

        p.setStatus(DAOUtil.getFactory().getProfessorStatusDA0().find(ProfessorStatus.ACTIVE));
        p.setUser(DAOUtil.getFactory().getUserDAO().find("bauna", true));

        Coder s = DAOUtil.getFactory().getCoderDAO().find(119676l);
        
        Classroom c = new Classroom();
        c.setName("test");
        c.setProfessor(p);
        c.setAcademicPeriod("test");
        c.setDescription("test");
        c.setSchool(DAOUtil.getFactory().getSchoolDAO().find(22l));
        c.setStatusId(Classroom.ACTIVE);
        
        StudentClassroom sc = new StudentClassroom();
        sc.setStatusId(StudentClassroom.ACTIVE_STATUS);
        sc.getId().setClassroom(c);
        sc.getId().setStudent(s);
        c.addStudentClassroom(sc);
        
        DAOUtil.getFactory().getProfessorDAO().saveOrUpdate(p);
        DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        // look for p

        Professor p2 = DAOUtil.getFactory().getProfessorDAO().find(p.getId());
        assertTrue("Could not found professor " + p.getId(), p2 != null);

        assertTrue("Different attribute: getStatusId - " + p.getStatus().getId() + " <> getStatusId - " + p2.getStatus().getId(),
                p.getStatus().getId().equals(p2.getStatus().getId()));
        assertTrue("Different attribute: getUser - " + p.getUser() + " <> getUser - " + p2.getUser(),
                p.getUser().equals(p2.getUser()));

        // check if p is a professor
        Boolean b = DAOUtil.getFactory().getProfessorDAO().isProfessor(p2.getId());
        assertTrue("Should be a professor ", b);

        b = DAOUtil.getFactory().getProfessorDAO().isProfessor(9999l);
        assertFalse("Should not be a professor ", b);
        
        p2.getUser().setProfessor(null);

        // delete all professor's classrooms
        List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(p2.getId());

        for (Classroom cls : lc) {
            DAOUtil.getFactory().getClassroomDAO().delete(cls);
        }

        DAOUtil.getFactory().getProfessorDAO().delete(p2);
    }

}
