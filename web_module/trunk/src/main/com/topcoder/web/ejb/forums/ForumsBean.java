package com.topcoder.web.ejb.forums;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.Group;
import com.jivesoftware.base.GroupManager;
import com.jivesoftware.base.PermissionType;
import com.jivesoftware.base.PermissionsManager;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserManager;
import com.jivesoftware.base.UserManagerFactory;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumNotFoundException;
import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumPermissions;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.Watch;
import com.jivesoftware.forum.WatchManager;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.model.TCAuthToken;
import com.topcoder.web.tc.Constants;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import java.util.List;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Date;

/**
 * This class handles interaction with the Jive database. Please update the code
 * if you know of a way to use Jive objects remotely, instead of using
 * primitives. Keep in mind that most Jive proxy objects are not serializable.
 *
 * <p>
 * Version 1.1 (TopCoder Cockpit Project Overview R1 Project Forum Backend Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #createTopCoderDirectProjectForums(String, Long)} method.</li>
 *   </ol>
 * </p>
 * 
 * @author mtong
 * @version 1.1
 */

public class ForumsBean extends BaseEJB {

	private static Logger log = Logger.getLogger(ForumsBean.class);
	private static ForumFactory forumFactory = ForumFactory.getInstance(new TCAuthToken(100129));
	private static final long TCS_FORUMS_ROOT_CATEGORY_ID = WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID;
	private static long swAdminID = 305384;

	// Creates a new forum in the "Algorithm Matches" category of the forums for
	// the given round.
	// Also sets the forum_id field of the corresponding row in DW.round.
	public void createMatchForum(int roundID) throws RowNotFoundException {
		// String username = "Administrator";
		// String pwd = selectString("user",
		// "password",
		// new String[]{"handle"},
		// new String[]{username},
		// DBMS.OLTP_DATASOURCE_NAME);

		String roundName = selectString("round", "short_name", new String[] { "round_id" }, new String[] { String
				.valueOf(roundID) }, DBMS.OLTP_DATASOURCE_NAME);

		try {
			ForumFactory forumFactory = ForumFactory.getInstance(new TCAuthToken(100129));
			Forum forum = forumFactory.createForum(roundName, "", forumFactory.getForumCategory(14));

			this.update("round", new String[] { "forum_id" }, new String[] { String.valueOf(forum.getID()) },
					new String[] { "round_id" }, new String[] { String.valueOf(roundID) }, DBMS.OLTP_DATASOURCE_NAME);
		} catch (UnauthorizedException uae) {
			uae.printStackTrace();
		} catch (ForumCategoryNotFoundException fe) {
			fe.printStackTrace();
		}
	}

	public String[] getCategoryNames() {
		ForumFactory forumFactory = ForumFactory.getInstance(AuthFactory.getAnonymousAuthToken());
		Iterator it = forumFactory.getRootForumCategory().getCategories();
		ArrayList listNames = new ArrayList();
		while (it.hasNext()) {
			listNames.add(((ForumCategory) it.next()).getName());
		}
		return (String[]) listNames.toArray(new String[listNames.size()]);
	}

	public int getThreadMessageCount(int threadID) {
		try {
			return this.selectInt("jivemessage", "count(*)", new String[] { "threadid" }, new String[] { String
					.valueOf(threadID) }, DBMS.FORUMS_DATASOURCE_NAME);
		} catch (RowNotFoundException e) {
			return 0;
		}
	}

