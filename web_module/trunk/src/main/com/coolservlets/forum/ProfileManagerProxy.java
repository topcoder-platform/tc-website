/**
 * ProfileManagerProxy.java
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

package com.coolservlets.forum;

import java.util.Iterator;

//JDK1.1// import com.sun.java.util.collections.*;

/**
 * Protection proxy for the ProfileManager class. It restricts access to
 * protected methods by throwing UnauthorizedExceptions when necessary.
 *
 * @see ProfileManager
 */
public class ProfileManagerProxy implements ProfileManager {

    private ProfileManager profileManager;
    private Authorization authorization;
    private ForumPermissions permissions;

    /**
     * Creates a new ProfileManagerProxy.
     */
    public ProfileManagerProxy(ProfileManager profileManager, Authorization
            authorization, ForumPermissions permissions) {
        this.profileManager = profileManager;
        this.authorization = authorization;
        this.permissions = permissions;
    }

    public User createUser(String username, String password, String email)
            throws UserAlreadyExistsException {
        return profileManager.createUser(username, password, email);
    }

    public User getUser(int userID) throws UserNotFoundException {
        User user = profileManager.getUser(userID);
        ForumPermissions userPermissions = user.getPermissions(authorization);
        ForumPermissions newPermissions =
                new ForumPermissions(permissions, userPermissions);
        return new UserProxy(user, authorization, newPermissions);
    }

    public User getUser(String username) throws UserNotFoundException {
        User user = profileManager.getUser(username);
        ForumPermissions userPermissions = user.getPermissions(authorization);
        ForumPermissions newPermissions =
                new ForumPermissions(permissions, userPermissions);
        return new UserProxy(user, authorization, newPermissions);
    }

    public User getAnonymousUser() {
        return profileManager.getAnonymousUser();
    }

    public User getSpecialUser() {
        return profileManager.getSpecialUser();
    }

    public void deleteUser(User user) throws UnauthorizedException {
        if (permissions.get(ForumPermissions.SYSTEM_ADMIN)) {
            profileManager.deleteUser(user);
        } else {
            throw new UnauthorizedException();
        }
    }

    public int getUserCount() {
        return profileManager.getUserCount();
    }

    public Iterator users() {
        Iterator iterator = profileManager.users();
        return new UserIteratorProxy(iterator, authorization, permissions);
    }

    public Iterator users(int startIndex, int numResults) {
        Iterator iterator = profileManager.users(startIndex, numResults);
        return new UserIteratorProxy(iterator, authorization, permissions);
    }

    public int userMessageCount(User user, Forum forum) {
        return profileManager.userMessageCount(user, forum);
    }

    public Iterator userMessages(User user, Forum forum) {
        Iterator iterator = profileManager.userMessages(user, forum);
        return new MessageIteratorProxy(iterator, authorization, permissions);
    }
}
