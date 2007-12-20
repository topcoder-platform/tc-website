package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface RoomDAO {
    /**
     * Given a round id, find the room with the fewest number of competitors.
     *
     * @param roundId the round
     * @return the room with the fewest number of competitors
     */
    Room findSmallestRoom(Integer roundId);

    /**
     * Given a round, find the room with the fewest number of competitors.
     *
     * @param round the round
     * @return the room with the fewest number of competitors
     */
    Room findSmallestRoom(Round round);

    void saveOrUpdate(Room r);

    Room find(Integer id);


}
