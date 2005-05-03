/**
 * DbSearchIndexer.java
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

import com.coolservlets.forum.ForumMessage;
import com.coolservlets.forum.ForumMessageNotFoundException;
import com.coolservlets.forum.PropertyManager;
import com.coolservlets.forum.SearchIndexer;
import com.coolservlets.util.StringUtils;
import com.topcoder.shared.util.DBMS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Right now this creates a thread that updates the database with the new
 * words from any messages added in a given amount of time specified by the
 * user with the setter methods of this class
 * Default update rate will be once every two hours.
 * Note: will want to allow updates on a per-message basis as well
 */
public class DbSearchIndexer extends Thread implements SearchIndexer {

    /** DATABASE QUERIES **/
    private static final String INSERT_WORD =
            "INSERT INTO jiveWord(wordID,word) VALUES(?,?)";
    private static final String INSERT_INDEX_RECORD =
            "INSERT INTO jiveMessageWord(messageID, wordID, wordCount, forumID) " +
            "VALUES(?,?,?,?)";
    private static final String DELETE_INDEX1 =
            "DELETE FROM jiveMessageWord";
    private static final String DELETE_INDEX2 =
            "DELETE FROM jiveWord";
    private static final String DELETE_PARTIAL_INDEX =
            "DELETE FROM jiveMessageWord WHERE jiveMessageWord.messageID=?";
    private static final String FIND_WORD_ID =
            "SELECT wordID FROM jiveWord WHERE word=?";
    private static final String MESSAGES_BEFORE_DATE =
            "SELECT messageID FROM jiveMessage WHERE modifiedDate < ?";
    private static final String MESSAGES_BEFORE_DATE_COUNT =
            "SELECT count(messageID) FROM jiveMessage WHERE modifiedDate < ?";
    private static final String MESSAGES_SINCE_DATE =
            "SELECT messageID FROM jiveMessage WHERE modifiedDate > ? " +
            "AND modifiedDate < ?";
    private static final String MESSAGES_SINCE_DATE_COUNT =
            "SELECT count(messageID) FROM jiveMessage WHERE modifiedDate > ? " +
            "AND modifiedDate < ?";

    /**
     * Constant for a MINUTE (in milleseconds)
     */
    private static final long MINUTE = 1000 * 60;
    /**
     * Constant for an HOUR (in milleseconds)
     */
    private static final long HOUR = MINUTE * 60;

    /**
     * Local cache for the word ID's. This cache is reset after every index
     * operation to save space. However, using it during large indexing tasks
     * can yield a huge performance win since we avoid numerous database
     * lookups. However, this cache should be changed to a fixed-size data
     * structure at some point in the future. Otherwise, it's possible that it
     * will grow larger than memory if too large of an indexing task is
     * started.
     */
    private Map wordCache;

    /**
     * Maintains the amount of time that should elapse until the next index.
     */
    private long updateInterval;

    /**
     * Maintains the time that the last index took place.
     */
    private long lastIndexed;

    /**
     * Indicates whether auto-indexing should be on or off. When on, an update
     * will be run at the "updateInterval".
     */
    private boolean autoIndex = true;

    /**
     * ForumFactory so that we can load message objects based on their ID.
     */
    private DbForumFactory factory;

    /**
     * Lock so that only one indexing function can be executed at once. Not
     * locking could impact the database integrity. Therefore, in a cluster of
     * Jive servers all pointed at the same db, only one indexer should be
     * running once.
     */
    private Object indexLock = new Object();

