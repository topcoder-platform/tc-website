package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class AssignCandidates extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        //take round
        //assign candidates to rooms in round


/*
        ArrayList<Candidate> candidates = new ArrayList<Candidate>();
        Candidate can;
        for (int i = 0; i < candidateCount; i++) {
            can = new Candidate();
            can.setName("gp candidate " + (i + 1));
            candidates.add(can);

        }
        CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
        CandidateRoomAssigner ra = new RandomAssigner();
        List<Room> l = ra.createAssignments(candidates, r, candidateCount);
        for (Room myRoom : l) {
            log.debug("adding " + myRoom.getName());
            r.addRoom(myRoom);
            for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                cDAO.saveOrUpdate(crr.getCandidate());
            }
        }
*/


    }
}
