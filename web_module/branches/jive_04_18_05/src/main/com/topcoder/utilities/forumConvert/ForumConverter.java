/*
 * Created on Apr 19, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.utilities.forumConvert;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.io.BufferedWriter;
import java.io.FileWriter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DateUtil;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.RatingHistory;
import com.jivesoftware.forum.*;
import com.jivesoftware.base.*;

// import jive

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
		"\n		  </JivePropertyList>"+
		"\n		  <UserList>"+
		"\n		  </UserList>";
	
	private static Logger log = Logger.getLogger(ForumConverter.class);
	
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
        Connection con = DBMS.getConnection();
        
        // TODO: remove
        //AuthToken authToken = AuthFactory.getAuthToken("admin","bloody1");
        //ForumFactory forumFactory = ForumFactory.getInstance(authToken);        
        
        // remove existing forums, messages, threads
        // repopulate them
        
        String q_forum = "select forumid, name, description, modifieddate, creationdate, userid " + 
			" from jiveforum";
        String q_message = "select m.messageid, m.threadid, m.subject, m.userid, m.body, " + 
			" m.modifieddate, m.creationdate, t.parentid " +
			" from jivemessage m, OUTER(jivemessagetree t) " +
			" where m.messageid = t.childid";
        String q_thread = "select threadid, forumid, rootmessageid, name, creationdate, modifieddate, userid " +
			" from jivethread";	
        
        PreparedStatement ps_forum = con.prepareStatement(q_forum);
        PreparedStatement ps_message = con.prepareStatement(q_message);
        PreparedStatement ps_thread = con.prepareStatement(q_thread);

        ResultSet rs_forum = null;
        ResultSet rs_message = null;
        ResultSet rs_thread = null;

        HashMap map_forum = new HashMap();
        HashMap map_message = new HashMap();
        HashMap map_thread = new HashMap();
        try {
        	
        	rs_forum = ps_forum.executeQuery();
        	while (rs_forum.next()) {
        		int forumID = rs_forum.getInt(1);
        		String forumName = rs_forum.getString(2);
        		String forumDesc = rs_forum.getString(3);
        		Long forumModifiedDateMillis = new Long(rs_forum.getString(4));
        		String forumModifiedDate = DateUtil.toString(forumModifiedDateMillis.longValue());
        		Long forumCreationDateMillis = new Long(rs_forum.getString(5));
        		String forumCreationDate = DateUtil.toString(forumCreationDateMillis.longValue());
        		int forumUserID = rs_forum.getInt(6);
        		
        		ForumForum forum = new ForumForum(forumID, forumName, forumDesc,
        				forumModifiedDate, forumCreationDate, forumUserID);
        		map_forum.put(new Integer(forumID), forum);
        	}
        	
        	rs_message = ps_message.executeQuery();
        	while (rs_message.next()) {
        		int messageID = rs_message.getInt(1);
        		int messageThreadID = rs_message.getInt(2);
        		String messageSubject = rs_message.getString(3);
        		int messageUserID = rs_message.getInt(4);
        		String messageBody = rs_message.getString(5);
        		Long messageModifiedDateMillis = new Long(rs_message.getString(6));
        		String messageModifiedDate = DateUtil.toString(messageModifiedDateMillis.longValue());
        		Long messageCreationDateMillis = new Long(rs_message.getString(7));
        		String messageCreationDate = DateUtil.toString(messageCreationDateMillis.longValue());
        		int messageParentID = rs_message.getInt(8);
        		
        		ForumMessage message = new ForumMessage(messageID, messageThreadID,
        				messageSubject, messageUserID, messageBody, messageModifiedDate,
						messageCreationDate, messageParentID);
        		map_message.put(new Integer(messageID), message);
        	}
        	
        	rs_thread = ps_thread.executeQuery();
        	while (rs_thread.next()) {
        		int threadID = rs_thread.getInt(1);
				int threadForumID = rs_thread.getInt(2);
				int threadRootID = rs_thread.getInt(3);
        		Long threadModifiedDateMillis = new Long(rs_thread.getString(4));
        		String threadModifiedDate = DateUtil.toString(threadModifiedDateMillis.longValue());
        		Long threadCreationDateMillis = new Long(rs_thread.getString(5));
        		String threadCreationDate = DateUtil.toString(threadCreationDateMillis.longValue());
        		
        		ForumThread thread = new ForumThread(threadID, threadForumID, threadRootID,
        				threadModifiedDate, threadCreationDate);
        		map_thread.put(new Integer(threadID), thread);
        	}
        	
        	BufferedWriter out = new BufferedWriter(new FileWriter("C:/Documents and Settings/mtong/Desktop/forum_data.xml"));
        	out.write(XML_HEADER);
        	out.write("<ForumList>\n");
        	
        	Iterator it = map_forum.values().iterator();
        	while (it.hasNext()) {
        		ForumForum forum = (ForumForum)it.next();
        		out.write(forum.toXML());
        	}
        	
        	out.write("</ForumList>\n");
        	out.write("</Jive>");

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
}