	public void assignRole(long userID, long groupID) {
		try {
			User user = forumFactory.getUserManager().getUser(userID);
			com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupID);
			if (group.getName().equals("Software Admins") || group.getName().toLowerCase().indexOf("admin") == -1) {
				group.addMember(user);
			}
		} catch (Exception e) {
			log.info("*** error in assigning role: " + e);
		}
	}

	public void assignRole(long userID, String groupName) {
		try {
			User user = forumFactory.getUserManager().getUser(userID);
			com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupName);
			if (group.getName().equals("Software Admins") || group.getName().toLowerCase().indexOf("admin") == -1) {
				group.addMember(user);
			}
		} catch (Exception e) {
			log.info("*** error in assigning role: " + e);
		}
	}

	public void addCategoryPerms(long userID, long forumCategoryID, long[] perms) {
		try {
			User user = forumFactory.getUserManager().getUser(userID);
			ForumCategory forumCategory = forumFactory.getForumCategory(forumCategoryID);
			PermissionsManager fcPermManager = forumCategory.getPermissionsManager();
			for (int i = 0; i < perms.length; i++) {
				fcPermManager.addUserPermission(user, PermissionType.ADDITIVE, perms[i]);
			}
		} catch (Exception e) {
			log.info("*** error in assigning role: " + e);
		}
	}

	public void removeRole(long userID, long groupID) {
		try {
			User user = forumFactory.getUserManager().getUser(userID);
			com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupID);
			if (group.getName().equals("Software Admins") || group.getName().toLowerCase().indexOf("admin") == -1) {
				group.removeMember(user);
			}
		} catch (Exception e) {
			log.info("*** error in removing role: " + e);
		}
	}

	public void removeRole(long userID, String groupName) {
		try {
			User user = forumFactory.getUserManager().getUser(userID);
			com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupName);
			if (group.getName().equals("Software Admins") || group.getName().toLowerCase().indexOf("admin") == -1) {
				group.removeMember(user);
			}
		} catch (Exception e) {
			log.info("*** error in removing role: " + e);
		}
	}

	public void setPublic(long categoryID, boolean isPublic) throws ForumCategoryNotFoundException,
			UnauthorizedException {
		// log.info("*** called setPublic(): categoryID = " + categoryID +
		// " | isPublic = " + isPublic);
		ForumCategory category = forumFactory.getForumCategory(categoryID);
		PermissionsManager categoryPermissionsManager = category.getPermissionsManager();

		if (!isPublic) {
			for (int i = 0; i < ForumConstants.SW_BLOCK_PERMS.length; i++) {
				categoryPermissionsManager.addAnonymousUserPermission(PermissionType.NEGATIVE,
						ForumConstants.SW_BLOCK_PERMS[i]);
				categoryPermissionsManager.addRegisteredUserPermission(PermissionType.NEGATIVE,
						ForumConstants.SW_BLOCK_PERMS[i]);
			}
		} else {
			for (int i = 0; i < ForumConstants.SW_BLOCK_PERMS.length; i++) {
				categoryPermissionsManager.removeAnonymousUserPermission(PermissionType.NEGATIVE,
						ForumConstants.SW_BLOCK_PERMS[i]);
				categoryPermissionsManager.removeRegisteredUserPermission(PermissionType.NEGATIVE,
						ForumConstants.SW_BLOCK_PERMS[i]);
			}
		}
	}

	public boolean isPublic(long categoryID) throws ForumCategoryNotFoundException, UnauthorizedException {
		ForumCategory category = forumFactory.getForumCategory(categoryID);
		PermissionsManager categoryPermissionsManager = category.getPermissionsManager();

		for (int i = 0; i < ForumConstants.ANONYMOUS_PERMS.length; i++) {
			if (categoryPermissionsManager.anonymousUserHasPermission(PermissionType.NEGATIVE,
					ForumConstants.ANONYMOUS_PERMS[i])) {
				return false;
			}
		}
		for (int i = 0; i < ForumConstants.REGISTERED_PERMS.length; i++) {
			if (categoryPermissionsManager.registeredUserHasPermission(PermissionType.NEGATIVE,
					ForumConstants.REGISTERED_PERMS[i])) {
				return false;
			}
		}
		return true;
	}

	public void closeCategory(long categoryID) throws ForumCategoryNotFoundException, UnauthorizedException {
		ForumCategory category = forumFactory.getForumCategory(categoryID);
		category.setProperty(ForumConstants.PROPERTY_ARCHIVAL_STATUS, String
				.valueOf(ForumConstants.PROPERTY_ARCHIVAL_STATUS_CLOSED));
	}

	public boolean canReadCategory(long userID, long categoryID) throws ForumCategoryNotFoundException {
		ForumFactory userForumFactory = ForumFactory.getInstance(new TCAuthToken(userID));
		ForumCategory category = userForumFactory.getForumCategory(categoryID);
		return category.isAuthorized(ForumPermissions.READ_FORUM);
	}

	/*
	 * Currently used only for software forums, without a maximum limit of
	 * categories that can be watched.
	 */
	public void createCategoryWatch(long userID, long categoryID) throws ForumCategoryNotFoundException,
			UnauthorizedException, UserNotFoundException {
		WatchManager watchManager = forumFactory.getWatchManager();
		User user = forumFactory.getUserManager().getUser(userID);
		ForumCategory category = forumFactory.getForumCategory(categoryID);
		if (!watchManager.isWatched(user, category)) {
			watchManager.createWatch(user, category);
		}
	}

	public void createCategoryWatches(long userID, long[] categoryIDs) throws ForumCategoryNotFoundException,
			UnauthorizedException, UserNotFoundException {
		WatchManager watchManager = forumFactory.getWatchManager();
		User user = forumFactory.getUserManager().getUser(userID);
		for (int i = 0; i < categoryIDs.length; i++) {
			ForumCategory category = forumFactory.getForumCategory(categoryIDs[i]);
			if (!watchManager.isWatched(user, category)) {
				watchManager.createWatch(user, category);
			}
		}
	}

	public void deleteCategoryWatch(long userID, long categoryID) throws ForumCategoryNotFoundException,
			UnauthorizedException, UserNotFoundException {
		WatchManager watchManager = forumFactory.getWatchManager();
		User user = forumFactory.getUserManager().getUser(userID);
		ForumCategory category = forumFactory.getForumCategory(categoryID);
		Watch watch = watchManager.getWatch(user, category);
		if (watch != null) {
			watchManager.deleteWatch(watch);
		}
	}

	public void deleteCategoryWatches(long userID, long[] categoryIDs) throws ForumCategoryNotFoundException,
			UnauthorizedException, UserNotFoundException {
		WatchManager watchManager = forumFactory.getWatchManager();
		User user = forumFactory.getUserManager().getUser(userID);
		for (int i = 0; i < categoryIDs.length; i++) {
			ForumCategory category = forumFactory.getForumCategory(categoryIDs[i]);
			Watch watch = watchManager.getWatch(user, category);
			if (watch != null) {
				watchManager.deleteWatch(watch);
			}
		}
	}

	public long[] areCategoriesWatched(long userID, long[] categoryIDs) throws ForumCategoryNotFoundException,
			UnauthorizedException, UserNotFoundException {
		WatchManager watchManager = forumFactory.getWatchManager();
		User user = forumFactory.getUserManager().getUser(userID);
		ArrayList<Long> watched = new ArrayList<Long>();
		for (int i = 0; i < categoryIDs.length; i++) {
			ForumCategory category = forumFactory.getForumCategory(new Long(categoryIDs[i]));
			Watch watch = watchManager.getWatch(user, category);
			if (watch != null) {
				watched.add(categoryIDs[i]);
			}
		}

		long[] watches = new long[watched.size()];
		for (int i = 0; i < watched.size(); i++) {
			watches[i] = ((Long) watched.get(i)).longValue();
		}

		return watches;
	}

	/*********************************************/
	/* Software Forums */
	/**
	 * *****************************************
	 */
	public ArrayList getSoftwareForumCategoryData(long categoryID) throws ForumCategoryNotFoundException {
		ForumCategory category = forumFactory.getForumCategory(categoryID);
		ArrayList data = new ArrayList();
		data.add(category.getCreationDate());
		data.add(category.getProperty(ForumConstants.PROPERTY_ARCHIVAL_STATUS));
		return data;
	}

	public String[][] getSoftwareCategoriesData() {
		try {
			String[][] softwareCategoriesData = new String[forumFactory.getForumCategory(TCS_FORUMS_ROOT_CATEGORY_ID)
					.getCategoryCount()][2];
			Iterator itCategories = forumFactory.getForumCategory(TCS_FORUMS_ROOT_CATEGORY_ID).getCategories();
			int row = 0;
			while (itCategories.hasNext()) {
				ForumCategory category = (ForumCategory) itCategories.next();
				softwareCategoriesData[row][0] = String.valueOf(category.getID());
				softwareCategoriesData[row][1] = String.valueOf(category.getName());
				row++;
			}
			return softwareCategoriesData;
		} catch (ForumCategoryNotFoundException fe) {
			log.info("*** error in obtaining software categories: " + fe);
			return null;
		}
	}

	/*
	 * Lists categories that are watched by the given user. If isWatched is
	 * false, returns the categories that can be watched (but are currently not)
	 * by the given user.
	 * 
	 * TODO: Improve this method's efficiency. It should return in a few seconds
	 * in the worst case.
	 */
	public String[][] getWatchedSoftwareCategoriesData(long userID, boolean isWatched) {
		User user = null;
		ForumFactory userForumFactory = ForumFactory.getInstance(new TCAuthToken(userID));
		try {
			user = userForumFactory.getUserManager().getUser(userID);
			Iterator itCategories = userForumFactory.getForumCategory(TCS_FORUMS_ROOT_CATEGORY_ID).getCategories();
			WatchManager watchManager = userForumFactory.getWatchManager();
			ArrayList categoriesList = new ArrayList();
			while (itCategories.hasNext()) {
				ForumCategory category = (ForumCategory) itCategories.next();
				if (!(watchManager.isWatched(user, category) ^ isWatched)) {
					categoriesList.add(category);
				}
			}

			Collections.sort(categoriesList, new JiveForumCategoryComparator("name", ResultFilter.ASCENDING));

			String[][] watchedSoftwareCategoriesData = new String[categoriesList.size()][2];
			for (int i = 0; i < categoriesList.size(); i++) {
				ForumCategory category = (ForumCategory) categoriesList.get(i);
				watchedSoftwareCategoriesData[i][0] = String.valueOf(category.getID());
				watchedSoftwareCategoriesData[i][1] = String.valueOf(category.getName());
			}
			return watchedSoftwareCategoriesData;
		} catch (Exception e) {
			log.info("*** error in obtaining watched software categories data: " + e);
			return null;
		}
	}

	public String[][] getSoftwareRolesData(long userID) {
		User user = null;
		try {
			user = forumFactory.getUserManager().getUser(userID);
		} catch (UserNotFoundException ue) {
			log.info("*** error in obtaining software roles: " + ue);
			return null;
		}

		Iterator itGroups = forumFactory.getGroupManager().getUserGroups(user);
		ArrayList softwareGroupList = new ArrayList();
		while (itGroups.hasNext()) {
			com.jivesoftware.base.Group group = (com.jivesoftware.base.Group) itGroups.next();
			if (group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX)
					|| group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX)
					|| group.getName().equals(ForumConstants.GROUP_SOFTWARE_ADMINS)) {
				softwareGroupList.add(group);
			}
		}

		Collections.sort(softwareGroupList, new JiveGroupComparator("description", ResultFilter.ASCENDING));

		String[][] softwareGroupData = new String[softwareGroupList.size()][3];
		for (int i = 0; i < softwareGroupData.length; i++) {
			Group group = (Group) softwareGroupList.get(i);
			softwareGroupData[i][0] = String.valueOf(group.getID());
			softwareGroupData[i][1] = String.valueOf(group.getName());
			softwareGroupData[i][2] = String.valueOf(group.getDescription());
		}
		return softwareGroupData;
	}

	public String[][] getAllSoftwareRolesData() {
		Iterator itGroups = forumFactory.getGroupManager().getGroups();
		ArrayList softwareGroupList = new ArrayList();
		while (itGroups.hasNext()) {
			com.jivesoftware.base.Group group = (com.jivesoftware.base.Group) itGroups.next();
			if (group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX)
					|| group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX)
					|| group.getName().equals(ForumConstants.GROUP_SOFTWARE_ADMINS)) {
				softwareGroupList.add(group);
			}
		}

		Collections.sort(softwareGroupList, new JiveGroupComparator("description", ResultFilter.ASCENDING));

		String[][] softwareGroupData = new String[softwareGroupList.size()][3];
		for (int i = 0; i < softwareGroupData.length; i++) {
			Group group = (Group) softwareGroupList.get(i);
			softwareGroupData[i][0] = String.valueOf(group.getID());
			softwareGroupData[i][1] = String.valueOf(group.getName());
			softwareGroupData[i][2] = String.valueOf(group.getDescription());
		}
		return softwareGroupData;
	}

	/*
	 * Create a new component category and constituent forums.
	 */
	public long createSoftwareComponentForums(String componentName, long componentID, long versionID, long phaseID,
			long componentStatusID, long rootCategoryID, String description, String versionText, boolean isPublic)
			throws Exception {

		return createSoftwareComponentForums(componentName, componentID, versionID, phaseID, componentStatusID,
				rootCategoryID, description, versionText, isPublic, 0);

	}

	/*
	 * Create a new component category and constituent forums.
	 */
	public long createSoftwareComponentForums(String componentName, long componentID, long versionID, long phaseID,
			long componentStatusID, long rootCategoryID, String description, String versionText, boolean isPublic,
			long projectCategoryId) throws Exception {
		try {
			String categoryName = ForumsUtil.getComponentCategoryName(componentName, versionText);
			ForumCategory newCategory = forumFactory.getForumCategory(TCS_FORUMS_ROOT_CATEGORY_ID).createCategory(
					categoryName, description);
			newCategory.setProperty(ForumConstants.PROPERTY_ARCHIVAL_STATUS,
					ForumConstants.PROPERTY_ARCHIVAL_STATUS_ACTIVE);
			// newCategory.setProperty(ForumConstants.PROPERTY_COMPONENT_PHASE,
			// String.valueOf(phaseID));
			// newCategory.setProperty(ForumConstants.PROPERTY_COMPONENT_ROOT_CATEGORY_ID,
			// String.valueOf(rootCategoryID));
			// newCategory.setProperty(ForumConstants.PROPERTY_COMPONENT_STATUS,
			// String.valueOf(componentStatusID));
			newCategory.setProperty(ForumConstants.PROPERTY_COMPONENT_ID, String.valueOf(componentID));
			newCategory.setProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_ID, String.valueOf(versionID));
			newCategory.setProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_TEXT, versionText);
			newCategory.setProperty(ForumConstants.PROPERTY_MODIFY_FORUMS, "true");

			boolean found = false;
			// try get by contest type id
			if (projectCategoryId > 0) {
				Connection forumsConn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);

				PreparedStatement forumsPS = forumsConn
						.prepareStatement("select name, description from template_forum t "
								+ "where t.project_category_id = " + projectCategoryId
								+ " order by t.display_order, t.template_forum_id");
				ResultSet rs = forumsPS.executeQuery();
				while (rs.next()) {
					found = true;
					forumFactory.createForum(rs.getString("name"), rs.getString("description"), newCategory);
				}
				rs.close();
				forumsPS.close();
				forumsConn.close();
			}

			// if contest type id is 0 or not found by contest type id,
			// use template_id = 2
			if (projectCategoryId == 0 || !found) {
				Connection forumsConn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);

				PreparedStatement forumsPS = forumsConn
						.prepareStatement("select name, description from template_forum t "
								+ "where t.template_id = 2 order by t.display_order, t.template_forum_id");
				ResultSet rs = forumsPS.executeQuery();
				while (rs.next()) {
					forumFactory.createForum(rs.getString("name"), rs.getString("description"), newCategory);
				}
				rs.close();
				forumsPS.close();
				forumsConn.close();
			}

			// SW admin posts one introductory message in every category so that
			// it will rise to the top
			// of the list of forums. This should be replaced by a search
			// function that will find category
			// by name, or (possibly better) by not moving empty categories to
			// the end.
			/*
			 * try { String swAdminIDStr =
			 * JiveGlobals.getJiveProperty("tc.tcs.forums.admin"); if
			 * (swAdminIDStr != null) { swAdminID =
			 * Long.parseLong(swAdminIDStr); } } catch (NumberFormatException
			 * nfe) {com.jivesoftware.base.Log.debug(
			 * "ForumsBean.createSoftwareComponentForums(): cannot find SW admin from Jive property"
			 * ); } try { User swAdmin =
			 * forumFactory.getUserManager().getUser(swAdminID); if
			 * (newCategory.getForumCount() > 0) { Iterator itForums =
			 * newCategory.getForums(); Forum f = (Forum) itForums.next();
			 * ForumMessage m = f.createMessage(swAdmin);
			 * m.setSubject(newCategory.getName()); m.setBody("Welcome to the "
			 * + newCategory.getName() +
			 * " forums. Please post component-related questions and documents here."
			 * ); ForumThread t = f.createThread(m); f.addThread(t); } } catch
			 * (UserNotFoundException unfe) {com.jivesoftware.base.Log.debug(
			 * "ForumsBean.createSoftwareComponentForums(): admin not found - will not create initial message"
			 * ); }
			 */

			createSoftwareComponentPermissions(newCategory, isPublic);
			return newCategory.getID();
		} catch (Exception e) {
			logException(e, "error in creating software component forums");
			throw e;
		}
	}

    /**
     * <p>Creates the forum for the specified <code>TopCoder Direct</code> project.</p>
     * 
     * @param projectName a <code>String</code> providing the name of <code>TC Direct</code> project to create forums 
     *        for.
     * @param tcDirectProjectTypeId a <code>Long</code> referencing the type of <code>TC Direct</code> project. 
     *        May be <code>null</code>.   
     * @return a <code>long</code> providing the ID of created forum.
     * @throws EJBException if an unexpected error occurs.
     * @throws Exception if an unexpected error occurs.
     * @throws IllegalArgumentException if specified <code>projectName</code> is <code>null</code> or empty. 
     * @since 1.1
     */
    public long createTopCoderDirectProjectForums(String projectName, Long tcDirectProjectTypeId) throws Exception {
        if ((projectName == null) || (projectName.trim().length() == 0)) {
            throw new IllegalArgumentException("The parameter [projectName] is not valid. [" + projectName + "]");
        }
        
        Connection forumsConn = null;
        try {
            // Create new forum category for TC Direct project
            ForumCategory newCategory 
                = forumFactory.getForumCategory(getTcDirectProjectForumsRootCategoryId()).createCategory(projectName,
                                                                                                         projectName);
            newCategory.setProperty(ForumConstants.PROPERTY_ARCHIVAL_STATUS,
                                    ForumConstants.PROPERTY_ARCHIVAL_STATUS_ACTIVE);
            newCategory.setProperty(ForumConstants.PROPERTY_MODIFY_FORUMS, "true");

            // Create sub-forums for 
            forumsConn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);
            PreparedStatement forumsPS;
            if (tcDirectProjectTypeId == null) {
                forumsPS = forumsConn.prepareStatement(
                    "SELECT name, description " +
                    "FROM template_project_forum t " +
                    "WHERE t.direct_project_type_id IS NULL " +
                    "ORDER BY t.display_order, t.template_project_forum_id");
            } else {
                forumsPS = forumsConn.prepareStatement(
                    "SELECT name, description " +
                    "FROM template_project_forum t " +
                    "WHERE t.direct_project_type_id = ? " +
                    "ORDER BY t.display_order, t.template_project_forum_id");
                forumsPS.setLong(1, tcDirectProjectTypeId);
            }

            ResultSet rs = forumsPS.executeQuery();
            while (rs.next()) {
                forumFactory.createForum(rs.getString("name"), rs.getString("description"), newCategory);
            }
            rs.close();
            forumsPS.close();

            createSoftwareComponentPermissions(newCategory, true);
            
            return newCategory.getID();
        } catch (Exception e) {
            logException(e, "error in creating TC Direct project forums");
            throw e;
        } finally {
            if (forumsConn != null) {
                forumsConn.close();
            }
        }
    }

	private void createSoftwareComponentPermissions(ForumCategory category, boolean isPublic) throws Exception {
		GroupManager groupManager = forumFactory.getGroupManager();
		try {
			Group swAdminGroup = groupManager.getGroup(ForumConstants.GROUP_SOFTWARE_ADMINS);
			Group moderatorGroup = groupManager.createGroup(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX
					+ category.getID()); // close resultset
			Group userGroup = groupManager.createGroup(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX + category.getID()); // close
																														// resultset
			moderatorGroup.setDescription(category.getName());
			userGroup.setDescription(category.getName());
			PermissionsManager categoryPermissionsManager = category.getPermissionsManager();
			for (int i = 0; i < ForumConstants.MODERATOR_PERMS.length; i++) {
				categoryPermissionsManager.addGroupPermission(moderatorGroup, PermissionType.ADDITIVE,
						ForumConstants.MODERATOR_PERMS[i]);
			}
			for (int i = 0; i < ForumConstants.REGISTERED_PERMS.length; i++) {
				categoryPermissionsManager.addGroupPermission(userGroup, PermissionType.ADDITIVE,
						ForumConstants.REGISTERED_PERMS[i]);
			}
			for (int i = 0; i < ForumConstants.ADMIN_PERMS.length; i++) {
				categoryPermissionsManager.addGroupPermission(swAdminGroup, PermissionType.ADDITIVE,
						ForumConstants.ADMIN_PERMS[i]);
			}
			if (!isPublic) {
				for (int i = 0; i < ForumConstants.SW_BLOCK_PERMS.length; i++) {
					categoryPermissionsManager.addAnonymousUserPermission(PermissionType.NEGATIVE,
							ForumConstants.SW_BLOCK_PERMS[i]);
					categoryPermissionsManager.addRegisteredUserPermission(PermissionType.NEGATIVE,
							ForumConstants.SW_BLOCK_PERMS[i]);
				}
			}
		} catch (Exception e) {
			logException(e, "error in creating software component permissions");
			throw e;
		}
	}

	public long getComponentVersionPhase(long compVersID) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
			ps = conn.prepareStatement("select phase_id from comp_versions v " + "where v.comp_vers_id = ?");
			ps.setLong(1, compVersID);
			rs = ps.executeQuery();

			long phaseID = -1;
			if (rs.next()) {
				phaseID = rs.getLong("phase_id");
			} else {
				throw new RowNotFoundException("no row found for " + ps.toString());
			}
			return phaseID;
		} catch (SQLException e) {
			DBMS.printSqlException(true, e);
			throw new EJBException(e.getMessage());
		} catch (Exception e) {
			throw new EJBException(e.getMessage());
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}
	}

	public Hashtable getComponentVersionPhases(long[] compVersIDs) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
			StringBuffer psStrBuf = new StringBuffer("select comp_vers_id, phase_id from comp_versions v "
					+ "where v.comp_vers_id IN (");
			for (int i = 0; i < compVersIDs.length - 1; i++) {
				psStrBuf.append(compVersIDs[i]);
				psStrBuf.append(',');
			}
			if (compVersIDs.length > 0) {
				psStrBuf.append(compVersIDs[compVersIDs.length - 1]);
			}
			psStrBuf.append(")");
			ps = conn.prepareStatement(psStrBuf.toString());
			rs = ps.executeQuery();

			Hashtable h = new Hashtable();
			while (rs.next()) {
				h.put(rs.getString("comp_vers_id"), rs.getString("phase_id"));
			}
			return h;
		} catch (SQLException e) {
			DBMS.printSqlException(true, e);
			throw new EJBException(e.getMessage());
		} catch (Exception e) {
			throw new EJBException(e.getMessage());
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}
	}

	public String getComponentVersionText(long compVersID) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
			ps = conn.prepareStatement("select version_text from comp_versions v " + "where v.comp_vers_id = ?");
			ps.setLong(1, compVersID);
			rs = ps.executeQuery();

			String versionText = "";
			if (rs.next()) {
				versionText = rs.getString("version_text");
			} else {
				throw new RowNotFoundException("no row found for " + ps.toString());
			}
			return versionText;
		} catch (SQLException e) {
			DBMS.printSqlException(true, e);
			throw new EJBException(e.getMessage());
		} catch (Exception e) {
			throw new EJBException(e.getMessage());
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}
	}

	public long getComponentRootCategory(long compID) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
			ps = conn.prepareStatement("select root_category_id from comp_catalog c " + "where c.component_id = ?");
			ps.setLong(1, compID);
			rs = ps.executeQuery();

			long rootCategory = -1;
			if (rs.next()) {
				rootCategory = rs.getLong("root_category_id");
			} else {
				throw new RowNotFoundException("no row found for " + ps.toString());
			}
			return rootCategory;
		} catch (SQLException e) {
			DBMS.printSqlException(true, e);
			throw new EJBException(e.getMessage());
		} catch (Exception e) {
			throw new EJBException(e.getMessage());
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}
	}

	public Hashtable getComponentRootCategories(long[] compIDs) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
			StringBuffer psStrBuf = new StringBuffer("select component_id, root_category_id from comp_catalog c "
					+ "where c.component_id IN (");
			for (int i = 0; i < compIDs.length - 1; i++) {
				psStrBuf.append(compIDs[i]);
				psStrBuf.append(',');
			}
			if (compIDs.length > 0) {
				psStrBuf.append(compIDs[compIDs.length - 1]);
			}
			psStrBuf.append(")");
			ps = conn.prepareStatement(psStrBuf.toString());
			rs = ps.executeQuery();

			Hashtable h = new Hashtable();
			while (rs.next()) {
				h.put(rs.getString("component_id"), rs.getString("root_category_id"));
			}
			return h;
		} catch (SQLException e) {
			DBMS.printSqlException(true, e);
			throw new EJBException(e.getMessage());
		} catch (Exception e) {
			throw new EJBException(e.getMessage());
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}
	}

	// Given an input list of component IDs, returns the IDs corresponding with
	// approved components.
	public HashSet getApprovedComponents(long[] compIDs) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
			StringBuffer psStrBuf = new StringBuffer("select c.component_id from comp_catalog c where status_id = "
					+ WebConstants.STATUS_APPROVED + " " + "and c.component_id IN (");
			for (int i = 0; i < compIDs.length - 1; i++) {
				psStrBuf.append(compIDs[i]);
				psStrBuf.append(',');
			}
			if (compIDs.length > 0) {
				psStrBuf.append(compIDs[compIDs.length - 1]);
			}
			psStrBuf.append(")");
			ps = conn.prepareStatement(psStrBuf.toString());
			rs = ps.executeQuery();

			HashSet h = new HashSet();
			while (rs.next()) {
				h.add(rs.getString("component_id"));
			}
			return h;
		} catch (SQLException e) {
			DBMS.printSqlException(true, e);
			throw new EJBException(e.getMessage());
		} catch (Exception e) {
			throw new EJBException(e.getMessage());
		} finally {
			close(rs);
			close(ps);
			close(conn);
		}
	}

	public void updateComponentVersion(long categoryID, String versionText) throws Exception {
		try {
			ForumCategory forumCategory = forumFactory.getForumCategory(categoryID);
			String oldVersionText = forumCategory.getProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_TEXT);
			String versionTextStr = "v" + versionText;
			String oldVersionTextStr = "v" + oldVersionText;
			forumCategory.setName(StringUtils.replace(forumCategory.getName(), oldVersionTextStr, versionTextStr));
			forumCategory.setProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_TEXT, String.valueOf(versionText));
		} catch (Exception e) {
			logException(e, "error in updating component version");
			throw e;
		}
	}

	public void updateComponentName(long categoryID, String name) throws Exception {
		try {
			ForumCategory forumCategory = forumFactory.getForumCategory(categoryID);
			String oldVersionText = forumCategory.getProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_TEXT);
			forumCategory.setName(ForumsUtil.getComponentCategoryName(name, oldVersionText));
		} catch (Exception e) {
			logException(e, "error in updating component name");
			throw e;
		}
	}

	/*
	 * Returns the ID of the software component linked to the given category.
	 */
	/*
	 * public long getSoftwareComponentID(ForumCategory category) throws
	 * SQLException { long compVersID = -1; long componentID = -1; try {
	 * compVersID =Long.parseLong(category.getProperty(ForumConstants.
	 * PROPERTY_COMPONENT_VERSION_ID)); } catch (NumberFormatException nfe) { //
	 * not a software category return -1; }
	 * 
	 * Connection forumsConn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);
	 * PreparedStatement forumsPS = forumsConn.prepareStatement(
	 * "select c.component_id" + " from comp_catalog c" +
	 * " join comp_versions v on (c.component_id = v.component_id)" +
	 * " where c.status_id = " + WebConstants.STATUS_APPROVED +
	 * " and v.comp_vers_id = ?"); forumsPS.setLong(1, compVersID); ResultSet rs
	 * = forumsPS.executeQuery(); if (rs.next()) { componentID = rs.getLong(0);
	 * } rs.close(); forumsPS.close(); forumsConn.close();
	 * 
	 * return componentID; }
	 */
	/*********************************************/
	/* Software Forums - End */
	/**
	 * *****************************************
	 */

	public void deleteOrphanedAttachments() {
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);
			ps = conn.prepareStatement("delete from jiveattachment where objectid is null");
			ps.executeUpdate();
			log.info("Successfully deleted orphaned attachments.");
		} catch (SQLException e) {
			DBMS.printSqlException(true, e);
			throw new EJBException(e.getMessage());
		} catch (Exception e) {
			throw new EJBException(e.getMessage());
		} finally {
			close(ps);
			close(conn);
		}
	}

	public void convertTCSPerms() {
		// int groupCNT = forumFactory.getGroupManager().getGroupCount();
		Iterator itGroups = forumFactory.getGroupManager().getGroups();
		// int n=0;
		while (itGroups.hasNext()) {
			Group group = (Group) itGroups.next();
			// log.debug("Analyzing group " + ++n + "/" + groupCNT + ": " +
			// group.getName());
			if (!(group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX) || group.getName()
					.startsWith(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX))) {
				// log.debug("Skipping non-TCS project group.");
				continue;
			}
			Iterator itUsers = group.getMembers();
			while (itUsers.hasNext()) {
				User user = (User) itUsers.next();
				try {
					if (group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX)) {
						long forumCategoryID = Long.parseLong(group.getName().substring(
								ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX.length()));
						addCategoryPerms(user.getID(), forumCategoryID, ForumConstants.MODERATOR_PERMS);
						// log.debug("Added moderator permissions for " +
						// user.getUsername() + " for category " +
						// forumCategoryID);
					} else if (group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX)) {
						long forumCategoryID = Long.parseLong(group.getName().substring(
								ForumConstants.GROUP_SOFTWARE_USERS_PREFIX.length()));
						addCategoryPerms(user.getID(), forumCategoryID, ForumConstants.REGISTERED_PERMS);
						// log.debug("Added user permissions for " +
						// user.getUsername() + " for category " +
						// forumCategoryID);
					}
					group.removeMember(user);
				} catch (UnauthorizedException ue) {
					ue.printStackTrace();
				}
			}
			// log.debug("Converted permissions.");
		}
	}

	private long createForum(long categoryID, String name) throws Exception {
		return createForum(categoryID, name, "");
	}

	private long createForum(long categoryID, String name, String description) throws Exception {
		try {
			ForumCategory category = forumFactory.getForumCategory(categoryID);

			Forum forum = forumFactory.createForum(name, description, category);

			return forum.getID();
		} catch (Exception e) {
			logException(e, "error in creating software component forums");
			throw e;
		}
	}

	// Creates a forum in the "Marathon Matches" category and adds the
	// "round.forum_id" value for the round.
	public long createMarathonForum(long roundID, String name) {
		try {
			long forumID = createForum(17, name);
			this.update("round", new String[] { "forum_id" }, new String[] { String.valueOf(forumID) },
					new String[] { "round_id" }, new String[] { String.valueOf(roundID) }, DBMS.OLTP_DATASOURCE_NAME);
			return forumID;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	/**public long createStudioForum(String name) {
		try {
			long forumID = createForum(3, name);
			return forumID;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	} */

    // TODO add user id as input
    public long createStudioForum(String name) {
		try {

            ForumCategory category = forumFactory.getForumCategory(3);

			Forum forum = forumFactory.createForum(name, "", category);
            
            //TODO, user Applications for now
            long userId = 22770213;
            User user = forumFactory.getUserManager().getUser(userId);

            ForumMessage forumMessage = forum.createMessage(user);
            forumMessage.setBody("Spec Review Discussion");
            forumMessage.setSubject("Spec Review Discussion");
			forumMessage.setCreationDate(new Date());
			forumMessage.setModificationDate(new Date());
            log.debug("Created ForumMessage with id " + forumMessage.getID() + " with user with id " + userId
					+ " and comment (message body): ");


            // create thread with forumMessage as root message
            ForumThread thread = forum.createThread(forumMessage);
            log.debug("Created new thread with id " + thread.getID() + " and root message with id "
                    + forumMessage.getID() + "!");

            // set creation and modification date of the thread to the date
            // of the UserComment
            thread.setCreationDate(new Date());
            thread.setModificationDate(new Date());
            forum.addThread(thread);
           log.debug("Added thread with id " + thread.getID() + " and root message with id "
						+ forumMessage.getID() + " to forum with id " + forum.getID() + "!");

			long forumID = forum.getID();

			return forumID;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public void createForumWatch(long userID, long forumID) throws Exception {
		try {
			WatchManager watchManager = forumFactory.getWatchManager();
			User user = forumFactory.getUserManager().getUser(userID);
			Forum forum = forumFactory.getForum(forumID);
			if (!watchManager.isWatched(user, forum)) {
				watchManager.createWatch(user, forum);
			}
		} catch (Exception e) {
			logException(e, "Can't create a forum watch for userid " + userID + " , forumID = " + forumID);
			throw new Exception("Can't create a forum watch for userid " + userID + " , forumID = " + forumID, e);
		}

	}


    public void deleteForumWatch(long userID, long forumID) throws  Exception
    {
        try {
			WatchManager watchManager = forumFactory.getWatchManager();
			User user = forumFactory.getUserManager().getUser(userID);

         
            Forum forum = forumFactory.getForum(forumID);
            if (!watchManager.isWatched(user, forum))
            {
                Watch watch = watchManager.getWatch(user, forum);
                if (watch != null) {
                    watchManager.deleteWatch(watch);
                }
            } 
            
		} catch (Exception e) {
			logException(e, "Error in deleteForumWatch userid =" + userID);
			throw new Exception("Error in deleteForumWatch userid " + userID , e);
		}
    }


    public long[] areForumsWatched(long userID, long[] forumIDs) throws Exception {
		try {
			WatchManager watchManager = forumFactory.getWatchManager();
			User user = forumFactory.getUserManager().getUser(userID);

            ArrayList<Long> watched = new ArrayList<Long>();
            for (int i = 0; i < forumIDs.length; i++) { 
                Forum forum = forumFactory.getForum(forumIDs[i]);
                if (watchManager.isWatched(user, forum))
                {
                    watched.add(forumIDs[i]);
                } 
            }

            long[] watches = new long[watched.size()];
            for (int i = 0; i < watched.size(); i++) {
                watches[i] = ((Long) watched.get(i)).longValue();
            }

		return watches;
		
		} catch (Exception e) {
			logException(e, "Error checking areForumsWatched userid =" + userID);
			throw new Exception("Error checking areForumsWatched userid " + userID , e);
		}

	}


    public void deleteForumWatches(long userID, long[] forumIDs) throws  Exception
    {
        try {
			WatchManager watchManager = forumFactory.getWatchManager();
			User user = forumFactory.getUserManager().getUser(userID);

            for (int i = 0; i < forumIDs.length; i++) {
                Forum forum = forumFactory.getForum(forumIDs[i]);
                if (!watchManager.isWatched(user, forum))
                {
                    Watch watch = watchManager.getWatch(user, forum);
                    if (watch != null) {
                        watchManager.deleteWatch(watch);
                    }
                } 
            }

		
		} catch (Exception e) {
			logException(e, "Error in deleteForumWatches userid =" + userID);
			throw new Exception("Error in deleteForumWatches userid " + userID , e);
		}
    }

    public void createForumWatches(long userID, long[] forumIDs) throws Exception
    {

        try {
			WatchManager watchManager = forumFactory.getWatchManager();
			User user = forumFactory.getUserManager().getUser(userID);

            for (int i = 0; i < forumIDs.length; i++) {
                Forum forum = forumFactory.getForum(forumIDs[i]);
                if (!watchManager.isWatched(user, forum))
                {
                    watchManager.createWatch(user, forum);
                } 
            }

		
		} catch (Exception e) {
			logException(e, "Error checking createForumWatches userid =" + userID);
			throw new Exception("Error checking createForumWatches userid " + userID , e);
		}

    }

	/**
	 * <p>
	 * Adds the given <code>comment</code> to the specification review forum at
	 * the given category.
	 * </p>
	 * 
	 * @param categoryId
	 *            The ID of the category at which specification review forum the
	 *            comment should be added.
	 * @param userId
	 *            The ID of the user which calls this method (retrieved from
	 *            <code>TCSubject</code>).
	 * @param questionId
	 *            The ID of the question to which the comment refers to.
	 * @param comment
	 *            The <code>UserComment</code> object which should be added to
	 *            the specification review forum of given category.
	 * @return The ID of the added comment.
	 * 
	 * @throws SpecReviewCommentServiceException
	 *             If any error occurs while adding the given
	 *             <code>comment</code> to the specification review forum of the
	 *             given category. Also thrown if a comment with the given
	 *             comment ID already exists.
	 */
	public long addSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment)
			throws ForumsException {

		log.debug("Entering addSpecReviewComment...");

		Connection forumsConn = null;
		try {

			// retrieving spec review forum for given category
			Forum forum = getSpecReviewForum(categoryId);

			forumsConn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);

			log.debug("DBMS.FORUMS_DATASOURCE_NAME: " + DBMS.FORUMS_DATASOURCE_NAME);
			if (forumsConn == null) {
				log.debug("forumsConn is NULL");
			}

			// get corrresponding thread ID for given 'questionId' and forumid
			PreparedStatement forumsPS = forumsConn.prepareStatement("select thread_id from question_thread_xref q "
					+ "where q.question_id = " + questionId + " AND q.forum_id = " + forum.getID());

			log.debug("Searching thread for question id " + questionId + " with forum id " + forum.getID());
			ResultSet rs = forumsPS.executeQuery();

			long threadId = -1;
			while (rs.next()) {

				threadId = rs.getLong("thread_id");
			}
			rs.close();
			forumsPS.close();

			UserManager userManager = forumFactory.getUserManager();

			// XXX: Retrieving user from name or tcSubject user ID
			// Use the following line if you want to retrieve user from ID:
			// User user = userManager.getUser(userId);
			long commentUserId = userManager.getUserID(comment.getCommentBy());
			log.debug("Retrieved user id " + commentUserId + " for user with name from comment "
					+ comment.getCommentBy() + " from UserManager!");

			User user = userManager.getUser(commentUserId);
			// user.setName(comment.getCommentBy());

			if (user != null) {

				log.debug("Retrieved user with id " + user.getID() + " and name " + user.getName()
						+ " from UserManager!");
			}

			// create Message with user
			ForumMessage forumMessage = forum.createMessage(user);
			String body = comment.getComment();
			forumMessage.setBody(body);
			forumMessage.setCreationDate(comment.getCommentDate());
			forumMessage.setModificationDate(comment.getCommentDate());
			log.debug("Created ForumMessage with id " + forumMessage.getID() + " with user with id " + userId
					+ " and comment (message body): " + body);

			String subject = "";
			if (threadId == -1) { // no thread exists for given questionId so we
				// need to create one

				log.debug("No thread found for question id " + questionId + "!");
				// set subject for forum message
				subject = trimSubject(comment.getCommentQuestionName());
				forumMessage.setSubject(subject);

				// create thread with forumMessage as root message
				ForumThread thread = forum.createThread(forumMessage);
				log.debug("Created new thread with id " + thread.getID() + " and root message with id "
						+ forumMessage.getID() + "!");

				// set creation and modification date of the thread to the date
				// of the UserComment
				thread.setCreationDate(comment.getCommentDate());
				thread.setModificationDate(comment.getCommentDate());
				forum.addThread(thread);
				log.debug("Added thread with id " + thread.getID() + " and root message with id "
						+ forumMessage.getID() + " to forum with id " + forum.getID() + "!");

				// store the mapping 'questionId <-> threadId' in DB in table
				// 'question_thread_xref'
				PreparedStatement forumsInsertQuestionPS = forumsConn
						.prepareStatement("insert into question_thread_xref(question_id, thread_id, forum_id) values (?, ?, ?)");
				forumsInsertQuestionPS.setLong(1, questionId);
				forumsInsertQuestionPS.setLong(2, thread.getID());
				forumsInsertQuestionPS.setLong(3, forum.getID());
				forumsInsertQuestionPS.executeUpdate(); // execute insert
														// statement

				forumsInsertQuestionPS.close();

			} else { // a thread already exists for given questionId so we just
				// need to add a message

				log.debug("Found thread with id " + threadId + " for question id " + questionId);
				// build subject for forum message
				subject = "Re: " + trimSubject(comment.getCommentQuestionName());
				forumMessage.setSubject(subject);
				ForumThread thread = forum.getThread(threadId);

				// throw exception if threadId was not found
				if (thread == null) {

					ForumsException srce = new ForumsException("Could not find thread with id " + threadId
							+ " in forum with id " + forum.getID() + "!");
					logException(srce, "Thread with id " + threadId + " was NOT found in forum with id "
							+ forum.getID() + "!");
					throw srce;
				}

				// set modification date of the thread to the date of the
				// UserComment
				thread.setModificationDate(comment.getCommentDate());
				// add the forum message to the thread with the root message as
				// parent message
				ForumMessage rootMessage = thread.getRootMessage();
				thread.addMessage(rootMessage, forumMessage);
				forum.addThread(thread);
				log.debug("Added forum message with id " + forumMessage.getID() + " to thread with id "
						+ thread.getID() + " and root message with id " + rootMessage.getID() + " as parent message!");
			}

			// store the mapping 'commentId <-> messageId' in DB in table
			// 'comment_message_xref'
			PreparedStatement forumsInsertCommentPS = forumsConn.prepareStatement(
					"insert into comment_message_xref(message_id) values (?)", Statement.RETURN_GENERATED_KEYS);
			// .prepareStatement("insert into comment_message_xref(comment_id, message_id) values (?)");
			// forumsInsertPS.setLong(1, commentId);
			// forumsInsertPS.setLong(2, forumMessage.getID());

			forumsInsertCommentPS.setLong(1, forumMessage.getID());
			forumsInsertCommentPS.executeUpdate(); // execute insert statement

			ResultSet keys = forumsInsertCommentPS.getGeneratedKeys();

			keys.next();

			BigDecimal key = keys.getBigDecimal(1);
			keys.close();
			forumsInsertCommentPS.close();

			log.debug("Auto generated comment ID is " + key.longValue() + "!");

			return key.longValue();
		} catch (Exception e) {

			ForumsException srce = new ForumsException(
					"An error occured while adding spec review comment for category ID " + categoryId
							+ ", question ID " + questionId + " and comment ID " + comment.getCommentId() + "!", e);
			logException(e, "An error occured while adding spec review comment for category ID " + categoryId
					+ ", question ID " + questionId + " and comment ID " + comment.getCommentId() + "!");
			throw srce;
		} finally {

			try {

				if (forumsConn != null) {
					forumsConn.close();
				}
			} catch (SQLException sqle) {

				ForumsException srce = new ForumsException("An error occured while closing DB connection!");
				logException(sqle, "An error occured while closing DB connection!");
				throw srce;
			}
		}
	}

	/**
	 * <p>
	 * Retrieves all specification review comments for the given
	 * <code>categoryId</code>.
	 * </p>
	 * 
	 * @param categoryId
	 *            The ID of the category from which all specification review
	 *            comments should be retrieved from.
	 * @return a List of all specification review comments at the specification
	 *         review forum. An empty List is returned in case no thread and so
	 *         no message was found.
	 * 
	 * @throws SpecReviewCommentServiceException
	 *             If any error occurs while retrieving the specification review
	 *             comments.
	 */
	public List<ForumsSpecReviewComment> getSpecReviewComments(long categoryId) throws ForumsException {

		log.debug("Entering getSpecReviewComments...");

		Connection forumsConn = null;
		try {

            List<ForumsSpecReviewComment> specReviewComments = new LinkedList<ForumsSpecReviewComment>();

			// retrieving spec review forum for given category
			Forum forum = getSpecReviewForum(categoryId);

            if (forum == null)
            {
                return specReviewComments;
            }

			long forumId = forum.getID();

			forumsConn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);

			log.debug("DBMS.FORUMS_DATASOURCE_NAME: " + DBMS.FORUMS_DATASOURCE_NAME);
			if (forumsConn == null) {
				log.debug("forumsConn is NULL");
			}

			PreparedStatement forumsPS = forumsConn
					.prepareStatement("select question_id, thread_id from question_thread_xref q "
							+ "where q.forum_id = " + forumId);

			log.debug("Searching for all threads in forum with id " + forumId + "!");
			ResultSet rs = forumsPS.executeQuery();

			long questionId = -1;
			long threadId = -1;

			// iterate over all threads in forum with 'forumId'
			while (rs.next()) {

				questionId = rs.getLong("question_id");
				threadId = rs.getInt("thread_id");

				// create 'SpecReviewComment' object and set 'questionId' to it
				ForumsSpecReviewComment specReviewComment = new ForumsSpecReviewComment();
				specReviewComment.setQuestionId(questionId);

				// create List for all comments (messages) in thread with given
				// 'threadId'
				List<ForumsUserComment> comments = new LinkedList<ForumsUserComment>();

				ForumThread thread = forum.getThread(threadId);
				// throw exception if threadId was not found
				if (thread == null) {

					ForumsException srce = new ForumsException("Could not find thread with id " + threadId
							+ " in forum with id " + forum.getID() + "!");
					logException(srce, "Thread with id " + threadId + " was NOT found in forum with id "
							+ forum.getID() + "!");
					throw srce;
				}

                PreparedStatement forumsCommentMsg = forumsConn
					.prepareStatement("select comment_id from jivemessage jm, comment_message_xref x "
                     + "  where threadid = " + threadId + "  and jm.messageid = x.message_id and jm.parentmessageid is null ");

                ResultSet rsCommentMsg = forumsCommentMsg.executeQuery();
                long commentId = 0;
                boolean commentIdFound = false;

                if (rsCommentMsg.next()) {

                    commentIdFound = true;
                    commentId = rsCommentMsg.getLong("comment_id");
			    }

                if (!commentIdFound) {

						ForumsException srce = new ForumsException("Could not find the comment id for thread/message with id "
								+ threadId + "!");
						logException(srce, "Comment id for thread/message with id " + threadId
								+ " was NOT found in forum with id " + forum.getID() + "!");
						throw srce;
				}

                rsCommentMsg.close();
                forumsCommentMsg.close();

				// iterate over all messages in thread with given 'threadId'
				for (Iterator iter = thread.getMessages(); iter.hasNext();) {

					ForumsUserComment userComment = new ForumsUserComment();

					ForumMessage message = (ForumMessage) iter.next();
					long messageId = message.getID();

					// retrieve comment ID for given 'messageId'
					/*PreparedStatement forumsCommentMsg = forumsConn
							.prepareStatement("select comment_id from comment_message_xref c "
									+ "where c.message_id = " + messageId);
					
					boolean commentIdFound = false;
					rsCommentMsg.close();
					forumsCommentMsg.close();*/

					
                    userComment.setCommentId(commentId);
					userComment.setCommentDate(message.getModificationDate());
					userComment.setCommentBy(message.getUser().getName());

					// determine question name from message subject (removing
					// 'Re: ' prefix)
					String subject = message.getSubject();
					if (subject.startsWith("Re: ")) {

						subject = subject.substring(4);
					}

					userComment.setCommentQuestionName(subject);
					userComment.setComment(message.getBody());

					// add 'userComment' to 'comments' List
					comments.add(userComment);
				}

				specReviewComment.setComments(comments);
				// add 'specReviewComment' 'specReviewComments' List
				specReviewComments.add(specReviewComment);
			}
			rs.close();
			forumsPS.close();

			// return empty list if no thread was found
			if (threadId == -1) {

				return new LinkedList();
			}

			return specReviewComments;
		} catch (Exception e) {

			ForumsException srce = new ForumsException(
					"An error occured while retrieving spec review comments for category ID " + categoryId + "!", e);
			logException(e, "An error occured while retrieving spec review comments for category ID " + categoryId
					+ "!");
			throw srce;
		} finally {

			try {

				if (forumsConn != null) {
					forumsConn.close();
				}
			} catch (SQLException sqle) {

				ForumsException srce = new ForumsException("An error occured while closing DB connection!", sqle);
				logException(sqle, "An error occured while closing DB connection!");
				throw srce;
			}
		}
	}

	/**
	 * <p>
	 * Updates the given specification review comment.
	 * </p>
	 * 
	 * @param categoryId
	 *            The ID of the category at which specification review forum the
	 *            comment should be updated.
	 * @param userId
	 *            The ID of the user which calls this method (retrieved from
	 *            <code>TCSubject</code>).
	 * @param questionId
	 *            The ID of the question to which the comment refers to.
	 * @param comment
	 *            The <code>UserComment</code> object which should be updated to
	 *            the specification review forum of given category.
	 * 
	 * @throws SpecReviewCommentServiceException
	 *             If any error occurs while updating the given
	 *             <code>comment</code> to the specification review forum of the
	 *             given category.
	 */
	public void updateSpecReviewComment(long categoryId, long userId, long questionId, ForumsUserComment comment)
			throws ForumsException {

		log.debug("Entering updateSpecReviewComment...");

		Connection forumsConn = null;
		try {

			// retrieving spec review forum for given category
			Forum forum = getSpecReviewForum(categoryId);

			forumsConn = DBMS.getConnection(DBMS.FORUMS_DATASOURCE_NAME);

			log.debug("DBMS.FORUMS_DATASOURCE_NAME: " + DBMS.FORUMS_DATASOURCE_NAME);
			if (forumsConn == null) {
				log.debug("forumsConn is NULL");
			}

			PreparedStatement forumsPS = forumsConn.prepareStatement("select thread_id from question_thread_xref q "
					+ "where q.question_id = " + questionId);

			log.debug("Searching thread for question id " + questionId);
			ResultSet rs = forumsPS.executeQuery();

			long threadId = -1;
			while (rs.next()) {

				threadId = rs.getLong("thread_id");
			}
			rs.close();
			forumsPS.close();

			if (threadId == -1) { // no thread exists for given questionId

				ForumsException srce = new ForumsException("Could not find a thread_id for question with id "
						+ questionId + "!");
				logException(srce, "Thread id for question with id " + questionId + " was NOT found in forum with id "
						+ forum.getID() + "!");
				throw srce;
			}

			log.debug("Retrieved user with id " + userId + " from UserManager!");

			long commentId = comment.getCommentId();
			// retrieve message ID for given 'commentId'
			PreparedStatement forumsCommentMsg = forumsConn
					.prepareStatement("select message_id from comment_message_xref c " + "where c.comment_id = "
							+ commentId);
			ResultSet rsCommentMsg = forumsCommentMsg.executeQuery();

			long messageId = -1;
			while (rsCommentMsg.next()) {

				messageId = rsCommentMsg.getLong("message_id");
			}
			rsCommentMsg.close();
			forumsCommentMsg.close();

			if (messageId == -1) { // no message found for given comment ID

				ForumsException srce = new ForumsException("Could not find a message_id for comment with id "
						+ commentId + "!");
				logException(srce, "Message id for comment with id " + commentId + " was NOT found in thread with id "
						+ threadId + "!");
				throw srce;
			}

			ForumThread thread = forum.getThread(threadId);
			if (thread == null) {

				ForumsException srce = new ForumsException("Thread with id " + threadId
						+ " was not found at forum with id " + forum.getID() + "!");
				logException(srce, "Thread with id " + threadId + " was not found at forum with id " + forum.getID()
						+ "!");
				throw srce;
			}

			ForumMessage oldMessage = thread.getMessage(messageId);

			oldMessage.setBody(comment.getComment());
			oldMessage.setSubject(comment.getCommentQuestionName());
			oldMessage.setModificationDate(comment.getCommentDate());
		} catch (Exception e) {

			ForumsException srce = new ForumsException(
					"An error occured while updating spec review comment for category ID " + categoryId
							+ ", question ID " + questionId + " and comment ID " + comment.getCommentId() + "!", e);
			logException(e, "An error occured while updating spec review comment for category ID " + categoryId
					+ ", question ID " + questionId + " and comment ID " + comment.getCommentId() + "!");
			throw srce;
		} finally {

			try {

				if (forumsConn != null) {
					forumsConn.close();
				}
			} catch (SQLException sqle) {

				ForumsException srce = new ForumsException("An error occured while closing DB connection!");
				logException(sqle, "An error occured while closing DB connection!");
				throw srce;
			}
		}
	}

	/**
	 * <p>
	 * Retrieves the specification review forum from the given
	 * <code>categoryId</code>.
	 * </p>
	 * 
	 * @param categoryId
	 *            The category ID to retrieve the specification review forum
	 *            from.
	 * @return The specification review forum.
	 * 
	 * @throws SpecReviewCommentServiceException
	 *             If no specification review forum was found in the given
	 *             category.
	 */
	private Forum getSpecReviewForum(long categoryId) throws ForumsException {

		// retrieve spec review forum from given category
		log.debug("Searching spec review forum for forum category with id: " + categoryId);

		ForumCategory forumCategory = null;
		try {
			forumCategory = forumFactory.getForumCategory(categoryId);
			Forum forum = null;
			for (Iterator iter = forumCategory.getForums(); iter.hasNext();) {

				forum = (Forum) iter.next();
				String name = forum.getName();
				if (name.endsWith(ForumConstants.SPEC_REVIEW_FORUM_SUFFIX)) {

					log.debug("Found spec review forum for category id " + categoryId + ": " + forum.getID());
					return forum;
				}
			}
		} catch (Exception e) {

			ForumsException srce = new ForumsException("An error occured while retrieving spec review forum!", e);
			logException(srce, "An error occured while retrieving spec review forum!");
			throw srce;
		}

		log.warn("Forum with category id " + categoryId + " does not contain a spec review forum!");
		return null;
	}

    /**
     * <p>Gets the ID for root category for forums to be created for <code>TC Direct</code> projects.</p>
     * 
     * @return a <code>long</code> providing the ID for root category for forums to be created for 
     *         <code>TC Direct</code> projects.
     * @throws NamingException if an unexpected error occurs while accessing JNDI context.
     * @since 1.1 
     */
    private long getTcDirectProjectForumsRootCategoryId() throws NamingException {
        Context context = new InitialContext(); 
        return (Long) context.lookup("java:comp/env/tcDirectProjectForumsRootCategoryId");
    }

	/**
	 * <p>
	 * Trims the given <code>subject</code> to a specified length.
	 * </p>
	 * 
	 * @param subject
	 *            The subject which to trim to a max length.
	 * @return The trimmed string.
	 */
	private String trimSubject(String subject) {

		String retVal = subject;
		
		if (subject.length() > ForumConstants.SPEC_REVIEW_FORUM_MAX_CHAR_SUBJECT) {
			
			subject = subject.substring(0, ForumConstants.SPEC_REVIEW_FORUM_MAX_CHAR_SUBJECT);
			while (subject.charAt(subject.length() - 1) != ' ') {

				subject = subject.substring(0, subject.length() - 1);
			}

			retVal = subject + "...";
		} else {

			retVal = subject;
		}
		return subject;
	}

	/**
	 * <p>
	 * Logs the given exception <code>e</code> and message <code>msg</code>.
	 * </p>
	 * 
	 * <p>
	 * 10th January 2011: Changed method to log at <code>ERROR</code> level
	 * instead of <code>INFO</code> level.
	 * </p>
	 * 
	 * @param e
	 *            The <code>Exception</code> to log.
	 * @param msg
	 *            The message to log.
	 */
	private void logException(Exception e, String msg) {

		log.error("*** " + msg + ": " + e);
		StackTraceElement[] ste = e.getStackTrace();
		for (int i = 0; i < ste.length; i++) {
			log.error(ste[i]);
		}
	}
}

