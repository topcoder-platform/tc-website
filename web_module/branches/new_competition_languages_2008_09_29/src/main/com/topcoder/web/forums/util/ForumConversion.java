/*
 * Copyright (C) 2005 TopCoder Inc., All Rights Reserved.
 */
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

import com.jivesoftware.forum.AttachmentException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumMessage;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;

/**
 * Uses the Jive API to create categories/forums/threads/messages with data retrieved from the old Topcoder
 * software forums database.
 *
 * @author air2cold, billy, mtong
 * @version 1.0
 */
public class ForumConversion {	
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

    /**
     * The statement to select forum data from old topcoder forum database.
     */
    private static PreparedStatement forumPS = null;
    
    /**
     * The statement to update rows in the "comp_forum_xref" table of the old topcoder forum database.
     */
    private static PreparedStatement updateCompForumXrefPS = null;

    /**
     * The statement to select topic data from old topcoder forum database.
     */
    private static PreparedStatement topicPS = null;

    /**
     * The statement to select thread data from old topcoder forum database.
     */
    private static PreparedStatement threadPS = null;

    /**
     * The statement to select post data from old topcoder forum database.
     */
    private static PreparedStatement postPS = null;

    /**
     * The statement to select attachment data from old topcoder forum database.
     */
    private static PreparedStatement attPS = null;
    
    /**
     * The statement to select the technology type data from old topcoder forum database.
     */
    private static PreparedStatement techPS = null;
    
    private static PreparedStatement oldForumPS = null;	// determine old forum IDs
    private static PreparedStatement rolesPS = null;	// select forum security roles
    private static PreparedStatement adminPS = null;	// determines admin privileges for SW forums
    private static PreparedStatement publicPS = null;	// determine public SW forums
    
    static boolean ATTACHMENTS_ENABLED = true;
    
    public static void convertForums(ForumFactory forumFactory) {       
    	if (!JiveGlobals.getJiveBooleanProperty("tc.convert.tcs.forums")) {
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
            if (JiveGlobals.getJiveBooleanProperty("tc.convert.tcs.forums.delete")) {
	            if (root.getCategoryCount() > 0 || root.getForumCount() > 0) {
	            	//log.info("Stopping conversion - the root category is not empty.");
	            	log.info("Deleting categories in dev.... ");
	            	Iterator itCat = root.getCategories();
	            	int numCategories = root.getCategoryCount();
	            	int numDeleted = 0;
	            	while (itCat.hasNext()) {
	            		ForumCategory cat = (ForumCategory)itCat.next();
	            		root.deleteCategory(cat);
	            		log.info(++numDeleted + "/" + numCategories + " categories deleted");
	            	}
	            	log.info("All dev categories deleted.");
	            }
            }

            log.info("Starting the forum conversion: attachmentDir = " + fileDir + " | rootCategoryId = "
            		+ rootCategoryId);
            convert(root, forumFactory);
            log.info("All forums are converted correctly.");
        } catch (Exception ex) {
            System.err.println("Error occurred when converting the data.");
            ex.printStackTrace();
        }
        
        JiveGlobals.setJiveProperty("tc.convert.tcs.forums", "false");
    }

