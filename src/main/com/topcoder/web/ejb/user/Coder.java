package com.topcoder.web.ejb.user;

import java.sql.Date;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 11:28:34 PM
 */
public interface Coder extends EJBObject {

    /**
     *
     * @param coderStatusId
     * @return coderId
     * @throws RemoteException
     */
    public long createCoder(int coderStatusId)
            throws RemoteException;

    /**
     *
     * @param coderId
     * @param memberSince
     * @throws RemoteException
     */
    public void setMemberSince(long coderId, Date memberSince)
            throws RemoteException;

    /**
     *
     * @param coder_id
     * @param coderStatusId
     * @throws RemoteException
     */
    public void setCoderStatusId(long coder_id, int coderStatusId)
            throws RemoteException;

    /**
     *
     * @param coderId
     * @return Member Since Date
     * @throws RemoteException
     */
    public Date getMemberSince(long coderId)
            throws RemoteException;

    /**
     *
     * @param coderId
     * @return coderStatusId int
     * @throws RemoteException
     */
    public int getCoderStatusId(long coderId)
            throws RemoteException;

    /**
     *
     * @param coderId
     * @return Coder Status Description
     * @throws RemoteException
     */
    public String getCoderStatusDesc(long coderId)
            throws RemoteException;
}