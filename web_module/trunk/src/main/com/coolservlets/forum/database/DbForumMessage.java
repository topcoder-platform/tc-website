/**
 * DbForumMessage.java
 * August 27, 2000
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
import java.sql.*;
import java.net.InetAddress;
import java.util.*;
import java.text.SimpleDateFormat;
import com.coolservlets.forum.*;
import com.coolservlets.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
/**
 * Database implementation of the ForumMessage interace.
 */
public final class DbForumMessage implements ForumMessage {
    /** DATABASE QUERIES **/
    private static final String LOAD_PROPERTIES =
        "SELECT name, propValue FROM jiveMessageProp WHERE messageID=?";
    private static final String DELETE_PROPERTIES =
        "DELETE FROM jiveMessageProp WHERE messageID=?";
    private static final String INSERT_PROPERTY =
        "INSERT INTO jiveMessageProp(messageID,name,propValue) VALUES(?,?,?)";
    private static final String LOAD_MESSAGE =
        "SELECT userID, creationDate, modifiedDate, subject, body, threadID FROM " +
        "jiveMessage WHERE messageID=?";
    private static final String INSERT_MESSAGE =
        "INSERT INTO jiveMessage(messageID,creationDate,modifiedDate,userID," +
        "subject,body,approved) VALUES(?,?,?,?,?,?,?)";
    private static final String SAVE_MESSAGE =
        "UPDATE jiveMessage SET userID=?, subject=?, body=?, creationDate=?, modifiedDate=? " +
        "WHERE messageID=?";
    private static final String GET_FORUM_BY_THREAD =
        "SELECT forumID FROM jiveThread where threadID=?";
    private int id = -1;
    private java.util.Date creationDate = new java.util.Date();
    private java.util.Date modifiedDate = new java.util.Date();
    private String subject = "";
    private String body = "";
    private int userID;
    private int threadID;
    private Properties properties;
    private Object propertyLock = new Object();
    private ForumFactory factory;
    private static Logger log = Logger.getLogger(DbForumMessage.class);
    /**
     * Creates a new DbForumMessage object.
     */
    protected DbForumMessage(User user, boolean approved, ForumFactory factory) {
        try {
          this.id = DBMS.getSeqId(DBMS.RTABLE_SEQ);
        } catch (Exception e) {
          e.printStackTrace();
        }
        creationDate = new java.util.Date();
        this.userID = user.getID();
        this.factory = factory;
        insertIntoDb(approved);
        properties = new Properties();
    }
    /**
     * Loads the specified DbForumMessage by its message id.
     */
    protected DbForumMessage(int id, DbForumFactory factory)
            throws ForumMessageNotFoundException
    {
        this.id = id;
        this.factory = factory;
        loadFromDb();
        loadProperties();
    }
    public int getID() {
        return id;
    }
    public java.util.Date getCreationDate() {
        return creationDate;
    }
    public void setCreationDate(java.util.Date creationDate)
            throws UnauthorizedException
    {
        this.creationDate = creationDate;
        saveToDb();
    }
    public java.util.Date getModifiedDate() {
        return modifiedDate;
    }
    public void setModifiedDate(java.util.Date modifiedDate)
            throws UnauthorizedException
    {
        this.modifiedDate = modifiedDate;
        saveToDb();
    }
    public String getSubject() {
        return StringUtils.escapeHTMLTags(subject);
    }
    public void setSubject(String subject) throws UnauthorizedException {
        this.subject = subject;
        //Update modifiedDate to the current time.
        modifiedDate.setTime(System.currentTimeMillis());
        saveToDb();
    }
    public String getBody() {
        return body;
    }
    public void setBody(String body) throws UnauthorizedException {
        this.body = body;
        //Update modifiedDate to the current time.
        modifiedDate.setTime(System.currentTimeMillis());
        saveToDb();
    }
    public User getUser() {
        User user = null;
        try {
            if (userID == -1) {
                user = factory.getProfileManager().getAnonymousUser();
            }
            else {
                user = factory.getProfileManager().getUser(userID);
            }
        }
        catch (UserNotFoundException unfe) {
            unfe.printStackTrace();
        }
        return user;
    }
    public String getProperty(String name) {
        return (String)properties.get(name);
    }
    public void setProperty(String name, String value) {
        properties.put(name, value);
        saveProperties();
    }
    public Enumeration propertyNames() {
        return properties.keys();
    }
    public boolean isAnonymous() {
        return (userID == -1);
    }
    public ForumThread getForumThread() {
        //First, we need a handle on the parent Forum object based
        //on the threadID.
        int forumID = -1;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(GET_FORUM_BY_THREAD);
            ps.setInt(1, threadID);
            rs = ps.executeQuery();
            rs.next();
            forumID = rs.getInt("forumID");
         }
        catch( SQLException sqle ) {
            sqle.printStackTrace();
        }
        finally {
          try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          rs = null;
          ps = null; 
          conn = null; 
        }
        Forum forum = null;
        ForumThread thread = null;
        try {
            forum = factory.getForum(forumID);
            //Now, get the thread
            thread = forum.getThread(threadID);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return thread;
    }
    public boolean hasPermission(int type) {
        return true;
    }
    public String toString() {
        return subject;
    }

