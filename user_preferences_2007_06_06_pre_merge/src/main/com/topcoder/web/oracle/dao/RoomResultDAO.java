package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.*;
import com.topcoder.web.common.model.User;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 28, 2007
 */
public interface RoomResultDAO {
    void saveOrUpdate(RoomResult rr);

    RoomResult find(Integer roomId, Long userId);

    RoomResult find(Room room, User user);

    List<RoomResult> getResults(Round round);

    List<RoomResult> getResults(Integer roundId);

    List<RoomResult> getResults(User u, Round round);
    List<RoomResult> getResults(Long userId, Integer roundId);
}
