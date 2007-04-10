package com.topcoder.web.oracle.roomassignment;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateRoomResult;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Random;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public class RandomAssigner implements CandidateRoomAssigner {
    protected static final Logger log = Logger.getLogger(RandomAssigner.class);

    public List<Room> createAssignments(Collection<Candidate> candidates, Round round, int roomSize) {
        int roomCount = candidates.size() % roomSize == 0 ? candidates.size() / roomSize : candidates.size() / roomSize + 1;
        if (log.isDebugEnabled()) {
            log.debug("got " + roomCount + " rooms to create with a room size of " + roomSize);
        }
        Room[] rooms = new Room[roomCount];
        for (int i = 0; i < rooms.length; i++) {
            rooms[i] = new Room();
            rooms[i].setName("Room " + (i + 1));
        }

        CandidateRoomResult res;
        if (roomCount == 1) {
            for (Candidate c : candidates) {
                res = new CandidateRoomResult(c);
                rooms[0].addCandidateResult(res);
            }
        } else {
            Random generator = new Random();
            int roomIdx;
            for (Candidate c : candidates) {
                roomIdx = generator.nextInt(roomCount);
                res = new CandidateRoomResult(c);
                rooms[roomIdx].addCandidateResult(res);
            }
        }
        return Arrays.asList(rooms);

    }
}