    /**
     * Creates a new DbSearchIndexer. It attempts to load properties for
     * the update interval and when the last index occured from the Jive
     * properties then starts the indexing thread.
     */
    public DbSearchIndexer(DbForumFactory factory) {
        this.factory = factory;
        wordCache = new HashMap();

        //Default to performing updates ever 10 minutes.
        updateInterval = 10 * MINUTE;
        //If the update interval property exists, use that
        String updInterval = PropertyManager.getProperty("DbSearchIndexer.updateInterval");
        try {
            updateInterval = Long.parseLong(updInterval);
        } catch (Exception e) { /* ignore */
        }

        wordCache = new HashMap();
        //Attempt to get the last updated time from the Jive properties
        String lastInd = PropertyManager.getProperty("DbSearchIndexer.lastIndexed");
        try {
            lastIndexed = Long.parseLong(lastInd);
        } catch (Exception e) {
            //Something went wrong. Therefore, set lastIndexed far into the past
            //so that we'll do a full index.
            lastIndexed = 0;
        }
        //Start the indexing thread.
        start();
    }

    public int getHoursUpdateInterval() {
        return (int) (updateInterval / HOUR);
    }

    public int getMinutesUpdateInterval() {
        return (int) ((updateInterval - getHoursUpdateInterval() * HOUR) / MINUTE);
    }

    public void setUpdateInterval(int minutes, int hours) {
        updateInterval = (minutes * MINUTE) + (hours * HOUR);
        //Save it to the properties
        PropertyManager.setProperty("DbSearchIndexer.updateInterval", "" + updateInterval);
    }

    public java.util.Date getLastIndexedDate() {
        return new java.util.Date(lastIndexed);
    }

    public boolean isAutoIndexEnabled() {
        return autoIndex;
    }

    public void setAutoIndexEnabled(boolean value) {
        autoIndex = value;
    }

    public void indexMessage(ForumMessage message) {
        //acquire the index lock so that no other indexing operations
        //are performed.
        //      Connection con = null;
        //        con =  DBMS.getConnection();
        //        indexMessage(message, con);
        //      try {  con.close(); }
        //      catch (Exception e) { e.printStackTrace(); }
        //Clear out word cache until next operation
        //      wordCache.clear();
        //      wordCache = new HashMap();
    }

    public void updateIndex() {
        //acquire the index lock so that no other indexing operations
        //are performed.
        synchronized (indexLock) {
            long now = System.currentTimeMillis();
            updateIndex(lastIndexed, now);
            lastIndexed = now;
            //Save the time as a Jive property.
            PropertyManager.setProperty("DbSearchIndexer.lastIndexed",
                    "" + lastIndexed);
        }
    }

    public void rebuildIndex() {
        //acquire the index lock so that no other indexing operations
        //are performed.
        synchronized (indexLock) {
            long now = System.currentTimeMillis();
            rebuildIndex(now);
            lastIndexed = now;
            //Save the time as a Jive property.
            PropertyManager.setProperty("DbSearchIndexer.lastIndexed",
                    "" + lastIndexed);
        }
    }

