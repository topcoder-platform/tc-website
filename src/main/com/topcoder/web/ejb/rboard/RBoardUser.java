package com.topcoder.web.ejb.rboard;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * Date: Feb 13, 2004
 */
public interface RBoardUser extends EJBObject {


    void createRBoardUser(String dataSource, long userId, int phaseId, int statusId,
                          boolean hasContract, boolean canReviewJava,
                          boolean canReviewDotNet, boolean canReviewFlash) throws RemoteException;

    void setStatus(String dataSource, long userId, int phaseId, int statusId) throws RemoteException;
    void setHasContract(String dataSource, long userId, int phaseId, boolean hasConstract) throws RemoteException;
    void setCanReviewJava(String dataSource, long userId, int phaseId, boolean canReviewJava) throws RemoteException;
    void setCanReviewDotNet(String dataSource, long userId, int phaseId, boolean canReviewDotNet) throws RemoteException;
    void setCanReviewFlash(String dataSource, long userId, int phaseId, boolean canReviewFlash) throws RemoteException;

    int getStatus(String dataSource, long userId, int phaseId) throws RemoteException;
    boolean hasContract(String dataSource, long userId, int phaseId) throws RemoteException;
    boolean canReviewJava(String dataSource, long userId, int phaseId) throws RemoteException;
    boolean canReviewDotNet(String dataSource, long userId, int phaseId) throws RemoteException;
    boolean canReviewFlash(String dataSource, long userId, int phaseId) throws RemoteException;





}
