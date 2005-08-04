/*
 * Created on Apr 19, 2005
 */
package com.topcoder.utilities.forumConvert;

import java.util.ArrayList;

/**
 * @author mtong
 */
public class ForumForum {
	private int forumID;
	private String name;
	private String description;
	private String modifiedDate;
	private String creationDate;
	private int userID;
	private ArrayList threadList;
	
	public ForumForum(int forumID, String name, String description, String modifiedDate,
			String creationDate, int userID) 
	{
		this.forumID = forumID;
		this.name = name;
		this.description = description;
		this.modifiedDate = modifiedDate;
		this.creationDate = creationDate;
		this.userID = userID;
		this.threadList = new ArrayList();
	}
	
	public int getForumID() {
		return forumID;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
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
	
	public void addThread(ForumThread thread) {
		this.threadList.add(thread);
	}
	
	public String toXML() {
		StringBuffer sb = new StringBuffer();
		sb.append("<Forum id=\"");
		sb.append(forumID);
		sb.append("\">\n");
		sb.append("<Name>");
		sb.append(name);
		sb.append("</Name>\n");
		sb.append("<Description>");
		sb.append(description);
		sb.append("</Description>\n");
		sb.append("<CreationDate>");
		sb.append(creationDate);
		sb.append(" EST");
		sb.append("</CreationDate>\n");
		sb.append("<ModifiedDate>");
		sb.append(modifiedDate);
		sb.append(" EST");
		sb.append("</ModifiedDate>\n");
		
		if (threadList.size() > 0) {
			sb.append("<ThreadList>\n");
			for (int i=0; i<threadList.size(); i++) {
				ForumThread ft = (ForumThread)threadList.get(i);
				sb.append(ft.toXML());
			}
			sb.append("</ThreadList>\n");
		}
		
		sb.append("</Forum>\n");
		
		return sb.toString();
	}
	
	public void writeXML(java.io.FileWriter writer) throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<Forum id=\"");
		sb.append(forumID);
		sb.append("\">\n");
		sb.append("<Name>");
		sb.append(name);
		sb.append("</Name>\n");
		sb.append("<Description>");
		sb.append(description);
		sb.append("</Description>\n");
		sb.append("<CreationDate>");
		sb.append(creationDate);
		sb.append(" EST");
		sb.append("</CreationDate>\n");
		sb.append("<ModifiedDate>");
		sb.append(modifiedDate);
		sb.append(" EST");
		sb.append("</ModifiedDate>\n");
		writer.write(sb.toString());
		
		if (threadList.size() > 0) {
			writer.write("<ThreadList>\n");
			for (int i=0; i<threadList.size(); i++) {
				ForumThread ft = (ForumThread)threadList.get(i);
				writer.write(ft.toXML());
				writer.flush();
			}
			writer.write("</ThreadList>\n");
		}
		
		writer.write("</Forum>\n");
	}
}
