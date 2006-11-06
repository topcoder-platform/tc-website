/*
 * DDEForum.java
 * 6 September 2002
 * 1.0
 *
 * Copyright(c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.forum;

import com.topcoder.forum.*;
import com.topcoder.security.TCSubject;

import java.rmi.RemoteException;
import java.util.List;


/**
 * The remote interface of the DDEForum Enterprise Java Bean (EJB). DDEForumEJB
 * provides the functionality for managing discussion forums specific to the
 * Distributed Development Environment.
 *
 * @version 1.0, 6 September 2002
 * @author  Albert Mao
 * @see     DDEForumHome
 */
public interface DDEForum extends javax.ejb.EJBObject {

    /**
     * Checks if a subject has permission to post to a forum.
     *
     * @param forumId the primary key of the forum
     * @param subject the <code>TCSubject</code> to check
     * @return <code>true</code> if the subject has permission to post to the
     * specified forum, <code>false</code> otherwise
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws ForumException if <code>subject</code> is <code>null</code>, or
     * if the pemission cannot be checked
     */
    public boolean canPost(long forumId, TCSubject subject)
            throws RemoteException, ForumException;

    /**
     * Checks if a subject has permission to moderate a forum.
     *
     * @param forumId the primary key of the forum
     * @param subject the <code>TCSubject</code> to check
     * @return <code>true</code> if the subject has permission to moderate the
     * specified forum, <code>false</code> otherwise
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws ForumException if <code>subject</code> is <code>null</code>, or
     * if the pemission cannot be checked
     */
    public boolean canModerate(long forumId, TCSubject subject)
            throws RemoteException, ForumException;

    /**
     * Returns the summary information for the component linked to the specified
     * forum.
     *
     * @param forumId the primary key of the forum
     * @return a <code>ComponentSummary</code> object
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws ForumException if the specified forum is not linked to exactly
     * one component version
     */
    public ForumComponent getLinkedComponent(long forumId)
            throws RemoteException, ForumException;

    /**
     * Returns the type of the specified forum.
     *
     * @param forumType the primary key of the forum
     * @return List of active forums
     * @throws RemoteException if a system-level failure causes the remote
     * method call to fail
     * @throws ForumException if the specified forum is not linked to exactly
     * one component version
     */
    public List getActiveForums(long forumType)
            throws RemoteException, ForumException;

}