/**
 * UserProxy.java
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

package com.coolservlets.forum;

import java.util.*;

/**
 * Protection proxy for User objects.
 *
 * @see User
 */
public class UserProxy implements User {

    private User user;
    private Authorization authorization;
    private ForumPermissions permissions;

    /**
     * Create a new UserProxy.
     */
    public UserProxy(User user, Authorization authorization,
            ForumPermissions permissions)
    {
        this.user = user;
        this.authorization = authorization;
        this.permissions = permissions;
    }
    /**
     * Returns the user's rating.
     */
    public int getRating() {
        return user.getRating();
    }

    /**
     * Returns the user's id. All ids must be unique in the system.
     */
    public int getID() {
        return user.getID();
    }

    /**
     * Returns true if the User object is an anonymous user object.
     */
    public boolean isAnonymous() {
        return user.isAnonymous();
    }

    /**
     * Returns the user's username. All usernames must be unique in the system.
     */
    public String getUsername() {
        return user.getUsername();
    }

    /**
     * Returns the user's name. The user's name does not have to be to be
     * unique in the system.
     */
    public String getName(){
        if (isNameVisible() || permissions.get(ForumPermissions.SYSTEM_ADMIN) ||
                permissions.get(ForumPermissions.USER_ADMIN))
        {
            return user.getName();
        }
        else {
            return null;
        }
    }

    /**
     * Sets the user's name. The user's name does not have to be to be
     * unique in the system.
     *
     * @param name new name for the user.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setName(String name) throws UnauthorizedException {
        if (permissions.get(ForumPermissions.SYSTEM_ADMIN) ||
               permissions.get(ForumPermissions.USER_ADMIN))
        {
            user.setName(name);
        }
        else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Returns true if the user has chosen to make her name visible to other
     * users. If the name is not visible, calling getName() will throw an
     * UnauthorizedException.
     */
    public boolean isNameVisible() {
        return user.isNameVisible();
    }

    /**
     * Sets whether a user's name is visible to other users. If the field
     * is set to not be visible, calling getName() will throw an
     * UnauthorizedException.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setNameVisible(boolean visible) throws UnauthorizedException {
        if (permissions.get(ForumPermissions.SYSTEM_ADMIN) ||
               permissions.get(ForumPermissions.USER_ADMIN))
        {
            user.setNameVisible(visible);
        }
        else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Sets the users's password. The password should be passed in as
     * plain text. The way the password is stored is implementation dependent.
     * However, it is recommended to at least hash passwords with an
     * algorithm such as MD5.
     *
     * @param password new password for the user.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setPassword(String password) throws UnauthorizedException {
        if (permissions.get(ForumPermissions.SYSTEM_ADMIN) ||
               permissions.get(ForumPermissions.USER_ADMIN))
        {
            user.setPassword(password);
        }
        else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Reset's a user's password. This is useful if a user forgets their
     * password since many implementations will not be able retrieve a
     * hashed password. The normal side effect of calling this method is
     * that the new password is emailed to the user using the email address
     * listed in the account. However, this method could be abused by another
     * user if they were able to continually reset another users's password.
     * <p>
     * A recommendation for implementation of a password resetting system:
     * provide a form where users can request a password reset because they've
     * forgotten their password. Making this request sends an email to the
     * email account listed for the user. That email should include a web
     * address with a random string for security. If the user visits that
     * address within 24 hours, the password is reset with a random string
     * and emailed to the user. If the web page is never visited, the password
     * is not reset. This method provides good security and prevents abuse
     * of the password resetting system. This functionality would probably
     * be incorporated into a forum skin.
     */
    //public void resetPassword() {
    //    user.resetPassword();
    //}

    /**
     * Returns the user's email address. Email should be considered to be
     * a required field of a user account since it is critical to many
     * user operations performing.
     */
    public String getEmail() {
        if (isEmailVisible() ||  permissions.get(ForumPermissions.SYSTEM_ADMIN) ||
                permissions.get(ForumPermissions.USER_ADMIN))
        {
            return user.getEmail();
        }
        else {
            return null;
        }
    }

    /**
     * Sets the user's email address. Email should be considered to be
     * a required field of a user account since it is critical to many
     * user operations performing.
     *
     * @param email new email address for the user.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setEmail(String email) throws UnauthorizedException {
        if (permissions.get(ForumPermissions.SYSTEM_ADMIN) ||
               permissions.get(ForumPermissions.USER_ADMIN))
        {
            user.setEmail(email);
        }
        else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Returns true if the user has chosen to make her email visible to other
     * users. If the email field is not visible, calling getEmail() will throw
     * an UnauthorizedException.
     */
    public boolean isEmailVisible() {
        return user.isEmailVisible();
    }

    /**
     * Sets whether a user's email is visible to other users. If the field
     * is set to not be visible, calling getEmail() will throw an
     * UnauthorizedException.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setEmailVisible(boolean visible) throws UnauthorizedException {
        if (permissions.get(ForumPermissions.SYSTEM_ADMIN) ||
               permissions.get(ForumPermissions.USER_ADMIN))
        {
            user.setEmailVisible(visible);
        }
        else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Returns the permissions for the user that correspond to the
     * passed-in Authorization. 
     *
     * @param authorization the auth token to look up permissions with.
     */
    public ForumPermissions getPermissions(Authorization authorization) {
        return user.getPermissions(authorization);
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
        return permissions.get(type);
    }

    /**
     * Converts the object to a String by returning the usernamename.
     * This functionality is primarily for Java applications that might be
     * accessing CoolForum objects through a GUI.
     */
    public String toString() {
        return user.toString();
    }
} 
