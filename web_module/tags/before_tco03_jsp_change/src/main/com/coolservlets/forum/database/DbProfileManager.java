/**
 * DbProfileManager.java
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
//JDK1.1// import com.sun.java.util.collections.*;
import java.sql.*;
import com.coolservlets.forum.*;
import com.coolservlets.util.*;
import com.topcoder.shared.util.*;
/**
 * Database implementation of the ProfileManager interface.
 */
public class DbProfileManager implements ProfileManager {
    /** DATABASE QUERIES **/
    private static final String USER_MESSAGE_COUNT =
        "SELECT count(*) FROM jiveMessage,jiveForum,jiveThread WHERE " +
        "jiveMessage.userID=? AND jiveForum.forumID=? AND " +
        "jiveThread.forumID=jiveForum.forumID AND " +
        "jiveMessage.threadID=jiveThread.threadID";
    private static final String USER_COUNT = "SELECT count(*) FROM user";
    private static final String ALL_USER_MESSAGES =
        "SELECT messageID FROM jiveMessage WHERE userID=?";
    private static final String DELETE_USER_MESSAGES =
        "UPDATE jiveMessage set userID=-1 WHERE userID=?";
    private static final String DELETE_USER_PERMS =
        "DELETE FROM jiveUserPerm WHERE userID=?";
    private static final String DELETE_USER_PROPS =
        "DELETE FROM jiveUserProp WHERE userID=?";

    private static final boolean cacheEnabled = true;

    private Cache userCache = new Cache(true);
    private Map userIDMap = Collections.synchronizedMap(new HashMap());
    private User anonymousUser = null;
    private User specialUser = null;
    private DbForumFactory factory;
    /**
     * Creates a new ProfileManager.
     */
    public DbProfileManager(DbForumFactory factory) {
        this.factory = factory;
        try {
            anonymousUser = getUser(-1);
            specialUser = getUser(0);
        }
        catch (UserNotFoundException unfe) {  }
    }
    /**
     * Creates a User.
     *
     * @param username the new and unique username for the account.
     * @param password the password for the account as plain text.
     * @param email the email address for the account.
     *
     * @throws UserAlreadyExistsException if username already exists in
     *    the system.
     */
    public User createUser(String username, String password, String email)
            throws UserAlreadyExistsException
    {
        User newUser = null;
        try {
            User existingUser = new DbUser(username);
            //the user already exists since now exception, so:
            throw new UserAlreadyExistsException();
        }
        catch (UserNotFoundException unfe) {
            //The user doesn't already exist so we can create a new user
            newUser = new DbUser(username, password, email);
        }
        return newUser;
    }
    /**
     * Returns a User specified by id.
     *
     * throws UserNotFoundException if the user does not exist.
     */
    public User getUser(int userID) throws UserNotFoundException {
        User user;

        //If cache is not enabled, do a new lookup of object
        if (!cacheEnabled) {
            return new DbUser(userID);
        }

        if(!userCache.containsKey(userID)) {
            user = new DbUser(userID);
            userCache.add(userID, user);
        }
        else {
            user = (User)userCache.get(userID);
        }
        return user;
    }
    /**
     * Returns a User specified by username.
     *
     * throws UserNotFoundException if the user does not exist.
     */
    public User getUser(String username) throws UserNotFoundException {
        User user;
        if (!userIDMap.containsKey(username)) {
            user = new DbUser(username);
            Integer id = new Integer(user.getID());
            userIDMap.put(username, id);
        }
        else {
            int id = ((Integer)userIDMap.get(username)).intValue();
            user = getUser(id);
        }
        return user;
    }
    /**
     * Returns the "anonymous user" object.
     */
    public User getAnonymousUser() {
        return anonymousUser;
    }
    /**
     * Returns the "special user" object. The special user represents any
     * valid user in the system. Getting a handle on this object is only
     * really useful for setting permissions on forums. For example, if you
     * want to allow any registered user to post messgages in a forum, add
     * a user permission for posting messages with the special user as the
     * User parameter.
     */
    public User getSpecialUser() {
        return specialUser;
    }   
    /**
     * Deletes a User.
     *
     * @throws UnauthorizedException
     */
    public void deleteUser(User user) throws UnauthorizedException {
        int userID = user.getID();
        int [] messages;
        //Get array of all user's messages in the system so that
        //we can expire them from cache.
        ArrayList tempMessages = new ArrayList();
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con =  DBMS.getConnection();
            pstmt = con.prepareStatement(ALL_USER_MESSAGES);
            pstmt.setInt(1, user.getID());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                tempMessages.add(new Integer(rs.getInt("messageID")));
            }
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbProfileManager:deleteUser()-" + sqle);
            sqle.printStackTrace();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        //Now copy into an array.
        messages = new int[tempMessages.size()];
        for (int i=0; i<messages.length; i++) {
            messages[i] = ((Integer)tempMessages.get(i)).intValue();
        }
        con = null;
        pstmt = null;
        try {
            con =  DBMS.getConnection();
            //mark all message by user as anonymous
            pstmt = con.prepareStatement(DELETE_USER_MESSAGES);
            pstmt.setInt(1,userID);
            pstmt.execute();
            pstmt.close();
            //remove all permissions given to user
            pstmt = con.prepareStatement(DELETE_USER_PERMS);
            pstmt.setInt(1,userID);
            pstmt.execute();
            pstmt.close();
            //delete all of the users's extended properties
            pstmt = con.prepareStatement(DELETE_USER_PROPS);
            pstmt.setInt(1,userID);
            pstmt.execute();
            pstmt.close();
        }
        catch( SQLException sqle ) {
            sqle.printStackTrace();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        //Finally, expire all relevant caches
        //all of users's messages
        for (int i=0; i<messages.length; i++) {
            factory.messageCache.remove(messages[i]);
        }
        //user cache
        userIDMap.remove(user.getUsername());
        userCache.remove(userID);
    }
    /**
     * Returns the numer of users in the system.
     */
    public int getUserCount() {
        int count = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con =  DBMS.getConnection();
            pstmt = con.prepareStatement(USER_COUNT);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        catch( SQLException sqle ) {
            sqle.printStackTrace();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        return count;
    }
    /**
     * Returns an iterator for all users.
     */
    public Iterator users() {
        return new DbUserIterator(this);
    }
    /**
     * Returns an iterator for all users.
     */
    public Iterator users(int startIndex, int numResults) {
        return new DbUserIterator(this, startIndex, numResults);
    }
    /**
     * Returns the number of messages a user has posted in a particular forum.
     */
    public int userMessageCount(User user, Forum forum) {
        int count = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con =  DBMS.getConnection();
            pstmt = con.prepareStatement(USER_MESSAGE_COUNT);
            pstmt.setInt(1, user.getID());
            pstmt.setInt(2, forum.getID());
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        }
        catch( SQLException sqle ) {
            sqle.printStackTrace();
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        return count;
    }
    /**
     * Returns an iterator for all the messages that a user posted in a
     * particular forum.
     */
    public Iterator userMessages(User user, Forum forum) {
        return new DbUserMessagesIterator(factory, user, forum);
    }
}
