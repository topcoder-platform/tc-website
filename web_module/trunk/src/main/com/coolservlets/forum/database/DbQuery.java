/**
 * DbQuery.java
 * August 29, 2000
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

import java.util.*;
//JDK1.1// import com.sun.java.util.collections.*;
import java.sql.*;

import com.coolservlets.util.*;
import com.coolservlets.forum.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;

/**
 * Database implementation of the Query interface.
 */
public class DbQuery implements Query {

    /**
     * The string entered by the user whose
     * words which will be searched for in the messages stored
     * in the database for the given Forum.
     */
    private String queryString = null;
    private java.util.Date beforeDate = null;
    private java.util.Date afterDate = null;
    private Forum forum;
    private DbForumFactory factory;
    private static Logger log = Logger.getLogger(DbQuery.class);

    public DbQuery(Forum forum, DbForumFactory factory) {
        this.forum = forum;
        this.factory = factory;
    }

    public DbQuery(DbForumFactory factory) {
        this.forum = null;
        this.factory = factory;
    }

    public void setQueryString(String queryString) {
        this.queryString = queryString;
    }

    public String getQueryString() {
        return queryString;
    }

    public void setBeforeDate(java.util.Date beforeDate) {
        this.beforeDate = beforeDate;
    }

    public java.util.Date getBeforeDate() {
        return beforeDate;
    }

    public void setAfterDate(java.util.Date afterDate) {
        this.afterDate = afterDate;
    }

    public java.util.Date getAfterDate() {
        return afterDate;
    }

    public Iterator execute() {
        //We don't know how many results will be returned, so store them
        //in an ArrayList.
        ArrayList tempMessages = new ArrayList();
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(buildQuery(false));
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                tempMessages.add(new Integer(rs.getInt(1)));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
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
        int[] messages = new int[tempMessages.size()];
        for (int i = 0; i < messages.length; i++) {
            messages[i] = ((Integer) tempMessages.get(i)).intValue();
        }
        return new DbQueryIterator(messages, factory);
    }

    public Iterator execute(int startIndex, int numResults) {
        int[] tempMessages = new int[numResults];
        int resultCount = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(buildQuery(false));
            ResultSet rs = pstmt.executeQuery();
            //skip however many we're supposed to
            for (int i = 0; i < startIndex; i++) {
                rs.next();
            }
            //copy number of results into temp buffer
            for (int i = 0; i < numResults; i++) {
                if (rs.next()) {
                    tempMessages[i] = rs.getInt(1);
                    resultCount++;
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
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
        int[] messages = new int[resultCount];
        for (int i = 0; i < messages.length; i++) {
            messages[i] = tempMessages[i];
        }
        return new DbQueryIterator(messages, factory);
    }

    /**
     * Build the SQL query based on the properties that have been set on the
     * Query object.
     */
    private String buildQuery(boolean isCountQuery) {
        StringBuffer query = new StringBuffer();
        String[] keywords = StringUtils.toLowerCaseWordArray(queryString);
        keywords = StringUtils.removeCommonWords(keywords);

        query.append(" SELECT distinct jiveMessageWord.messageID");
        query.append(" FROM jiveMessageWord");
        query.append(" ,jiveMessage");
        if (forum!=null)
            query.append(" ,jiveThread jt");
        if (queryString != null) {
            for (int i = 0; i < keywords.length; i++) {
                query.append(", jiveMessageWord jmw" + i + ", jiveWord jw" + i);
            }
        }
        query.append(" WHERE 1=1");
        if (forum!=null) {
            query.append(" and jt.threadid = jiveMessage.threadid");
            query.append(" and jt.forumid = " + forum.getID());
        }
        query.append(" and jiveMessageWord.messageID=jiveMessage.messageID");
        if (queryString != null) {
            for (int i = 0; i < keywords.length; i++) {
                query.append(" AND  jiveMessageWord.messageID=jmw" + i + ".messageID ");
                query.append(" AND jmw" + i + ".wordID=jw" + i + ".wordID ");
                query.append(" AND jw" + i + ".word='" + keywords[i] + "'");
            }
        }
        //FOR DEBUG
        //log.debug("***** the query *****\n" + query.toString());
        return query.toString();
    }
}
