/**
 * TreeWalkerProxy.java
 * August 20, 2000
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

/**
 * Protection proxy for TreeWalker ojbects
 */
public class TreeWalkerProxy implements TreeWalker{

    private TreeWalker treeWalker;
    private Authorization authorization;
    private ForumPermissions permissions;

    public TreeWalkerProxy(TreeWalker treeWalker, Authorization authorization,
            ForumPermissions permissions)
    {
        this.treeWalker = treeWalker;
        this.authorization = authorization;
        this.permissions = permissions;
    }

    public ForumMessage getRoot() {
        ForumMessage message = treeWalker.getRoot();
        return new ForumMessageProxy(message, authorization, permissions);
    }

    public ForumMessage getChild(ForumMessage parent, int index) {
        ForumMessage message = treeWalker.getChild(parent, index);
        return new ForumMessageProxy(message, authorization, permissions);
    }

    public int getChildCount(ForumMessage parent) {
        return treeWalker.getChildCount(parent);
    }

    public int getRecursiveChildCount(ForumMessage parent) {
        return treeWalker.getRecursiveChildCount(parent);
    }

    public int getIndexOfChild(ForumMessage parent, ForumMessage child) {
        return treeWalker.getIndexOfChild(parent, child);
    }

    public boolean isLeaf(ForumMessage node) {
        return treeWalker.isLeaf(node);
    }

} 