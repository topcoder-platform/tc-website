package com.topcoder.web.ejb.user;

import com.topcoder.shared.ejb.BaseEJB;
import java.rmi.RemoteException;
import java.sql.Date;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$ 
 * Dec 25, 2002 1:00:16 AM
 */
public class CoderBeanStub extends BaseEJB {
    /**
     *
     * @param coderStatusId
     * @return coderId
     * @throws RemoteException
     */
    public long createCoder(int coderStatusId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param coderId
     * @param memberSince
     * @throws RemoteException
     */
    public void setMemberSince(long coderId, Date memberSince)
            throws RemoteException {
    }

    /**
     *
     * @param coder_id
     * @param coderStatusId
     * @throws RemoteException
     */
    public void setCoderStatusId(long coder_id, int coderStatusId)
            throws RemoteException {
    }

    /**
     *
     * @param coderId
     * @return Member Since Date
     * @throws RemoteException
     */
    public Date getMemberSince(long coderId)
            throws RemoteException {
        return null;
    }

    /**
     *
     * @param coderId
     * @return coderStatusId int
     * @throws RemoteException
     */
    public int getCoderStatusId(long coderId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param coderId
     * @return Coder Status Description
     * @throws RemoteException
     */
    public String getCoderStatusDesc(long coderId)
            throws RemoteException {
        return null;
    }
}
