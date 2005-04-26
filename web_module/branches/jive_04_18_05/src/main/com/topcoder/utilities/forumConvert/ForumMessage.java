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
		this.messageList = new ArrayList();
	}
	
	public int getMessageID() {
		return messageID;
	}
	public int getThreadID() {
		return threadID;
	}
	public String getSubject() {
		return subject;
	}
	public int getUserID() {
		return userID;
	}
	public String getBody() {
		return body;
	}
	public String getModifiedDate() {
		return modifiedDate;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public int getParentMessageID() {
		return parentMessageID;
	}
	
	public void addMessage(ForumMessage message) {
		this.messageList.add(message);
	}
	
	public String toXML() {
		StringBuffer sb = new StringBuffer();
		sb.append("<Message id=\"");
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
		sb.append(" EST");
		sb.append("</CreationDate>\n");
		sb.append("<ModifiedDate>");
		sb.append(modifiedDate);
		sb.append(" EST");
		sb.append("</ModifiedDate>\n");
		
		if (messageList.size() > 0) {
			sb.append("<MessageList>\n");
			for (int i=0; i<messageList.size(); i++) {
				ForumMessage fm = (ForumMessage)messageList.get(i);
				sb.append(fm.toXML());
			}
			sb.append("</MessageList>\n");
		}
		
		sb.append("</Message>\n");
		
		return sb.toString();
	}
}