    /**
     * Indexing thread logic. It wakes up once a minute to see if any threaded
     * action should take place.
     */
    public void run() {
        while (true) {
            //If auto indexing is on
            if (autoIndex && PropertyManager.getProperty("DbSearchIndexer.indexingOn").equals("true")) {
                long now = System.currentTimeMillis();
                //If we want to re-index everything.
                if (lastIndexed == 0) {
                    synchronized (indexLock) {
                        rebuildIndex(now);
                        lastIndexed = now;
                        //Save the time as a Jive property.
                        PropertyManager.setProperty("DbSearchIndexer.lastIndexed",
                                "" + lastIndexed);
                    }
                }
                //We only want to do an update.
                else {
                    long nextIndex = lastIndexed + updateInterval;
                    if (now > nextIndex) {
                        synchronized (indexLock) {
                            updateIndex(lastIndexed, now);
                            lastIndexed = now;
                            //Save the time as a Jive property.
                            PropertyManager.setProperty("DbSearchIndexer.lastIndexed",
                                    "" + lastIndexed);
                        }
                    }
                }
            }
            //sleep for 1 minute and then check again.
            try {
                this.sleep(60000);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Returns the wordID of the passed-in word. It will check the local word
     * cache for the ID first. If that fails, it will use the connection to
     * look up the ID. The connection is assumed to be open when passed in
     * and will remain open after the method is done executing.
     */
    private int getWordID(String word, Connection con) {
        int wordID = -1;
        //look for word in cache
        if (wordCache.containsKey(word)) {
            wordID = ((Integer) wordCache.get(word)).intValue();
        } else {
            PreparedStatement pstmt = null;
            try {
                pstmt = con.prepareStatement(FIND_WORD_ID);
                pstmt.setString(1, word);
                ResultSet rs = pstmt.executeQuery();
                //word is already in db, save the id to cache and return it
                if (rs.next()) {
                    wordID = rs.getInt(1);
                }
                //word is not in db, insert it then put it in cache
                else {
                    try {
                        pstmt.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    int nextWordID = 0;
                    try {
                        nextWordID = DBMS.getSeqId(DBMS.RTABLE_SEQ);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    pstmt = con.prepareStatement(INSERT_WORD);
                    pstmt.setInt(1, nextWordID);
                    pstmt.setString(2, word);
                    pstmt.executeUpdate();
                    wordCache.put(word, new Integer(nextWordID));
                    wordID = nextWordID;
                }
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            } finally {
                try {
                    pstmt.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return wordID;
    }

    /**
     * Indexes an indivual message. The connection is assumed to be open when
     * passed in and will remain open after the method is done executing.
     */
    protected final void indexMessage(ForumMessage message, Connection con) {
        String[] subjectWords = StringUtils.toLowerCaseWordArray(message.getSubject());
        subjectWords = StringUtils.removeCommonWords(subjectWords);
        String[] bodyWords = StringUtils.toLowerCaseWordArray(message.getBody());
        bodyWords = StringUtils.removeCommonWords(bodyWords);

        Map words = new HashMap(subjectWords.length);
        Map wordCount = new HashMap(subjectWords.length);

        //Loop through all words in subject.
        for (int i = 0; i < subjectWords.length; i++) {
            String currentWord = subjectWords[i];
            boolean exists = (words.get(currentWord) != null);
            //Check if we already have an entry for this word in the cache
            if (exists) {
                //increment the count since we found the word again
                int count = ((Integer) wordCount.get(currentWord)).intValue();
                count += 2; //count words in subject doubly
                wordCount.remove(currentWord);
                wordCount.put(currentWord, new Integer(count));
            } else {
                //first time we've found the word, store it into cache
                int count = 0;
                int wordID = getWordID(currentWord, con);
                words.put(currentWord, new Integer(wordID));
                wordCount.put(currentWord, new Integer(count));
            }
        }
        //Loop through all words in body.
        for (int i = 0; i < bodyWords.length; i++) {
            String currentWord = bodyWords[i];
            boolean exists = (words.get(currentWord) != null);
            if (exists) {
                int count = ((Integer) wordCount.get(currentWord)).intValue();
                count++;
                wordCount.remove(currentWord);
                wordCount.put(currentWord, new Integer(count));
            } else {
                int count = 0;
                int wordID = getWordID(currentWord, con);
                words.put(currentWord, new Integer(wordID));
                wordCount.put(currentWord, new Integer(count));
            }
        }

        //Now add all the index entries into the database.
        PreparedStatement pstmt = null;
        int messageID = message.getID();
        int forumID = message.getForumThread().getForum().getID();
        try {
            pstmt = con.prepareStatement(INSERT_INDEX_RECORD);
            //insert all subject words
            Iterator iter = words.keySet().iterator();
            while (iter.hasNext()) {
                String word = (String) iter.next();
                int tempWordID = ((Integer) words.get(word)).intValue();
                int tempWordCount = ((Integer) wordCount.get(word)).intValue();
                pstmt.setInt(1, messageID);
                pstmt.setInt(2, tempWordID);
                pstmt.setInt(3, tempWordCount);
                pstmt.setInt(4, forumID);
                pstmt.execute();
            }
        } catch (SQLException sqle) {
            System.err.println("Error in DbSearchIndexer:indexMessage-" + sqle);
            sqle.printStackTrace();
        } finally {
            try {
                pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Rebuilds the search index from scratch. It deletes the entire index
     * and word tables and then indexes every message up to the end time.
     */
    protected final void rebuildIndex(long end) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            //For a clean rebuild we delete the whole index table and also
            //the word table.
            con = DBMS.getConnection();
            pstmt = con.prepareStatement(DELETE_INDEX1);
            pstmt.execute();
            pstmt.close();
            pstmt = con.prepareStatement(DELETE_INDEX2);
            pstmt.execute();
            pstmt.close();

            //Now, find all messages that need to inserted
            pstmt = con.prepareStatement(MESSAGES_BEFORE_DATE_COUNT);
            pstmt.setString(1, "" + end);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int messageCount = rs.getInt(1);
            pstmt.close();

            int[] messages = new int[messageCount];
            pstmt = con.prepareStatement(MESSAGES_BEFORE_DATE);
            pstmt.setString(1, "" + end);
            rs = pstmt.executeQuery();
            for (int i = 0; i < messages.length; i++) {
                rs.next();
                messages[i] = rs.getInt("messageID");
            }
            pstmt.close();

            //Finally, index all messages;
            for (int i = 0; i < messages.length; i++) {
                ForumMessage message = factory.getMessage(messages[i]);
                indexMessage(message, con);
            }
        } catch (ForumMessageNotFoundException fmnfe) {
            fmnfe.printStackTrace();
        } catch (SQLException sqle) {
            System.err.println("Error in DbSearchIndexer:updateIndex()-" + sqle);
            sqle.printStackTrace();
        } finally {
            try {
//                  con.commit();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //Clear out word cache until next operation
        wordCache.clear();
        wordCache = new HashMap();
    }

    /**
     * Updates the index. It first deletes any messages in the index between
     * the start and end times, and then adds all messages to the index that
     * are between the start and end times.
     */
    protected final void updateIndex(long start, long end) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBMS.getConnection();
            //For a clean update, we need to make sure that we first delete
            //and index entries that were made since we last updated. This
            //might happen if a process was calling indexMessage() between runs
            //of this method. For this reason, the two types of indexing should
            //not be intermixed. However, we still perform this deletion to be
            //safe.
            pstmt = con.prepareStatement(MESSAGES_SINCE_DATE_COUNT);
            pstmt.setString(1, "" + start);
            pstmt.setString(2, "" + end);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int messageCount = rs.getInt(1);
            int[] messages = new int[messageCount];
            pstmt.close();
            pstmt = con.prepareStatement(MESSAGES_SINCE_DATE);
            pstmt.setString(1, "" + start);
            pstmt.setString(2, "" + end);
            rs = pstmt.executeQuery();
            for (int i = 0; i < messages.length; i++) {
                rs.next();
                messages[i] = rs.getInt("messageID");
            }
            pstmt.close();
            pstmt = con.prepareStatement(DELETE_PARTIAL_INDEX);
            for (int i = 0; i < messages.length; i++) {
                pstmt.setInt(1, messages[i]);
                pstmt.execute();
            }
            pstmt.close();

            //Finally, index all messages;
            for (int i = 0; i < messages.length; i++) {
                ForumMessage message = factory.getMessage(messages[i]);
                indexMessage(message, con);
            }
        } catch (ForumMessageNotFoundException fmnfe) {
            fmnfe.printStackTrace();
        } catch (SQLException sqle) {
            System.err.println("Error in DbSearchIndexer:updateIndex()-" + sqle);
            sqle.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //Clear out word cache until next operation
        wordCache.clear();
        wordCache = new HashMap();
    }
}
