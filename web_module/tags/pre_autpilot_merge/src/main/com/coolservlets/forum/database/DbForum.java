/**
 * DbForum.java
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

import java.util.*;
import java.sql.*;
import java.io.*;
import com.coolservlets.forum.*;
import com.coolservlets.util.*;
import com.coolservlets.forum.filter.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
/**
 * Database implementation of the Forum interface.
 */
public class DbForum implements Forum {

    /** DATABASE QUERIES **/
    private static final String ADD_THREAD =
        "UPDATE jiveThread set forumID=?, userID=? WHERE threadID=?";
    private static final String DELETE_THREAD = "DELETE FROM jiveThread WHERE threadID=?";
    private static final String THREAD_COUNT =
        "SELECT count(*) FROM jiveThread WHERE forumID=?";
    private static final String MESSAGE_COUNT =
        "SELECT count(*) FROM jiveThread, jiveMessage WHERE " +
        "jiveThread.forumID=? AND jiveThread.threadID=jiveMessage.threadID";
    private static final String ADD_USER_PERM =
        "INSERT INTO jiveUserPerm(forumID,userID,permission) VALUES(?,?,?)";
    private static final String REMOVE_USER_PERM =
        "DELETE FROM jiveUserPerm WHERE forumID=? AND userID=? AND permission=?";
    private static final String USERS_WITH_PERM =
        "SELECT DISTINCT userID FROM jiveUserPerm WHERE forumID=? AND permission=?";
    private static final String LOAD_FILTERS =
        "SELECT filterObject, filterIndex FROM jiveFilter WHERE forumID=? ORDER BY filterIndex ASC";
    private static final String DELETE_FILTERS = "DELETE FROM jiveFilter WHERE forumID=?";
    private static final String ADD_FILTER =
        "INSERT INTO jiveFilter(forumID,filterIndex,filterObject) VALUES(?,?,?)";
    private static final String LOAD_FORUM =
        "SELECT name, description, creationDate, modifiedDate, moderated, userID FROM jiveForum WHERE forumID=?";
    private static final String ADD_FORUM =
        "INSERT INTO jiveForum(forumID, name, description, creationDate, " +
        "modifiedDate, moderated, userID) VALUES (?,?,?,?,?,?,?)";
    private static final String SAVE_FORUM =
        "UPDATE jiveForum SET name=?, description=?, creationDate=?, " +
        "modifiedDate=?, moderated=?, userID=? WHERE forumID=?";
    private static final String UPDATE_FORUM_MODIFIED_DATE =
        "UPDATE jiveForum SET modifiedDate=?, userID=? WHERE forumID=?";


    private int id = -1;
    private String name;
    private String description;
    private java.util.Date creationDate;
    private java.util.Date modifiedDate;
    private int moderated = 0;
    private int userID = 0;
    private ForumMessageFilter[] filters;

    //lock for synchronizing saving filters.
    private Object filterLock = new Object();

    private DbForumFactory factory;

    protected Cache userPermissionsCache = new Cache();
    private static Logger log = Logger.getLogger(DbForum.class);

    /**
     * Creates a new forum with the specified name and description.
     */
    protected DbForum(String name, String description, DbForumFactory factory) {
        try {
          this.id = DBMS.getSeqId(DBMS.RTABLE_SEQ); 
        } catch (Exception e) {
          e.printStackTrace();
        }
        this.name = name;
        this.description = description;
        creationDate = new java.util.Date();
        modifiedDate = new java.util.Date();
        this.factory = factory;
        insertIntoDb();
        //Forums should start with an html filter by default for
        //security purposes.
        filters = new ForumMessageFilter[0];
        try {
            addForumMessageFilter(new FilterHtml(), 0);
            addForumMessageFilter(new FilterNewline(), 1);
        }
        catch (UnauthorizedException ue) {
            ue.printStackTrace();
        }
    }

    /**
     * Loads a forum with the specified id.
     */
    protected DbForum(int id, DbForumFactory factory)
            throws ForumNotFoundException
    {
        this.id = id;
        this.factory = factory;
        if (id != -1)
        {
            loadFromDb();
            loadFiltersFromDb();
        }
    }

