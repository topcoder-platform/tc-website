/**
 * DbForumThread.java
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

import java.sql.*;
import java.util.*;
//JDK1.1// import com.sun.java.util.collections.*;
import java.text.*;

import com.topcoder.shared.util.*;
import com.coolservlets.forum.*;
import com.coolservlets.util.*;
import com.coolservlets.forum.filter.*;

/**
 * Database implementation of the ForumThread interface.
 */
public class DbForumThread implements ForumThread {

    /** DATABASE QUERIES **/
    private static final String MESSAGE_COUNT =
        "SELECT count(*) FROM jiveMessage WHERE threadID=?";
    private static final String ADD_MESSAGE1 =
        "UPDATE jiveMessage SET threadID=?, userID=? WHERE messageID=?";
    private static final String ADD_MESSAGE2 =
        "INSERT INTO jiveMessageTree(parentID,childID) VALUES(?,?)";
    private static final String UPDATE_THREAD_MODIFIED_DATE =
        "UPDATE jiveThread SET modifiedDate=?, userID=? WHERE threadID=?";
    private static final String DELETE_MESSAGE1 =
        "DELETE FROM jiveMessageTree WHERE childID=?";
    private static final String DELETE_MESSAGE2 =
        "DELETE FROM jiveMessage WHERE messageID=?";
    private static final String DELETE_MESSAGE_PROPERTIES =
        "DELETE FROM jiveMessageProp WHERE messageID=?";
    private static final String LOAD_THREAD = "SELECT * FROM jiveThread WHERE threadID=?";
    private static final String INSERT_THREAD1 =
        "INSERT INTO jiveThread(threadID,rootMessageID,creationDate,modifiedDate," +
        "name,approved,userID) VALUES(?,?,?,?,?,?,?)";
    private static final String INSERT_THREAD2 =
        "UPDATE jiveMessage SET threadID=? WHERE messageID=?";
    private static final String SAVE_THREAD =
        "UPDATE jiveThread SET name=?, rootMessageID=?, creationDate=?, " +
        "modifiedDate=?, userID=? WHERE threadID=?";

    private int id = -1;
    private String name;
    private int rootMessageID;
    private java.util.Date creationDate = new java.util.Date();
    private java.util.Date modifiedDate = new java.util.Date();
    private boolean approved;
    private int forumID;
    private int userID;

    //The forum allows us access to the message cache.
    private DbForum forum;
    //The factory provides services such as db connections and logging.
    private DbForumFactory factory;

    /**
     * Creates a new DbForumThread.
     */
    protected DbForumThread(ForumMessage rootMessage, boolean approved,
            DbForum forum, DbForumFactory factory) throws UnauthorizedException
    {
        try {
          this.id = DBMS.getSeqId(DBMS.RTABLE_SEQ);
        } catch (Exception e) {
          e.printStackTrace();
        }
        this.forum = forum;
        this.factory = factory;
        //Make the name of the thread be the same as the subject
        //of the message by default. The skin can always change this
        //later if needed.
        this.name = rootMessage.getSubject();
        this.rootMessageID = rootMessage.getID();
        this.creationDate = rootMessage.getCreationDate();
        this.approved = approved;
        this.userID = rootMessage.getUser().getID();
        insertIntoDb();
    }

    /**
     * Loads a DbForumThread from the database based on its id.
     */
    protected DbForumThread(int id, DbForum forum, DbForumFactory factory)
            throws ForumThreadNotFoundException
    {
        this.id = id;
        this.forum = forum;
        this.factory = factory;
        loadFromDb();
    }

    /**
     * Returns the id of the thread.
     */
    public int getID() {
        return id;
    }

    /**
     * Returns the name of the thread. The name is set by default to the
     * subject of the root message.
     */
    public String getName() {
        return StringUtils.escapeHTMLTags(name);
    }

    /**
     * Returns the userID of the thread. 
     */
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

    /**
     * Sets the name of the thread.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setName(String name) throws UnauthorizedException {
        this.name = name;
        //We're updating the thread, so set modifiedDate to the current time.
        modifiedDate.setTime(System.currentTimeMillis());
        saveToDb();
    }

    /**
     * Returns the Date that the thread was created.
     */
    public java.util.Date getCreationDate() {
        return creationDate;
    }

    /**
     * Sets the creation date of the thread. In most cases, the creation date
     * will default to when the thread was entered into the system. However,
     * the creation date needs to be set manually when importing data.
     * In other words, skin authors should ignore this method since it only
     * intended for system maintenance.
     *
     * @param creationDate the date the thread was created.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setCreationDate(java.util.Date creationDate)
            throws UnauthorizedException
    {
        this.creationDate = creationDate;
        saveToDb();
    }

    /**
     * Returns the Date that the thread was last modified. In other words, the
     * date of the most recent message in the thread.
     */
    public java.util.Date getModifiedDate() {
        return modifiedDate;
    }

