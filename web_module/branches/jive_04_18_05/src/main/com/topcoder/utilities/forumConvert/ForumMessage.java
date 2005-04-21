/*
 * Created on Apr 19, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.utilities.forumConvert;

import java.util.ArrayList;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ForumMessage {
	private int messageID;
	private int threadID;
	private String subject;
	private int userID;
	private String body;
	private String modifiedDate;
	private String creationDate;
	private int parentMessageID;
	private ArrayList messageList;
	
	public ForumMessage(int messageID, int threadID, String subject, int userID,
			String body, String modifiedDate, String creationDate, int parentMessageID)
	{
		this.messageID = messageID;
		this.threadID = threadID;
		this.subject = subject;
		this.userID = userID;
		this.body = body;
		this.modifiedDate = modifiedDate;
		this.creationDate = creationDate;
		this.parentMessageID = parentMessageID;
	}
	
	public String toXML() {
		StringBuffer sb = new StringBuffer();
		sb.append("Message id=\"");
		sb.append(messageID);
		sb.append("\">\n");
		sb.append("<Subject>");
		sb.append(subject);
		sb.append("</Subject>\n");
		sb.append("<Body>");
		sb.append(body);
		sb.append("</Body>\n");
		sb.append("<CreationDate>");
		sb.append(creationDate);
		sb.append("</CreationDate>\n");
		sb.append("<ModifiedDate>");
		sb.append(modifiedDate);
		sb.append("</ModifiedDate>\n");
		
		/*
		<Message id="1">
		<Subject>the beginning</Subject>
                <Body>and then this was a post</Body>
                <CreationDate>2004/11/23 11:00:04.312 EST</CreationDate>
                <ModifiedDate>2004/11/23 11:00:04.312 EST</ModifiedDate>
                <PropertyList>
                  <Property name="IP" value="172.16.1.182"/>
                </PropertyList>
                <MessageList> */
		
		return sb.toString();
	}
}
