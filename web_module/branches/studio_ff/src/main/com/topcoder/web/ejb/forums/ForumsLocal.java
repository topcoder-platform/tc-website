/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.forums;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.forum.ForumNotFoundException;
import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Map;

/**
 * <p>An interface to <code>Forums EJB</code>.</p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Cockpit Post Software Milestone Feedback to Forum)) Change notes:
 *   <ol>
 *     <li>Added {@link #postThreadToQuestionForum(long, String, String, long)} to post a new thread in a specified forum.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Release Assembly - TC Direct Project Forum Configuration Assembly 2) Change notes:
 *   <ol>
 *     <li>Added {@link #addTopCoderDirectProjectForum(long, String, String)} to add a direct project forum.</li>
 *     <li>Added {@link #deleteTopCoderDirectProjectForum(long, long)} to delete a direct project forum.</li>
 *   </ol>
 * </p>
 * 
 * @author mtong, TCSASSEMBER, duxiaoyang
 * @version 1.2
 */
public interface ForumsLocal extends EJBLocalObject {

    public void createMatchForum(int roundID) throws RowNotFoundException;

    public String[] getCategoryNames() throws EJBException;

    public int getThreadMessageCount(int threadID) throws EJBException;

    public void assignRole(long userID, long groupID) throws EJBException;

    public void assignRole(long userID, String groupName) throws EJBException;

    public void addCategoryPerms(long userID, long forumCategoryID, long[] perms) throws EJBException;

    public void removeRole(long userID, long groupID) throws EJBException;

    public void removeRole(long userID, String groupName) throws EJBException;

    public void setPublic(long categoryID, boolean isPublic) throws EJBException, ForumCategoryNotFoundException, UnauthorizedException;

    public boolean isPublic(long categoryID) throws EJBException, ForumCategoryNotFoundException, UnauthorizedException;

    public void closeCategory(long categoryID) throws EJBException, ForumCategoryNotFoundException, UnauthorizedException;

    public boolean canReadCategory(long userID, long categoryID) throws EJBException, ForumCategoryNotFoundException;

    public void createCategoryWatch(long userID, long categoryID) throws EJBException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;

    public void createCategoryWatches(long userID, long[] categoryIDs) throws EJBException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;

    public void deleteCategoryWatch(long userID, long categoryID) throws EJBException, ForumCategoryNotFoundException, UnauthorizedException, UserNotFoundException;

    public ArrayList getSoftwareForumCategoryData(long categoryID) throws EJBException, ForumCategoryNotFoundException;

    public String[][] getSoftwareCategoriesData() throws EJBException;

    public String[][] getWatchedSoftwareCategoriesData(long userID, boolean isWatched) throws EJBException;

    public String[][] getSoftwareRolesData(long userID) throws EJBException;

    public String[][] getAllSoftwareRolesData() throws EJBException;

    public long createSoftwareComponentForums(String componentName, long componentID, long versionID,
                                              long phaseID, long componentStatusID, long rootCategoryID, String description, String versionText,
                                              boolean isPublic)
            throws EJBException, Exception;

	public long createSoftwareComponentForums(String componentName, long componentID, long versionID,
    		long phaseID, long componentStatusID, long rootCategoryID, String description, String versionText, 
    		boolean isPublic, long projectCategoryId)
    	throws EJBException, Exception;

    public Hashtable getComponentVersionPhases(long[] compVersIDs) throws EJBException;

    public long getComponentVersionPhase(long compVersID) throws EJBException;

    public String getComponentVersionText(long compVersID) throws EJBException;

    public Hashtable getComponentRootCategories(long[] compIDs) throws EJBException;

    public long getComponentRootCategory(long compID) throws EJBException;

    public HashSet getApprovedComponents(long[] compIDs) throws EJBException;

    public void updateComponentVersion(long categoryID, String versionText) throws EJBException, Exception;

    //public long getSoftwareComponentID(ForumCategory category) throws EJBException, SQLException;

    public void deleteOrphanedAttachments() throws EJBException;

    public void convertTCSPerms() throws EJBException;

    public long createMarathonForum(long roundID, String name) throws EJBException;
    
    public long createStudioForum(String name) throws EJBException;
    
    public void createForumWatch(long userID, long forumID) throws EJBException, Exception;

    public void updateComponentName(long categoryID, String name) throws EJBException, Exception;

    /**
     * Update the studio forum category name.
     *
     * @param categeoryId the id of the category to update
     * @param name the new category name
     */
    public void updateStudioForumName(long categoryID, String name) throws EJBException, Exception;
    
     public void deleteCategoryWatches(long userID, long[] categoryIDs) throws EJBException, Exception;

    public long[] areCategoriesWatched(long userID, long[] categoryIDs) throws EJBException, Exception;

    public long addSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment) throws EJBException, ForumsException;

    public List<ForumsSpecReviewComment> getSpecReviewComments(long categoryId) throws EJBException, ForumsException;

    public void updateSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment) throws EJBException, ForumsException;

    public void removeUserPermission(long userID, long forumCategoryID) throws EJBException, Exception;
    
    /**
     * <p>Post a new thread to the question forum under a specified category.</p>
     * 
     * @param categoryId the id of the specified category.
     * @param subject the thread subject.
     * @param body the thread body.
     * @param userId the author of the thread
     * @return the id of the new created thread
     * @throws EJBException if an unexpected EJB error occurs.
     * @throws IllegalArgumentException if subject is null or empty, body is null or empty
     * @throws Exception if any other error occurs
     * @since 1.2
     */
    public long postThreadToQuestionForum(long categoryId, String subject, String body, long userId) throws EJBException, Exception;
	
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
            Map<String, String> forums) throws EJBException, Exception;

    /**
     * <p>
     * Adds a forum to the existing TopCoder Direct project forum category.
     * </p>
     * @param forumCategoryId the TopCoder Direct project forum category id.
     * @param forumName the name of the forum to be added.
     * @param forumDescription the description of the forum to be added.
     * @return the id of the added forum.
     * @throws EJBException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @since 1.2
     */
    public long addTopCoderDirectProjectForum(long forumCategoryId, String forumName, String forumDescription)
            throws EJBException, Exception;

    /**
     * <p>
     * Deletes an existing TopCoder Direct project forum.
     * </p>
     * @param forumCategoryId the id of the forum category.
     * @param forumId the id of the forum to be deleted.
     * @throws EJBException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @since 1.2
     */
    public void deleteTopCoderDirectProjectForum(long forumCategoryId, long forumId) throws EJBException, Exception;
}
