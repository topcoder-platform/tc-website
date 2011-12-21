/*
 * Created on Apr 19, 2005
 */
package com.topcoder.utilities.forumConvert;

import java.util.ArrayList;

/**
 * @author mtong
 */
public class ForumThread {
	private int threadID;
	private int forumID;
	private int rootMessageID;
	private String name;
	private String creationDate;
	private String modifiedDate;
	private int userID;
	private ForumMessage rootMessage;
	
	public ForumThread(int threadID, int forumID, int rootMessageID, String name, 
			String creationDate, String modifiedDate, int userID)
	{
		this.threadID = threadID;
		this.forumID = forumID;
		this.rootMessageID = rootMessageID;
		this.name = name;
		this.creationDate = creationDate;
		this.modifiedDate = modifiedDate;
		this.userID = userID;
	}
	
	public int getThreadID() {
		return threadID;
	}
	public int getForumID() {
		return forumID;
	}
	public int getRootMessageID() {
		return rootMessageID;
	}
	public String getName() {
		return name;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public String getModifiedDate() {
		return modifiedDate;
	}
	public int getUserID() {
		return userID;
	}
	
	public void setRootMessage(ForumMessage rootMessage) {
		this.rootMessage = rootMessage;
	}
	
	public String toXML() {
		if (rootMessage == null) {
			//System.out.println("\nERROR: Thread " + threadID + " has no root message");
			return "";
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("<Thread id=\"");
		sb.append(threadID);
		sb.append("\">\n");
		sb.append("<CreationDate>");
		sb.append(creationDate);
		sb.append(" EST");
		sb.append("</CreationDate>\n");
		sb.append("<ModifiedDate>");
		sb.append(modifiedDate);
		sb.append(" EST");
		sb.append("</ModifiedDate>\n");
		sb.append(rootMessage.toXML());
		sb.append("</Thread>\n");
		
		return sb.toString();
	}
}