    /**
     * Do the conversion.
     */
    private static void convert(ForumCategory root, ForumFactory forumFactory) throws Exception {
        UserManager userManager = forumFactory.getUserManager();
        GroupManager groupManager = forumFactory.getGroupManager();
        MimetypesFileTypeMap fileTypeMap = new MimetypesFileTypeMap();
        
        // Remove old software user/moderator groups
        Iterator itGroups = groupManager.getGroups();
        while (itGroups.hasNext()) {
        	Group group = (Group)itGroups.next();
        	if (group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX) ||
        			group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX)) {
        		groupManager.deleteGroup(group);
        	}
        }
        
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
        
        //Context context = new InitialContext();
        //LocalIdGenHome localIdGenHome = (LocalIdGenHome) context.lookup(LocalIdGenHome.EJB_REF_NAME);
        //LocalIdGen localIdGen = localIdGenHome.create();
        
    	// get forums from FORUM_MASTER table        
        forumPS = tcConn.prepareStatement(
                "select m.forum_id, c.component_name, c.short_desc, m.status_id, m.create_time, "
        		+ " v.comp_vers_id, v.version_text, v.phase_id, f.forum_type, "
        		+ " c.root_category_id, c.status_id, c.component_id "
                + " from forum_master m, comp_forum_xref f, comp_versions v, comp_catalog c "
                + " where m.forum_id = f.forum_id and "
                + " f.comp_vers_id = v.comp_vers_id and v.component_id = c.component_id and f.forum_type = 2"
                + " order by m.forum_id"
        );

        rs = forumPS.executeQuery();
        List forums = new ArrayList();

        while (rs.next()) {
            ForumMaster forum = new ForumMaster(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getLong(4),
                    rs.getDate(5), rs.getLong(6), rs.getString(7), rs.getLong(8), rs.getLong(9), rs.getLong(10),
                    rs.getLong(11), rs.getLong(12));
            forums.add(forum);
        }

        rs.close();
        
        // the ps to insert rows into the comp_jive_xref table
        updateCompForumXrefPS = tcConn.prepareStatement("update comp_forum_xref " 
        		+ "set jive_category_id = ? " 
        		+ "where comp_vers_id = ? and forum_type = ?");

        // the ps to get topics from forum_topics table
        topicPS = tcConn.prepareStatement("select topic_id, topic_name, topic_text, create_time from forum_topics "
                + "where forum_id = ? and status_id != 0");

        // the ps to get threads from forum_threads table
        threadPS = tcConn.prepareStatement(
                "select thread_id, subject, create_time from forum_threads where topic_id = ? "
                + " and status_id = 1 order by create_time ASC");

        // the ps to get posts from forum_posts table
        postPS = tcConn.prepareStatement(
                "select post_id, login_id, post_time, post_text, parent_post_id from forum_posts "
                + " where thread_id = ? and status_id = 1 order by post_time ASC");

        // the ps to get attachments from forum_attachment table
        attPS = tcConn.prepareStatement("select forum_attach_id, attachment_name, url from forum_attachment "
                + " where post_id = ?");
        
        // the ps to get the technology types from forum_master table
        techPS = tcConn.prepareStatement("select tech.technology_type_id "
        		+ " from comp_forum_xref f, comp_technology tech "
				+ " where f.forum_id = ? and f.comp_vers_id = tech.comp_vers_id");
        
        // the ps to get the old forum id from comp_forum_xref table
        oldForumPS = tcConn.prepareStatement("select forum_id from comp_forum_xref "
        		+ " where comp_vers_id = ? and forum_type = ?");

        int forumNum = 0;
        int totalForum = forums.size();
       	int startIdx = JiveGlobals.getJiveIntProperty("tc.convert.tcs.forums.start", 1);
       	int endIdx = JiveGlobals.getJiveIntProperty("tc.convert.tcs.forums.end", totalForum);
       	log.info("Returning forums " + startIdx + "-" + endIdx + " out of " + totalForum + " total forums: ");
        
        for (Iterator it = forums.iterator(); it.hasNext();) {
            ForumMaster forum = (ForumMaster) it.next();
        	++forumNum;
        	if (forumNum < startIdx) continue;
            if (forumNum > endIdx) break;

            // create a category for topcoder forum
            log.info("Processing forum " + forumNum + "/" + endIdx + " (ID = " + forum.getId() + "): ");
            String categoryName = ForumsUtil.getComponentCategoryName(forum.getName(), forum.getVersionText());
            ForumCategory category = root.createCategory(categoryName, forum.getDesc());
            category.setCreationDate(forum.getCreation());
            category.setModificationDate(forum.getCreation());
            category.setProperty(ForumConstants.PROPERTY_ARCHIVAL_STATUS, forum.getStatus() + "");           
            //category.setProperty(ForumConstants.PROPERTY_COMPONENT_PHASE, forum.getComponentPhase() + "");
            //category.setProperty(ForumConstants.PROPERTY_COMPONENT_STATUS, forum.getComponentStatus() + "");
            category.setProperty(ForumConstants.PROPERTY_COMPONENT_ID, forum.getComponentId() + "");
            category.setProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_ID, forum.getCompVersId() + "");
            //category.setProperty(ForumConstants.PROPERTY_COMPONENT_ROOT_CATEGORY_ID, 
            //		forum.getRootCategoryId() + "");
            category.setProperty(ForumConstants.PROPERTY_COMPONENT_VERSION_TEXT, forum.getVersionText());
            category.setProperty(ForumConstants.PROPERTY_MODIFY_FORUMS, "true");
            
            // set moderator, user, admin permissions
            Group moderatorGroup = groupManager.createGroup(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX + category.getID());  // close resultset
            Group userGroup = groupManager.createGroup(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX + category.getID());	// close resultset
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
            
            oldForumPS.setLong(1, forum.getCompVersId());
            oldForumPS.setLong(2, forum.getForumType());
            rs = oldForumPS.executeQuery();
            rs.next();
            long oldForumID = rs.getLong(1);
            rs.close();
            
            if (!publicOldForumSet.contains(String.valueOf(oldForumID))) {
            	for (int i=0; i<ForumConstants.SW_BLOCK_PERMS.length; i++) {
                	categoryPermissionsManager.addAnonymousUserPermission(PermissionType.NEGATIVE, ForumConstants.SW_BLOCK_PERMS[i]);	
	            	categoryPermissionsManager.addRegisteredUserPermission(PermissionType.NEGATIVE, ForumConstants.SW_BLOCK_PERMS[i]);
            	}
            }
           
            // the ps to get the security roles from user_roles_xref table
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
            rs.close();
            
            // set technology types for this category
            /*
            techPS.setLong(1, forum.getId());
            // holds list of technology types in form "1,5,15"
            StringBuffer techTypeList = new StringBuffer();
            rs = techPS.executeQuery();
            while(rs.next()) {
            	if(techTypeList.length() > 0) {
            		techTypeList.append(",");
            	}
            	techTypeList.append(rs.getLong(1));
            }
            category.setProperty(ForumConstants.PROPERTY_COMPONENT_TECH_TYPES, techTypeList.toString());
            rs.close();
            */
            
            // link comp_forum_xref entries to Jive categories
            updateCompForumXrefPS.setLong(1, category.getID());
            updateCompForumXrefPS.setLong(2, forum.getCompVersId());
            updateCompForumXrefPS.setLong(3, forum.getForumType());
            updateCompForumXrefPS.executeUpdate();
            
            // get topics in this forum           
            topicPS.setLong(1, forum.getId());
            //log.info("setting topicPS[1] to " + forum.getId());
            rs = topicPS.executeQuery();

            List topics = new ArrayList();

            while (rs.next()) {
                ForumTopic topic = new ForumTopic(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getDate(4));
                topics.add(topic);
            }

            rs.close();

            for (Iterator topIt = topics.iterator(); topIt.hasNext();) {
                ForumTopic topic = (ForumTopic) topIt.next();

                // create a category for this topic
                // not creating separate category for forum
                /*
                DbForumCategory topicCat = (DbForumCategory) category.createCategory(topic.getName(), topic.getText());
                //log.info("topic is: " + topic);
                topicCat.setCreationDate(topic.getCreation());
                topicCat.setModificationDate(topic.getCreation());
                */
                
                // create a forum for this topic in the category created above
                //DbForum topicForum = (DbForum) forumFactory.createForum(topic.getName(), topic.getText(), topicCat);
                Forum topicForum = forumFactory.createForum(topic.getName(), topic.getText(), category);

                topicForum.setCreationDate(topic.getCreation());
                topicForum.setModificationDate(topic.getCreation());

                // get threads in this topic               
                threadPS.setLong(1, topic.getId());
                //log.info("setting threadPS[1] to " + topic.getId());
                rs = threadPS.executeQuery();

                List threads = new ArrayList();

                while (rs.next()) {
                    ForumThread thread = new ForumThread(rs.getLong(1), rs.getString(2), rs.getDate(3));
                    threads.add(thread);
                }

                rs.close();

                // insert threads into jive forum
                int threadNum = 0;
                int totalThreads = threads.size();
                Date forumModificationDate = null;

                for (Iterator threadIt = threads.iterator(); threadIt.hasNext();) {
                    threadNum++;

                    ForumThread thread = (ForumThread) threadIt.next();

                    // get posts in this thread                   
                    postPS.setLong(1, thread.getId());
                    //log.info("setting postPS[1] to " + thread.getId());
                    rs = postPS.executeQuery();

                    List posts = new ArrayList();

                    while (rs.next()) {
                        ForumPost post = new ForumPost(rs.getLong(1), rs.getLong(2), rs.getDate(3), rs.getString(4));
                        long parentId = rs.getLong(5);

                        if (!rs.wasNull()) {
                            post.setParentId(new Long(parentId));
                        }

                        posts.add(post);
                    }

                    rs.close();

                    // insert posts into the thread
                    boolean first = true;
                    Map parentMsgs = new HashMap();
                    ForumMessage parentMsg = null;
                    com.jivesoftware.forum.ForumThread forumThread = null;
                    Date threadModificationDate = null;

                    for (Iterator postIt = posts.iterator(); postIt.hasNext();) {
                        ForumPost post = (ForumPost) postIt.next();

                        // get attachments of this post                      
                        attPS.setLong(1, post.getId());
                        //log.info("setting attPS[1] to " + post.getId());
                        rs = attPS.executeQuery();

                        List attaches = new ArrayList();

                        while (rs.next()) {
                            ForumAttachment att = new ForumAttachment(rs.getLong(1), rs.getString(2), rs.getString(3));
                            attaches.add(att);
                        }

                        rs.close();

                        ForumMessage msg;
                        try {
                        	msg = topicForum.createMessage(userManager.getUser(post.getLoginId()));
                        } catch (UserNotFoundException unfe) {
                        	log.info("UserNotFoundException when trying to create message: " + unfe.getMessage());
                        	log.info("post.getId(): " + post.getId());
                        	log.info("post.getLoginId(): " + post.getLoginId());

                        	log.info("unfe.getUserID(): " + unfe.getUserID());
                        	log.info("unfe.getUsername(): " + unfe.getUsername() + "\n[end UNFE]");
                        	
                        	// set to user #100 (guest100) and try again
                        	msg = topicForum.createMessage(userManager.getUser(100));
                        	
                        	//throw unfe;
                        	//continue;
                        } catch (Exception e) {
                        	log.info("Exception: " + e.getMessage() + ": loginId is: " + post.getLoginId());
                        	throw e;
                        }
                        msg.setBody(post.getPostText());
                        msg.setCreationDate(post.getPostTime());
                        msg.setModificationDate(post.getPostTime());

                        // add attachment to jive message
                        for (Iterator attIt = attaches.iterator(); attIt.hasNext();) {
                            ForumAttachment att = (ForumAttachment) attIt.next();
                            File attFile = new File(fileDir + att.getUrl());
                            //String urlStr = "https://software.topcoder.com/forum/attachment?f="+post.getId()+"&id="+att.getId();
                            
                            if(ATTACHMENTS_ENABLED) {
	                            try {
	                            	msg.createAttachment(att.getName(), fileTypeMap.getContentType(attFile), new FileInputStream(attFile));
	                            	log.info("***** Attachment " + att.getName() + " successfully attached at: " + attFile.getPath());
	                            } catch (IOException ioe) {
	                            	log.info("***** Attachment " + att.getName() + " not found at: " + attFile.getPath());
	                            } catch (AttachmentException ae) {
	                            	log.info("***** Attachment exception for " + att.getName() + ": " + ae.getMessage() + ". Skipped attachment.");
	                            }
                            } else {
                            	log.info("***** Skipping attaching of: " + att.getName() + " at: " + attFile.getPath());
                            }
                        }

                        if (first) {
                            // add the thread into jive forum
                            msg.setSubject(thread.getSubject());
                            forumThread = topicForum.createThread(msg);
                            topicForum.addThread(forumThread);
                            parentMsg = msg;
                            first = false;
                        } else {
                            // add the message into the jive thread
                            msg.setSubject("Re: " + thread.getSubject());

                            ForumMessage pMsg = (ForumMessage)parentMsgs.get(post.getParentId());

                            if (pMsg != null) {
                                forumThread.addMessage(pMsg, msg);
                            }
                        }

                        parentMsgs.put(new Long(post.getId()), msg);
                        threadModificationDate = post.getPostTime();
                    }

                    // change thread's modification date
                    forumThread.setModificationDate(threadModificationDate);
                    forumModificationDate = threadModificationDate;

                    if ((threadNum % 1000) == 0) {
                        log.info(threadNum + " out of " + totalThreads + " threads have been processed.");
                    }
                }

                // change forum/category's modification date
                if (forumModificationDate != null) {
                    topicForum.setModificationDate(forumModificationDate);
                    //topicCat.setModificationDate(forumModificationDate);
                    category.setModificationDate(forumModificationDate);
                }
            }
            
            log.info(forumNum + " out of " + endIdx + " forums have been processed.");
        }
    }

    /**
     * Close the connection.
     *
     * @param conn the connection to close.
     */
    private static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ex) {
            	log.info("connection could not be closed: ");
            	ex.printStackTrace();
            }
        }
    }

    /**
     * Close the statement.
     *
     * @param ps the statement to close.
     */
    private static void closeStatement(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ex) {
            	log.info("statement could not be closed: ");
            	ex.printStackTrace();
            }
        }
    }
}


