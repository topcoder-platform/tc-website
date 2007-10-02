/*
* ArenaHelper
*
* Created Oct 2, 2007
*/
package com.topcoder.web.ep.controller.request;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.Contest;
import com.topcoder.web.common.model.algo.Room;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundComponent;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.algo.RoundSegment;
import com.topcoder.web.common.model.algo.RoundType;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ArenaHelper implements ArenaServices {

    /**
     * @param roundId 
     * @param c
     * @param lc
     * @param points 
     * @param startDate
     * @param endDate
     * @param assignmentName
     * @param coderPhaseLength
     * @param showAllScores
     * @param scoreType
     * @param languages 
     */
    public void addNewAssignment(Long classroomId, String classroomName, List<Long> components, List<Double> points, 
            Timestamp startDate, Timestamp endDate, String assignmentName, Long coderPhaseLength, Long showAllScores, 
            Long scoreType, List<Integer> languages) {
        
        // create new contest
        Contest ct = createContest(classroomName, startDate, endDate);
        
        // create new round
        Round r = createRound(assignmentName, ct);
        
        // add default room to the round
        addRoom(r);
        
        // assign custom properties to round 
        assignProperties(r, classroomId, coderPhaseLength, showAllScores, scoreType);
        
        // create default segments for the round
        assignSegments(r, startDate, endDate);

        // add selected components to the round
        addComponents(r, components, points);

        // add selected languages to the round
        addLanguages(r, languages);

        DAOUtil.getFactory().getRoundDAO().saveOrUpdate(r);
    }

    
    /**
     * @param roundId 
     * @param c
     * @param lc
     * @param startDate
     * @param endDate
     * @param assignmentName
     * @param coderPhaseLength
     * @param showAllScores
     * @param scoreType
     * @param languages 
     */
    public void editAssignment(Long roundId, Long classroomId, String classroomName, List<Long> components, List<Double> points, Timestamp startDate, Timestamp endDate, String assignmentName, Long coderPhaseLength, Long showAllScores, Long scoreType, List<Integer> languages) {
        Round r = DAOUtil.getFactory().getRoundDAO().find(roundId);
        
        r.setName(assignmentName);

        // update contest dates and name
        updateContest(classroomName, startDate, endDate, r);
        
        // update properties values
        updateRoundProperties(classroomId, coderPhaseLength, showAllScores, scoreType, r);

        // update segments dates
        r.updateSegmentsDates(startDate, endDate);

        // now update components
        updateRoundComponents(components, points, r);

        // finally update languages
        updateLanguages(languages, r);

        DAOUtil.getFactory().getRoundDAO().saveOrUpdate(r);
    }

    
    /**
     * @param r
     * @param languages
     */
    private static void addLanguages(Round r, List<Integer> languages) {
        for (Integer i : languages) {
            r.addLanguage(DAOUtil.getFactory().getLanguageDAO().find(i));
        }
    }

    /**
     * @param r
     * @param components
     * @param points
     */
    private static void addComponents(Round r, List<Long> components, List<Double> points) {
        int j = 0;
        for (Long cid : components) {
            Component cm = DAOUtil.getFactory().getComponentDAO().find(cid);
            RoundComponent rcm = new RoundComponent();
            rcm.getId().setComponent(cm);
            rcm.setDivisionId(1);
            rcm.setDifficulty(cm.getProblem().getProposedDifficulty());
            rcm.setPoints(points.get(j) != null ? points.get(j) : cm.getProblem().getProposedDifficulty().getPointValue());
            r.addComponent(rcm);
            j++;
        }
    }

    /**
     * @param r
     * @param startDate
     * @param endDate
     * @param current
     */
    private static void assignSegments(Round r, Timestamp startDate, Timestamp endDate) {
        Timestamp current = new Timestamp((new Date()).getTime());

        for (int i = 1; i < 6; i++) {
            RoundSegment rs = new RoundSegment();
            rs.setStartTime(i == 1 ? current : startDate);
            rs.setEndTime(i == 1 ? current : endDate);
            rs.setStatus(RoundSegment.FUTURE_STATUS);
            rs.getId().setSegmentId(new Long(i));
            r.addSegment(rs);
        }
    }

    /**
     * @param r
     * @param c
     * @param coderPhaseLength
     * @param showAllScores
     * @param scoreType
     */
    private static void assignProperties(Round r, Long classroomId, Long coderPhaseLength, Long showAllScores, Long scoreType) {
        r.addProperty(RoundProperty.CLASSROOM_ID, classroomId);
        r.addProperty(RoundProperty.CODING_PHASE_LENGTH, coderPhaseLength);
        r.addProperty(RoundProperty.SHOW_ALL_SCORES, showAllScores);
        r.addProperty(RoundProperty.SCORE_TYPE, scoreType);
    }

    /**
     * @param r
     */
    private static void addRoom(Round r) {
        Room rm = new Room();
        rm.setRound(r);
        rm.setName("Room 1");
        rm.setDivisionId(1);
        rm.setRoomTypeId(2);
        rm.setEligible(1);
        rm.setUnrated(0);
        
        r.addRoom(rm);
    }

    /**
     * @param assignmentName
     * @param ct
     * @return
     */
    private static Round createRound(String assignmentName, Contest ct) {
        Round r = new Round();
        r.setContest(ct);
        r.setName(assignmentName);
        r.setStatus(Round.FUTURE_STATUS);
        r.setRegistrationLimit(1024l);
        r.setInvitational(0);
        r.setType(DAOUtil.getFactory().getRoundTypeDAO().find(RoundType.EDUCATION_ROUND_TYPE));
        r.setRated(0);
        return r;
    }

    /**
     * @param c
     * @param startDate
     * @param endDate
     * @return
     */
    private static Contest createContest(String classroomName, Timestamp startDate, Timestamp endDate) {
        Contest ct = new Contest();
        ct.setName(classroomName);
        ct.setStartDate(startDate);
        ct.setEndDate(endDate);
        ct.setStatus(Contest.FUTURE_STATUS);

        DAOUtil.getFactory().getContestDAO().saveOrUpdate(ct);
        return ct;
    }

    /**
     * @param languages
     * @param r
     */
    private static void updateLanguages(List<Integer> languages, Round r) {
        r.clearLanguages();
        addLanguages(r, languages);
    }

    /**
     * @param lc
     * @param points
     * @param r
     */
    private static void updateRoundComponents(List<Long> components, List<Double> points, Round r) {
        List<RoundComponent> removeList = new ArrayList<RoundComponent>();
        // first remove deleted components
        for (RoundComponent rc : r.getRoundComponents()) {
            if (!components.contains(rc.getId())) {
                // removeit
                removeList.add(rc);
            } else {
                // update
                //Component updateComponent = components.get(components.indexOf(rc.getId().getComponent()));
                Double updatePoints = points.get(components.indexOf(rc.getId()));
                
                rc.setPoints(updatePoints != null ? updatePoints : rc.getId().getComponent().getProblem().getProposedDifficulty().getPointValue());
                
                // take them out from the list
                points.remove(components.indexOf(rc.getId()));
                components.remove(rc.getId());
            }
        }

        for (RoundComponent rc : removeList) {
            r.removeRoundComponent(rc);
            rc.getId().getComponent().removeRoundComponent(rc);
        }

        // add new
        int j = 0;
        for (Long cid : components) {
            Component cm = DAOUtil.getFactory().getComponentDAO().find(cid);
            RoundComponent rcm = new RoundComponent();
            rcm.getId().setComponent(cm);
            rcm.setDivisionId(1);
            rcm.setDifficulty(cm.getProblem().getProposedDifficulty());
            rcm.setPoints(points.get(j) != null ? points.get(j) : cm.getProblem().getProposedDifficulty().getPointValue());
            r.addComponent(rcm);
            j++;
        }
    }

    /**
     * @param c
     * @param coderPhaseLength
     * @param showAllScores
     * @param scoreType
     * @param r
     */
    private static void updateRoundProperties(Long classroomId, Long coderPhaseLength, Long showAllScores, Long scoreType, Round r) {
        r.editProperty(RoundProperty.CLASSROOM_ID, classroomId);
        r.editProperty(RoundProperty.CODING_PHASE_LENGTH, coderPhaseLength);
        r.editProperty(RoundProperty.SHOW_ALL_SCORES, showAllScores);
        r.editProperty(RoundProperty.SCORE_TYPE, scoreType);
    }

    /**
     * @param c
     * @param startDate
     * @param endDate
     * @param r
     */
    private static void updateContest(String classroomName, Timestamp startDate, Timestamp endDate, Round r) {
        Contest ct = r.getContest();
        ct.setName(classroomName);
        ct.setStartDate(startDate);
        ct.setEndDate(endDate);

        DAOUtil.getFactory().getContestDAO().saveOrUpdate(ct);
    }
}
