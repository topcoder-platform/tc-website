package com.topcoder.dde.submission;

import com.topcoder.util.idgenerator.bean.IdGenException;

import javax.ejb.CreateException;
import javax.ejb.EJBObject;
import javax.naming.NamingException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.rmi.RemoteException;
import java.sql.SQLException;

/**
 */
public interface Submissions extends EJBObject, Serializable {

    /**
     * Submits a new submission for the given submitter.
     * If a submission already exists, an additional
     * submission is created without overwriting the original.
     *
     * @param submitter_id the id of the submitter
     * @param submission the submission as it should be written to a file
     * @param comment comments by the submitter
     * @return the primary key id of the submission
     */
    public long submit(long submitter_id, InputStream submission, String comment) throws IOException, SQLException, NamingException, CreateException, IdGenException, RemoteException;

    public Submission getSubmission(long submission_id) throws RemoteException, SQLException, SubmissionDoesNotExistException, NamingException;

    public Submission[] getSubmissions(long submitter_id) throws RemoteException, SQLException, NamingException;
}