/**
 * Represents the forum entity. It corresponds to the record in the form_master table.
 *
 * @author air2cold
 * @version 1.0
 */
class ForumMaster {
    /**
     * The id of the forum.
     */
    private long id;

    /**
     * The name of the forum.
     */
    private String name;

    /**
     * The description of the forum.
     */
    private String desc;

    /**
     * The status of the forum.
     */
    private long status;

    /**
     * The creation date of the forum.
     */
    private Date creation;
    
    /**
     * The component version id
     */
    private long compVersId;
    
    /**
     * The version number
     */
    private String versionText;
    
    /**
     * The component phase
     */
    private long componentPhase;

    /**
     * The forum type
     */
    private long forumType;
    
    /**
     * The root category id
     */
    private long rootCategoryId;
    
    /**
     * The component status
     */
    private long componentStatus;
    
    /**
     * The component id
     */
    private long componentId;
    
    /**
     * Constructor.
     *
     * @param id forum id.
     * @param name forum name.
     * @param desc forum description.
     * @param status forum status.
     * @param creation forum creation time.
     * @param compVersId component version id.
     * @param versionText component version text.
     * @param componentPhase component phase.
     * @param forumType forum type.
     * @param rootCategoryId root category id.
     * @param componentStatus component status.
     * @param componentId component id.
     */
    public ForumMaster(long id, String name, String desc, long status, Date creation, long compVersId, 
    		String versionText, long componentPhase, long forumType, long rootCategoryId, long componentStatus,
    		long componentId) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.status = status;
        this.creation = creation;
        this.compVersId = compVersId;
        this.versionText = versionText;
        this.componentPhase = componentPhase;
        this.forumType = forumType;
        this.rootCategoryId = rootCategoryId;
        this.componentStatus = componentStatus;
        this.componentId = componentId;
    }

    /**
     * Return the forum id.
     *
     * @return the forum id.
     */
    public long getId() {
        return this.id;
    }

    /**
     * Return the forum name.
     *
     * @return the forum name.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Return the forum description.
     *
     * @return the forum description.
     */
    public String getDesc() {
        return this.desc;
    }

    /**
     * Return the forum status.
     *
     * @return the forum status.
     */
    public long getStatus() {
        return this.status;
    }

    /**
     * Return the forum creation date time.
     *
     * @return the forum creation date time.
     */
    public Date getCreation() {
        return this.creation;
    }
    
    /**
     * Return the component version id.
     * 
     * @return the component version id.
     */
    public long getCompVersId() {
    	return this.compVersId;
    }
    
    /**
     * Return the version text.
     * 
     * @return the version text.
     */
    public String getVersionText() {
    	return this.versionText;
    }
    
    /**
     * Return the component's phase.
     * 
     * @return the component's phase
     */
    public long getComponentPhase() {
    	return this.componentPhase;
    }
    
    /**
     * Return the forum type.
     * 
     * @return the forum type
     */
    public long getForumType() {
    	return this.forumType;
    }
    
    /**
     * Return the root category id.
     * 
     * @return the root category id
     */
    public long getRootCategoryId() {
    	return this.rootCategoryId;
    }
    
    /**
     * Return the component's status.
     * 
     * @return the component's status
     */
    public long getComponentStatus() {
    	return this.componentStatus;
    }
    
    /**
     * Return the component's id.
     * 
     * @return the component's id
     */
    public long getComponentId() {
    	return this.componentId;
    }
}


