package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.oracle.roomassignment.CandidateRoomAssigner;
import com.topcoder.web.oracle.roomassignment.RandomAssigner;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class AdvanceCandidates extends Base {

    protected void dbProcessing() throws Exception {

        //todo take which class to use for assignment from user
        inputValidation();

        if (!hasErrors()) {
            Round r = OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(getRequest().getParameter(Constants.ROUND_ID)));
            Round pr = OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(getRequest().getParameter(Constants.PRIOR_ROUND_ID)));

            List<Candidate> cans = new ArrayList<Candidate>();
            Candidate c;
            for (CandidateRoomResult crr : OracleDAOUtil.getFactory().getCandidateRoomResultDAO().getResults(pr)) {
                if (crr.advanced()) {
                    cans.add(crr.getCandidate());
                }
            }

            CandidateRoomAssigner ra = new RandomAssigner();
            List<Room> l = ra.createAssignments(cans, r, new Integer(r.getConfigMap().get(RoundProperty.MAX_ROOM_SIZE)));
            for (Room myRoom : l) {
                r.addRoom(myRoom);
            }

            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=AdminViewRound&");
            buf.append(Constants.ROUND_ID).append("=").append(r.getId());
            setNextPage(buf.toString());
            setIsNextPageInContext(false);


        } else {
            Round r = OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(getRequest().getParameter(Constants.ROUND_ID)));

            loadEditRoundData(r);

            setNextPage("/admin/editRound.jsp");
            setIsNextPageInContext(true);
        }
    }

    private void inputValidation() throws NavigationException {
        Integer roundId;
        try {
            roundId = new Integer(getRequest().getParameter(Constants.ROUND_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid round specified");
        }
        Round r = OracleDAOUtil.getFactory().getRoundDAO().find(roundId);
        if (r == null) {
            throw new NavigationException("Invalid round specified");
        } else {
            if (!r.getConfigMap().containsKey(RoundProperty.MAX_ROOM_SIZE)) {
                addError(Constants.STUDIO_CONTEST_ID, "Round must have max room size set to add candidates.");
            }
        }

        Integer priorRoundId = null;
        try {
            priorRoundId = new Integer(getRequest().getParameter(Constants.PRIOR_ROUND_ID));
        } catch (NumberFormatException e) {
            addError(Constants.PRIOR_ROUND_ID, "Please choose a valid round.");
        }
        if (priorRoundId != null) {
            Round pr = OracleDAOUtil.getFactory().getRoundDAO().find(priorRoundId);
            if (pr == null) {
                addError(Constants.PRIOR_ROUND_ID, "Please choose a valid round.");
            }
        }


    }


}


