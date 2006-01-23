package com.topcoder.dde.submission;

import com.topcoder.util.idgenerator.bean.IdGenException;

import javax.ejb.CreateException;
import javax.ejb.EJBObject;
import javax.naming.NamingException;
import java.io.Serializable;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;

/**
 */
public interface Submitters extends EJBObject, Serializable {

    /**
     * Retrieves the submitter id for the given user,
     * component (by version), and phase.
     *
     * @param login_id the login id of the user
     * @param comp_ver_id the version id of the component
     * @param phase_id the phase id of the submission
     * @param create indicates whether or not to create
     * the submitter if one does not already exist
     * @return the submitter id
     * @throws SubmitterDoesNotExistException if the submitter
     * does not exist and should not be created
     */
    public long getSubmitterId(long login_id, long comp_ver_id, long phase_id, boolean create)
            throws SubmitterDoesNotExistException, RemoteException, SQLException, NamingException, CreateException, IdGenException;

    public Submitter getSubmitter(long submitter_id) throws RemoteException, SQLException, SubmitterDoesNotExistException, NamingException;

    public List getSubmitters(Submitter filter) throws RemoteException, SQLException, NamingException;
}
