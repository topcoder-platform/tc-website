/*
* ClassroomDAOTestCase
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
 * @version $Id: ClassroomDAOTestCase.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class ClassroomDAOTestCase extends TCHibernateTestCase {

    /**
     * Test method for {@link com.topcoder.web.common.dao.GenericDAO#find(java.io.Serializable)}.
     */
    public void testFindSaveOrUpdate() {
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        Professor p = u.getProfessor();

        if (p == null) {
            p = new Professor();
            p.setStatus(DAOUtil.getFactory().getProfessorStatusDA0().find(ProfessorStatus.ACTIVE));
            p.setUser(u);
            u.setProfessor(p);
        } else {
            // delete all professor's classrooms
            List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(p.getId());

            for (Classroom cls : lc) {
                DAOUtil.getFactory().getClassroomDAO().delete(cls);
            }
        }

        DAOUtil.getFactory().getProfessorDAO().saveOrUpdate(p);

        tearDown();
        setUp();

        Coder s = DAOUtil.getFactory().getCoderDAO().find(119676l);

        Classroom c = new Classroom();
        c.setName("test classroom");
        c.setAcademicPeriod("test academic");
        c.setDescription("test");
        c.setProfessor(p);
        c.setSchool(DAOUtil.getFactory().getSchoolDAO().find(22l));
        c.setStatusId(Classroom.ACTIVE);

        StudentClassroom sc = new StudentClassroom();
        sc.setStatusId(StudentClassroom.ACTIVE_STATUS);
        sc.getId().setClassroom(c);
        sc.getId().setStudent(s);
        c.addStudentClassroom(sc);
        
        DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        // look for c

        Classroom c2 = DAOUtil.getFactory().getClassroomDAO().find(c.getId());
        assertTrue("Could not found classroom " + c.getId(), c2 != null);

        assertTrue("Different attribute: getStatusId - " + c.getStatusId() + " <> getStatusId - " + c2.getStatusId(),
                c.getStatusId().equals(c2.getStatusId()));
        assertTrue("Different attribute: getName - " + c.getName() + " <> getName - " + c2.getName(),
                c.getName().equals(c2.getName()));
        assertTrue("Different attribute: getAcademicPeriod - " + c.getAcademicPeriod() + " <> getAcademicPeriod - " + c2.getAcademicPeriod(),
                c.getAcademicPeriod().equals(c2.getAcademicPeriod()));
        assertTrue("Different attribute: getDescription - " + c.getDescription() + " <> getDescription - " + c2.getDescription(),
                c.getDescription().equals(c2.getDescription()));
        assertTrue("Different attribute: getProfessor - " + c.getProfessor().getId() + " <> getProfessor - " + c2.getProfessor().getId(),
                c.getProfessor().getId().equals(c2.getProfessor().getId()));
        assertTrue("Different attribute: getSchool - " + c.getSchool() + " <> getSchool - " + c2.getSchool(),
                c.getSchool().equals(c2.getSchool()));


        // look for c using professor
        List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(p.getId());
        boolean found = false;
        for (Classroom cls : lc) {
            if (cls.equals(c)) {
                found = true;
            }
        }
        assertTrue("Could not found classroom using professor " + c.getId(), found);
        

        // look for c using student, status
        lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(s.getId(), StudentClassroom.ACTIVE_STATUS);
        found = false;
        for (Classroom cls : lc) {
            if (cls.equals(c)) {
                found = true;
            }
        }
        assertTrue("Could not found classroom using student " + c.getId(), found);
        
        // look for c using student
        lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(s.getId());
        found = false;
        for (Classroom cls : lc) {
            if (cls.equals(c)) {
                found = true;
            }
        }
        assertTrue("Could not found classroom using student " + c.getId(), found);

        lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingStudentId(99999l, StudentClassroom.ACTIVE_STATUS);
        assertTrue("There should not be classrooms for an invalid student ", lc.size() == 0);

        // look for classroom using name and period
        lc =  DAOUtil.getFactory().getClassroomDAO().findClassroomUsingNameAndPeriod(c.getSchool().getId(), c.getName(), c.getAcademicPeriod());
        assertTrue("Could not found classroom using name and period " + c.getId(), lc.size() > 0);

        DAOUtil.getFactory().getClassroomDAO().delete(c2);
    }

}
