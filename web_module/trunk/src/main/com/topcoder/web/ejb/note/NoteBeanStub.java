package com.topcoder.web.ejb.note;

import com.topcoder.shared.ejb.BaseEJB;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision$
 * Dec 20, 2002 12:34:19 AM
 */
public class NoteBeanStub extends BaseEJB {
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
                           int noteTypeId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param noteId
     * @param text
     * @throws RemoteException
     */
    public void setText(long noteId, String text)
            throws RemoteException {
    }

    /**
     *
     * @param noteId
     * @param submittedBy
     * @throws RemoteException
     */
    public void setSubmittedBy(long noteId, long submittedBy)
            throws RemoteException {
    }

    /**
     *
     * @param noteId
     * @param noteTypeId
     * @throws RemoteException
     */
    public void setNoteTypeId(long noteId, int noteTypeId)
            throws RemoteException {
    }

    /**
     *
     * @param noteId
     * @return note text
     * @throws RemoteException
     */
    public String getText(long noteId)
            throws RemoteException {
        return null;
    }

    /**
     *
     * @param noteId
     * @return submitter user id
     * @throws RemoteException
     */
    public long getSubmittedBy(long noteId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param noteId
     * @return note type id
     * @throws RemoteException
     */
    public int getNoteTypeId(long noteId)
            throws RemoteException {
        return 0;
    }

    /**
     *
     * @param noteId
     * @return Note Type Description
     * @throws RemoteException
     */
    public String getNoteTypeDesc(long noteId)
            throws RemoteException {
        return null;
    }
}