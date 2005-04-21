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
	}
	
	public String toXML() {
		StringBuffer sb = new StringBuffer();
		sb.append("Forum id=\"");
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
		sb.append("</CreationDate>\n");
		sb.append("<ModifiedDate>");
		sb.append(modifiedDate);
		sb.append("</ModifiedDate>\n");
		
		/*
		<Forum id="1">
		<Name>Bullpen</Name>
        <Description>Some crazy description</Description>
        <CreationDate>2004/11/23 10:59:05.789 EST</CreationDate>
        <ModifiedDate>2004/11/24 10:10:55.396 EST</ModifiedDate> */
		
		return sb.toString();
	}
}