    public int getID() {
        return id;
    }

    public String getName() {
        return name;
    }

    public User getUser() {
        User user = null;
        try {
            if (userID == -1) {
                user = factory.getProfileManager().getAnonymousUser();
            }
            else {
                user = factory.getProfileManager().getUser(userID);
            }
        }
        catch (UserNotFoundException unfe) {
            unfe.printStackTrace();
        }
        return user;
    }

    public void setName(String name) throws UnauthorizedException {
        this.name = name;
        saveToDb();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) throws UnauthorizedException
    {
        this.description = description;
        saveToDb();
    }

    public java.util.Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(java.util.Date creationDate)
            throws UnauthorizedException
    {
       this.creationDate = creationDate;
       saveToDb();
    }

    public java.util.Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(java.util.Date modifiedDate)
            throws UnauthorizedException
    {
        this.modifiedDate = modifiedDate;
        saveToDb();
    }

    public boolean isModerated(int type) {
        return false;
    }

    public void setModerated(int type, boolean moderated)
            throws UnauthorizedException
    {
    }

    public ForumThread createThread(ForumMessage rootMessage)
        throws UnauthorizedException
    {
        //If the forum is moderated, the thread is not automatically
        //approved.
        boolean approved = true;
        return new DbForumThread(rootMessage, approved, this, factory);
    }
    public ForumMessage createMessage(User user)
        throws UnauthorizedException
    {
        //If the forum is moderated, the message is not automatically
        //approved.
        boolean approved = !isModerated(JiveConstants.MESSAGE);
        return new DbForumMessage(user, approved, factory);
    }

