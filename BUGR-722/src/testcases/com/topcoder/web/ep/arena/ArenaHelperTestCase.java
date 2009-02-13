/**
 * 
 */
package com.topcoder.web.ep.arena;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.algo.Contest;
import com.topcoder.web.common.model.algo.Language;
import com.topcoder.web.common.model.algo.Room;
import com.topcoder.web.common.model.algo.RoomResult;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundComponent;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.algo.RoundRegistration;
import com.topcoder.web.common.model.algo.RoundSegment;
import com.topcoder.web.common.model.algo.RoundType;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;
import com.topcoder.web.ep.model.Classroom;
import com.topcoder.web.ep.model.StudentClassroom;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author Pablo
 *
 */
public class ArenaHelperTestCase extends TCHibernateTestCase {

    private ArenaHelper ah;
    private AssignmentDTO basicADTO;

    
    @Override
    public void setUp() {
        super.setUp();
        
        ah = new ArenaHelper();
        ah.setSendEvent(false);

        Classroom c = createClassroomForTest();
        basicADTO = createBasicAssignmentDTO(c);

        ah.addNewAssignment(basicADTO);
    }

    @Override
    public void tearDown() {
        super.tearDown();
        super.setUp();

        // clean up the professor and remove the created assignment
        cleanUp();

        super.tearDown();
    }

    /**
     * Test method for {@link com.topcoder.web.ep.arena.ArenaHelper#addNewAssignment(com.topcoder.web.ep.dto.AssignmentDTO)}.
     */
    public final void testAddNewAssignment() {
        // look what we have in the DB
        // get the round
        
        Round r = DAOUtil.getFactory().getRoundDAO().find(basicADTO.getRoundId());

        checkBasicData(r);

        // check segments
        Timestamp almostCurrent = new Timestamp((new Date()).getTime() - 1000000);  
        checkSegments(r, almostCurrent);
        
        // check components
        assertTrue("Round should have exactly three components", r.getRoundComponents().size() == 3);

        for (RoundComponent rc : r.getRoundComponents()) {
            assertTrue("Wrong component id ", 
                    rc.getId().getComponent().getId().equals(5l) ||
                    rc.getId().getComponent().getId().equals(6l) ||
                    rc.getId().getComponent().getId().equals(7l)
                    );
            assertTrue("Wrong component division", rc.getDivisionId().equals(1));            
            assertTrue("Wrong component difficulty", rc.getDifficulty().equals(rc.getId().getComponent().getProblem().getProposedDifficulty()));

            if (rc.getId().getComponent().getId().equals(5l)) {
                assertTrue("(1) Wrong component points", rc.getPoints().equals(300d));
            } else if (rc.getId().getComponent().getId().equals(6l)) {
                assertTrue("(2) Wrong component points", rc.getPoints().equals(rc.getId().getComponent().getProblem().getProposedDifficulty().getPointValue()));                
            } else if (rc.getId().getComponent().getId().equals(7l)) {
                assertTrue("(3) Wrong component points", rc.getPoints().equals(900d));
            }
        }

        // check languages
        assertTrue("Round should have exactly two languages", r.getLanguages().size() == 2);

        for (Language l : r.getLanguages()) {
            assertTrue("Wrong language id ", 
                    l.getId().equals(Language.JAVA_LANGUAGE) ||
                    l.getId().equals(Language.CPP_LANGUAGE));
        }
    }

    /**
     * Test method for {@link com.topcoder.web.ep.arena.ArenaHelper#EditAssignment(com.topcoder.web.ep.dto.AssignmentDTO)}.
     */
    public final void testEditAssignment() {
        // edit
        updateBasicAssignmentDTO(basicADTO);
        ah.editAssignment(basicADTO);

        // look what we have in the DB
        // get the round
        
        Round r = DAOUtil.getFactory().getRoundDAO().find(basicADTO.getRoundId());

        checkBasicData(r);

        // check segments
        Timestamp almostCurrent = new Timestamp((new Date()).getTime() - 1000000);  
        checkSegments(r, almostCurrent);
        
        // check components
        assertTrue("Round should have exactly three components", r.getRoundComponents().size() == 3);

        for (RoundComponent rc : r.getRoundComponents()) {
            assertTrue("Wrong component id ", 
                    rc.getId().getComponent().getId().equals(5l) ||
                    rc.getId().getComponent().getId().equals(8l) ||
                    rc.getId().getComponent().getId().equals(7l)
                    );
            assertTrue("Wrong component division", rc.getDivisionId().equals(1));            
            assertTrue("Wrong component difficulty", rc.getDifficulty().equals(rc.getId().getComponent().getProblem().getProposedDifficulty()));

            if (rc.getId().getComponent().getId().equals(5l)) {
                assertTrue("(1) Wrong component points", rc.getPoints().equals(rc.getId().getComponent().getProblem().getProposedDifficulty().getPointValue()));
            } else if (rc.getId().getComponent().getId().equals(8l)) {
                assertTrue("(2) Wrong component points", rc.getPoints().equals(1200d));                
            } else if (rc.getId().getComponent().getId().equals(7l)) {
                assertTrue("(3) Wrong component points", rc.getPoints().equals(900d));
            }
        }

        // check languages
        assertTrue("Round should have exactly two languages", r.getLanguages().size() == 2);

        for (Language l : r.getLanguages()) {
            assertTrue("Wrong language id ", 
                    l.getId().equals(Language.JAVA_LANGUAGE) ||
                    l.getId().equals(Language.CSHARP_LANGUAGE));
        }
    }


