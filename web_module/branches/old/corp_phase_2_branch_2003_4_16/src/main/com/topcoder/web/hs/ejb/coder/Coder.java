package com.topcoder.web.hs.ejb.coder;

import java.sql.Date;
import javax.ejb.EJBObject;
import javax.ejb.EJBException;
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
     * @param coderId
     * @throws RemoteException
     */
    public void createCoder(long coderId) throws EJBException, RemoteException;
    /**
     *
     * @param coderId
     * @param memberSince
     * @throws java.rmi.RemoteException
     */
    public void setMemberSince(long coderId, Date memberSince) throws EJBException, RemoteException;

    /**
     *
     * @param coderId
     * @param quote
     * @throws EJBException
     * @throws RemoteException
     */
    public void setQuote(long coderId, String quote) throws EJBException, RemoteException;

    /**
     *
     * @param coderId
     * @param editorId
     * @throws EJBException
     * @throws RemoteException
     */
    public void setEditorId(long coderId, int editorId) throws EJBException, RemoteException;

    /**
     *
     * @param coderId
     * @param languageId
     * @throws EJBException
     * @throws RemoteException
     */
    public void setLanguageId(long coderId, int languageId) throws EJBException, RemoteException;

    /**
     *
     * @param coderId
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    public Date getMemberSince(long coderId)  throws EJBException, RemoteException;

    /**
     *
     * @param coderId
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    public String getQuote(long coderId) throws EJBException, RemoteException;

    /**
     *
     * @param coderId
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    public int getEditorId(long coderId) throws EJBException, RemoteException;

    /**
     *
     * @param coderId
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    public int getLanguageId(long coderId) throws EJBException, RemoteException;

}