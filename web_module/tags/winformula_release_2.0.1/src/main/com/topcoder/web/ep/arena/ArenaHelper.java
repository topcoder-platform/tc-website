/*
* ArenaHelper
*
* Created Oct 2, 2007
*/
package com.topcoder.web.ep.arena;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.shared.round.events.RoundCreatedEvent;
import com.topcoder.shared.round.events.RoundEvent;
import com.topcoder.shared.round.events.RoundEventException;
import com.topcoder.shared.round.events.RoundEventFactory;
import com.topcoder.shared.round.events.RoundEventPublisher;
import com.topcoder.shared.round.events.RoundModifiedEvent;
import com.topcoder.shared.round.events.RoundModifiedEvent.RegistrationModification;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.Contest;
import com.topcoder.web.common.model.algo.Room;
import com.topcoder.web.common.model.algo.RoomResult;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.RoundComponent;
import com.topcoder.web.common.model.algo.RoundProperty;
import com.topcoder.web.common.model.algo.RoundRegistration;
import com.topcoder.web.common.model.algo.RoundSegment;
import com.topcoder.web.common.model.algo.RoundType;
import com.topcoder.web.ep.dto.AssignmentDTO;
import com.topcoder.web.ep.dto.ComponentDTO;

/**
 * This is the hibernate implementation for the Arena services provider
 *  
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ArenaHelper implements ArenaServices {

    private static Logger log = Logger.getLogger(ArenaHelper.class);

    boolean sendEvent = true;
    
    /**
     * This method will update the assignment registrations to what specified adding or removing existing registrations when corresponds.
     * 
     * Notes: this method assume all validations took place and that the actions can be done at this time.
     * These validations include:
     * - The round is not started or finished for registration remove
     * - The round is not finished for registrations addition
     * - The performer of the action is authorized
     * 
     * @param roundId the round id of the registration 
     * @param coderIds the list of coderIds that are registered 
     */
    public void updateRoundRegistration(Long roundId, List<Long> coderIds) {
        List<Long> tempIds = new ArrayList<Long>(coderIds);
        Round r = DAOUtil.getFactory().getRoundDAO().find(roundId);

        // first we want to get the intersection of the new coders collection and the one in the DB
        List<Long> existingCodersIds = new ArrayList<Long>();
        List<Long> intersectionCodersIds = new ArrayList<Long>();
        for (RoundRegistration rr : r.getRoundRegistrations()) {
            existingCodersIds.add(rr.getId().getCoder().getId());
            intersectionCodersIds.add(rr.getId().getCoder().getId());
        }

        intersectionCodersIds.retainAll(tempIds);
        existingCodersIds.removeAll(intersectionCodersIds);
        tempIds.removeAll(intersectionCodersIds);
        
        // three cases:
        // coders in intersection : do nothing
        // coders in tempIds : add
        // coders in existingCodersIds : remove
        
        // remove
        removeRegistrations(r, existingCodersIds);

        // add
        addRegistrations(r, tempIds);

        DAOUtil.getFactory().getRoundDAO().saveOrUpdate(r);

        HibernateUtils.getSession().flush();
        HibernateUtils.commit();
        HibernateUtils.begin();

        // notify arena
        RoundModifiedEvent event = createRegistrationUpdateEvent(r, tempIds,
                existingCodersIds);
        publishEvent(event);

    }

    /**
     * This method will create all Arena related objects as specified to 
     * emulate the education platform assignment
     * 
     * @param adto the assignment data transfer object to add 
     */
    public void addNewAssignment(AssignmentDTO adto) {
        
        // create new contest
        Contest ct = createContest(adto.getClassroomName(), adto.getStartDate(), adto.getEndDate());
        
        // create new round
        Round r = createRound(adto.getAssignmentName(), ct);
        
        // add default room to the round
        addRoom(r);
        
        // assign custom properties to round 
        assignProperties(r, adto.getClassroomId(), adto.getCoderPhaseLength(), adto.getShowAllScores(), adto.getScoreType());
        
        // create default segments for the round
        assignSegments(r, adto.getStartDate(), adto.getEndDate());

        // add selected components to the round
        addComponents(r, adto.getComponents());

        // add selected languages to the round
        addLanguages(r, adto.getLanguages());

        DAOUtil.getFactory().getRoundDAO().saveOrUpdate(r);
        HibernateUtils.getSession().flush();
        HibernateUtils.commit();        
        HibernateUtils.begin();

        adto.setRoundId(r.getId());
        
        // notify arena
        RoundCreatedEvent event = new RoundCreatedEvent(r.getId().intValue());
        publishEvent(event);
    }

    /**
     * This method will update all Arena related objects as specified to 
     * emulate the education platform assignment
     *
     * Notes: this method assume all validations took place and that the actions can be done at this time.
     * These validations include:
     * - The round is not started.
     * - The performer of the action is authorized
     * 
     * @param adto the assignment data transfer object to update 
     */
    public void editAssignment(AssignmentDTO adto) {
        Round r = DAOUtil.getFactory().getRoundDAO().find(adto.getRoundId());
        
        r.setName(adto.getAssignmentName());
        r.setShortName(adto.getAssignmentName());

        // update contest dates and name
        updateContest(adto.getClassroomName(), adto.getStartDate(), adto.getEndDate(), r);
        
        // update properties values
        updateRoundProperties(adto.getClassroomId(), adto.getCoderPhaseLength(), adto.getShowAllScores(), adto.getScoreType(), r);

        // update segments dates
        r.updateSegmentsDates(adto.getStartDate(), adto.getEndDate());

        // now update components
        updateRoundComponents(adto.getComponents(), r);

        // finally update languages
        updateLanguages(adto.getLanguages(), r);
        

        DAOUtil.getFactory().getRoundDAO().saveOrUpdate(r);
        
        HibernateUtils.getSession().flush();
        HibernateUtils.commit();        
        HibernateUtils.begin();

        // notify arena
        RoundModifiedEvent event = new RoundModifiedEvent(r.getId().intValue());
        event.addModification(new RoundModifiedEvent.ScheduleModification());
        publishEvent(event);
    }


    private void addLanguages(Round r, List<Integer> languages) {
        for (Integer i : languages) {
            r.addLanguage(DAOUtil.getFactory().getLanguageDAO().find(i));
        }
    }

    private void addComponents(Round r, List<ComponentDTO> components) {
        int j = 0;
        for (ComponentDTO cdto : components) {
            Component cm = DAOUtil.getFactory().getComponentDAO().find(cdto.getComponentId());
            RoundComponent rc = new RoundComponent();
            rc.getId().setComponent(cm);
            rc.setDivisionId(1);
            rc.setDifficulty(cm.getProblem().getProposedDifficulty());
            rc.setPoints(cdto.getPoints() != null ? cdto.getPoints() : cm.getProblem().getProposedDifficulty().getPointValue());
            r.addComponent(rc);
            j++;
        }
    }

    private void assignSegments(Round r, Timestamp startDate, Timestamp endDate) {
        Timestamp current = new Timestamp((new Date()).getTime());

        for (int i = 1; i < 6; i++) {
            RoundSegment rs = new RoundSegment();
            
            rs.setStartTime(i == 1 ? current : ((i == 2) ? startDate : endDate));
            rs.setEndTime(i == 1 ? current : endDate);
            rs.setStatus(RoundSegment.FUTURE_STATUS);
            rs.getId().setSegmentId(new Long(i));
            r.addSegment(rs);
        }
    }

    private void assignProperties(Round r, Long classroomId, Long coderPhaseLength, Long showAllScores, Long scoreType) {
        r.addProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID, classroomId);
        r.addProperty(RoundProperty.CODING_PHASE_LENGTH_PROPERTY_ID, coderPhaseLength);
        r.addProperty(RoundProperty.SHOW_ALL_SCORES_PROPERTY_ID, showAllScores);
        r.addProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID, scoreType);
    }

    private void addRoom(Round r) {
        Room rm = new Room();
        rm.setRound(r);
        rm.setName("Room 1");
        rm.setDivisionId(1);
        rm.setRoomTypeId(2);
        rm.setEligible(1);
        rm.setUnrated(0);
        
        r.addRoom(rm);
    }

    private Round createRound(String assignmentName, Contest ct) {
        Round r = new Round();
        r.setContest(ct);
        r.setName(assignmentName);
        r.setShortName(assignmentName);
        r.setStatus(Round.FUTURE_STATUS);
        r.setRegistrationLimit(1024l);
        r.setInvitational(0);
        r.setType(DAOUtil.getFactory().getRoundTypeDAO().find(RoundType.EDUCATION_ROUND_TYPE));
        r.setRated(0);
        return r;
    }

    private Contest createContest(String classroomName, Timestamp startDate, Timestamp endDate) {
        Contest ct = new Contest();
        ct.setName(classroomName);
        ct.setStartDate(startDate);
        ct.setEndDate(endDate);
        ct.setStatus(Contest.FUTURE_STATUS);

        DAOUtil.getFactory().getContestDAO().saveOrUpdate(ct);
        return ct;
    }

    private void updateLanguages(List<Integer> languages, Round r) {
        r.clearLanguages();
        addLanguages(r, languages);
    }

    private void updateRoundComponents(List<ComponentDTO> components, Round r) {
        List<RoundComponent> removeList = new ArrayList<RoundComponent>();
        // first remove deleted components
        for (RoundComponent rc : r.getRoundComponents()) {
            if (!components.contains(new ComponentDTO(rc.getId().getComponent().getId()))) {
                // remove it
                removeList.add(rc);
            } else {
                ComponentDTO cdto = components.get(components.indexOf(new ComponentDTO(rc.getId().getComponent().getId()))); 

                // update points
                rc.setPoints(cdto.getPoints() != null ? cdto.getPoints() : rc.getId().getComponent().getProblem().getProposedDifficulty().getPointValue());
                
                // take them out from the list
                components.remove(cdto);
            }
        }

        for (RoundComponent rc : removeList) {
            log.debug("Removing RoundComponent: " + rc.getId().getRound().getId() + ", " + rc.getId().getComponent().getId());
            r.removeRoundComponent(rc);
            rc.getId().getComponent().removeRoundComponent(rc);
        }

        // add new
        int j = 0;
        for (ComponentDTO cdto: components) {
            Component cm = DAOUtil.getFactory().getComponentDAO().find(cdto.getComponentId());
            RoundComponent rcm = new RoundComponent();
            rcm.getId().setComponent(cm);
            rcm.setDivisionId(1);
            rcm.setDifficulty(cm.getProblem().getProposedDifficulty());
            rcm.setPoints(cdto.getPoints() != null ? cdto.getPoints() : cm.getProblem().getProposedDifficulty().getPointValue());
            r.addComponent(rcm);
            j++;
        }
    }

    private void updateRoundProperties(Long classroomId, Long coderPhaseLength, Long showAllScores, Long scoreType, Round r) {
        r.editProperty(RoundProperty.CLASSROOM_ID_PROPERTY_ID, classroomId);
        r.editProperty(RoundProperty.CODING_PHASE_LENGTH_PROPERTY_ID, coderPhaseLength);
        r.editProperty(RoundProperty.SHOW_ALL_SCORES_PROPERTY_ID, showAllScores);
        r.editProperty(RoundProperty.SCORE_TYPE_PROPERTY_ID, scoreType);
    }

    private void updateContest(String classroomName, Timestamp startDate, Timestamp endDate, Round r) {
        Contest ct = r.getContest();
        ct.setName(classroomName);
        ct.setStartDate(startDate);
        ct.setEndDate(endDate);

        DAOUtil.getFactory().getContestDAO().saveOrUpdate(ct);
    }
    
    
    private void publishEvent(RoundEvent event) {
        if (isSendEvent()) {
            try {
                RoundEventInitializer.ensureInitialized();
                RoundEventPublisher pub = RoundEventFactory.getFactory().createPublisher("EDUCATION_CRUD");
                pub.publishEvent(event);
            } catch (RoundEventException e) {
                log.error("Could not notify round created event",e);
            }
        } else {
            log.debug("Skipping sending the event to the Arena");
        }
    }

    private RoundModifiedEvent createRegistrationUpdateEvent(Round r,
            List<Long> coderIds, List<Long> existingCodersIds) {
        RoundModifiedEvent event = new RoundModifiedEvent(r.getId().intValue());
                
        // coders in coderIds : add
        // coders in existingCodersIds : remove

        int[] addIds = new int[coderIds.size()];
        int[] removeIds = new int[existingCodersIds.size()];
        
        int i = 0;
        for (Long id : coderIds) {
            addIds[i] = id.intValue();
            i++;
        }
        
        i = 0;
        for (Long id : existingCodersIds) {
            removeIds[i] = id.intValue();
            i++;
        }
           
        event.addModification(new RegistrationModification(addIds, removeIds));
        return event;
    }    

    private void addRegistrations(Round r, List<Long> coderIds) {
        for (Long coderId : coderIds) {
            // get entities:
            Coder c = DAOUtil.getFactory().getCoderDAO().find(coderId);
            
            RoundRegistration rr = new RoundRegistration();
            
            rr.getId().setCoder(c);
            rr.setTimestamp(new Timestamp((new Date()).getTime()));
            rr.setEligible(1);
            rr.setTeamId(null);
            
            r.addRegistration(rr);
            
            RoomResult rmr = new RoomResult();
            rmr.getId().setCoder(c);
            rmr.getId().setRound(r);

            // there's only one room in this kind of round
            Room rm = r.getRooms().iterator().next();
            
            rmr.setRoomSeed(0);
            rmr.setOldRating(0);
            rmr.setNewRating(0);
            rmr.setPaid(0d);
            rmr.setRoomPlaced(0);
            rmr.setDivisionPlaced(0);
            rmr.setAttended("N");
            rmr.setAdvanced("N");
            rmr.setOverallRank(0);
            rmr.setPointTotal(0d);
            rmr.setDivisionSeed(0);

            rm.addResult(rmr);
        }
    }

    private void removeRegistrations(Round r, List<Long> existingCodersIds) {
        for (Long coderId : existingCodersIds) {
            Coder c = DAOUtil.getFactory().getCoderDAO().find(coderId);
            RoundRegistration rr = new RoundRegistration();
            rr.getId().setCoder(c);
            rr.getId().setRound(r);
            
            r.removeRegistration(rr);

            Room rm = r.getRooms().iterator().next();

            RoomResult rs = new RoomResult();
            rs.getId().setCoder(c);
            rs.getId().setRoom(rm);
            rs.getId().setRound(r);

            rm.removeResult(rs);
        }
    }

    public boolean isSendEvent() {
        return sendEvent;
    }

    public void setSendEvent(boolean sendEvent) {
        this.sendEvent = sendEvent;
    }
}
