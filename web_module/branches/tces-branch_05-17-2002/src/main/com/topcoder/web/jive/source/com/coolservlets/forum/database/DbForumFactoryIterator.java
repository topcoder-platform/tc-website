/**
 * DbForumFactoryIterator.java
 * Aug 31, 2000
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
import com.coolservlets.util.*;
import java.util.*;
//JDK1.1// import com.sun.java.util.collections.*;
import java.sql.*;
import com.topcoder.common.*;

/**
 * Iterator for all forums defined for a ForumFactory instance.
 */
public class DbForumFactoryIterator implements Iterator, ListIterator {

    /** DATABASE QUERIES **/
    private static final String GET_FORUMS = "SELECT forumID, modifieddate FROM jiveForum ORDER BY modifiedDate DESC";

    private ForumFactory factory;
    private int [] forums;
    //The current index points to
    int currentIndex = -1;

    protected DbForumFactoryIterator(ForumFactory factory) {
        this.factory = factory;
        ArrayList allForums = new ArrayList();
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(GET_FORUMS);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                allForums.add(new Integer(rs.getInt("forumID")));
            }
        }
        catch( SQLException sqle ) {
            DBMS.printSqlException(true, sqle);
        }
        finally {
            try {  pstmt.close(); }
            catch (Exception e) { e.printStackTrace(); }
            try {  con.close();   }
            catch (Exception e) { e.printStackTrace(); }
        }
        //Now, elimiante all forums the user doesn't have read access to.
        /*for (int i=0; i<allForums.size(); i++) {
            int tempID = ((Integer)allForums.get(i)).intValue();
            try {
                Forum tempForum = factory.getForum(tempID);
            }
            catch (Exception ee) {
                System.err.println(ee);
                allForums.remove(i);
            }
        }
        */
        //Now, put in array
        forums = new int[allForums.size()];
        for (int i=0; i<forums.length; i++) {
            forums[i] = ((Integer)allForums.get(i)).intValue();
        }
    }

    /**
     * Returns true if there are more forums left to iteratate through.
     */
    public boolean hasNext() {
        return (currentIndex+1 < forums.length);
    }

    /**
     * Returns the next Forum the user has READ access for.
     */
    public Object next() throws java.util.NoSuchElementException {
        Forum forum = null;
        currentIndex++;
        if (currentIndex >= forums.length) {
            throw new java.util.NoSuchElementException();
        }
        try {
            forum = factory.getForum(forums[currentIndex]);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return forum;
    }

    /**
     * For security reasons, the remove operation is not supported. Use
     * ForumFactory.deleteForum() instead.
     *
     * @see ForumFactory
     */
    public void remove() {
        throw new UnsupportedOperationException();
    }

    public void add(Object o) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }

    public boolean hasPrevious() {
        return (currentIndex > 0);
    }

    public int nextIndex() {
        return currentIndex+1;
    }

    public Object previous() throws java.util.NoSuchElementException {
        Forum forum = null;
        currentIndex--;
        if (currentIndex < 0) {
            currentIndex++;
            throw new java.util.NoSuchElementException();
        }
        try {
            forum = factory.getForum(forums[currentIndex]);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return forum;
    }

    public int previousIndex() {
        return currentIndex-1;
    }

    public void set(Object o) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }
} 
