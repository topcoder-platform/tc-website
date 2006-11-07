/*
 * Copyright (C) 2005 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities;

import com.jivesoftware.base.UserManager;
import com.jivesoftware.base.UserNotFoundException;

import com.jivesoftware.forum.database.DbForum;
import com.jivesoftware.forum.database.DbForumCategory;
import com.jivesoftware.forum.database.DbForumFactory;
import com.jivesoftware.forum.database.DbForumMessage;
import com.jivesoftware.forum.database.DbForumThread;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.web.forums.model.TCUserManager;

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Uses the Jive API to create categories/forums/threads/messages with data retrieved from the old Topcoder
 * software forums database. (NOTE: this does not work, since JNDI/context lookups for Jive and TCUserManager
 * cannot be performed when JBoss is down. Use /forums/util/ForumConversion instead.)
 *
 * @author air2cold, billy, mtong
 * @version 1.0
 */
public class ForumConversion {
	/**
     * Datasource containing the existing TCS attachments.
     */
    private static String datasourceName = null;
	
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
    
    static boolean ATTACHMENTS_ENABLED = true;

    
    public static void main(String[] args) {
        if (args.length != 3) {
            System.out.println("SYNTAX: java ForumConversion <datasource> <attachment_dir> <root_category_id>");
            return;
        }
        
        try {
        	datasourceName = args[0];
            fileDir = args[1];
            rootCategoryId = Long.parseLong(args[2]);
            tcConn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty(datasourceName)).getConnection();
            
            if (!fileDir.endsWith("/")) {
                fileDir = fileDir + "/";
            }

            System.out.println("Start the forum conversion.");
            convert();
            System.out.println("All forums are converted correctly.");
        } catch (Exception ex) {
            System.err.println("Error occurred when converting the data.");
            ex.printStackTrace();
            return;
        } finally {
            closeConnection(tcConn);
            closeStatement(forumPS);
            closeStatement(topicPS);
            closeStatement(threadPS);
            closeStatement(postPS);
            closeStatement(attPS);
        }
        return;
    }

    /**
     * Do the conversion.
     */
    public static void convert() throws Exception {
        // get forums from FORUM_MASTER table        
        forumPS = tcConn.prepareStatement(
                "select m.forum_id, c.component_name, c.short_desc, m.status_id, m.create_time, "
        		+ " v.comp_vers_id, v.version_text, v.phase_id, f.forum_type "
                + " from forum_master m, comp_forum_xref f, comp_versions v, comp_catalog c "
                + " where (m.status_id = 1 or m.status_id = 2) and m.forum_id = f.forum_id and "
                + " f.comp_vers_id = v.comp_vers_id and v.component_id = c.component_id"
        );

        ResultSet rs = forumPS.executeQuery();
        List forums = new ArrayList();

        while (rs.next()) {
            ForumMaster forum = new ForumMaster(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getLong(4),
                    rs.getDate(5), rs.getLong(6), rs.getString(7), rs.getLong(8), rs.getLong(9));
            forums.add(forum);
        }

        rs.close();

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

        //UserManager userManager = new DbUserManager();
        UserManager userManager = new TCUserManager();

        // All topcoder forums would be put under this root category.
        DbForumCategory root = new DbForumCategory(rootCategoryId);

        int forumNum = 0;
        int totalForum = forums.size();

        for (Iterator it = forums.iterator(); it.hasNext();) {
            forumNum++;

            // create a category for topcoder forum
            ForumMaster forum = (ForumMaster) it.next();
            DbForumCategory category = (DbForumCategory) root.createCategory(forum.getName(), forum.getDesc());
            category.setCreationDate(forum.getCreation());
            category.setModificationDate(forum.getCreation());
            category.setProperty("status", (forum.getStatus() == 1) ? "active" : "archived");           
            category.setProperty("componentStatus", forum.getComponentStatus() + "");
            category.setProperty("compVersId", forum.getCompVersId() + "");
            category.setProperty("forumType", forum.getForumType() + "");
            category.setProperty("versionText", forum.getVersionText());
            
            // set technology types for this category
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
            category.setProperty("technologyType", techTypeList.toString());
            rs.close();
            
            // get topics in this forum           
            topicPS.setLong(1, forum.getId());
            //System.out.println("setting topicPS[1] to " + forum.getId());
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
                //System.out.println("topic is: " + topic);
                topicCat.setCreationDate(topic.getCreation());
                topicCat.setModificationDate(topic.getCreation());
                */
                
                // create a forum for this topic in the category created above
                DbForumFactory forumFactory = DbForumFactory.getInstance();
                //DbForum topicForum = (DbForum) forumFactory.createForum(topic.getName(), topic.getText(), topicCat);
                DbForum topicForum = (DbForum) forumFactory.createForum(topic.getName(), topic.getText(), category);

                topicForum.setCreationDate(topic.getCreation());
                topicForum.setModificationDate(topic.getCreation());

                // get threads in this topic               
                threadPS.setLong(1, topic.getId());
                //System.out.println("setting threadPS[1] to " + topic.getId());
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
                    //System.out.println("setting postPS[1] to " + thread.getId());
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
                    DbForumMessage dbParentMsg = null;
                    DbForumThread dbThread = null;
                    Date threadModificationDate = null;

                    for (Iterator postIt = posts.iterator(); postIt.hasNext();) {
                        ForumPost post = (ForumPost) postIt.next();

                        // get attachments of this post                      
                        attPS.setLong(1, post.getId());
                        //System.out.println("setting attPS[1] to " + post.getId());
                        rs = attPS.executeQuery();

                        List attaches = new ArrayList();

                        while (rs.next()) {
                            ForumAttachment att = new ForumAttachment(rs.getLong(1), rs.getString(2), rs.getString(3));
                            attaches.add(att);
                        }

                        rs.close();

                        DbForumMessage msg;
                        try {
                        	msg = (DbForumMessage) topicForum.createMessage(userManager.getUser(
                                    post.getLoginId()));
                        } catch (UserNotFoundException unfe) {
                        	System.out.println("UserNotFoundException: " + unfe.getMessage());
                        	System.out.println("post.getId(): " + post.getId());
                        	System.out.println("post.getLoginId(): " + post.getLoginId());

                        	System.out.println("unfe.getUserID(): " + unfe.getUserID());
                        	System.out.println("unfe.getUsername(): " + unfe.getUsername() + "\n[end UNFE]");
                        	
                        	// set to user #100 (guest100) and try again
                        	msg = (DbForumMessage) topicForum.createMessage(userManager.getUser(100));
                        	
                        	//throw unfe;
                        	//continue;
                        } catch (Exception e) {
                        	System.out.println("Exception: " + e.getMessage() + ": loginId is: " + post.getLoginId());
                        	throw e;
                        }
                        msg.setBody(post.getPostText());
                        msg.setCreationDate(post.getPostTime());
                        msg.setModificationDate(post.getPostTime());

                        // add attachment to jive message
                        for (Iterator attIt = attaches.iterator(); attIt.hasNext();) {
                            ForumAttachment att = (ForumAttachment) attIt.next();
                            String urlStr = fileDir + att.getUrl();
                            
                            if(ATTACHMENTS_ENABLED) {
	                            URL url = new URL(urlStr);
	                            URLConnection conn = url.openConnection();
	                            try {
	                            	msg.createAttachment(att.getName(), conn.getContentType(), conn.getInputStream());
	                            } catch (IOException ioe) {
	                            	System.out.println("attachment " + att.getName() + " not found at URL: " + urlStr);
	                            }
                            } else {
                            	System.out.println("skipping attaching of: " + att.getName() + " from " + urlStr);
                            }
                        }

                        if (first) {
                            // add the thread into jive forum
                            msg.setSubject(thread.getSubject());
                            dbThread = (DbForumThread) topicForum.createThread(msg);
                            topicForum.addThread(dbThread);
                            dbParentMsg = msg;
                            first = false;
                        } else {
                            // add the message into the jive thread
                            msg.setSubject("Re: " + thread.getSubject());

                            DbForumMessage pMsg = (DbForumMessage) parentMsgs.get(post.getParentId());

                            if (pMsg == null) {
                                // it shoule never happen
                                System.err.println("Invalid parent message");
                                System.out.println("post is: " + post);
                                dbThread.addMessage(dbParentMsg, msg);
                            } else {
                                dbThread.addMessage(pMsg, msg);
                            }
                        }

                        parentMsgs.put(new Long(post.getId()), msg);
                        threadModificationDate = post.getPostTime();
                    }

                    // change thread's modification date
                    dbThread.setModificationDate(threadModificationDate);
                    forumModificationDate = threadModificationDate;

                    if ((threadNum % 1000) == 0) {
                        System.out.println(threadNum + " out of " + totalThreads + " threads have been processed.");
                    }
                }

                // change forum/category's modification date
                if (forumModificationDate != null) {
                    topicForum.setModificationDate(forumModificationDate);
                    //topicCat.setModificationDate(forumModificationDate);
                    category.setModificationDate(forumModificationDate);
                }
            }

            System.out.println(forumNum + " out of " + totalForum + " forums have been processed.");
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
     * The component status
     */
    private long componentStatus;

    /**
     * The forum type
     */
    private long forumType;
    
    /**
     * Constructor.
     *
     * @param id forum id.
     * @param name forum name.
     * @param desc forum description.
     * @param status forum status.
     * @param creation forum creation time.
     */
    public ForumMaster(long id, String name, String desc, long status, Date creation, long compVersId, String versionText, long componentStatus, long forumType) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.status = status;
        this.creation = creation;
        this.compVersId = compVersId;
        this.versionText = versionText;
        this.componentStatus = componentStatus;
        this.forumType = forumType;
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
     * Return the component's status.
     * 
     * @return the component's status
     */
    public long getComponentStatus() {
    	return this.componentStatus;
    }
    
    /**
     * Return the forum type.
     * 
     * @return the forum type
     */
    public long getForumType() {
    	return this.forumType;
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
    		System.out.println("----- null creation date - using Date(0)");
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
    		System.out.println("loginId is 0 - changing to 2");
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