/**
 * Represents the topic in the forum. Corresponds to record in forum_topics table.
 *
 * @author air2cold
 * @version 1.0
 */
class ForumTopic {
	
	public String toString() {
		return "id: " + id + "\tname: " + name + "\ttext: " + text + "\tcreation: " + creation;
	}
	
    /**
     * The topic id.
     */
    private long id;

    /**
     * The topic name.
     */
    private String name;

    /**
     * The topic text.
     */
    private String text;

    /**
     * The topic creation date.
     */
    private Date creation;

    /**
     * Constructor.
     *
     * @param id topic id.
     * @param name topic name.
     * @param text topic text.
     * @param creation topic creation date.
     */
    public ForumTopic(long id, String name, String text, Date creation) {
        this.id = id;
        this.name = name;
        this.text = text;
        this.creation = creation;
    }

    /**
     * Return topic id.
     *
     * @return topic id.
     */
    public long getId() {
        return this.id;
    }

    /**
     * Return topic name.
     *
     * @return topic name.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Return topic text.
     *
     * @return topic text.
     */
    public String getText() {
        return this.text;
    }

    /**
     * Return topic creation date.
     *
     * @return topic creation date.
     */
    public Date getCreation() {
    	if(this.creation == null) {
    		//log.info("----- null creation date - using Date(0)");
    		return new Date(0);
    	}
        return this.creation;
    }
}


