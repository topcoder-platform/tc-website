/*
 * Copyright (c) 2006-2012 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.sql.Timestamp;

/**
 * <p>A remote interface to <code>RBoard EJB</code>.</p>
 *
 * <p>
 *   Version 1.0.1 Change notes:
 *   <ol>
 *     <li>Bean was moved from tc to tcs site and was updated to centralize all RBoard operations.</li>
 *   </ol>
 *
 *   Version 1.0.2 Change notes:
 *   <ol>
 *     <li>Changed APPLICATION_DELAY to a method, getApplicationDelay.</li>
 *     <li>Removed getLatestApplicationReviewTimestamp.</li>
 *   </ol>
 *
 *   Version 1.0.3 Change notes:
 *   <ol>
 *     <li>Added {@link #validateUserWithoutCatalog(String, int, long, int)} method to validate the Assembly reviewer
 *     permissions without taking any catalog into consideration.</li>
 *   </ol>
 *
 *   Version 1.0.4 (Specification Review Integration 1.0) Change notes:
 *   <ol>
 *     <li>Added new method createSpecReviewRBoardApplication to apply for spec reviews.</li>
 *   </ol>
 *
 *   Version 1.0.5 Change notes:
 *   <ol>
 *     <li>createSpecReviewRBoardApplication method rewritten to work with the new Spec Reviewer process.
 *     It now adds "Specification Reviewer" role to the parent cotnest in OR instead of a separate project in OR.
 *     </li>
 *   </ol> 
 *
 *   Version 1.0.6 Change notes:
 *   <ol>
 *     <li>createRBoardApplication and createSpecReviewRBoardApplication methods return boolean value
 *     indicating whether the timeline has been extended.
 *     </li>
 *   </ol> 
 * </p> 
 *
 * @author dok, pulky, ivern, isv, snow01, VolodymyrK
 * @version 1.0.6
 */
public interface RBoardApplication extends EJBObject {

    boolean createRBoardApplication(String dataSource, long userId, long projectId, int reviewRespId, int phaseId,
                                 Boolean open, Timestamp opensOn, int reviewTypeId, boolean primary)
        throws RBoardRegistrationException, RemoteException;

    long getApplicationDelay(String dataSource, long userId) throws RemoteException;

    long getSpecReviewApplicationDelay(String dataSource, long userId) throws RemoteException;

    void validateUser(String dataSource, int catalog, int reviewTypeId, long userId, int phaseId)
        throws RBoardRegistrationException, RemoteException;

    public void validateUserTrans(String dataSource, long projectId, int phaseId, long userId, Boolean open,
                                  Timestamp opensOn, int reviewTypeId, boolean primary)
        throws RBoardRegistrationException, RemoteException;

    /**
     * <p>Verifies that the specified user is granted a permission to take the specified review position for the
     * projects of specified type.</p>
     *
     * @param dataSource a <code>String</code> providing the name referencing the data source in <code>JNDI</code>
     *        context.
     * @param reviewTypeId an <code>int</code> referencing the review position type.
     * @param userId a <code>long</code> providing the ID of a user to be validated.
     * @param projectTypeId an <code>int</code> providing the ID of a project category.
     * @throws RBoardRegistrationException if an unexpected error occurs.
     * @throws RemoteException if an error occurs while calling EJB method remotely.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    void validateUserWithoutCatalog(String dataSource, int reviewTypeId, long userId, int projectTypeId)
        throws RBoardRegistrationException, RemoteException;
    
    /**
     * Creates the spec review rboard_application and "Specification Reviewer" resource for the contest in OR. 
     * 
     *
     * @param dataSource the datasource being used
     * @param userId the user id to insert
     * @param projectId the project id to insert
     * @param reviewRespId the review responsibility id to insert
     * @param phaseId the phase id
     * @param opensOn timestamp when the positions opens on
     * @param reviewTypeId the type of the review
     * @return true if the timeline was extended
     * @throws RBoardRegistrationException if an unexpected error occurs.
     * @throws RemoteException if an error occurs while calling EJB method remotely.
     * @throws EJBException if an error occurs doing persistence operations
     *
     * @since 1.0.4
     */
    public boolean createSpecReviewRBoardApplication(String dataSource, long userId,
                                        long projectId, int reviewRespId, int phaseId, Boolean open, Timestamp opensOn,
                                        int reviewTypeId) throws RBoardRegistrationException, RemoteException;
}
