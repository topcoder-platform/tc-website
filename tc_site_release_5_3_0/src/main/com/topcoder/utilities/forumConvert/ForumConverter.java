/*
 * Created on Apr 19, 2005
 */
package com.topcoder.utilities.forumConvert;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.io.BufferedWriter;
import java.io.FileWriter;

import javax.naming.Context;
import javax.naming.InitialContext;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DateUtil;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.RatingHistory;
import com.jivesoftware.forum.*;
import com.jivesoftware.base.*;


/**
 * @author mtong
 *
 * Sends existing forum data to a XML file to be imported by Jive's import function.
 */
public class ForumConverter {
	private final static String XML_HEADER = 
		"<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
		"\n	 <Jive xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"http://www.jivesoftware.com/products/forums/jiveforums.xsd\" xmlversion=\"4.0\" exportDate=\"2005/04/19 15:23:43.219 EDT\">" +
		"\n		  <JivePropertyList>" +
		"\n		    <Property name=\"filter.initialSetup\" value=\"true\" />" +
		"\n		    <Property name=\"filter.global.filterCount\" value=\"5\" />" +
		"\n		    <Property name=\"filter.global.filter3.filterTypes\" value=\"24\" />" +
		"\n		    <Property name=\"jiveURL\" value=\"http://172.16.20.41:8080/jive4\" />" +
		"\n		    <Property name=\"filter.global.filter2.className\" value=\"com.jivesoftware.base.filter.Emoticon\" />" +
		"\n		    <Property name=\"filter.global.filter2.filterTypes\" value=\"24\" />" +
		"\n		    <Property name=\"cookieKey\" value=\"L3q3G20CSdb2Sau\" />" +
		"\n		    <Property name=\"mail.smtp.host\" value=\"172.16.20.40\" />" +
		"\n		    <Property name=\"filter.global.filter1.filterTypes\" value=\"24\" />" +
		"\n		    <Property name=\"mail.smtp.port\" value=\"25\" />" +
		"\n		    <Property name=\"filter.global.filter0.filterTypes\" value=\"24\" />" +
		"\n		    <Property name=\"filter.global.filter3.className\" value=\"com.jivesoftware.base.filter.URLConverter\" />" +
		"\n		    <Property name=\"skin.default.communityName\" value=\"TopCoder Forums\" />" +
		"\n		    <Property name=\"filter.global.filter0.className\" value=\"com.jivesoftware.base.filter.HTMLFilter\" />" +
		"\n		    <Property name=\"filter.global.filter4.className\" value=\"com.jivesoftware.base.filter.Newline\" />" +
		"\n		    <Property name=\"filter.global.filter1.className\" value=\"com.jivesoftware.base.filter.TextStyle\" />" +
		"\n		    <Property name=\"filter.global.filter4.filterTypes\" value=\"24\" />" +
		"\n		  </JivePropertyList>" +
		"\n		  <UserList>" +
		"\n		  </UserList>" +
		"\n";
	
	private static final DateFormat JIVE_DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
	private static Logger log = Logger.getLogger(ForumConverter.class);
	
	private HashMap map_forum;
	private HashMap map_message;
	private HashMap map_thread;
	
	private ArrayList list_forum;
	private ArrayList list_message;
	private ArrayList list_thread;
	
	public ForumForum getForum(int forumID) {
		return (ForumForum)map_forum.get(new Integer(forumID));
	}
	public ForumMessage getMessage(int messageID) {
		return (ForumMessage)map_message.get(new Integer(messageID));
	}
	public ForumThread getThread(int threadID) {
		return (ForumThread)map_thread.get(new Integer(threadID));
	}
	
