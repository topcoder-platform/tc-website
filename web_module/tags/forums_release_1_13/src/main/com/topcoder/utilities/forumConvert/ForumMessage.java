/*
 * Created on Apr 19, 2005
 */
package com.topcoder.utilities.forumConvert;

import java.util.ArrayList;

/**
 * @author mtong
 */
public class ForumMessage {
	private int messageID;
	private int threadID;
	private String subject;
	private String userName;
	private String body;
	private String modifiedDate;
	private String creationDate;
	private int parentMessageID;
	private ArrayList messageList;
	
	public ForumMessage(int messageID, int threadID, String subject, String userName,
			String body, String modifiedDate, String creationDate, int parentMessageID)
	{
		this.messageID = messageID;
		this.threadID = threadID;
		this.subject = subject;
		this.userName = userName;
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
	public String getUserName() {
		return userName;
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
		if (subject.trim().equals("")) {
			sb.append("(no subject)");
		} else {
			sb.append(subject);
		}
		sb.append("</Subject>\n");
		sb.append("<Body>");
		sb.append(body);
		sb.append("</Body>\n");
		sb.append("<Username>");
		sb.append(userName);
		sb.append("</Username>\n");
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
