package com.topcoder.web.ejb.sessionprofile;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 10:32:26 PM
 */
public interface SessionProfileProblem extends EJBObject {

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @param sortOrder
     * @param sessionRoundId
     * @throws RemoteException
     */
    public void createSessionProfileProblem(long sessionProfileId,
                                            long problemId,
                                            int problemTypeId,
                                            int sortOrder,
                                            long sessionRoundId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @throws RemoteException
     */
    public void setProblemTypeId(long sessionProfileId,
                                 long problemId,
                                 int problemTypeId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @throws RemoteException
     */
    public void setSortOrder(long sessionProfileId, long problemId,
                             int problemTypeId,
                             int sortOrder)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @param sessionRoundId
     * @throws RemoteException
     */
    public void setSessionRoundId(long sessionProfileId,
                                  long problemId,
                                  int problemTypeId,
                                  long sessionRoundId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return
     * @throws RemoteException
     */
    public int getProblemTypeId(long sessionProfileId, long problemId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @return sortOrder in int
     * @throws RemoteException
     */
    public int getSortOrder(long sessionProfileId, long problemId,
                            int problemTypeId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @return long of sessionRoundId
     * @throws RemoteException
     */
    public long getSessionRoundId(long sessionProfileId, long problemId,
                                  int problemTypeId)
            throws RemoteException;

    public ResultSetContainer getProblems(long sessionProfileId) throws RemoteException;

}