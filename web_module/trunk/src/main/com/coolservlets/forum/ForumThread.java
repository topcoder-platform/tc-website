/**
 * ForumThread.java
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

import java.util.Date;
import java.util.Iterator;

//JDK1.1// import com.sun.java.util.collections.*;

/**
 * A ForumThread is a container for a hierarchy of ForumMessages.
 *
 * Intimately tied to the concept of a ForumThread is a root message. A
 * root message must be supplied when creating a thread. Subsequently, all
 * further messages posted to the thread are children of the root message.
 * Most implementations of ForumThread will set the name of the thread to
 * the subject of the root message. When displaying a thread, most skins may
 * want to simply call <i>getRootMessage</i> and use that message's info
 * to display information about the thread.
 * <p>
 * To get a handle on a ForumThread object, the <i>getThread</i> method
 * should be called from a Forum object. To create a thread, <i>createThread</i>
 * from a Forum object should be used. After creating a thread, you must
 * attach it to a Forum by calling <i>addThread</i> from a Forum object.
 * To delete a ForumThread, call the <i>deleteThread</i> method from the
 * Forum object that the thread is attached to.
 * <p>
 * There are two options for navigating through the messages of a thread.
 * <ul>
 *   <li>A TreeWalker -- this provides a hierarchical view of the messages in
 *      in the thread. For most skins, this will be the most appropriate
 *      navigation method.
 *   <li>An Iterator -- this provides a flat view of the messages in the thread.
 *      Since the message structure is not really flat, a field to sort by
 *      must be provided. This view of thread is useful for skins that want
 *      to provide functionality such as listing all the messages in the order
 *      they were created, etc.
 * </ul>
 */
public interface ForumThread {

    /**
     * Returns the id of the thread.
     */
    public int getID();

    /**
     * Returns the name of the thread. It is recommended that name of the
     * thread be set to the subject of the root message.
     */
    public String getName();

    /**
     * Sets the name of the thread.
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void setName(String name) throws UnauthorizedException;

    /**
     * Returns the Date that the thread was created.
     */
    public Date getCreationDate();

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
    public void setCreationDate(Date creationDate) throws UnauthorizedException;

    /**
     * Returns the Date that the thread was last modified. In other words, the
     * date of the most recent message in the thread.
     */
    public Date getModifiedDate();

    /**
     * Returns the User that last modified the thread.
     */
    public User getUser();

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
    public void setModifiedDate(Date modifiedDate) throws UnauthorizedException;

    /**
     * Returns the parent Forum of the thread.
     */
    public Forum getForum();

    /**
     * Returns a message from the thread based on its id.
     *
     * @param messageID the ID of the message to get from the thread.
     */
    public ForumMessage getMessage(int messageID)
            throws ForumMessageNotFoundException;

    /**
     * Returns the root message of a thread. The root message is a special
     * first message that is intimately tied to the thread for most forumViews.
     * All other messages in the thread are children of the root message.
     */
    public ForumMessage getRootMessage() throws ForumMessageNotFoundException;

    /**
     * Returns the number of messages in the thread. This includes the root
     * message. So, to find the number of replies to the root message,
     * subtract one from the answer of this method.
     */
    public int getMessageCount();

    /**
     * Adds a new message to the thread.
     *
     * @param parentMessage some message in the thread that will be parent
     * @param newMessage message to add to the thread under the parent
     */
    public void addMessage(ForumMessage parentMessage, ForumMessage newMessage);

    /**
     * Deletes a message from the thread. Throws a MessageNotFoundException
     * if the message is not in the thread. If the message is deleted, it
     * should be entirely erased from the Forum system. Therefore, the
     * behavior is unspecified if a message object is first removed from a
     * thread and then added to another (this action not recommended).
     *
     * @throws UnauthorizedException if does not have ADMIN permissions.
     */
    public void deleteMessage(ForumMessage message)
            throws ForumMessageNotFoundException, UnauthorizedException;

    /**
     * Returns a TreeWalker for the entire thread. A TreeWalker is used
     * to navigate through the tree of messages in a hierarchical manner.
     */
    public TreeWalker treeWalker();

    /**
     * Return an Iterator for all the messages in a thread.
     */
    public Iterator messages();

    /**
     * Return an Iterator for all the messages in a thread. The startIndex
     * and numResults restrict the number of results returned, which is useful
     * for multi-page HTML navigation.
     *
     * @param startIndex the index you'd like to start the iterator at.
     * @param numResuls the max number of results iterator will hold.
     */
    public Iterator messages(int startIndex, int numResults);

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