    /**
     * Sets the date the thread was last modified. In most cases, last modifed
     * will default to when the thread data was last changed. However,
     * the last modified date needs to be set manually when importing data.
     * In other words, skin authors should ignore this method since it only
     * intended for system maintenance.
     *
     * @param modifiedDate the date the thread was modified.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setModifiedDate(java.util.Date modifiedDate)
            throws UnauthorizedException
    {
        this.modifiedDate = modifiedDate;
        saveToDb();
    }

    /**
     * Returns the parent Forum of the thread.
     */
    public Forum getForum() {
        Forum forum = null;
        try {
            forum = factory.getForum(forumID);
        }
        //Since the thread in the forum exists, there is basically
        //no chance that the forum won't. Therefore, we need no special
        //handling of the error condition.
        catch (ForumNotFoundException fnfe) {
            fnfe.printStackTrace();
        }
        //We already have a handle on the thread within the forum, so there
        //shouldn't be a security exception.
        catch (UnauthorizedException ue) {
            ue.printStackTrace();
        }
        return forum;
    }

    /**
     * Returns a message from the thread based on its id.
     *
     * @param messageID the ID of the message to get from the thread.
     */
    public ForumMessage getMessage(int messageID)
            throws ForumMessageNotFoundException
    {
        ForumMessage message = factory.getMessage(messageID);
        
        //Apply filters to message.
        message = forum.applyFilters(message);
        return message;
    }

    /**
     * Returns the root message of a thread. The root message is a special
     * first message that is intimately tied to the thread for most forumViews.
     * All other messages in the thread are children of the root message.
     */
    public ForumMessage getRootMessage() throws ForumMessageNotFoundException {
        return getMessage(rootMessageID);
    }

    /**
     * Returns the number of messages in the thread. This includes the root
     * message. So, to find the number of replies to the root message,
     * subtract one from the answer of this method.
     */
    public int getMessageCount() {
        int messageCount = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(MESSAGE_COUNT);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            messageCount = rs.getInt(1 /*"mCount"*/);
        }
        catch( SQLException sqle ) {
            System.err.println("DbForumThread:getMessageCount() failed: "+sqle);
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        return messageCount;
    }

    /**
     * Adds a new message to the thread.
     *
     * @param parentMessage some message in the thread that will be parent
     * @param newMessage message to add to the thread under the parent
     */
    public void addMessage(ForumMessage parentMessage, ForumMessage newMessage) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(ADD_MESSAGE1);
            pstmt.setInt(1, id);
            pstmt.setInt(2, newMessage.getUser().getID());
            pstmt.setInt(3, newMessage.getID());
            pstmt.executeUpdate();
            pstmt.close();

