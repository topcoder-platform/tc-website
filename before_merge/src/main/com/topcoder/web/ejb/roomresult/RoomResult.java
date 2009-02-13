package com.topcoder.web.ejb.roomresult;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public interface RoomResult extends EJBObject {
    void createRoomResult(long roundId, long roomId, long coderId, String dataSource) throws RemoteException;

    void setPointTotal(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setAttended(long roundId, long roomId, long coderId, boolean attended, String dataSource) throws RemoteException;

    double getPointTotal(long roundId, long roomId, long coderId, String dataSource) throws RemoteException;
    boolean getAttended(long roundId, long roomId, long coderId, String dataSource) throws RemoteException;

/*
    void setAdvanced(long roundId, long roomId, long coderId, boolean advanced, String dataSource) throws RemoteException;
    void setRoomSeed(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setOldRating(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setNewRating(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setRoomPlaced(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setOverallRank(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setDivisionSeed(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setDivisionPlaced(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setRoundPaymentId(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setRatedFlag(long roundId, long roomId, long coderId, double pointTotal, String dataSource) throws RemoteException;
*/

}
