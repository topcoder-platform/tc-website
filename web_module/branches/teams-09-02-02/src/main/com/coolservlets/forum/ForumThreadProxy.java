/**
 * ForumThreadProxy.java
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

import java.util.*;
//JDK1.1// import com.sun.java.util.collections.*;

/**
 * Protection proxy for ForumThread objects. It restricts access to protected
 * methods by throwing UnauthorizedExceptions if the user does not have
 * permission to access the class.
 */
public class ForumThreadProxy implements ForumThread {

    private ForumThread thread;
    private Authorization authorization;
    private ForumPermissions permissions;

    /**
     * Creates a new proxy.
     */
    public ForumThreadProxy(ForumThread thread, Authorization authorization,
            ForumPermissions permissions)
    {
        this.thread = thread;
        this.authorization = authorization;
        this.permissions = permissions;
    }

    public int getID() {
        return thread.getID();
    }

    public User getUser() {
        return thread.getUser();
    }

    public String getName() {
        return thread.getName();
    }

    public void setName(String name) throws UnauthorizedException {
        if (permissions.isSystemOrForumAdmin()) {
            thread.setName(name);
        }
        else throw new UnauthorizedException();
    }

    public Date getCreationDate() {
        return thread.getCreationDate();
    }

    public void setCreationDate(Date creationDate)
            throws UnauthorizedException
    {
        if (permissions.isSystemOrForumAdmin()) {
            thread.setCreationDate(creationDate);
        }
        else throw new UnauthorizedException();
    }

    public Date getModifiedDate() {
        return thread.getModifiedDate();
    }

    public void setModifiedDate(Date modifiedDate)
            throws UnauthorizedException
    {
        if (permissions.isSystemOrForumAdmin()) {
            thread.setModifiedDate(modifiedDate);
        }
        else throw new UnauthorizedException();
    }

    public Forum getForum() {
        Forum forum = thread.getForum();
        return new ForumProxy(forum, authorization, permissions);
    }

    public int getMessageCount() {
        return thread.getMessageCount();
    }

    public ForumMessage getRootMessage() throws ForumMessageNotFoundException {
        ForumMessage message = thread.getRootMessage();
        return new ForumMessageProxy(message, authorization, permissions);
    }

    public void addMessage(ForumMessage parentMessage, ForumMessage newMessage)
    {
        thread.addMessage(parentMessage, newMessage);
    }

    public void deleteMessage(ForumMessage message)
            throws ForumMessageNotFoundException, UnauthorizedException
    {
        if (permissions.isSystemOrForumAdmin()) {
            thread.deleteMessage(message);
        }
        else {
            throw new UnauthorizedException();
        }
    }

    public ForumMessage getMessage(int messageID)
            throws ForumMessageNotFoundException
    {
        ForumMessage message = thread.getMessage(messageID);
        //Apply the protection proxy and return message.
        return new ForumMessageProxy(message, authorization, permissions);
    }

    public TreeWalker treeWalker() {
        return new TreeWalkerProxy(thread.treeWalker(), authorization, permissions);
    }

    public Iterator messages() {
        Iterator iterator = thread.messages();
        return new MessageIteratorProxy(iterator, authorization, permissions);
    }

    public Iterator messages(int startIndex, int numResults) {
        Iterator iterator = thread.messages(startIndex, numResults);
        return new MessageIteratorProxy(iterator, authorization, permissions);
    }

    public boolean hasPermission(int type) {
        return permissions.get(type);
    }

    public String toString() {
        return thread.toString();
    }
} 