            pstmt = con.prepareStatement(ADD_MESSAGE2);
            pstmt.setInt(1, parentMessage.getID());
            pstmt.setInt(2, newMessage.getID());
            pstmt.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForumThread:addMessage()-" + sqle);
            sqle.printStackTrace();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        //Added new message, so update the modified date of this thread
        updateModifiedDate(newMessage.getUser().getID(),newMessage.getModifiedDate());
        //Also, update the modified date of the forum
        forum.updateModifiedDate(newMessage.getUser().getID(),modifiedDate);
    }

    /**
     * Deletes a message from the thread. Throws a MessageNotFoundException
     * if the message is not in the thread. If the message is deleted, it
     * should be entirely erased from the Forum system. Therefore, the
     * behavior is unspecified if a message object is first removed from a
     * thread and then added to another (this action not recommended).
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void deleteMessage(ForumMessage message) {
        //First, delete from the cache.
        factory.messageCache.remove(message.getID());
        
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            //Delete the message from the parent/child table
            pstmt = con.prepareStatement(DELETE_MESSAGE1);
            pstmt.setInt(1, message.getID());
            pstmt.execute();
            pstmt.close();
            con.close();

            //Recursively delete all children
            TreeWalker walker = treeWalker();
            int childCount = walker.getChildCount(message);
            for (int i=0; i<childCount; i++) {
                deleteMessage(walker.getChild(message,i));
            }

            //Delete the actual message.
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(DELETE_MESSAGE2);
            pstmt.setInt(1, message.getID());
            pstmt.execute();
            pstmt.close();

            //Delete any message properties.
            pstmt = con.prepareStatement(DELETE_MESSAGE_PROPERTIES);
            pstmt.setInt(1, message.getID());
            pstmt.execute();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForumThread:deleteMessage()-" + sqle);
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
    }

    /**
     * Returns a TreeWalker for the entire thread. A TreeWalker is used
     * to navigate through the tree of messages in the thread.
     */
    public TreeWalker treeWalker() {
        return new DbTreeWalker(this, factory);
    }

    /**
     * Return an Iterator for all the messages in a thread. Similar
     * to an iterator, but it allows backwards and forwards navigation.
     * The add(), remove(), and set() operations should not be supported by
     * implementations of this interface for security reasons.
     */
    public Iterator messages() {
        return new DbThreadIterator(this);
    }

    /**
     * Return an Iterator for all the messages in a thread. Similar
     * to an iterator, but it allows backwards and forwards navigation.
     * The add(), remove(), and set() operations should not be supported by
     * implementations of this interface for security reasons.
     */
    public Iterator messages(int startIndex, int numResults) {
        return new DbThreadIterator(this, startIndex, numResults);
    }

    /**
     * Returns true if the handle on the object has the permission specified.
     * A list of possible permissions can be found in the ForumPermissions
     * class. Certain methods of this class are restricted to certain
     * permissions as specified in the method comments.
     *
     * @see ForumPermissions
     */
    public boolean hasPermission(int type) {
        return true;
    }

    /**
     * Converts the object to a String by returning the name of the thread.
     * This functionality is primarily for Java applications that might be
     * accessing Jive objects through a GUI.
     */
    public String toString() {
        return name;
    }

    /**
     * Updates the modified date but doesn't require a security check since
     * it is a protected method.
     */
    protected void updateModifiedDate(int uId, java.util.Date modifiedDate) {
        this.modifiedDate = modifiedDate;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(UPDATE_THREAD_MODIFIED_DATE);
            pstmt.setString(1, ""+modifiedDate.getTime());
            pstmt.setInt(2, uId);
            pstmt.setInt(3, id);
            pstmt.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForumThread:updateModifiedDate()-" + sqle);
            sqle.printStackTrace();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
    }

    /**
     * Loads a ForumThread from the database.
     */
    private void loadFromDb() throws ForumThreadNotFoundException {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(LOAD_THREAD);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if( !rs.next() ) { 
                throw new ForumThreadNotFoundException("Thread " + id +
                    " could not be loaded from the database.");
            }
            name = rs.getString("name");
            rootMessageID = rs.getInt("rootMessageID");
            creationDate = new java.util.Date(Long.parseLong(rs.getString("creationDate").trim()));
            modifiedDate =  new java.util.Date(Long.parseLong(rs.getString("modifiedDate").trim()));
            forumID = rs.getInt("forumID");
            userID = rs.getInt("userID");
        }
        catch( SQLException sqle ) {
            throw new ForumThreadNotFoundException("Thread " + id +
                " could not be loaded from the database.");
        }
        catch (NumberFormatException nfe) {
            System.err.println("WARNING: In DbForumThread.loadFromDb() -- there " +
                "was an error parsing the dates returned from the database. Ensure " +
                "that they're being stored correctly.");
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
    }

    /**
     * Inserts a new forum thread into the database.
     */
    private void insertIntoDb() {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(INSERT_THREAD1);
            pstmt.setInt(1, id);
            pstmt.setInt(2, rootMessageID);
            pstmt.setString(3, ""+creationDate.getTime());
            pstmt.setString(4, ""+modifiedDate.getTime());
            pstmt.setString(5, name);
            pstmt.setInt(6, approved?1:0);
            pstmt.setInt(7, userID);
            pstmt.executeUpdate();
            pstmt.close();

            pstmt = con.prepareStatement(INSERT_THREAD2);
            pstmt.setInt(1, id);
            pstmt.setInt(2, rootMessageID);
            pstmt.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForumThread:insertIntoDb()-"+sqle);
            sqle.printStackTrace();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
    }

    /**
     * Saves the ForumThread to the database.
     */
    private void saveToDb() {
        Connection con = null;
        PreparedStatement pstmt = null;
         try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(SAVE_THREAD);
            pstmt.setString(1, name);
            pstmt.setInt(2, rootMessageID);
            pstmt.setString(3, ""+creationDate.getTime());
            pstmt.setString(4, ""+modifiedDate.getTime());
            pstmt.setInt(5, userID);
            pstmt.setInt(6, id);
            pstmt.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForumThread:saveToDb()-" + sqle);
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  
                  con.commit();
                  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
    }
} 
