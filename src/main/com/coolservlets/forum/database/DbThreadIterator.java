/**
 * DbThreadIterator.java
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
import com.coolservlets.forum.ForumThread;
import com.topcoder.shared.util.DBMS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.ListIterator;

/**
 * Database implementation of Iterator for ForumMesages in a ForumThread.
 */
public class DbThreadIterator implements Iterator, ListIterator {

    /** DATABASE QUERIES **/
    private static final String MESSAGE_COUNT =
            "SELECT count(messageID) FROM jiveMessage WHERE threadID=?";
    private static final String GET_MESSAGES =
            "SELECT messageID, creationDate FROM jiveMessage WHERE threadID=? " +
            "ORDER BY creationDate ASC";

    private ForumThread thread;
    private int[] messages;
    private int currentIndex = -1;

    protected DbThreadIterator(ForumThread thread) {
        this.thread = thread;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(MESSAGE_COUNT);
            pstmt.setInt(1, thread.getID());
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            messages = new int[rs.getInt(1)];
            pstmt.close();

            pstmt = con.prepareStatement(GET_MESSAGES);
            pstmt.setInt(1, thread.getID());
            rs = pstmt.executeQuery();
            for (int i = 0; i < messages.length; i++) {
                rs.next();
                messages[i] = rs.getInt("messageID");
            }
        } catch (SQLException sqle) {
            System.err.println("Error in DbThreadIterator:constructor()-" + sqle);
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
    }

    protected DbThreadIterator(ForumThread thread, int startIndex, int numResults) {
        this.thread = thread;

        int[] tempMessages = new int[numResults];
        //It's very possible that there might not be as many messages to get
        //as we requested. Therefore, we keep track of how many messages we
        //get by keeping a messageCount.
        int messageCount = 0;

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(GET_MESSAGES);
            pstmt.setInt(1, thread.getID());
            ResultSet rs = pstmt.executeQuery();
            //Move to start of index
            for (int i = 0; i < startIndex; i++) {
                rs.next();
            }
            //Now read in desired number of results
            for (int i = 0; i < numResults; i++) {
                if (rs.next()) {
                    tempMessages[messageCount] = rs.getInt("messageID");
                    messageCount++;
                } else {
                    break;
                }
            }
        } catch (SQLException sqle) {
            System.err.println("Error in DbThreadIterator:constructor()-" + sqle);
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
        messages = new int[messageCount];
        for (int i = 0; i < messageCount; i++) {
            messages[i] = tempMessages[i];
        }
    }

    /**
     * Returns true if there is a next message in the list.
     */
    public boolean hasNext() {
        return (currentIndex + 1 < messages.length);
    }

    /**
     * Returns true if there is a previous message in the list.
     */
    public boolean hasPrevious() {
        return (currentIndex > 0);
    }

    /**
     * Returns the next message.
     */
    public Object next() throws java.util.NoSuchElementException {
        ForumMessage message = null;
        currentIndex++;
        if (currentIndex >= messages.length) {
            throw new java.util.NoSuchElementException();
        }
        try {
            message = thread.getMessage(messages[currentIndex]);
        } catch (ForumMessageNotFoundException mnfe) {
            System.err.println(mnfe);
            throw new java.util.NoSuchElementException();
        }
        return message;
    }

    public int nextIndex() {
        return currentIndex + 1;
    }

    /**
     * Returns the previous message.
     */
    public Object previous() throws java.util.NoSuchElementException {
        ForumMessage message = null;
        currentIndex--;
        if (currentIndex < 0) {
            currentIndex++;
            throw new java.util.NoSuchElementException();
        }
        try {
            message = thread.getMessage(messages[currentIndex]);
        } catch (ForumMessageNotFoundException mnfe) {
            System.err.println(mnfe);
            throw new java.util.NoSuchElementException();
        }
        return message;
    }

    public int previousIndex() {
        return currentIndex - 1;
    }

    /**
     * Not supported for security reasons. Use the deleteMessage method in the
     * ForumThread class instead.
     *
     * @see ForumThread#deleteMessage(ForumMessage)
     */
    public void add(Object o) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }

    /**
     * Not supported for security reasons. Use the deleteMessage method in the
     * ForumThread class instead.
     *
     * @see ForumThread#deleteMessage(ForumMessage)
     */
    public void remove() throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }

    /**
     * Not supported for security reasons. Use the methods in the
     * ForumThread class instead.
     *
     * @see ForumThread
     */
    public void set(Object o) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }
}