	public static void main(String[] args) {
        ForumConverter converter = new ForumConverter();
        try {
            converter.run();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	public void run() throws Exception {
        //InitialContext ctx = TCContext.getInitial();
        //Connection con = DBMS.getConnection();
		
		Class.forName("com.informix.jdbc.IfxDriver");
		String urlStr = "jdbc:informix-sqli://172.16.20.25:1526/informixoltp:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec";
        Connection con = DriverManager.getConnection(urlStr);
		
        // TODO: remove
        //AuthToken authToken = AuthFactory.getAuthToken("admin","bloody1");
        //ForumFactory forumFactory = ForumFactory.getInstance(authToken);        
        
        String q_forum = "select forumid, name, description, modifieddate, creationdate, userid " + 
			" from jiveforum" +
			" order by creationdate";
        String q_message = "select m.messageid, m.threadid, m.subject, u.handle, m.body, " + 
			" m.modifieddate, m.creationdate, t.parentid " +
			" from jivemessage m, user u, OUTER(jivemessagetree t) " +
			" where m.messageid = t.childid " +
			" and m.userid = u.user_id " +
			" order by m.creationdate";
        String q_thread = "select threadid, forumid, rootmessageid, name, creationdate, modifieddate, userid " +
			" from jivethread" +
			" order by creationdate";
			
        PreparedStatement ps_forum = con.prepareStatement(q_forum);
        PreparedStatement ps_message = con.prepareStatement(q_message);
        PreparedStatement ps_thread = con.prepareStatement(q_thread);

        ResultSet rs_forum = null;
        ResultSet rs_message = null;
        ResultSet rs_thread = null;

        map_forum = new HashMap();
        map_message = new HashMap();
        map_thread = new HashMap();
        
        list_forum = new ArrayList();
        list_message = new ArrayList();
        list_thread = new ArrayList();
        
        long elapsedTimeMillis, start;
        float elapsedTimeSec;
        
        try {
        	start = System.currentTimeMillis();
        	
        	System.out.print("Acquiring forum data... ");
        	rs_forum = ps_forum.executeQuery();
        	while (rs_forum.next()) {
        		int forumID = rs_forum.getInt(1);
        		String forumName = rs_forum.getString(2);
        		String forumDesc = rs_forum.getString(3);
        		Long forumModifiedDateMillis = new Long(rs_forum.getString(4));
        		String forumModifiedDate = DateUtil.toString(forumModifiedDateMillis.longValue(), JIVE_DATE_FORMAT);
        		Long forumCreationDateMillis = new Long(rs_forum.getString(5));
        		String forumCreationDate = DateUtil.toString(forumCreationDateMillis.longValue(), JIVE_DATE_FORMAT);
        		int forumUserID = rs_forum.getInt(6);
        		
        		ForumForum forum = new ForumForum(forumID, parse(forumName), parse(forumDesc),
        				forumModifiedDate, forumCreationDate, forumUserID);
        		map_forum.put(new Integer(forumID), forum);
        		list_forum.add(forum);
        	}
        	
        	elapsedTimeMillis = System.currentTimeMillis()-start;
            elapsedTimeSec = elapsedTimeMillis/1000F;
            System.out.println("completed in " + elapsedTimeSec + " seconds");
            start = System.currentTimeMillis();
        	
        	System.out.print("Acquiring message data... ");
        	rs_message = ps_message.executeQuery();
        	while (rs_message.next()) {
        		int messageID = rs_message.getInt(1);
        		int messageThreadID = rs_message.getInt(2);
        		String messageSubject = rs_message.getString(3);
        		String messageUserName = rs_message.getString(4);
        		String messageBody = rs_message.getString(5);
        		Long messageModifiedDateMillis = new Long(rs_message.getString(6));
        		String messageModifiedDate = DateUtil.toString(messageModifiedDateMillis.longValue(), JIVE_DATE_FORMAT);
        		Long messageCreationDateMillis = new Long(rs_message.getString(7));
        		String messageCreationDate = DateUtil.toString(messageCreationDateMillis.longValue(), JIVE_DATE_FORMAT);
        		int messageParentID = rs_message.getInt(8);
        		
        		ForumMessage message = new ForumMessage(messageID, messageThreadID,
        				parse(messageSubject), messageUserName, parse(messageBody), messageModifiedDate,
						messageCreationDate, messageParentID);
        		map_message.put(new Integer(messageID), message);
        		list_message.add(message);
        	}
        	
        	elapsedTimeMillis = System.currentTimeMillis()-start;
            elapsedTimeSec = elapsedTimeMillis/1000F;
            System.out.println("completed in " + elapsedTimeSec + " seconds");
            start = System.currentTimeMillis();
        	
        	System.out.print("Acquiring thread data... ");
        	rs_thread = ps_thread.executeQuery();
        	while (rs_thread.next()) {
        		int threadID = rs_thread.getInt(1);
				int threadForumID = rs_thread.getInt(2);
				int threadRootID = rs_thread.getInt(3);
				String name = rs_thread.getString(4);
        		Long threadModifiedDateMillis = new Long(rs_thread.getString(5));
        		String threadModifiedDate = DateUtil.toString(threadModifiedDateMillis.longValue(), JIVE_DATE_FORMAT);
        		Long threadCreationDateMillis = new Long(rs_thread.getString(6));
        		String threadCreationDate = DateUtil.toString(threadCreationDateMillis.longValue(), JIVE_DATE_FORMAT);
        		int userID = rs_thread.getInt(7);
        		
        		ForumThread thread = new ForumThread(threadID, threadForumID, threadRootID, parse(name),
        				threadModifiedDate, threadCreationDate, userID);
        		map_thread.put(new Integer(threadID), thread);
        		list_thread.add(thread);
        	}
        	
        	elapsedTimeMillis = System.currentTimeMillis()-start;
            elapsedTimeSec = elapsedTimeMillis/1000F;
            System.out.println("completed in " + elapsedTimeSec + " seconds");
            start = System.currentTimeMillis();
            
        } finally {
            close(rs_forum);
            close(rs_message);
            close(rs_thread);
            close(ps_forum);
            close(ps_message);
            close(ps_thread);
            close(con);
            //close(ctx);
        }
        	
        System.out.print("Creating hierarchy... ");
        Iterator it = list_thread.iterator();
        while (it.hasNext()) {
        	ForumThread thread = (ForumThread)it.next();
        	ForumForum forum = (ForumForum)map_forum.get(new Integer(thread.getForumID()));
        	if (forum != null) {
        		forum.addThread(thread);
        	} else {
        		System.out.println("\nERROR: Thread " + thread.getThreadID() + " has no parent forum");
        	}
        	ForumMessage message = (ForumMessage)map_message.get(new Integer(thread.getRootMessageID()));
        	if (message != null) {
        		thread.setRootMessage(message);
        	} else {
        		System.out.println("\nERROR: Thread " + thread.getThreadID() + " has no root message");
        	}
        }
        
        it = list_message.iterator();
        while (it.hasNext()) {
        	ForumMessage message = (ForumMessage)it.next();
        	ForumMessage parentMessage = (ForumMessage)map_message.get(new Integer(message.getParentMessageID()));
        	if (parentMessage != null) {
        		parentMessage.addMessage(message);
        	}
        }
        
        elapsedTimeMillis = System.currentTimeMillis()-start;
        elapsedTimeSec = elapsedTimeMillis/1000F;
        System.out.println("completed in " + elapsedTimeSec + " seconds");
        start = System.currentTimeMillis();
    	
        System.out.print("Writing to file... ");
        FileWriter out = new FileWriter("C:/Documents and Settings/mtong/My Documents/Jive/forum_data.xml");
    	out.write(XML_HEADER);
    	out.write("<ForumList>\n");
    	
    	it = list_forum.iterator();
    	while (it.hasNext()) {
    		ForumForum forum = (ForumForum)it.next();
    		try {
    			//out.write(forum.toXML());
    			forum.writeXML(out);
    			System.out.print("\nForum write succeeded: " + forum.getName());
    		} catch (OutOfMemoryError oe) {
    			System.out.print("\nForum write failed: " + forum.getName());
    		} 
    	}
    	System.out.println();
    	
    	out.write("</ForumList>\n");
    	out.write("</Jive>");
    	
    	elapsedTimeMillis = System.currentTimeMillis()-start;
        elapsedTimeSec = elapsedTimeMillis/1000F;
        System.out.println("completed in " + elapsedTimeSec + " seconds");
        out.close();
	}
	
	protected void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                log.error("FAILED to close ResultSet.");
                ignore.printStackTrace();
            }
        }
    }

    protected void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Connection.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                log.error("FAILED to close Context.");
                ignore.printStackTrace();
            }
        }

    }

    protected void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                log.error("FAILED to close PreparedStatement.");
                ignore.printStackTrace();
            }
        }

    }
    
    private String parse(String s) {
    	if (s == null) return null;
		s = s.replaceAll("<[pP][rR][eE]>", "[code]");
		s = s.replaceAll("</[pP][rR][eE]>", "[/code]");
		s = s.replaceAll("&", "&amp;");
		s = s.replaceAll("<", "&lt;"); 
		s = s.replaceAll(">", "&gt;");
		s = s.replaceAll("\"", "&quot;");
		s = s.replaceAll("’", "'");
		return s;
    }
}