    /**
     * Test method for {@link com.topcoder.web.ep.arena.ArenaHelper#updateRoundRegistration(java.lang.Long, java.util.List)}.
     */
    public final void testUpdateRoundRegistration() {
        // add registrations
        List<Long> coderIds = new ArrayList<Long>();
        coderIds.add(119676l);
        coderIds.add(8369898l);
        
        ah.updateRoundRegistration(basicADTO.getRoundId(), coderIds);

        Round r = DAOUtil.getFactory().getRoundDAO().find(basicADTO.getRoundId());
        
        // check registrations
        assertTrue("Round should have exactly two registrations", r.getRoundRegistrations().size() == 2);
        assertTrue("Round should have exactly two room results ", r.getRooms().iterator().next().getRoomResults().size() == 2);

        for (RoundRegistration rr : r.getRoundRegistrations()) {
            assertTrue("Invalid registration: " + rr.getId().getCoder().getId(), coderIds.contains(rr.getId().getCoder().getId()));
        }

        for (RoomResult rr : r.getRooms().iterator().next().getRoomResults()) {
            assertTrue("Invalid room result: " + rr.getId().getCoder().getId(), coderIds.contains(rr.getId().getCoder().getId()));
        }

        super.tearDown();
        super.setUp();

        coderIds.clear();
        // remove one, leave one and add one.
        coderIds.add(8369898l);
        coderIds.add(152342l);

        ah.updateRoundRegistration(basicADTO.getRoundId(), coderIds);

        r = DAOUtil.getFactory().getRoundDAO().find(basicADTO.getRoundId());
        
        // check registrations
        assertTrue("Round should have exactly two registrations", r.getRoundRegistrations().size() == 2);
        assertTrue("Round should have exactly two room results ", r.getRooms().iterator().next().getRoomResults().size() == 2);
        for (RoundRegistration rr : r.getRoundRegistrations()) {
            assertTrue("Invalid registration: " + rr.getId().getCoder().getId(), coderIds.contains(rr.getId().getCoder().getId()));
        }

        for (RoomResult rr : r.getRooms().iterator().next().getRoomResults()) {
            assertTrue("Invalid room result: " + rr.getId().getCoder().getId(), coderIds.contains(rr.getId().getCoder().getId()));
        }
    }


    
    /************************ PRIVATE HELPER METHODS ******************************/ 
    