    public void addThread(ForumThread thread) throws UnauthorizedException {
        //Add message to db
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(ADD_THREAD);
            ps.setInt(1,id);
            ps.setInt(2,thread.getUser().getID());
            ps.setInt(3,thread.getID());
            ps.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForum:addThread()-" + sqle);
        }
        finally {
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          ps = null; 
          conn = null; 
        }
        //Since we added a thread, update the modified date of this thread.
        updateModifiedDate(thread.getUser().getID(),thread.getModifiedDate());
    }

    public ForumThread getThread(int threadID) throws
            ForumThreadNotFoundException
    {
        return factory.getThread(threadID, this);
    }

    public void deleteThread(ForumThread thread) throws UnauthorizedException
    {
        //First, delete from cache
        factory.threadCache.remove(thread.getID());

        //Now delete the actual thread
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(DELETE_THREAD);
            ps.setInt(1,thread.getID());
            ps.execute();
        }
        catch( Exception sqle ) {
            System.err.println("Error in DbForum:deleteThread()-" + sqle);
        }
        finally {
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          ps = null; 
          conn = null; 
        }

        //Finally, delete all messages from the thread. We could do this
        //through a direct sql statement. However, doing so would increase
        //coupling and mean that we'd have to manage sql statments and cache
        //management in multiple places. Since deletion is such an infrequent
        //operation for typical use, we'll go with the easier, less-optimized
        //method. If optimizing Jive for deletion is something you need to do,
        //feel free to modify this method to make a direct sql call. :)
        try {
            ForumMessage message = thread.getRootMessage();
            thread.deleteMessage(message);
        }
        catch (ForumMessageNotFoundException fmnfe) {
            fmnfe.printStackTrace();
        }
    }

    public Iterator threads() {
        return new DbForumIterator(this, factory);
    }
    

    public Iterator threads(int startIndex, int numResults) {
        return new DbForumIterator(this, factory, startIndex, numResults);
    }

    public int getThreadCount() {
        int threadCount = 0;
        // Based on the id in the object, get the thread data from the database:
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(THREAD_COUNT);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            threadCount = rs.getInt(1 /*"threadCount"*/);
        }
        catch( SQLException sqle ) {
            System.err.println("DbForum:getThreadCount() failed: " + sqle);
        }
        finally {
          try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          rs = null; 
          ps = null; 
          conn = null; 
        }
        return threadCount;
    }

    public int getMessageCount() {
        int messageCount = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(MESSAGE_COUNT);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            messageCount = rs.getInt(1 /*"messageCount"*/);
        }
        catch( SQLException sqle ) {
            System.err.println("DbForum:getMessageCount() failed: " + sqle);
        }
        finally {
          try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          rs = null; 
          ps = null; 
          conn = null; 
        }
        return messageCount;
    }

    public Query createQuery() {
        return new DbQuery(this, factory);
    }

    public void addUserPermission(User user, int permissionType)
            throws UnauthorizedException
    {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(ADD_USER_PERM);
            ps.setInt(1,id);
            ps.setInt(2,user.getID());
            ps.setInt(3,permissionType);
            ps.execute();
            //Remove user permissions from cache since they've changed.
            userPermissionsCache.remove(user.getID());
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForum.java:" + sqle);
            sqle.printStackTrace();
        }
        finally {
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          ps = null; 
          conn = null; 
        }
    }

    public void removeUserPermission(User user, int permissionType)
            throws UnauthorizedException
    {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(REMOVE_USER_PERM);
            ps.setInt(1,id);
            ps.setInt(2,user.getID());
            ps.setInt(3,permissionType);
            ps.execute();
            //Remove user permissions from cache since they've changed.
            userPermissionsCache.remove(user.getID());
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForum.java:" + sqle);
            sqle.printStackTrace();
        }
        finally {
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          ps = null; 
          conn = null; 
        }
    }

    public int[] usersWithPermission(int permissionType)
            throws UnauthorizedException
    {
        int [] users = new int[0];
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(USERS_WITH_PERM);
            ps.setInt(1,id);
            ps.setInt(2,permissionType);
            rs = ps.executeQuery();
            ArrayList userList = new ArrayList();
            while (rs.next()) {
                userList.add(new Integer(rs.getInt("userID")));
            }
            users = new int[userList.size()];
            for (int i=0; i<users.length; i++) {
                users[i] = ((Integer)userList.get(i)).intValue();
            }
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForum.java:" + sqle);
            sqle.printStackTrace();
        }
        finally {
          try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          rs = null; 
          ps = null; 
          conn = null; 
        }
        return users;
    }

    public ForumMessage applyFilters(ForumMessage message) {
        //Loop through filters and apply them
        for (int i=0; i < filters.length; i++) {
            message = filters[i].clone(message);
        }
        return message;
    }

    public ForumMessageFilter[] getForumMessageFilters()
            throws UnauthorizedException
    {
        ForumMessageFilter [] dbFilters = new ForumMessageFilter[filters.length];
        for (int i=0; i<filters.length; i++) {
            dbFilters[i] = new DbForumMessageFilter((ForumMessage)filters[i], this);
        }
        return dbFilters;
    }

    public void addForumMessageFilter(ForumMessageFilter filter)
            throws UnauthorizedException
    {
        ArrayList newFilters = new ArrayList(filters.length+1);
        for (int i=0; i<filters.length; i++) {
            newFilters.add(filters[i]);
        }
        newFilters.add(filter);
        ForumMessageFilter[] newArray = new ForumMessageFilter[newFilters.size()];
        for (int i=0; i<newArray.length; i++) {
            newArray[i] = (ForumMessageFilter)newFilters.get(i);
        }
        //Finally, overwrite filters with the new array
        filters = newArray;
        saveFiltersToDb();
    }

    public void addForumMessageFilter(ForumMessageFilter filter, int index)
            throws UnauthorizedException
    {
        ArrayList newFilters = new ArrayList(filters.length+1);
        for (int i=0; i<filters.length; i++) {
            newFilters.add(filters[i]);
        }
        newFilters.add(index, filter);
        ForumMessageFilter[] newArray = new ForumMessageFilter[newFilters.size()];
        for (int i=0; i<newArray.length; i++) {
            newArray[i] = (ForumMessageFilter)newFilters.get(i);
        }
        //Finally, overwrite filters with the new array
        filters = newArray;
        saveFiltersToDb();
    }

    public void removeForumMessageFilter(int index)
            throws UnauthorizedException
    {
        ArrayList newFilters = new ArrayList(filters.length);
        for (int i=0; i<filters.length; i++) {
            newFilters.add(filters[i]);
        }
        newFilters.remove(index);
        ForumMessageFilter[] newArray = new ForumMessageFilter[newFilters.size()];
        for (int i=0; i<newArray.length; i++) {
            newArray[i] = (ForumMessageFilter)newFilters.get(i);
        }
        //Finally, overwrite filters with the new array
        filters = newArray;
        saveFiltersToDb();
    }

    public ForumPermissions getPermissions(Authorization authorization) {
        int userID = authorization.getUserID();
        boolean cacheEnabled = factory.isUserPermCacheEnabled();

        //Simple case: if cache is turned on and the user is already cached,
        //we can simply return the cached permissions.
        if (cacheEnabled && userPermissionsCache.containsKey(userID)) {
            return (ForumPermissions)userPermissionsCache.get(userID);
        }

        //Not so simple case: cache is not turned on or the user permissions
        //have not been cached yet.
        boolean isAnonymous = (userID == -1);
        boolean isUser = !isAnonymous;

        ForumPermissions finalPermissions = ForumPermissions.none();

        //Step 1 - Get permissions for the User. This includes anonymous
        //perms, "special user" perms, and the specific perms for the user.
        //gp note: noone ever gets permissions this way cuz no one
        //gets an entry in the permissions table
        if (isUser) {
            ForumPermissions userPermissions = factory.getUserPermissions(userID, id);
            //Combine permissions
            finalPermissions = new ForumPermissions(finalPermissions, userPermissions);
        }
        //Add in anonymous perms.
        ForumPermissions anonyPermissions;
        if (cacheEnabled && userPermissionsCache.containsKey(-1)) {
            anonyPermissions = (ForumPermissions)userPermissionsCache.get(-1);
        }
        //Otherwise, do our own lookup.
        else {
            anonyPermissions = factory.getUserPermissions(-1, id);
        }
        //Combine permissions
        finalPermissions = new ForumPermissions(finalPermissions, anonyPermissions);

        //If they are a valid user, figure out "any user" permissions.
        //this is how they get permissions...if they are a user ie; logged in
        //then they have permission to read and post etc.
        if (isUser) {
            ForumPermissions specialUserPermissions;
            //Check for cache
            if (cacheEnabled && userPermissionsCache.containsKey(0)) {
                specialUserPermissions = (ForumPermissions)userPermissionsCache.get(0);
            }
            //Otherwise, do our own lookup.
            else {
                specialUserPermissions = new ForumPermissions(true, false, false, false, false, false, true, true);
                //Add to cache so it will be there next time.
                if (cacheEnabled) {
                    userPermissionsCache.add(0, specialUserPermissions);
                }
            }
            //Combine permissions
            finalPermissions = new ForumPermissions(finalPermissions, specialUserPermissions);
        }

        //Finally, add user to cache so it will be there next time.
        if (cacheEnabled) {
            userPermissionsCache.add(userID, finalPermissions);
        }

        return finalPermissions;
    }

    public boolean hasPermission(int type) {
        return true;
    }

    public String toString() {
        return name;
    }

    /**
     * Updates the modified date but doesn't require a security check since
     * it is a protected method.
     */
    protected void updateModifiedDate(int userID, java.util.Date modifiedDate) {
        this.modifiedDate = modifiedDate;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(UPDATE_FORUM_MODIFIED_DATE);
            ps.setString(1, ""+modifiedDate.getTime());
            ps.setInt(2, userID);
            ps.setInt(3, id);
            ps.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForum:updateModifiedDate()-" + sqle);
            sqle.printStackTrace();
        }
        finally {
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          ps = null; 
          conn = null; 
        }
    }
    
    /**
     * Loads filters from the database.
     */
    private void loadFiltersFromDb() {
        ArrayList newFilters = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(LOAD_FILTERS);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while(rs.next()) {
              newFilters.add(DBMS.getBlobObject(rs, 1));
            }
        }
        catch( SQLException sqle ) {
            sqle.printStackTrace();
        }
        catch (Exception e) {
            log.debug("On FORUM ID----- " + id);
            e.printStackTrace();
        }
        finally {
            try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
            try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
            try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
            rs = null; 
            ps = null; 
            conn = null; 
        }
        filters = new ForumMessageFilter[newFilters.size()];
        for (int i=0; i<filters.length; i++) {
            filters[i] = (ForumMessageFilter)newFilters.get(i);
        }
        //Finally, save filters back to Db. Effectively, this deletes filters
        //from the database that failed to load. See note above.
        //saveFiltersToDb();
    }

    /**
     * Saves filters to the database. Filter saving works by serializing
     * each filter to a byte stream and then inserting that stream into
     * the database.
     */
    protected void saveFiltersToDb() {
            //This should really be done as a transaction if the database
            //supports them. Perhaps, we can have code in the future which
            //will use transactions if they're supported.
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                conn = DBMS.getConnection();
                ps = conn.prepareStatement(DELETE_FILTERS);
                ps.setInt(1,id);
                ps.execute();
                //Now insert new list of filters.
                ps.close();
                ps = conn.prepareStatement(ADD_FILTER);
                for (int i=0; i<filters.length; i++) {
                  try {
                      ps.setInt(1,id);
                      ps.setInt(2,i);
                      ps.setBytes(3, DBMS.serializeBlobObject(filters[i]));
                      ps.execute();
                  }
                  catch (Exception e) {
                    e.printStackTrace();
                    try{
                      conn.rollback();
                    }catch(Exception e1){}
                  }
                   
                }
            }
            catch( SQLException sqle ) {
                sqle.printStackTrace();
                try{
                  conn.rollback();
                }catch(Exception e1){}
            }
            finally {
              try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
              try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
              ps = null; 
              conn = null; 
            }
    }

    /**
     * Loads forum data from the database.
     */
    private void loadFromDb() throws ForumNotFoundException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(LOAD_FORUM);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            if( !rs.next() ) {
                throw new ForumNotFoundException("Forum " + getID() +
                    " could not be loaded from the database.");
            }
            name = rs.getString("name");
            description = rs.getString("description");
            this.creationDate =
                new java.util.Date(Long.parseLong(rs.getString("creationDate")));
            this.modifiedDate =
                new java.util.Date(Long.parseLong(rs.getString("modifiedDate")));
            moderated = rs.getInt("moderated");
            userID = rs.getInt("userID");
        }
        catch( SQLException sqle ) {
            sqle.printStackTrace();
            throw new ForumNotFoundException("Forum " + getID() +
                " could not be loaded from the database.");
        }
        catch (NumberFormatException nfe) {
            System.err.println("WARNING: In DbForum.loadFromDb() -- there " +
                "was an error parsing the dates returned from the database. Ensure " +
                "that they're being stored correctly.");
        }
        finally {
              try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
              try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
              try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
              rs = null; 
              ps = null; 
              conn = null; 
        }
    }

    /**
     * Inserts a new record into the database.
     */
    private void insertIntoDb() {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(ADD_FORUM);
            ps.setInt(1,id);
            ps.setString(2,name);
            ps.setString(3,description);
            ps.setString(4, ""+creationDate.getTime());
            ps.setString(5, ""+modifiedDate.getTime());
            ps.setInt(6, moderated);
            ps.setInt(7, userID);
            ps.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForum:insertIntoDb()-" + sqle);
            sqle.printStackTrace();
        }
        finally {
              try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
              try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
              ps = null; 
              conn = null; 
        }
    }

    /**
     * Saves forum data to the database.
     */
    private void saveToDb() {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(SAVE_FORUM);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, ""+creationDate.getTime());
            ps.setString(4, ""+modifiedDate.getTime());
            ps.setInt(5, moderated);
            ps.setInt(6, userID);
            ps.setInt(7, id);
            ps.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForum:saveToDb()-" + sqle);
            sqle.printStackTrace();
        }
        finally {
              try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
              try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
              ps = null; 
              conn = null; 
        }
    }
}
