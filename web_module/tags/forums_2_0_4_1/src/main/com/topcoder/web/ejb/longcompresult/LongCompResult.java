package com.topcoder.web.ejb.longcompresult;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public interface LongCompResult extends EJBObject {
    void createLongCompResult(long roundId, long coderId, String dataSource) throws RemoteException;

    void setPointTotal(long roundId, long coderId, double pointTotal, String dataSource) throws RemoteException;
    void setAttended(long roundId, long coderId, boolean attended, String dataSource) throws RemoteException;

    double getPointTotal(long roundId, long coderId, String dataSource) throws RemoteException;
    boolean getAttended(long roundId, long coderId, String dataSource) throws RemoteException;
    boolean exists(long roundId, long coderId, String dataSource) throws RemoteException;


}
