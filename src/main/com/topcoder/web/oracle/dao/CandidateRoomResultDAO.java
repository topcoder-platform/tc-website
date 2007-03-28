package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateRoomResult;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public interface CandidateRoomResultDAO {
    void saveOrUpdate(CandidateRoomResult crr);

    CandidateRoomResult find(Integer roomId, Integer candidateId);

    CandidateRoomResult find(Room room, Candidate candidate);

    List<CandidateRoomResult> getResults(Round round);

    List<CandidateRoomResult> getResults(Integer roundId);
}
