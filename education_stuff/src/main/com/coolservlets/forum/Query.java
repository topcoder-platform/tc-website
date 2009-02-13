/**
 * Query.java
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
 
package com.coolservlets.forum;

import java.util.*;
//JDK1.1// import com.sun.java.util.collections.*;

/**
 * Encapsulates a search for content in a forum. Use the factory method
 * forum.createQuery() to get a handle on a Query object. From there, set
 * the properties that you're interested in searching on. For example, to
 * search a forum for "Jive is cool", you would use the following code:
 * <p>
 * <pre>
 * Query query = forum.createQuery();
 * query.setQueryString("Jive is cool");
 * Iterator iter = query.execute();
 * while (iter.hasNext()) {
 *     ForumMessage message = (ForumMessage)iter.nextElement();
 *     //print results...
 * }
 * </pre>
 * <p>
 * In the above example, notice that calling the execute method will actually
 * perform the query and return results. All search properties are optional.
 * You can mix and match them depending on what kind of query you'd like to
 * perform.
 */
public interface Query {

    /**
     * Returns the query string for the Query object. The query string is a
     * set of keywords that should be searched on. Currently only "and" keyword
     * searches are supported -- that is, only results that contain every
     * keyword will be returned. In general, keywords should be seperated by
     * spaces. However, other delimiter characters are legal and will be
     * ignored.
     * <p>
     * If the query string has not been set, this method will return null.
     *
     * @return the Query query string.
     */
    public String getQueryString();

    /**
     * Sets the query string for the Query object. The query string is a
     * set of keywords that should be searched on. Currently only "and" keyword
     * searches are supported -- that is, only results that contain every
     * keyword will be returned. In general, keywords should be seperated by
     * spaces. However, other delimiter characters are legal and will be
     * ignored.
     *
     * @param queryString a new query string.
     */
    public void setQueryString(String queryString);

    /**
     * Returns the latest date for search results. For example, the "before date"
     * can be used to search for messages modified more than 1 month ago.
     * <p>
     * If the "before date" has not been set, this method will return null.
     *
     * @return the upder date boundary for search results.
     */
    public Date getBeforeDate();

    /**
     * Sets the latest date for search results. For example, the "before date"
     * can be used to search for messages modified more than 1 month ago.
     *
     * @param beforeDate an upper date boundary for search results.
     */
    public void setBeforeDate(Date beforeDate);

    /**
     * Returns the earliest date for search results. For example, the "after date"
     * can be used to search for messages modified within the last week.
     * <p>
     * If the "after date" has not been set, this method will return null.
     *
     * @return the lower date boundary for search results.
     */
    public Date getAfterDate();

    /**
     * Sets the earliest date for search results. For example, the "after date"
     * can be used to search for messages modified within the last week.
     *
     * @param afterDate a lower date boundary for search results.
     */
    public void setAfterDate(Date afterDate);

    /**
     * Returns the total number of results that query would return.
     *
     * @return the number of results the query would return.
     */
    //public int resultCount();
    //Arg! Problems making this work in MySQL. It will be revisited in the
    //future when we have more time to devote to it.

    /**
     * Executes the query with the set parameters and returns the result
     * as an Iterator. The iterator objects are ForumMessages.
     *
     * @return the result of the query as an Iterator.
     */
    public Iterator execute();

    /**
     * Executes the query with the set parameters and returns the result
     * as an Iterator. The iterator objects are ForumMessages. The
     * startIndex and numResults paramaters are used to look at a certain range
     * of the results. For example, the first twenty results, the second twenty
     * results, etc. This is useful for user interface with multiple pages
     * of results.
     *
     * @param startIndex the index in the results that the iterator will start at.
     * @param numResuls the max number of results that should be returned.
     *
     * @return the result of the query as an Iterator.
     */
    public Iterator execute(int startIndex, int numResults);
}