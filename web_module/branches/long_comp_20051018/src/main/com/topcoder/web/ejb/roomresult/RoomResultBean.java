package com.topcoder.web.ejb.roomresult;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public class RoomResultBean extends BaseEJB {
    private static Logger log = Logger.getLogger(RoomResultBean.class);

    public void createRoomResult(long roundId, long roomId, long coderId, String dataSource) {
        log.debug("createRoomResult called... " + roundId + " " + roomId + " " + coderId);
        insert("room_result", new String[] {"round_id", "room_id", "coder_id"},
                new String[] {String.valueOf(roundId), String.valueOf(roomId),String.valueOf(coderId)}, dataSource);
    }

    public void setPointTotal(long roundId, long roomId, long coderId, double pointTotal, String dataSource)  {
        log.debug("setPointTotal called... " + roundId + " " + roomId + " " + coderId + " " + pointTotal);
        update("room_result", new String[] {"point_total"}, new String[] {String.valueOf(pointTotal)},
                new String[] {"round_id", "room_id", "coder_id"},
                new String[] {String.valueOf(roundId), String.valueOf(roomId),String.valueOf(coderId)}, dataSource);
    }
    public void setAttended(long roundId, long roomId, long coderId, boolean attended, String dataSource)  {
        log.debug("setAttended called... " + roundId + " " + roomId + " " + coderId + " " + attended);
        update("room_result", new String[] {"attended"}, new String[] {attended?"Y":"N"},
                new String[] {"round_id", "room_id", "coder_id"},
                new String[] {String.valueOf(roundId), String.valueOf(roomId),String.valueOf(coderId)}, dataSource);
    }

    public double getPointTotal(long roundId, long roomId, long coderId, String dataSource)  {
        log.debug("getPointTotal called... " + roundId + " " + roomId + " " + coderId);
        return selectDouble("room_result", "point_total", new String[] {"round_id", "room_id", "coder_id"},
            new String[] {String.valueOf(roundId), String.valueOf(roomId),String.valueOf(coderId)}, dataSource).doubleValue();
    }

    public boolean getAttended(long roundId, long roomId, long coderId, String dataSource)  {
        log.debug("getAttended called... " + roundId + " " + roomId + " " + coderId);
        return "Y".equals(selectString("room_result", "attended", new String[] {"round_id", "room_id", "coder_id"},
            new String[] {String.valueOf(roundId), String.valueOf(roomId),String.valueOf(coderId)}, dataSource));

    }

}
