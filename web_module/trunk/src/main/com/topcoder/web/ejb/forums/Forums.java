/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.forums;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ejb.EJBException;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.forum.ForumNotFoundException;

/**
 * <p>An interface to <code>Forums EJB</code>.</p>
 * 
 * <p>
 * Version 1.1 (TopCoder Cockpit Project Overview R2 Project Forum Backend Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #createTopCoderDirectProjectForums(String, Long)} method and re-formatted the code.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (Release Assembly - TopCoder Cockpit Post Software Milestone Feedback to Forum)) Change notes:
 *   <ol>
 *     <li>Added {@link #postThreadToQuestionForum(long, String, String, long)} to post a new thread in a specified forum.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (Release Assembly - TC Direct Project Forum Configuration Assembly) Change notes:
 *   <ol>
 *     <li>Modified {@link #createTopCoderDirectProjectForums(String, Long, Map)} to add a new argument.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.4 (Release Assembly - TC Direct Project Forum Configuration Assembly 2) Change notes:
 *   <ol>
 *     <li>Added {@link #addTopCoderDirectProjectForum(long, String, String)} to add a direct project forum.</li>
 *     <li>Added {@link #deleteTopCoderDirectProjectForum(long, long)} to delete a direct project forum.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.5 (Module Assembly - CloudSpokes Challenge Discussions Loader Assembly)
 * <ul>
 *     <li>Added interface
 *     {@link #migrateCloudSpokesForumData(long, long, String, ForumThreadData, Long[], Long[], long)}</li>
 * </ul>
 * </p>
 * 
 * @author duxiaoyang, TCSASSEMBLER
 * @version 1.5
 */
public interface Forums extends EJBObject {
    
    public void assignRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public void assignRole(long userID, String groupName) throws EJBException, RemoteException;
    
    public void removeRole(long userID, long groupID) throws EJBException, RemoteException;
    
    public void removeRole(long userID, String groupName) throws EJBException, RemoteException;
    
    public void setPublic(long categoryID, boolean isPublic) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException;
    
