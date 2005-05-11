/**
 * ForumMessageProxy.java
 * August 12, 2000
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

import java.util.Date;
import java.util.Enumeration;

/**
 * A protection proxy for ForumMessage objects.
 */
public class ForumMessageProxy implements ForumMessage {

    private ForumMessage message;
    private Authorization authorization;
    private ForumPermissions permissions;

    /**
     * Creates a new ForumMessageProxy to protect the supplied message with
     * the specified permissions
     */
    public ForumMessageProxy(ForumMessage message, Authorization authorization,
                             ForumPermissions permissions) {
        this.message = message;
        this.authorization = authorization;
        this.permissions = permissions;
    }

    /**
     * Returns the id of the message.
     */
    public int getID() {
        return message.getID();
    }

    /**
     * Returns the when the message was created.
     */
    public Date getCreationDate() {
        return message.getCreationDate();
    }

    /**
     * Sets the creation date of the message. In most cases, the creation date
     * will default to when the message was entered into the system. However,
     * the creation date needs to be set manually when importing messages.
     * In other words, skin authors should ignore this method since it only
     * intended for system maintenance.
     *
     * @param creationDate the date the message was created.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setCreationDate(Date creationDate)
            throws UnauthorizedException {
        if (permissions.isSystemOrForumAdmin()) {
            this.message.setCreationDate(creationDate);
        } else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Returns when the message was last modified.
     */
    public Date getModifiedDate() {
        return message.getModifiedDate();
    }

    /**
     * Sets the date the message was last modified. In most cases, last modifed
     * will default to when the message data was last changed. However,
     * the last modified date needs to be set manually when importing messages.
     * In other words, skin authors should ignore this method since it only
     * intended for system maintenance.
     *
     * @param modifiedDate the date the message was modified.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setModifiedDate(Date modifiedDate)
            throws UnauthorizedException {
        if (permissions.isSystemOrForumAdmin()) {
            this.message.setModifiedDate(modifiedDate);
        } else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Returns the subject of the message.
     */
    public String getSubject() {
        return message.getSubject();
    }

    /**
     * Sets the subject of the message.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setSubject(String subject) throws UnauthorizedException {
        if (permissions.isSystemOrForumAdmin() ||
                getUser().hasPermission(ForumPermissions.USER_ADMIN)) {
            this.message.setSubject(subject);
        } else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Returns the message body.
     */
    public String getBody() {
        return message.getBody();
    }

    /**
     * Sets the body of the message.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setBody(String body) throws UnauthorizedException {
        if (permissions.isSystemOrForumAdmin() ||
                getUser().hasPermission(ForumPermissions.USER_ADMIN)) {
            this.message.setBody(body);
        } else {
            throw new UnauthorizedException();
        }
    }

    /**
     * Returns the User associated with the message.
     */
    public User getUser() {
        User user = message.getUser();
        ForumPermissions userPermissions = user.getPermissions(authorization);
        ForumPermissions newPermissions =
                new ForumPermissions(permissions, userPermissions);
        return new UserProxy(user, authorization, newPermissions);
    }

    /**
     * Returns an extended property of the message. Each message can have an
     * arbitrary number of extended properties. This lets particular skins
     * or filters provide enhanced functionality that is not part of the base
     * interface.
     *
     * @param name the name of the property to get.
     */
    public String getProperty(String name) {
        return message.getProperty(name);
    }

    /**
     * Sets an extended property of the message. Each message can have an
     * arbitrary number of extended properties. This lets particular skins
     * or filters provide enhanced functionality that is not part of the base
     * interface.
     *
     * @param name the name of the property to set.
     * @param value the new value for the property.
     */
    public void setProperty(String name, String value) {
        message.setProperty(name, value);
    }

    /**
     * Returns an Enumeration of all the names of the message properties.
     */
    public Enumeration propertyNames() {
        return message.propertyNames();
    }

    /**
     * Returns whether the message was posted anonymously.
     */
    public boolean isAnonymous() {
        return message.isAnonymous();
    }

    /**
     * Returns the parent ForumThread of the message.
     */
    public ForumThread getForumThread() {
        return message.getForumThread();
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
     * Converts the object to a String by returning the subject of the message.
     * This functionality is primarily for Java applications that might be
     * accessing CoolForum objects through a GUI.
     */
    public String toString() {
        return message.toString();
    }

}