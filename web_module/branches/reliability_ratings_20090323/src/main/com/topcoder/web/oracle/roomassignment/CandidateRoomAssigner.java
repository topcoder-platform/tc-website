package com.topcoder.web.oracle.roomassignment;

import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;

import java.util.Collection;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public interface CandidateRoomAssigner {
    List<Room> createAssignments(Collection<Candidate> candidates, Round round, int roomSize);

}
