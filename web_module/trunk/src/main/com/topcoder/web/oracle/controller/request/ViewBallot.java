package com.topcoder.web.oracle.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class ViewBallot extends ShortHibernateProcessor {
    protected final void dbProcessing() throws Exception {

        if (userLoggedIn()) {
            String roundId = getRequest().getParameter(Constants.ROUND_ID);
            String roomId = getRequest().getParameter(Constants.ROOM_ID);
            if ("".equals(StringUtils.checkNull(roomId)) && "".equals(StringUtils.checkNull(roundId))) {
                throw new NavigationException("No round or room specified");
            } else {

                Room room=null;

                Round round;
                if (!"".equals(StringUtils.checkNull(roomId))) {
                    Integer rid;
                    try {
                        rid = new Integer(roomId);
                    } catch (NumberFormatException e) {
                        throw new NavigationException("Invalid room specified");
                    }
                    room = OracleDAOUtil.getFactory().getRoomDAO().find(rid);
                    if (room == null) {
                        throw new NavigationException("Invalid room specified");
                    }
                    round = room.getRound();
                } else {
                    Integer rid;
                    try {
                        rid = new Integer(roundId);
                    } catch (NumberFormatException e) {
                        throw new NavigationException("Invalid round specified");
                    }
                    List<RoomResult> rrs = OracleDAOUtil.getFactory().getRoomResultDAO().getResults(getUser().getId(), rid);
                    if (rrs.isEmpty()) {
                        round = OracleDAOUtil.getFactory().getRoundDAO().find(rid);
                    } else if (rrs.size() > 1) {
                        throw new NavigationException("User assigned to " + rrs.size() + " rooms");
                    } else {
                        room = rrs.get(0).getRoom();
                        round = room.getRound();
                    }
                }


                if (ContestStatus.ACTIVE.equals(round.getContest().getStatus().getId())) {
                    if (RoundStatus.ACTIVE.equals(round.getStatus().getId())) {
                        if (OracleDAOUtil.getFactory().getRoundRegistrationDAO().find(round.getId(), getUser().getId()) != null) {
                            if (room==null) {
                                throw new NavigationException("User not assigned to a room");
                            } else if (OracleDAOUtil.getFactory().getPredictionDAO().alreadyCompeted(getUser().getId(), room.getId())) {
                                StringBuffer buf = new StringBuffer(50);
                                buf.append(getSessionInfo().getServletPath());
                                buf.append("?" + Constants.MODULE_KEY + "=ViewCompletedBallot&");
                                buf.append(Constants.ROOM_ID).append("=").append(room.getId());
                                setNextPage(buf.toString());
                                setIsNextPageInContext(false);
                            } else {
                                Date now = new Date();
                                if (round.getPhase(Phase.SUBMISSION).getStartTime().before(now)) {
                                    if (round.getPhase(Phase.SUBMISSION).getEndTime().after(now)) {
                                        ballotProcessing(room);
                                    } else {
                                        throw new NavigationException("Sorry, the submission phase is over.");
                                    }
                                } else {
                                    throw new NavigationException("Sorry, the submission phase has not started.");
                                }

                            }
                        } else {
                            StringBuffer buf = new StringBuffer(50);
                            buf.append(getSessionInfo().getServletPath());
                            buf.append("?" + Constants.MODULE_KEY + "=ViewRegistration&");
                            buf.append(Constants.ROUND_ID).append("=").append(round.getId());
                            setNextPage(buf.toString());
                            setIsNextPageInContext(false);
                        }
                    } else {
                        throw new NavigationException("Invalid round specified.");
                    }
                } else {
                    throw new NavigationException("Invalid contest specified.");
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }

    protected void ballotProcessing(Room room) throws Exception {
        loadData(room);
        setNextPage("/ballot.jsp");
        setIsNextPageInContext(true);

    }


    /**
     * load up the candidates in appropriate random order
     * it should be the same random order for a particular user every
     * time they look at the candidates for a particular round
     *
     * @param room the room to load data for
     */
    protected final void loadData(Room room) {
        List<Candidate> candidates =
                OracleDAOUtil.getFactory().getCandidateDAO().getCandidates(room.getId(), getUser().getId());
        Collections.sort(candidates, new Candidate.IDComparator());
        Collections.shuffle(candidates, new Random(getUser().getId() + room.getId()));
        getRequest().setAttribute("candidates", candidates);
        getRequest().setAttribute("room", room);
        setDefault(Constants.ROOM_ID, room.getId());

    }

}
