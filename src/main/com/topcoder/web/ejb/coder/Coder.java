package com.topcoder.web.ejb.coder;

import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Date;

/**
 * @author Fred Wang (silentmobius)
 * @version $Revision: 63884 $
 *          Dec 19, 2002 11:28:34 PM
 */
public interface Coder extends EJBObject {

    /**
     * @param coderId
     * @throws RemoteException
     */
    void createCoder(long coderId, String dataSource) throws EJBException, RemoteException;

    /**
     * @param coderId
     * @param memberSince
     * @throws java.rmi.RemoteException
     */
    void setMemberSince(long coderId, Date memberSince, String dataSource) throws EJBException, RemoteException;

    /**
     * @param coderId
     * @param quote
     * @throws EJBException
     * @throws RemoteException
     */
    void setQuote(long coderId, String quote, String dataSource) throws EJBException, RemoteException;

    /**
     * @param coderId
     * @param editorId
     * @throws EJBException
     * @throws RemoteException
     */
    void setEditorId(long coderId, int editorId, String dataSource) throws EJBException, RemoteException;

    /**
     * @param coderId
     * @param languageId
     * @throws EJBException
     * @throws RemoteException
     */
    void setLanguageId(long coderId, int languageId, String dataSource) throws EJBException, RemoteException;

    /**
     * @param coderId
     * @param coderTypeId
     * @param dataSource
     * @throws EJBException
     * @throws RemoteException
     */
    void setCoderTypeId(long coderId, int coderTypeId, String dataSource) throws EJBException, RemoteException;

    void setContactDate(long coderId, long timestamp, String dataSource) throws EJBException, RemoteException;

    void setCompCountryCode(long coderId, String compCountryCode, String dataSource) throws EJBException, RemoteException;

    /**
     * @param coderId
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    Date getMemberSince(long coderId, String dataSource) throws RowNotFoundException, RemoteException;

    /**
     * @param coderId
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    String getQuote(long coderId, String dataSource) throws RowNotFoundException, RemoteException;

    /**
     * @param coderId
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    Integer getEditorId(long coderId, String dataSource) throws RowNotFoundException, RemoteException;

    /**
     * @param coderId
     * @param dataSource
     * @return
     * @throws RowNotFoundException
     */
    Integer getLanguageId(long coderId, String dataSource) throws RowNotFoundException, RemoteException;

    /**
     * @param coderId
     * @param dataSource
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    Integer getCoderTypeId(long coderId, String dataSource) throws RowNotFoundException, RemoteException;


    String getCompCountryCode(long coderId, String dataSource) throws RowNotFoundException, RemoteException;


    /**
     * @param coderId
     * @param dataSource
     * @return
     * @throws EJBException
     * @throws RemoteException
     */
    boolean exists(long coderId, String dataSource) throws EJBException, RemoteException;

}
