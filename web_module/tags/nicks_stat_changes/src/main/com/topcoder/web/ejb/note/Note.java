package com.topcoder.web.ejb.note;

import javax.ejb.EJBObject;
import javax.ejb.EJBException;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 11:53:33 PM
 */

public interface Note extends EJBObject {

    /**
     *
     * @param text
     * @param submittedBy
     * @param noteTypeId
     * @return note id
     * @throws RemoteException
     */
    public long createNote(String text,
                           long submittedBy,
                           int noteTypeId, String dataSource, String idDataSource)
            throws EJBException, RemoteException;

    /**
     *
     * @param noteId
     * @param text
     * @throws RemoteException
     */
    public void setText(long noteId, String text, String dataSource)
            throws EJBException, RemoteException;

    /**
     *
     * @param noteId
     * @param submittedBy
     * @throws RemoteException
     */
    public void setSubmittedBy(long noteId, long submittedBy, String dataSource)
            throws EJBException, RemoteException;

    /**
     *
     * @param noteId
     * @param noteTypeId
     * @throws RemoteException
     */
    public void setNoteTypeId(long noteId, int noteTypeId, String dataSource)
            throws EJBException, RemoteException;

    /**
     *
     * @param noteId
     * @return note text
     * @throws RemoteException
     */
    public String getText(long noteId, String dataSource)
            throws EJBException, RemoteException;

    /**
     *
     * @param noteId
     * @return submitter user id
     * @throws RemoteException
     */
    public long getSubmittedBy(long noteId, String dataSource)
            throws EJBException, RemoteException;

    /**
     *
     * @param noteId
     * @return note type id
     * @throws RemoteException
     */
    public int getNoteTypeId(long noteId, String dataSource)
            throws EJBException, RemoteException;

    /**
     *
     * @param noteId
     * @return Note Type Description
     * @throws RemoteException
     */
    public String getNoteTypeDesc(long noteId, String dataSource)
            throws EJBException, RemoteException;
}