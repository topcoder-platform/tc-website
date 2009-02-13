/**
 * DbForumFactory.java
 * August 31, 2000
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.coolservlets.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@coolservlets.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.coolservlets.com>.
 */

package com.coolservlets.forum.database;

import com.coolservlets.forum.*;
import com.coolservlets.util.Cache;
import com.topcoder.shared.util.DBMS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

//JDK1.1// import com.sun.java.util.collections.*;

/**
 * Database implementation of the ForumFactory interface.
 */
public class DbForumFactory extends ForumFactory {

    /** DATABASE QUERIES **/
    private static final String FORUM_COUNT = "SELECT count(*) FROM jiveForum";
    private static final String DELETE_FORUM = "DELETE FROM jiveForum WHERE forumID=?";
    private static final String DELETE_FORUM_USER_PERMS =
            "DELETE FROM jiveUserPerm WHERE forumID=?";
    private static final String GET_USER_PERMS =
            "SELECT DISTINCT permission FROM jiveUserPerm WHERE forumID=? " +
            "AND userID=?";
    //By default, cache is enabled.
    private boolean cacheEnabled = false;
    private boolean userPermCacheEnabled = true;
    //Cache forum objects for faster access.
    protected Cache forumCache;
    protected Cache threadCache;
    protected Cache messageCache;
    protected Cache userPermissionsCache;

    /**
     * The profile manager provides access to users and groups.
     */
    private ProfileManager profileManager;

    /**
     * The search indexer periodically runs to index forum content
     */
    private DbSearchIndexer searchIndexer;

    /**
     * Creates a new DbForumFactory.
     */
    public DbForumFactory() {
        forumCache = new Cache();
        threadCache = new Cache();
        messageCache = new Cache();
        userPermissionsCache = new Cache();

        profileManager = new DbProfileManager(this);
        searchIndexer = new DbSearchIndexer(this);
    }

    public Forum createForum(String name, String description)
            throws UnauthorizedException {
        DbForum newForum = new DbForum(name, description, this);
        return newForum;
    }

