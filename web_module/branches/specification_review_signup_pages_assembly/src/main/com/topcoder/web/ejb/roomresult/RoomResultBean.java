package com.topcoder.web.ejb.roomresult;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public class RoomResultBean extends BaseEJB {
    private static Logger log = Logger.getLogger(RoomResultBean.class);

    public void createRoomResult(long roundId, long roomId, long coderId, String dataSource) {
        log.debug("createRoomResult called... " + roundId + " " + roomId + " " + coderId);
        insert("room_result", new String[]{"round_id", "room_id", "coder_id"},
                new String[]{String.valueOf(roundId), String.valueOf(roomId), String.valueOf(coderId)}, dataSource);
    }

    public void setPointTotal(long roundId, long roomId, long coderId, double pointTotal, String dataSource) {
        log.debug("setPointTotal called... " + roundId + " " + roomId + " " + coderId + " " + pointTotal);
        update("room_result", new String[]{"point_total"}, new String[]{String.valueOf(pointTotal)},
                new String[]{"round_id", "room_id", "coder_id"},
                new String[]{String.valueOf(roundId), String.valueOf(roomId), String.valueOf(coderId)}, dataSource);
    }

    public void setAttended(long roundId, long roomId, long coderId, boolean attended, String dataSource) {
        log.debug("setAttended called... " + roundId + " " + roomId + " " + coderId + " " + attended);
        update("room_result", new String[]{"attended"}, new String[]{attended ? "Y" : "N"},
                new String[]{"round_id", "room_id", "coder_id"},
                new String[]{String.valueOf(roundId), String.valueOf(roomId), String.valueOf(coderId)}, dataSource);
    }

    public double getPointTotal(long roundId, long roomId, long coderId, String dataSource) throws RowNotFoundException {
        log.debug("getPointTotal called... " + roundId + " " + roomId + " " + coderId);
        return selectDouble("room_result", "point_total", new String[]{"round_id", "room_id", "coder_id"},
                new String[]{String.valueOf(roundId), String.valueOf(roomId), String.valueOf(coderId)}, dataSource);
    }

    public boolean getAttended(long roundId, long roomId, long coderId, String dataSource) throws RowNotFoundException {
        log.debug("getAttended called... " + roundId + " " + roomId + " " + coderId);
        return "Y".equals(selectString("room_result", "attended", new String[]{"round_id", "room_id", "coder_id"},
                new String[]{String.valueOf(roundId), String.valueOf(roomId), String.valueOf(coderId)}, dataSource));

    }

    public boolean exists(long roundId, long roomId, long coderId, String dataSource) {
        log.debug("exists called... user_id=" + coderId + " roundId=" + roundId + " room " + roomId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("SELECT '1' FROM room_result WHERE coder_id = ? AND round_id = ? and room_id = ?");
            ps.setLong(1, coderId);
            ps.setLong(2, roundId);
            ps.setLong(3, roomId);

            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException exists coder_id=" + coderId + " roundId=" + roundId + " roomid " + roomId);
        } catch (Exception e) {
            throw new EJBException("Exception exists coder_id=" + coderId + " roundId=" + roundId + " roomid " + roomId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

    }

}