/**
 * DbTreeWalker.java
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

package com.coolservlets.forum.database;

import com.coolservlets.forum.ForumMessage;
import com.coolservlets.forum.ForumMessageNotFoundException;
import com.coolservlets.forum.TreeWalker;
import com.topcoder.shared.util.DBMS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Database implementation of the TreeWalker interface. This class is relatively
 * inefficient compared to how it will eventually be implemented. However,
 * a schema change is needed before that optimization is needed (represent
 * tree structure directly in schema).
 */
public class DbTreeWalker implements TreeWalker {
    /** DATABASE QUERIES **/
    private static final String GET_CHILD =
            "SELECT jiveMessageTree.childID, jiveMessage.creationDate FROM " +
            "jiveMessageTree, jiveMessage WHERE " +
            "jiveMessageTree.childID=jiveMessage.messageID AND " +
            "jiveMessageTree.parentID=? ORDER BY jiveMessage.creationDate";
    private static final String CHILD_COUNT =
            "SELECT count(*) FROM jiveMessageTree WHERE parentID=?";
    private static final String INDEX_OF_CHILD =
            "SELECT jiveMessageTree.childID, jiveMessage.creationDate " +
            "FROM jiveMessageTree, jiveMessage WHERE jiveMessageTree.childID=jiveMessage.messageID " +
            "AND jiveMessageTree.parentID=? ORDER BY jiveMessage.creationDate";
    private DbForumThread thread;
    private DbForumFactory factory;

    public DbTreeWalker(DbForumThread thread, DbForumFactory factory) {
        this.thread = thread;
        this.factory = factory;
    }

    /**
     * Returns the root of the tree. Returns null only if the tree has no nodes.
     *
     * @returns the root of the tree
     */
    public ForumMessage getRoot() {
        try {
            return thread.getRootMessage();
        } catch (ForumMessageNotFoundException mnfe) {
            return null;
        }
    }

    /**
     * Returns the child of parent at index index in the parent's child array.
     * This should not return null if index is a valid index for parent (that
     * is index >= 0 && index < getChildCount(parent)).
     *
     * @param parent the parent message.
     * @param index the index of the child.
     * @returns the child of parent at index.
     */
    public ForumMessage getChild(ForumMessage parent, int index) {
        ForumMessage message = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(GET_CHILD);
            pstmt.setInt(1, parent.getID());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next() && index > 0) {
                index--;
            }
            if (index == 0) {
                int messageID = rs.getInt(1);
                message = thread.getMessage(messageID);
            }
        } catch (Exception e) {
            System.err.println("Error in DbMessageTreeWalker:getChild("
                    + index + ")-" + e);
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return message;
    }

    /**
     * Returns the number of children of parent. Returns 0 if the node is a
     * leaf or if it has no children.
     *
     * @param parent a node in the tree, obtained from this data source.
     * @returns the number of children of the node parent.
     */
    public int getChildCount(ForumMessage parent) {
        int childCount = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(CHILD_COUNT);
            pstmt.setInt(1, parent.getID());
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            childCount = rs.getInt(1);
        } catch (Exception e) {
            System.err.println("Error in DbTreeWalker:getChildCount()-"
                    + e);
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return childCount;
    }

    /**
     * Returns the total number of recursive children of a parent. Returns 0
     * if there are no children. This method is not intended to aid in
     * navigation of a Thread but is included as an added utility.
     */
    public int getRecursiveChildCount(ForumMessage parent) {
        int numChildren = 0;
        int num = getChildCount(parent);
        numChildren += num;
        for (int i = 0; i < num; i++) {
            ForumMessage child = getChild(parent, i);
            if (child != null) {
                numChildren += getRecursiveChildCount(child);
            }
        }
        return numChildren;
    }

    /**
     * Returns the index of child in parent.
     */
    public int getIndexOfChild(ForumMessage parent, ForumMessage child) {
        int index = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(INDEX_OF_CHILD);
            pstmt.setInt(1, parent.getID());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) == child.getID()) {
                    break;
                }
                index++;
            }
        } catch (Exception e) {
            System.err.println("Error in DbTreeWalker:getIndexOfChild()-" + e);
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return index;
    }

    /**
     * Returns true if node is a leaf. A node is a leaf when it has no children
     * messages.
     *
     * @param node a node in the tree, obtained from this data source
     * @returns true if node is a leaf
     */
    public boolean isLeaf(ForumMessage node) {
        return (getChildCount(node) > 0);
    }
}