    /**
     * Loads message properties from the database.
     */
    private void loadProperties() {
            Properties newProps = new Properties();
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = DBMS.getConnection();
                ps = conn.prepareStatement(LOAD_PROPERTIES);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                while(rs.next()) {
                    String name = rs.getString("name");
                    String value = rs.getString("propValue");
                    newProps.put(name, value);
                }
            }
            catch( SQLException sqle ) {
                System.err.println("Error in DbForumMessage:loadProperties():" + sqle);
                sqle.printStackTrace();
            }
            finally {
                try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
                try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
                try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
                rs = null; 
                ps = null; 
                conn = null; 
            }
        this.properties = newProps;
    }

    /**
     * Saves message properties to the database.
     */
    private void saveProperties() {
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                conn = DBMS.getConnection();
                //Delete all old values.
                ps = conn.prepareStatement(DELETE_PROPERTIES);
                ps.setInt(1, id);
                ps.execute();
                ps.close();
                //Now insert new values.
                ps = conn.prepareStatement(INSERT_PROPERTY);
                Enumeration enum = properties.keys();
                while (enum.hasMoreElements()) {
                    String name = (String)enum.nextElement();
                    String value = (String)properties.get(name);
                    ps.setInt(1, id);
                    ps.setString(2, name);
                    ps.setString(3, value);
                    ps.executeUpdate();
                }
            }
            catch( SQLException sqle ) {
                System.err.println(sqle);
            }
            finally {
                try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
                try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
                ps = null; 
                conn = null; 
            }
    }

    /**
     *  Loads message and user data from the database.
     */
    private void loadFromDb() throws ForumMessageNotFoundException {
        // Based on the id in the object, get the message data from the database.
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(LOAD_MESSAGE);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if( !rs.next() ) { 
                throw new ForumMessageNotFoundException("Message " + id +
                    " could not be loaded from the database.");
            }
            this.userID = rs.getInt("userID");
            this.creationDate =
                new java.util.Date(Long.parseLong(rs.getString("creationDate").trim()));
            this.modifiedDate =
                new java.util.Date(Long.parseLong(rs.getString("modifiedDate").trim()));
            this.subject = rs.getString("subject");
            this.body = DBMS.getTextString(rs, 5); 
            this.threadID = rs.getInt("threadID");
         }
        catch( SQLException sqle ) {
            throw new ForumMessageNotFoundException( "Message of id "
                    + id + " was not found in the database."
            );
        }
        catch (NumberFormatException nfe) {
            System.err.println("WARNING: In DbForumMessage.loadFromDb() -- there " +
                "was an error parsing the dates returned from the database. Ensure " +
                "that they're being stored correctly.");
        }
        catch (Exception e) {
            log.debug("failure getting blob from DB");
            e.printStackTrace();
        }
        finally {
          try { if (rs   != null) rs.close();  } catch (Exception ignore) {log.debug("rs   close problem");}
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          rs = null; 
          ps = null; 
          conn = null; 
        }
    }

    /**
     * Inserts a new record into the database.
     *
     * @param approved indicates if the message is already approved or if it
     *        needs to be moderated.
     */
    private void insertIntoDb(boolean approved) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(INSERT_MESSAGE);
            ps.setInt(1, id);
            ps.setString(2, ""+creationDate.getTime());
            ps.setString(3, ""+modifiedDate.getTime());
            ps.setInt(4, userID);
            ps.setString(5, subject);
            ps.setBytes(6, DBMS.serializeTextString(body));
            ps.setInt(7, approved?1:0);
            ps.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println("Error in DbForumMessage:insertIntoDb()-" + sqle);
            sqle.printStackTrace();
        }
        catch( Exception e) {
            log.debug("failure setting blob in DB");
            e.printStackTrace();
        }
        finally {
          try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
          try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
          ps = null; 
          conn = null; 
        }
    }

    /**
     *  Saves message data to the database.
     */
    private void saveToDb() {               
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(SAVE_MESSAGE);
            ps.setInt(1, userID);
            ps.setString(2, subject);
            ps.setBytes(3, DBMS.serializeTextString(body));
            ps.setString(4, ""+creationDate.getTime());
            ps.setString(5, ""+modifiedDate.getTime());
            ps.setInt(6, id);
            ps.executeUpdate();
        }
        catch( SQLException sqle ) {
            System.err.println( "SQLException in DbForumMessage:saveToDb()- " + sqle );
            sqle.printStackTrace();
        }
        catch( Exception e) {
            log.debug("failure setting blob in DB");
            e.printStackTrace();
        }
        finally {
            try { if (ps   != null) ps.close();  } catch (Exception ignore) {log.debug("ps   close problem");}
            try { if (conn != null) conn.close();} catch (Exception ignore) {log.debug("conn close problem");}
            ps = null; 
            conn = null; 
        }
    }
}
