/**
 * Forum.java
 * September 02, 2000
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
import java.util.Iterator;

/**
 * A top level container for discussions. It contains a list of threads, each
 * of which contains a tree of messages.
 */
public interface Forum {

    /**
     * Returns the id of the forum.
     */
    public int getID();

    /**
     * Returns the name of the forum.
     */
    public String getName();

    /**
     * Sets the name of a the forum.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setName(String name) throws UnauthorizedException;

    /**
     * Returns the description of the forum.
     */
    public String getDescription();

    /**
     * Sets the description of the forum.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setDescription(String description) throws UnauthorizedException;

    /**
     * Returns the Date that the forum was created.
     */
    public Date getCreationDate();

    /**
     * Sets the creation date of the forum. In most cases, the creation date
     * will default to when the forum was entered into the system. However,
     * the creation date needs to be set manually when importing data.
     * In other words, skin authors should ignore this method since it only
     * intended for system maintenance.
     *
     * @param creationDate the date the forum was created.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setCreationDate(Date creationDate) throws UnauthorizedException;

    /**
     * Returns the Date that the forum was last modified. In other words, the
     * date of the most recent message or thread in the forum.
     */
    public Date getModifiedDate();

    /**
     * Returns the CoderId that last modified the forum.
     */
    public User getUser();

    /**
     * Sets the date the forum was last modified. In most cases, last modifed
     * will default to when the forum data was last changed. However,
     * the last modified date needs to be set manually when importing data.
     * In other words, skin authors should ignore this method since it only
     * intended for system maintenance.
     *
     * @param modifiedDate the date the forum was modified.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setModifiedDate(Date modifiedDate) throws UnauthorizedException;

    /**
     * Returns true if this forum is moderated. When a forum is moderated,
     * posted messages and threads must first be approved by a user with
     * moderator permissions.<p>
     *
     * Note: this feature not yet implemented.
     *
     * @param type should be either Forum.THREAD or Forum.MESSAGE
     */
    public boolean isModerated(int type);

    /**
     * Sets whether the forum is moderated. When a forum is moderated,
     * posted messages and threads must first be approved by a user with
     * moderator permissions.<p>
     *
     * Note: this feature not yet implemented.
     *
     * @param type should be either Forum.THREAD or Forum.MESSAGE
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setModerated(int type, boolean moderated)
            throws UnauthorizedException;

    /**
     * Factory method to create a Thread.
     *
     * @param forum the forum to create the thread in.
     * @param rootMessage the root message of the thread.
     *
     * @throws UnauthorizedException if does not have CREATE_THREAD permissions.
     */
    public abstract ForumThread createThread(ForumMessage rootMessage) throws
            UnauthorizedException;

    /**
     * Factory method to create a Message.
     *
     * @param user the user for the message.
     *
     * @throws UnauthorizedException if does not have CREATE_MESSAGE permissions.
     */
    public abstract ForumMessage createMessage(User user)
            throws UnauthorizedException;

    /**
     * Deletes a thread.
     *
     * @param thread the thread to delete.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void deleteThread(ForumThread thread) throws UnauthorizedException;

    /**
     * Adds a thread to the forum.
     *
     * @param thread the thread to add to the forum.
     *
     * @throws UnauthorizedException if does not have CREATE_THREAD permissions.
     */
    public void addThread(ForumThread thread) throws UnauthorizedException;

    /**
     * Returns a thread specified by its id. Will return null
     * if the thread is not in the forum.
     */
    public ForumThread getThread(int threadID)
            throws ForumThreadNotFoundException;

    /**
     * Returns a Iterator for the forum to move through the threads.
     */
    public Iterator threads();

    /**
     * Returns a ListIterator for the forum to move through the threads.
     *
     * @param startIndex the index you'd like to start the iterator at.
     * @param numResuls the max number of results iterator will hold.
     */
    public Iterator threads(int startIndex, int numResults);

    /**
     * Returns the number of threads in the forum.
     */
    public int getThreadCount();

    /**
     * Returns the number of messages in the forum.
     */
    public int getMessageCount();

    /**
     * Creates a query object to search the forum. This method is considered
     * a first stab at searching in Jive, and will almost certainly be
     * modified in the near future.
     */
    public Query createQuery();

    /**
     * Grants a user a particular permission for the forum.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void addUserPermission(User user, int permissionType)
            throws UnauthorizedException;

    /**
     * Revokes a particular permission from a user for the forum.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void removeUserPermission(User user, int permissionType)
            throws UnauthorizedException;

    /**
     * Returns all the userID's of users with a particular permission.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public int[] usersWithPermission(int permissionType)
            throws UnauthorizedException;

    /**
     * Applies all of the currently active filters to a message.
     *
     * @param message the ForumMessage to apply filters to.
     */
    public ForumMessage applyFilters(ForumMessage message);

    /**
     * Returns an array of the currently active ForumMessageFilters.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public ForumMessageFilter[] getForumMessageFilters()
            throws UnauthorizedException;

    /**
     * Adds a new ForumMessageFilter to the end of the filter list.
     *
     * @param filter ForumMessageFilter to add to the filter list.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void addForumMessageFilter(ForumMessageFilter filter)
            throws UnauthorizedException;

    /**
     * Inserts a new ForumMessageFilter at specified index in the filter list.
     *
     * @param filter ForumMessageFilter to add to the filter list.
     * @param index position in filter list to insert new filter.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void addForumMessageFilter(ForumMessageFilter filter, int index)
            throws UnauthorizedException;

    /**
     * Removes a ForumMessageFilter at the specified index in the filter list.
     *
     * @param index position in filter list to remove filter from.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void removeForumMessageFilter(int index)
            throws UnauthorizedException;

    /**
     * Returns the permissions for the forum that correspond to the
     * passed-in Authorization.
     *
     * @param authorization the auth token to lookup permissions for.
     */
    public abstract ForumPermissions getPermissions(Authorization authorization);

    /**
     * Returns true if the handle on the object has the permission specified.
     * A list of possible permissions can be found in the ForumPermissions
     * class. Certain methods of this class are restricted to certain
     * permissions as specified in the method comments.
     *
     * @see ForumPermissions
     */
    public boolean hasPermission(int type);
}

