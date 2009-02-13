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
 * @author pulky
 * @version $Revision: 66901 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class StudentClassroomDAOTestCase extends TCHibernateTestCase {
    public void testGetStudents() {
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
        Coder s2 = DAOUtil.getFactory().getCoderDAO().find(8369898l);

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

        StudentClassroom sc2 = new StudentClassroom();
        sc2.setStatusId(StudentClassroom.INACTIVE_STATUS);
        sc2.getId().setClassroom(c);
        sc2.getId().setStudent(s2);
        c.addStudentClassroom(sc2);

        DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        assertTrue("The student " + s.getId() + " is active in that classroom", DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(s.getId(), c.getId()) != null);
        assertTrue("The student " + s.getId() + " is in that classroom", DAOUtil.getFactory().getStudentClassroomDAO().findUsingStudentIdClassroomId(s.getId(), c.getId()) != null);

        assertTrue("The student " + s2.getId() + " is not active in that classroom", DAOUtil.getFactory().getStudentClassroomDAO().findActiveUsingStudentIdClassroomId(s2.getId(), c.getId()) == null);
        assertTrue("The student " + s2.getId() + " is in that classroom", DAOUtil.getFactory().getStudentClassroomDAO().findUsingStudentIdClassroomId(s2.getId(), c.getId()) != null);

        List<Coder> lc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingProfessorIdSchoolId(p.getId(), 22l);
        assertTrue("findUsingProfessorIdSchoolId Should have returned 2 coders, but instead returned " + lc.size(), lc.size() == 2 );

        lc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.ACTIVE_STATUS);
        assertTrue("findUsingClassroomIdStatusId Should have returned 1 coder, but instead returned " + lc.size(), 
                lc.size() == 1);

        lc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.INACTIVE_STATUS);
        assertTrue("findUsingClassroomIdStatusId Should have returned 1 coder, but instead returned " + lc.size(), 
                lc.size() == 1);

        lc = DAOUtil.getFactory().getStudentClassroomDAO().findUsingClassroomIdStatusId(c.getId(), StudentClassroom.PENDING_STATUS);
        assertTrue("findUsingClassroomIdStatusId Should have returned 0 coders, but instead returned " + lc.size(), 
                lc.size() == 0);

        
        Classroom c2 = DAOUtil.getFactory().getClassroomDAO().find(c.getId());

        DAOUtil.getFactory().getClassroomDAO().delete(c2);
    }

}
