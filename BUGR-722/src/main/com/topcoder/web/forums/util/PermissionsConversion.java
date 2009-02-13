package com.topcoder.web.forums.util;

import com.jivesoftware.base.Group;
import com.jivesoftware.base.GroupManager;
import com.jivesoftware.base.GroupNotFoundException;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.PermissionType;
import com.jivesoftware.base.PermissionsManager;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserManager;
import com.jivesoftware.base.UserNotFoundException;

import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumFactory;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.forums.ForumConstants;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.HashSet;
import java.util.Iterator;

/**
 * Uses the Jive API to create forum groups and permissions with data retrieved from the old Topcoder
 * software forums database.
 *
 * @author mtong
 * @version 1.0
 */
public class PermissionsConversion {	
	protected static Logger log = Logger.getLogger(ForumConversion.class);
	
	/**
     * The directory all the attachments are placed in.
     */
    private static String fileDir = null;
    
    /**
     * The root category id.
     */
    private static long rootCategoryId = 1;

    /**
     * The connection to old topcoder forum database.
     */
    private static Connection tcConn = null;
    
    private static PreparedStatement oldForumPS = null;	// determine old forum IDs
    private static PreparedStatement rolesPS = null;	// select forum security roles
    private static PreparedStatement adminPS = null;	// determines admin privileges for SW forums
    private static PreparedStatement publicPS = null;	// determine public SW forums
    
    public static void convertPermissions(ForumFactory forumFactory) {       
    	if (!JiveGlobals.getJiveBooleanProperty("tc.convert.tcs.forumPerms")) {
    		log.info("Forum conversion canceled.");
    		return;
    	}
    	
        try {
            fileDir = "/temp_forum_files";
            rootCategoryId = WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID;
            tcConn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
            
            if (!fileDir.endsWith("/")) {
                fileDir = fileDir + "/";
            }
            
            ForumCategory root = forumFactory.getForumCategory(rootCategoryId);

            log.info("Starting forum permissions conversion: attachmentDir = " + fileDir + " | rootCategoryId = "
            		+ rootCategoryId);
            convert(root, forumFactory);
            log.info("All forum permissions are converted correctly.");
        } catch (Exception ex) {
            System.err.println("Error occurred when converting the data.");
            ex.printStackTrace();
        }
        
        JiveGlobals.setJiveProperty("tc.convert.tcs.forumPerms", "false");
    }

