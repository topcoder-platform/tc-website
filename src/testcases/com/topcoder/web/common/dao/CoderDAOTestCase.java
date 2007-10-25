package com.topcoder.web.common.dao;

import java.util.HashSet;
import java.util.List;

import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.common.model.educ.StudentClassroom;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CoderDAOTestCase extends TCHibernateTestCase {

    public void testFind() {

        Coder tomek = DAOUtil.getFactory().getCoderDAO().find(new Long(144400));

        assertTrue("could not load tomek", tomek != null);

    }

    public void testResumeLoad() {
        Coder dok = DAOUtil.getFactory().getCoderDAO().find(new Long(132456));

        /*Iterator it = dok.getResumes().iterator();
        Resume r = (Resume)it.next();
        log.debug("resume is " + r.getFileName());
        */
        assertFalse("could not find dok's resume", dok.getResumes().isEmpty());

    }


    public void testReferralLoad() {
        Coder tomek = DAOUtil.getFactory().getCoderDAO().find(new Long(144400));
        assertFalse("could not load tomek's referral", tomek.getCoderReferral() == null);
    }

    public void testMemberReferralLoad() {
        Coder somedude = DAOUtil.getFactory().getCoderDAO().find(new Long(13387370));
        assertFalse("some dude's member referral not loaded", somedude.getCoderReferral().getReferenceCoder() == null);
    }

    public void testNonCoderReference() {
        Coder somedude = DAOUtil.getFactory().getCoderDAO().find(new Long(156023));
        assertFalse("could not load some dude's referral", somedude.getCoderReferral() == null);
    }
    
    
    public void testGetStudents() {
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        Professor p = u.getProfessor();

        if (p == null) {
            p = new Professor();
            p.setStatus(DAOUtil.getFactory().getProfessorStatusDA0().find(ProfessorStatus.ACTIVE));
            p.setUser(u);
            u.setProfessor(p);
        } else {
            //remove professor's classrooms
            p.setClassrooms(new HashSet<Classroom>());
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

        p.addClassrooms(c);

        DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(c);

        tearDown();
        setUp();

        // 

        assertTrue("The student " + s.getId() + " is active in that classroom", DAOUtil.getFactory().getCoderDAO().getActiveStudentUsingClassroomId(s.getId(), c.getId()) != null);
        assertTrue("The student " + s.getId() + " is in that classroom", DAOUtil.getFactory().getCoderDAO().getStudentUsingClassroomId(s.getId(), c.getId()) != null);

        assertTrue("The student " + s2.getId() + " is not active in that classroom", DAOUtil.getFactory().getCoderDAO().getActiveStudentUsingClassroomId(s2.getId(), c.getId()) == null);
        assertTrue("The student " + s2.getId() + " is in that classroom", DAOUtil.getFactory().getCoderDAO().getStudentUsingClassroomId(s2.getId(), c.getId()) != null);

        Classroom c2 = DAOUtil.getFactory().getClassroomDAO().find(c.getId());

        c2.getProfessor().removeClassroom(c2);
        DAOUtil.getFactory().getClassroomDAO().delete(c2);
    }

}