    public void deleteForum(Forum forum) throws UnauthorizedException {
        //First, remove forum from memory.
        forumCache.remove(forum.getID());

        //Delete all messages and threads in the forum.
        Iterator threads = forum.threads();
        while (threads.hasNext()) {
            ForumThread thread = (ForumThread) threads.next();
            forum.deleteThread(thread);
        }
        //Finally, delete the forum itself and all permissions
        //associated with it.
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(DELETE_FORUM);
            pstmt.setInt(1, forum.getID());
            pstmt.execute();
            pstmt.close();
            //User perms
            pstmt = con.prepareStatement(DELETE_FORUM_USER_PERMS);
            pstmt.setInt(1, forum.getID());
            pstmt.execute();
            pstmt.close();
        } catch (Exception sqle) {
            System.err.println("Error in DbForumFactory:deleteForum()-" + sqle);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public Forum getForum(int forumID)
            throws ForumNotFoundException, UnauthorizedException {
        //If cache is not enabled, do a new lookup of object
        if (!cacheEnabled) {
            return new DbForum(forumID, this);
        }
        //Cache is enabled.
        if (!forumCache.containsKey(forumID)) {
            DbForum forum = new DbForum(forumID, this);
            forumCache.add(forumID, forum);
            return forum;
        } else {
            return (DbForum) forumCache.get(forumID);
        }
    }

    public int getForumCount() {
        int forumCount = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(FORUM_COUNT);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            forumCount = rs.getInt(1);
        } catch (SQLException sqle) {
            System.err.println("DbForumFactory:getForumCount() failed: " + sqle);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return forumCount;
    }

    public Iterator forums() {
        return new DbForumFactoryIterator(this);
    }

    public ProfileManager getProfileManager() {
        return profileManager;
    }

    public SearchIndexer getSearchIndexer() {
        return searchIndexer;
    }

    public ForumPermissions getPermissions(Authorization authorization) {
        int userID = authorization.getUserID();

        //Simple case: if cache is turned on and the user is already cached,
        //we can simply return the cached permissions.
        if (userPermCacheEnabled && userPermissionsCache.containsKey(userID)) {
            return (ForumPermissions) userPermissionsCache.get(userID);
        }

        //Not so simple case: cache is not turned on or the user permissions
        //have not been cached yet.
        boolean isAnonymous = (userID == -1);
        boolean isUser = !isAnonymous;

        ForumPermissions finalPermissions = ForumPermissions.none();

        //Step 1 - Get permissions for the User. This includes anonymous
        //perms, "special user" perms, and the specific perms for the user.
        if (isUser) {
            ForumPermissions userPermissions = new ForumPermissions(true, false, false, false, false, false, true, true);
            //Combine permissions
            finalPermissions = new ForumPermissions(finalPermissions, userPermissions);
        }
        //Add in anonymous perms.
        ForumPermissions anonyPermissions;
        if (userPermCacheEnabled && userPermissionsCache.containsKey(-1)) {
            anonyPermissions = (ForumPermissions) userPermissionsCache.get(-1);
        }
        //Otherwise, do our own lookup.
        else {
            anonyPermissions = getUserPermissions(-1, -1);
        }
        //Combine permissions
        finalPermissions = new ForumPermissions(finalPermissions, anonyPermissions);

        //If they are a valid user, figure out "any user" permissions.
        if (isUser) {
            ForumPermissions specialUserPermissions;
            //Check for cache
            if (userPermCacheEnabled && userPermissionsCache.containsKey(0)) {
                specialUserPermissions = (ForumPermissions) userPermissionsCache.get(0);
            }
            //Otherwise, do our own lookup.
            else {
                specialUserPermissions = getUserPermissions(0, -1);
                //Add to cache so it will be there next time.
                if (userPermCacheEnabled) {
                    userPermissionsCache.add(0, specialUserPermissions);
                }
            }
            //Combine permissions
            finalPermissions = new ForumPermissions(finalPermissions, specialUserPermissions);
        }

        //Finally, add user to cache so it will be there next time.
        if (userPermCacheEnabled) {
            userPermissionsCache.add(userID, finalPermissions);
        }

        return finalPermissions;
    }

    public boolean hasPermission(int type) {
        return true;
    }

    //-- METHODS BELOW ARE NOT PART OF THE FORUMFACTORY INTERFACE --//

    /**
     * Returns true if caching is enabled.
     */
    public boolean isCacheEnabled() {
        return cacheEnabled;
    }

    public boolean isUserPermCacheEnabled() {
        return userPermCacheEnabled;
    }

    /**
     * Sets whether cache is enabled.
     */
    public void setCacheEnabled(boolean enabled) {
        cacheEnabled = false;
        //If disabling cache, clear out all caches since we'll no
        //long need them.
        if (enabled == false) {
            forumCache.clear();
            threadCache.clear();
            messageCache.clear();
            userPermissionsCache.clear();
            //Now, iterate through all forums and clear their caches.
            Iterator iter = forums();
            while (iter.hasNext()) {
                DbForum forum = (DbForum) iter.next();
                forum.userPermissionsCache.clear();
            }
        }
    }

    /**
     * Returns a thread specified by its id. Will return null
     * if the thread is not in the forum. If cache is turned
     * on, it will use it.
     */
    public DbForumThread getThread(int threadID, DbForum forum) throws
            ForumThreadNotFoundException {
        //If cache is not enabled, do a new lookup of object
        if (!cacheEnabled) {
            return new DbForumThread(threadID, forum, this);
        }
        //Cache is enabled.
        if (!threadCache.containsKey(threadID)) {
            DbForumThread thread = new DbForumThread(threadID, forum, this);
            threadCache.add(threadID, thread);
            return thread;
        } else {
            return (DbForumThread) threadCache.get(threadID);
        }
    }

    /**
     * Returns a message from the thread based on its id. If cache is turned
     * on, it will use it.
     *
     * @param messageID the ID of the message to get from the thread.
     */
    protected DbForumMessage getMessage(int messageID)
            throws ForumMessageNotFoundException {
        //If cache is not enabled, do a new lookup of object
        if (!cacheEnabled) {
            return new DbForumMessage(messageID, this);
        }
        //Cache is enabled.
        if (!messageCache.containsKey(messageID)) {
            DbForumMessage message = new DbForumMessage(messageID, this);
            messageCache.add(messageID, message);
            return message;
        } else {
            return (DbForumMessage) messageCache.get(messageID);
        }
    }

    /**
     * Logs events in the system. Very beginnings here....
     */
    protected void log(String message, Exception e) {
        System.err.println("Log event : " + message);
        e.printStackTrace();
    }

    /**
     * Returns the permissions that a particular user has for the forum.
     */
    protected ForumPermissions getUserPermissions(int userID, int forumID) {
        Connection con = null;
        PreparedStatement pstmt = null;
        //Initialize a permissions array with no permissions.
        boolean[] permissions = new boolean[8];
        for (int i = 0; i < permissions.length; i++) {
            permissions[i] = false;
        }
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(GET_USER_PERMS);
            pstmt.setInt(1, forumID);
            pstmt.setInt(2, userID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int newPerm = rs.getInt("permission");
                permissions[newPerm] = true;
            }
        } catch (SQLException sqle) {
            System.err.println("Error in DbForum.java:" + sqle);
            sqle.printStackTrace();
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return new ForumPermissions(permissions);
    }

}
