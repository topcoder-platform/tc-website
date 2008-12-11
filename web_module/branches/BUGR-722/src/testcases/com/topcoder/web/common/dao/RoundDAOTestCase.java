/*
* RoundDAOTestCase
*
* Created Sep 27, 2007
*/
package com.topcoder.web.common.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.algo.Language;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundType;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.ep.arena.ArenaHelper;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: RoundDAOTestCase.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class RoundDAOTestCase extends TCHibernateTestCase {

    /**
     * Test method for {@link com.topcoder.web.common.dao.hibernate.RoundDAOHibernate#getRoundsAfter(java.util.Date)}.
     */
    public void testGetRoundsAfter() {
        Date d = new Date(new GregorianCalendar(2106, 1, 1).getTimeInMillis());
        List l = DAOUtil.getFactory().getRoundDAO().getRoundsAfter(d);
        
        assertTrue("There shouldn't be rounds after " + d.toString(), 
                l.size() == 0);
        
        Date d2 = new Date(new GregorianCalendar(2006, 1, 1).getTimeInMillis());
        List l2 = DAOUtil.getFactory().getRoundDAO().getRoundsAfter(d2);
        assertTrue("There should be rounds after " + d.toString(), 
                l2.size() > 0);
    }

    /**
     * Test method for {@link com.topcoder.web.common.dao.hibernate.RoundDAOHibernate#find(java.lang.Integer)}.
     */
    public void testFindInteger() {
        
        assertTrue("Could not found round 2000", DAOUtil.getFactory().getRoundDAO().find(2000l) != null);
        
        assertTrue("There is no round -100", DAOUtil.getFactory().getRoundDAO().find(-100l) == null);
    }

    /**
     * Test method for {@link com.topcoder.web.common.dao.hibernate.RoundDAOHibernate#saveOrUpdate(com.topcoder.web.common.model.algo.Round)}.
     */
    public void testSaveOrUpdateRound() {
        Round r = new Round();
        r.setContest(DAOUtil.getFactory().getContestDAO().find(4000l));

        r.setInvitational(1);
        r.setName("Test round");
        r.setRated(1);
        r.setRegistrationLimit(1024l);
        r.setShortName("tst rnd");
        r.setStatus("A");
        
        RoundType rt = new RoundType();
        rt.setDescription("test round type");
        r.setType(DAOUtil.getFactory().getRoundTypeDAO().find(RoundType.SRM));
        
        DAOUtil.getFactory().getRoundDAO().saveOrUpdate(r);
        
        tearDown();
        setUp();

        // look for r

        Round r2 = DAOUtil.getFactory().getRoundDAO().find(r.getId());
        assertTrue("Could not found round " + r.getId(), r2 != null);

        assertTrue("Different attribute: getName - " + r.getName() + " <> getName - " + r2.getName(), 
                r.getName().equals(r2.getName()));
        assertTrue("Different attribute: getInvitational - " + r.getInvitational() + " <> getInvitational - " + r2.getInvitational(), 
                r.getInvitational().equals(r2.getInvitational()));
        assertTrue("Different attribute: getRated - " + r.getRated() + " <> getRated - " + r2.getRated(), 
                r.getRated().equals(r2.getRated()));
        assertTrue("Different attribute: getRegistrationLimit - " + r.getRegistrationLimit() + " <> getRegistrationLimit - " + r2.getRegistrationLimit(), 
                r.getRegistrationLimit().equals(r2.getRegistrationLimit()));
        assertTrue("Different attribute: getShortName - " + r.getShortName() + " <> getShortName - " + r2.getShortName(), 
                r.getShortName().equals(r2.getShortName()));
        assertTrue("Different attribute: getStatus - " + r.getStatus() + " <> getStatus - " + r2.getStatus(), 
                r.getStatus().equals(r2.getStatus()));
                
        DAOUtil.getFactory().getRoundDAO().delete(r2);
    }

    public void testEducationalAssignments() {
        // findDuplicateName
        // getAssignments
        // getAssignmentsForStudent
        
        ArenaHelper ah = new ArenaHelper();
        ah.setSendEvent(false);

        Classroom c = createClassroomForTest();
        AssignmentDTO basicADTO = createBasicAssignmentDTO(c);

        ah.addNewAssignment(basicADTO);

        List<Long> coderIds = new ArrayList<Long>();
        coderIds.add(119676l);
        
        ah.updateRoundRegistration(basicADTO.getRoundId(), coderIds);

        assertTrue("Should've found the round", DAOUtil.getFactory().getRoundDAO().findDuplicateName(c.getId(), basicADTO.getAssignmentName(), null).size() > 0);

        assertTrue("Shouldn't have found the round", DAOUtil.getFactory().getRoundDAO().findDuplicateName(c.getId(), basicADTO.getAssignmentName(), basicADTO.getRoundId()).size() == 0);

        assertTrue("There are no assignments for the classroom", DAOUtil.getFactory().getRoundDAO().getAssignments(999l).size() == 0);

        assertTrue("There are assignments for the classroom", DAOUtil.getFactory().getRoundDAO().getAssignments(c.getId()).size() > 0);

        assertTrue("There are no assignments for the student", DAOUtil.getFactory().getRoundDAO().getAssignmentsForStudent(999l, 119676l).size() == 0);

        assertTrue("There are no assignments for the student", DAOUtil.getFactory().getRoundDAO().getAssignmentsForStudent(c.getId(), 8369898l).size() == 0);

        assertTrue("There are assignments for the student", DAOUtil.getFactory().getRoundDAO().getAssignmentsForStudent(c.getId(), 119676l).size() > 0);

        super.tearDown();
        super.setUp();

        // clean up the professor and remove the created assignment
        cleanUp(basicADTO);

    }

    
    
    
    /************************ PRIVATE HELPER METHODS ******************************/ 
    
    private void cleanUp(AssignmentDTO basicADTO) {
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        Professor p = u.getProfessor();

        if (p != null) {
            p.getUser().setProfessor(null);
    
            // delete all professor's classrooms
            List<Classroom> lc = DAOUtil.getFactory().getClassroomDAO().getClassroomsUsingProfessorId(p.getId());
    
            for (Classroom cls : lc) {
                DAOUtil.getFactory().getClassroomDAO().delete(cls);
            }
    
            DAOUtil.getFactory().getProfessorDAO().delete(p);
        }
        
        if (basicADTO.getRoundId() != null) {
            DAOUtil.getFactory().getRoundDAO().delete(
                    DAOUtil.getFactory().getRoundDAO().find(basicADTO.getRoundId()));
        }
    }

    private Classroom createClassroomForTest() {
        // create or clean professor first
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
        
        super.tearDown();
        super.setUp();

        // create classroom with registrations
        
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
        sc2.setStatusId(StudentClassroom.ACTIVE_STATUS);
        sc2.getId().setClassroom(c);
        sc2.getId().setStudent(s2);
        c.addStudentClassroom(sc2);

        DAOUtil.getFactory().getClassroomDAO().saveOrUpdate(c);

        super.tearDown();
        super.setUp();

        return c;
    }

    private AssignmentDTO createBasicAssignmentDTO(Classroom c) {
        AssignmentDTO adto = new AssignmentDTO();
        
        adto.setClassroomId(c.getId());
        adto.setClassroomName(c.getName());
        adto.setSchoolName(c.getSchool().getName());

        adto.setAssignmentName("test assignment name");
        adto.setStartDate(new Timestamp((new Date()).getTime() + 1000000));
        adto.setEndDate(new Timestamp((new Date()).getTime() + 1200000));
        adto.setCoderPhaseLength(0l);
        adto.setShowAllScores(1l);
        adto.setScoreType(1l);
        
        // fill the components
        adto.addComponent(new ComponentDTO(5l, 300d, "Denominator"));
        adto.addComponent(new ComponentDTO(6l, null, "Factor"));
        adto.addComponent(new ComponentDTO(7l, 900d, "getChange"));

        // fill the languages
        List<Integer> languageList = new ArrayList<Integer>();

        languageList.add(Language.JAVA_LANGUAGE);
        languageList.add(Language.CPP_LANGUAGE);
        adto.setLanguages(languageList);
        
        return adto;
    }

}
