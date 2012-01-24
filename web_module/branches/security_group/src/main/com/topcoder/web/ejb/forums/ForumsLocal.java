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

/**
 * @author mtong
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

     public void deleteCategoryWatches(long userID, long[] categoryIDs) throws EJBException, Exception;

    public long[] areCategoriesWatched(long userID, long[] categoryIDs) throws EJBException, Exception;

    public long addSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment) throws EJBException, ForumsException;

    public List<ForumsSpecReviewComment> getSpecReviewComments(long categoryId) throws EJBException, ForumsException;

    public void updateSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment) throws EJBException, ForumsException;

    public void removeUserPermission(long userID, long forumCategoryID) throws EJBException, Exception;
}