class JiveForumCategoryComparator implements Comparator {
	private String sortField;
	private int sortOrder;

	public JiveForumCategoryComparator(String sortField, int sortOrder) {
		this.sortField = sortField;
		this.sortOrder = sortOrder;
	}

	public final int compare(Object o1, Object o2) {
		ForumCategory c1 = (ForumCategory) o1;
		ForumCategory c2 = (ForumCategory) o2;

		int retVal = 0;
		if (sortField.equals("id")) {
			retVal = String.valueOf(c1.getID()).compareTo(String.valueOf(c2.getID()));
		} else if (sortField.equals("name")) {
			retVal = String.valueOf(c1.getName()).compareTo(String.valueOf(c2.getName()));
		}
		if (sortOrder == ResultFilter.DESCENDING) {
			retVal = -retVal;
		}
		return retVal;
	}
}

class JiveGroupComparator implements Comparator {
	private String sortField;
	private int sortOrder;

	public JiveGroupComparator(String sortField, int sortOrder) {
		this.sortField = sortField;
		this.sortOrder = sortOrder;
	}

	public final int compare(Object o1, Object o2) {
		Group g1 = (Group) o1;
		Group g2 = (Group) o2;

		int retVal = 0;
		if (sortField.equals("id")) {
			retVal = String.valueOf(g1.getID()).compareTo(String.valueOf(g2.getID()));
		} else if (sortField.equals("name")) {
			retVal = g1.getName().compareTo(g2.getName());
		} else if (sortField.equals("description")) {
			retVal = g1.getDescription().compareTo(g2.getDescription());
		}
		if (sortOrder == ResultFilter.DESCENDING) {
			retVal = -retVal;
		}
		return retVal;
	}
}