/**
 * Represents the thread in each topic. Corresponds to record in forum_threads table.
 *
 * @author air2cold
 * @version 1.0
 */
class ForumThread {
    /**
     * The thread id.
     */
    private long id;

    /**
     * The thread subject.
     */
    private String subject;

    /**
     * The thread creation date.
     */
    private Date creation;

    /**
     * Constructor.
     *
     * @param id thread id.
     * @param subject thread subject.
     * @param creation thread creation date.
     */
    public ForumThread(long id, String subject, Date creation) {
        this.id = id;
        this.subject = subject;
        this.creation = creation;
    }

    /**
     * Return thread id.
     *
     * @return thread id.
     */
    public long getId() {
        return this.id;
    }

    /**
     * Return thread subject.
     *
     * @return thread subject.
     */
    public String getSubject() {
        return this.subject;
    }

    /**
     * Return thread creation date.
     *
     * @return thread creation date.
     */
    public Date getCreation() {
        return this.creation;
    }
}


/**
 * Represents the post in each thread. Corresponds record in forum_posts table.
 *
 * @author air2cold
 * @version 1.0
 */
class ForumPost {
	public String toString() {
		return "id: " + id + "\tloginId: " + loginId + "\tpostTime: " + postTime + "\tpostText: " + postText + "\tparentId: " + parentId;
	}
    /**
     * The post id.
     */
    private long id;

