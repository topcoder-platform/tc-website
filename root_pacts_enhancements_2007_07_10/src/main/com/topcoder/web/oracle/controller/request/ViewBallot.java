package com.topcoder.web.oracle.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
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
            String roomId = getRequest().getParameter(Constants.ROOM_ID);
            if ("".equals(StringUtils.checkNull(roomId))) {
                throw new NavigationException("No room specified");
            } else {

                OracleDAOFactory f = OracleDAOUtil.getFactory();
                Room room = null;

                Round round;
                Integer rid;
                try {
                    rid = new Integer(roomId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid room specified");
                }
                room = f.getRoomDAO().find(rid);
                if (room == null) {
                    throw new NavigationException("Invalid room specified");
                }
                round = room.getRound();
                if (ContestStatus.ACTIVE.equals(round.getContest().getStatus().getId())) {
                    if (RoundStatus.ACTIVE.equals(round.getStatus().getId())) {
                        if (f.getPredictionDAO().alreadyCompeted(getUser().getId(), room.getId())) {
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
                                    if (f.getRoundRegistrationDAO().find(round.getId(), getUser().getId()) != null) {
                                        if (f.getRoomResultDAO().find(room.getId(), getUser().getId()) == null) {
                                            throw new NavigationException("User not assigned to a room.");
                                        } else {
                                            ballotProcessing(room);
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
                                    throw new NavigationException("Sorry, the submission phase is over.");
                                }
                            } else {
                                throw new NavigationException("Sorry, the submission phase has not started.");
                            }
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
     * time they look at the candidates for a particular room
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
