package com.topcoder.web.ejb.roomresult;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public interface RoomResultLocal extends EJBLocalObject {
    void createRoomResult(long roundId, long roomId, long coderId, String dataSource);

    void setPointTotal(long roundId, long roomId, long coderId, double pointTotal, String dataSource);
    void setAttended(long roundId, long roomId, long coderId, boolean attended, String dataSource);

    double getPointTotal(long roundId, long roomId, long coderId, String dataSource);
    boolean getAttended(long roundId, long roomId, long coderId, String dataSource);

}