    /**
     * The id of user who posts the thread.
     */
    private long loginId;

    /**
     * The date the post is posted.
     */
    private Date postTime;

    /**
     * The content of the post.
     */
    private String postText;

    /**
     * The id of the parent post.
     */
    private Long parentId = null;

    /**
     * Constructor.
     *
     * @param id post id.
     * @param loginId user id.
     * @param postTime post date.
     * @param postText post text.
     */
    public ForumPost(long id, long loginId, Date postTime, String postText) {
        this.id = id;
        this.loginId = loginId;
        this.postTime = postTime;
        this.postText = postText;
    }

    /**
     * Return post id.
     *
     * @return post id.
     */
    public long getId() {
        return this.id;
    }

    /**
     * Return user id.
     *
     * @return user id.
     */
    public long getLoginId() {
    	if(this.loginId == 0) {
    		//log.info("loginId is 0 - changing to 2");
    		return 2;
    	}
        return this.loginId;
    }

    /**
     * Return post time.
     *
     * @return post time.
     */
    public Date getPostTime() {
        return this.postTime;
    }

    /**
     * Return post text.
     *
     * @return post text.
     */
    public String getPostText() {
        return this.postText;
    }

    /**
     * Set parent post id.
     *
     * @param parentId parent post id.
     */
    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    /**
     * Return parent post id, return null if there is no parent.
     *
     * @return parent post id.
     */
    public Long getParentId() {
        return this.parentId;
    }
}


/**
 * Represents the attachment in the post. Corresponds to forum_attachment table.
 *
 * @author air2cold
 * @version 1.0
 */
class ForumAttachment {
    /**
     * The attachment id.
     */
    private long id;

    /**
     * The attachment name.
     */
    private String name;

    /**
     * The attachment url.
     */
    private String url;

    /**
     * Constructor.
     *
     * @param id attachment id.
     * @param name attachment name.
     * @param url attachment url.
     */
    public ForumAttachment(long id, String name, String url) {
        this.id = id;
        this.name = name;
        this.url = url;
    }

    /**
     * Return attachment id.
     *
     * @return attachment id.
     */
    public long getId() {
        return this.id;
    }

    /**
     * Return attachment name.
     *
     * @return attachment name.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Return attachment url.
     *
     * @return attachment url.
     */
    public String getUrl() {
        return this.url;
    }
}