    /**
     * Do the conversion.
     */
    private static void convert(ForumCategory root, ForumFactory forumFactory) throws Exception {
        UserManager userManager = forumFactory.getUserManager();
        GroupManager groupManager = forumFactory.getGroupManager();
        
        Group swAdminGroup = null;
        try {
        	swAdminGroup = groupManager.getGroup(ForumConstants.GROUP_SOFTWARE_ADMINS);
        } catch (GroupNotFoundException ge) {
        	swAdminGroup = groupManager.createGroup(ForumConstants.GROUP_SOFTWARE_ADMINS);
        }
        swAdminGroup.setDescription(ForumConstants.GROUP_SOFTWARE_ADMINS);
        
        adminPS = tcConn.prepareStatement("select login_id from user_role_xref where role_id = 1");
        ResultSet rs = adminPS.executeQuery();
        while (rs.next()) {
        	User user = userManager.getUser(rs.getLong(1));
        	if (!swAdminGroup.isMember(user)) {
        		swAdminGroup.addMember(user);
        	}
        }
        rs.close();
        
        for (int i=0; i<ForumConstants.ADMIN_PERMS.length; i++) {
        	root.getPermissionsManager().addGroupPermission(swAdminGroup, PermissionType.ADDITIVE, ForumConstants.ADMIN_PERMS[i]);
        }
        
        HashSet publicOldForumSet = new HashSet();
        publicPS = tcConn.prepareStatement("select permission from security_perms p, security_roles r "
        		+ " where p.permission like 'com.topcoder.dde.forum.ForumPostPermission %' "
        		+ " and p.role_id = r.role_id and p.role_id = 2");
        rs = publicPS.executeQuery();
        while (rs.next()) {
        	String[] ss = rs.getString(1).split(" ");
        	publicOldForumSet.add(ss[1]);
        }
        rs.close();
        
        // the ps to get the old forum id from comp_forum_xref table
        oldForumPS = tcConn.prepareStatement("select forum_id from comp_forum_xref "
        		+ " where comp_vers_id = ? and forum_type = 2");

        Iterator itCategories = root.getCategories();
        while (itCategories.hasNext()) {
            ForumCategory category = (ForumCategory)itCategories.next();
            log.info("Examining category " + category.getID() + " (" + category.getName() + "):");
            try {
                groupManager.getGroup(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX + category.getID());
                groupManager.getGroup(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX + category.getID());
                log.info("Moderator and user groups found, skipping...");
            } catch (GroupNotFoundException gnfe) {
                log.info("Moderator and user groups not found, creating groups...");
                // set moderator, user, admin permissions
                Group moderatorGroup = groupManager.createGroup(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX + category.getID());  // close resultset
                Group userGroup = groupManager.createGroup(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX + category.getID());  // close resultset
                moderatorGroup.setDescription(category.getName());
                userGroup.setDescription(category.getName());
                PermissionsManager categoryPermissionsManager = category.getPermissionsManager();
                for (int i=0; i<ForumConstants.MODERATOR_PERMS.length; i++) {
                    categoryPermissionsManager.addGroupPermission(moderatorGroup, PermissionType.ADDITIVE, ForumConstants.MODERATOR_PERMS[i]);
                }
                for (int i=0; i<ForumConstants.REGISTERED_PERMS.length; i++) {
                    categoryPermissionsManager.addGroupPermission(userGroup, PermissionType.ADDITIVE, ForumConstants.REGISTERED_PERMS[i]);
                }
                for (int i=0; i<ForumConstants.ADMIN_PERMS.length; i++) {
                    categoryPermissionsManager.addGroupPermission(swAdminGroup, PermissionType.ADDITIVE, ForumConstants.ADMIN_PERMS[i]);
                }
                
                // grant public permissions, if applicable
                oldForumPS.setLong(1, Long.parseLong(category.getProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_ID)));
                rs = oldForumPS.executeQuery();
                boolean hasNext = rs.next();
                if (hasNext) {
                    long oldForumID = rs.getLong(1);
                    rs.close();
                    
                    if (!publicOldForumSet.contains(String.valueOf(oldForumID))) {
                        for (int i=0; i<ForumConstants.SW_BLOCK_PERMS.length; i++) {
                            categoryPermissionsManager.addAnonymousUserPermission(PermissionType.NEGATIVE, ForumConstants.SW_BLOCK_PERMS[i]);   
                            categoryPermissionsManager.addRegisteredUserPermission(PermissionType.NEGATIVE, ForumConstants.SW_BLOCK_PERMS[i]);
                        }
                    }
                    
                    // add moderators
                    rolesPS = tcConn.prepareStatement("select urx.login_id from user_role_xref urx, security_roles r "
                            + "where r.description = 'ForumModerator " + oldForumID + "' and urx.role_id = r.role_id");
                    rs = rolesPS.executeQuery();
                    while (rs.next()) {
                        try {
                            long userID = rs.getLong("login_id");
                            moderatorGroup.addMember(userManager.getUser(userID));
                        } catch (UserNotFoundException unfe) {
                            log.info("UserNotFoundException when trying to add member to moderatorGroup: " + unfe.getMessage());
                            log.info("userID: " + rs.getLong("login_id"));
                        }
                    }
                    rs.close();
                    
                    // add users
                    rolesPS = tcConn.prepareStatement("select urx.login_id from user_role_xref urx, security_roles r "
                            + "where r.description = 'ForumUser " + oldForumID + "' and urx.role_id = r.role_id");
                    rs = rolesPS.executeQuery();
                    while (rs.next()) {
                        try {
                            long userID = rs.getLong("login_id");
                            userGroup.addMember(userManager.getUser(userID));
                        } catch (UserNotFoundException unfe) {
                            log.info("UserNotFoundException when trying to add member to userGroup: " + unfe.getMessage());
                            log.info("userID: " + rs.getLong("login_id"));
                        }
                    }
                }
                rs.close();
                log.info("Moderator and user groups created.");
            }
        }
    }
}