    private void cleanUp() {
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

    
    private void checkSegments(Round r, Timestamp almostCurrent) {
        assertTrue("Round should have exactly five segments", r.getRoundSegments().size() == 5);

        for (RoundSegment rs : r.getRoundSegments()) {
            if (rs.getId().getSegmentId().equals(1l)) {
                assertTrue("(1) Wrong segment start time ", rs.getStartTime().after(almostCurrent));
                assertTrue("(1) Wrong segment end time ", rs.getEndTime().after(almostCurrent));
            } else {
                if (rs.getId().getSegmentId().equals(2l)) {
                    assertTrue("(2) Wrong segment start time ", rs.getStartTime().equals(basicADTO.getStartDate()));
                } else {
                    assertTrue("(3) Wrong segment start time : " + rs.getStartTime() + "should've been : " + basicADTO.getEndDate() + " for segment: " + rs.getId().getSegmentId(), rs.getStartTime().equals(basicADTO.getEndDate()));
                }
                assertTrue("(2) Wrong segment end time ", rs.getEndTime().equals(basicADTO.getEndDate()));
            }
            
            assertTrue("Wrong segment status ", rs.getStatus().equals(RoundSegment.FUTURE_STATUS));
        }
    }


    private void checkBasicData(Round r) {
        // check contest attributes
        assertTrue("Wrong contest name ", r.getContest().getName().equals(basicADTO.getClassroomName()));
        assertTrue("Wrong contest start ", r.getContest().getStartDate().equals(basicADTO.getStartDate()));
        assertTrue("Wrong contest end ", r.getContest().getEndDate().equals(basicADTO.getEndDate()));
        assertTrue("Wrong contest status ", r.getContest().getStatus().equals(Contest.FUTURE_STATUS));

        // check round attributes
        assertTrue("Wrong round name ", r.getName().equals(basicADTO.getAssignmentName()));
        assertTrue("Wrong round short name ", r.getShortName().equals(basicADTO.getAssignmentName()));
        assertTrue("Wrong round status ", r.getStatus().equals(Round.FUTURE_STATUS));
        assertTrue("Wrong round registration limit ", r.getRegistrationLimit().equals(1024l));
        assertTrue("Wrong round invitational ", r.getInvitational().equals(0));
        assertTrue("Wrong round type ", r.getType().equals(DAOUtil.getFactory().getRoundTypeDAO().find(RoundType.EDUCATION_ROUND_TYPE)));
        assertTrue("Wrong round rated ", r.getRated().equals(0));
        
        // check room attributes
        assertTrue("Round should have exactly one room", r.getRooms().size() == 1);
        Room rm = r.getRooms().iterator().next();
        
        assertTrue("Wrong room name ", rm.getName().equals("Room 1"));
        assertTrue("Wrong room division ", rm.getDivisionId().equals(1));
        assertTrue("Wrong room type ", rm.getRoomTypeId().equals(2));
        assertTrue("Wrong room eligible ", rm.getEligible().equals(1));
        assertTrue("Wrong room unrated ", rm.getUnrated().equals(0));

        // check properties
        assertTrue("Wrong classroom property ", ((Long) r.getProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID)).equals(basicADTO.getClassroomId()));
        assertTrue("Wrong coding phase property ", ((Long) r.getProperty(RoundProperty.CODING_PHASE_LENGTH_PROPERTY_ID)).equals(basicADTO.getCoderPhaseLength()));
        assertTrue("Wrong show all scores property ", ((Long) r.getProperty(RoundProperty.SHOW_ALL_SCORES_PROPERTY_ID)).equals(basicADTO.getShowAllScores()));
        assertTrue("Wrong score type property ", ((Long) r.getProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID)).equals(basicADTO.getScoreType()));
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

    private Classroom createClassroomForUpdate() {
        // create or clean professor first
        User u = DAOUtil.getFactory().getUserDAO().find("bauna", true);
        Professor p = u.getProfessor();

        // create classroom with registrations
        
        Coder s = DAOUtil.getFactory().getCoderDAO().find(119676l);
        Coder s2 = DAOUtil.getFactory().getCoderDAO().find(8369898l);

        Classroom c = new Classroom();
        c.setName("test classroom 2");
        c.setAcademicPeriod("test academic 2");
        c.setDescription("test 2");
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

    private void updateBasicAssignmentDTO(AssignmentDTO adto) {
        Classroom c = createClassroomForUpdate();
        
        adto.setClassroomId(c.getId());
        adto.setClassroomName(c.getName());
        adto.setSchoolName(c.getSchool().getName());

        adto.setAssignmentName("test assignment name 2");
        adto.setStartDate(new Timestamp((new Date()).getTime() + 1000000));
        adto.setEndDate(new Timestamp((new Date()).getTime() + 1200000));
        adto.setCoderPhaseLength(100l);
        adto.setShowAllScores(2l);
        adto.setScoreType(3l);
        
        // update the components
        for (ComponentDTO cdto : adto.getComponents()) {
            if (cdto.getComponentId().equals(6l)) {
                adto.getComponents().remove(cdto);
            } else if (cdto.getComponentId().equals(5l)) {
                cdto.setPoints(null);
            } else if (cdto.getComponentId().equals(7l)) {
                cdto.setPoints(900d);
            }
        }
        adto.addComponent(new ComponentDTO(8l, 1200d, "getLongValue"));
        
        // fill the languages
        List<Integer> languageList = new ArrayList<Integer>();

        languageList.clear();
        languageList.add(Language.JAVA_LANGUAGE);
        languageList.add(Language.CSHARP_LANGUAGE);
        adto.setLanguages(languageList);
        
    }
}
