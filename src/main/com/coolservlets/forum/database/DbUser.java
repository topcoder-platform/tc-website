/**
 * DbUser.java
 * August 19, 2000
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
import com.coolservlets.util.StringUtils;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Database implementation of the User interface. Additionally, it filters all
 * HTML tags from fields before returning them for security purposes.
 *
 * Use of the Jive user system is optional. There a number of different ways
 * to create your own user system or to integrate into an existing user
 * system:
 *   - Edit the source of this class and modify the database queries to match
 *     your user system.
 *   - Implement a set of custom classes and tell the ForumFactory to load
 *     them. In this case, it is still recommended to use the Jive user API
 *     since that will mean much less reimplementation work in the other
 *     classes.
 * If you can follow the Jive API for your own user data, but need access
 * within Jive to extended user properties, such as addresses or other
 * personal data, and easy solution is to adapt the user properties facility
 * to load and access this data.
 */
public class DbUser implements User, Serializable {

    private static final String LOAD_USER_BY_USERNAME =
            "SELECT u.user_id, u.handle, u.password, u.email, r.rating FROM user u, rating r WHERE u.user_id = r.coder_id and u.handle=?";
    private static final String LOAD_USER_BY_ID =
            "SELECT u.user_id, u.handle, u.password, u.email, r.rating FROM user u, rating r WHERE u.user_id = r.coder_id and u.user_id=?";

    private static final String INSERT_USER =
            "INSERT INTO jiveUser(userID,username,passwordHash,email,emailVisible," +
            "nameVisible) VALUES(?,?,?,?,?,?)";
    private static final String SAVE_USER =
            "UPDATE jiveUser SET passwordHash=?,email=?,emailVisible=?,name=?," +
            "nameVisible=? WHERE userID=?";
    private static final String DELETE_PERMISSIONS =
            "DELETE FROM jiveUserPerm WHERE userID=?";
    private static final String INSERT_PERMISSION =
            "INSERT INTO jiveUserPerm(userID,forumID,permission) VALUES(?,?,?)";

    /**
     * user id of -2 means no user id has been set yet. -1 is reserved for
     * "anonymous user" and 0 is reserved for "all users".
     */
    private int userID = -2;
    private String username;
    private String passwordHash;
    private String name = "";
    private boolean nameVisible = true;
    private String email;
    private int rating;
    private boolean emailVisible = true;
    private transient static Logger log = Logger.getLogger(DbUser.class);

    /**
     * Create a new DbUser with all required fields.
     *
     */
    protected DbUser(String username, String password, String email) {
        try {
            this.userID = DBMS.getSeqId(DBMS.RTABLE_SEQ);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.username = username;
        //Compute hash of password.
        this.passwordHash = (password);
        this.email = email;
        insertIntoDb();
    }

    /**
     * Load a DbUser object specified by userID.
     */
    protected DbUser(int userID) throws UserNotFoundException {
        this.userID = userID;
        loadFromDb();
    }

    /**
     * Load a DbUser object specified by username.
     */
    protected DbUser(String username) throws UserNotFoundException {
        this.username = username;
        loadFromDb();
    }

    public int getRating() {
        return rating;
    }

    public int getID() {
        return userID;
    }

    public boolean isAnonymous() {
        return (userID == -1);
    }

    public String getUsername() {
        return StringUtils.escapeHTMLTags(username);
    }

    public String getName() {
        return StringUtils.escapeHTMLTags(name);
    }

    public void setName(String name) throws UnauthorizedException {
        this.name = name;
        saveToDb();
    }

    public boolean isNameVisible() {
        return nameVisible;
    }

    public void setNameVisible(boolean visible) throws UnauthorizedException {
        this.nameVisible = visible;
        saveToDb();
    }

    public void setPassword(String password) throws UnauthorizedException {
        //Compute hash of password.
        this.passwordHash = (password);
        saveToDb();
    }

    //public void resetPassword() {
    //implement this eventually... :)
    //}

    public String getEmail() {
        return StringUtils.escapeHTMLTags(email);
    }

    public void setEmail(String email) throws UnauthorizedException {
        this.email = email;
        saveToDb();
    }

    public boolean isEmailVisible() {
        return emailVisible;
    }

    public void setEmailVisible(boolean visible) throws UnauthorizedException {
        this.emailVisible = visible;
        saveToDb();
    }

    public ForumPermissions getPermissions(Authorization authorization) {
        if (authorization.getUserID() == userID || userID == -1 || userID == 0) {
            return new ForumPermissions(false, false, false, true, false, false, false, false);
        } else {
            return ForumPermissions.none();
        }
    }

    public boolean hasPermission(int type) {
        return true;
    }

    public String toString() {
        return username;
    }

    /**
     * Load the user data from the database.
     */
    private void loadFromDb() throws UserNotFoundException {
        //If the user is anonymous or "all users", do nothing.
        if (userID == -1 || userID == 0) {
            return;
        }
        // Otherwise, select user data from User table and fill in relevant fields.
        String query = null;
        //We may want to do a username lookup.
        if (username != null) {
            query = LOAD_USER_BY_USERNAME;
        }
        //Otherwise, a lookup by id
        else {
            query = LOAD_USER_BY_ID;
        }
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(query);
            if (username != null) {
                ps.setString(1, username);
            } else {
                ps.setInt(1, userID);
            }

            rs = ps.executeQuery();
            if (rs.next()) {
/*
                throw new UserNotFoundException(
                    "Failed to read user " + userID + " from database."
                );
*/
                this.userID = rs.getInt("user_id");
                this.username = rs.getString("handle");
                this.passwordHash = rs.getString("password");
                this.email = rs.getString("email");
                this.rating = rs.getInt("rating");
            }
        } catch (SQLException sqle) {
            throw new UserNotFoundException(
                    "Failed to read user " + userID + " from database.", sqle
            );
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.debug("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.debug("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.debug("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
    }

    /**
     * Inserts a new user record into the database.
     */
    private void insertIntoDb() {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(INSERT_USER);
            ps.setInt(1, userID);
            ps.setString(2, username);
            ps.setString(3, passwordHash);
            ps.setString(4, email);
            ps.setInt(5, emailVisible ? 1 : 0);
            ps.setInt(6, nameVisible ? 1 : 0);
            ps.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("Error in DbUser:insertIntoDb()-" + sqle);
            sqle.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.debug("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.debug("conn close problem");
            }
            ps = null;
            conn = null;
        }
    }

    /**
     * Save the user data to the database.
     */
    private void saveToDb() {
        if (userID == -1 || userID == 0) {
            //"anonymous" or "all users", do nothing
            return;
        }
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(SAVE_USER);
            ps.setString(1, passwordHash);
            ps.setString(2, email);
            ps.setInt(3, emailVisible ? 1 : 0);
            ps.setString(4, name);
            ps.setInt(5, nameVisible ? 1 : 0);
            ps.setInt(6, userID);
            ps.executeUpdate();
        } catch (SQLException sqle) {
            System.err.println("SQLException in DbUser.java:saveToDb(): " + sqle);
            sqle.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.debug("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.debug("conn close problem");
            }
            ps = null;
            conn = null;
        }
    }
}