    public boolean isPublic(long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException;
    
    public void closeCategory(long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException;
    
    public boolean canReadCategory(long userID, long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException;
    
    public void createCategoryWatch(long userID, long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;
    
    public void createCategoryWatches(long userID, long[] categoryIDs) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;
    
    public void deleteCategoryWatch(long userID, long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;
    
    public ArrayList getSoftwareForumCategoryData(long categoryID) throws EJBException, RemoteException, ForumCategoryNotFoundException; 
    
    public String[][] getSoftwareCategoriesData() throws EJBException, RemoteException;
    
    public String[][] getWatchedSoftwareCategoriesData(long userID, boolean isWatched) throws EJBException, RemoteException;
    
    public String[][] getSoftwareRolesData(long userID) throws EJBException, RemoteException;
    
    public String[][] getAllSoftwareRolesData() throws EJBException, RemoteException;
    
    public long createSoftwareComponentForums(String componentName, long componentID, long versionID,
    		long phaseID, long componentStatusID, long rootCategoryID, String description, String versionText, 
    		boolean isPublic)
    	throws EJBException, RemoteException, Exception;

	public long createSoftwareComponentForums(String componentName, long componentID, long versionID,
    		long phaseID, long componentStatusID, long rootCategoryID, String description, String versionText, 
    		boolean isPublic, long projectCategoryId)
    	throws EJBException, RemoteException, Exception;
    
    public void updateComponentVersion(long categoryID, String versionText) throws EJBException, RemoteException, Exception;
    
    //public long getSoftwareComponentID(ForumCategory category) throws EJBException, RemoteException, SQLException;
    
    public long createMarathonForum(long roundID, String name) throws EJBException, RemoteException;
    
    public long createStudioForum(String name) throws EJBException, RemoteException;
    
    public void createForumWatch(long userID, long forumID) throws Exception, EJBException, RemoteException;

    public void updateComponentName(long categoryID, String name) throws EJBException, RemoteException, Exception;

    /**
     * Update the studio forum category name.
     *
     * @param categeoryId the id of the category to update
     * @param name the new category name
     */
    public void updateStudioForumName(long categoryID, String name) throws EJBException, RemoteException,Exception;
    
    public void deleteCategoryWatches(long userID, long[] categoryIDs) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;

    public long[] areCategoriesWatched(long userID, long[] categoryIDs) throws EJBException, RemoteException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;

    public long addSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment) throws EJBException, RemoteException, ForumsException;

    public List<ForumsSpecReviewComment> getSpecReviewComments(long categoryId) throws EJBException, RemoteException, ForumsException;

    public void updateSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment) throws EJBException, RemoteException, ForumsException;

    public long[] areForumsWatched(long userID, long[] forumIDs) throws EJBException, RemoteException, Exception;

    public void deleteForumWatches(long userID, long[] forumIDs) throws EJBException, RemoteException, Exception;

    public void createForumWatches(long userID, long[] forumIDs) throws EJBException, RemoteException, Exception;

    public void deleteForumWatch(long userID, long forumID) throws EJBException, RemoteException, Exception;

    public void removeUserPermission(long userID, long forumCategoryID) throws EJBException,RemoteException, Exception;

    
    /**
     * <p>Creates the forum for the specified <code>TopCoder Direct</code> project.</p>
     * 
     * @param projectName a <code>String</code> providing the name of <code>TC Direct</code> project to create forums 
     *        for.
     * @param tcDirectProjectTypeId a <code>Long</code> referencing the type of <code>TC Direct</code> project. 
     *        May be <code>null</code>.   
     * @return a <code>long</code> providing the ID of created forum.
     * @throws EJBException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @since 1.1
     */
    public long createTopCoderDirectProjectForums(String projectName, Long tcDirectProjectTypeId) 
        throws EJBException, RemoteException, Exception;
    
    /**
     * <p>Post a new thread to the question forum under a specified category.</p>
     * 
     * @param categoryId the id of the specified category.
     * @param subject the thread subject.
     * @param body the thread body.
     * @param userId the author of the thread
     * @return the id of the new created thread
     * @throws EJBException if an unexpected EJB error occurs.
     * @throws RemoteException if an unexpected EJB error occurs.
     * @throws IllegalArgumentException if subject is null or empty, body is null or empty
     * @throws Exception if any other error occurs
     * @since 1.2
     */
    public long postThreadToQuestionForum(long categoryId, String subject, String body, long userId) throws EJBException, RemoteException, Exception;

    /**
     * <p>Creates the forum for the specified <code>TopCoder Direct</code> project.</p>
     * 
     * @param projectName a <code>String</code> providing the name of <code>TC Direct</code> project to create forums 
     *        for.
     * @param tcDirectProjectTypeId a <code>Long</code> referencing the type of <code>TC Direct</code> project. 
     *        May be <code>null</code>.
     * @param forums the pre-configured forums to be created.
     * @return a <code>long</code> providing the ID of created forum.
     * @throws EJBException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @throws IllegalArgumentException if specified <code>projectName</code> is <code>null</code> or empty, or
     *         specified <code>forums</code> contains null key/value.
     * @since 1.1
     */
    public long createTopCoderDirectProjectForums(String projectName, Long tcDirectProjectTypeId,
            Map<String, String> forums) throws EJBException, RemoteException, Exception;

    /**
     * <p>
     * Adds a forum to the existing TopCoder Direct project forum category.
     * </p>
     * @param forumCategoryId the TopCoder Direct project forum category id.
     * @param forumName the name of the forum to be added.
     * @param forumDescription the description of the forum to be added.
     * @return the id of the added forum.
     * @throws EJBException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @since 1.4
     */
    public long addTopCoderDirectProjectForum(long forumCategoryId, String forumName, String forumDescription)
            throws EJBException, RemoteException, Exception;

    /**
     * <p>
     * Deletes an existing TopCoder Direct project forum.
     * </p>
     * @param forumCategoryId the id of the forum category.
     * @param forumId the id of the forum to be deleted.
     * @throws EJBException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @since 1.4
     */
    public void deleteTopCoderDirectProjectForum(long forumCategoryId, long forumId) throws EJBException, RemoteException, Exception;

    /**
     * Migrate the CloudSpokes Challenge discussions data to TopCoder forum.
     *
     * @param contestId the id of the TopCoder contest
     * @param compVersionId the component version id
     * @param contestName the contest name
     * @param forumData the forum data
     * @param userIds the user ids to give the forum user permission
     * @param adminIds the user ids to give the forum admin permission
     * @param postUserId the user id to post the thread
     * @throws EJBException if an unexpected error occurs.
     * @throws RemoteException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @return the forum category id created
     * @since 1.5
     */
    public long migrateCloudSpokesForumData(long contestId, long compVersionId, String contestName,
                                            ForumThreadData forumData, Long[] userIds,
                                            Long[] adminIds, long postUserId)
            throws EJBException, RemoteException, Exception;
}
