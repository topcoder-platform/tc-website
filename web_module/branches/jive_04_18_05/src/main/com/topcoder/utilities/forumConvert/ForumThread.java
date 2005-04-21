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
public class ForumThread {
	private int threadID;
	private int forumID;
	private int rootMessageID;
	private String creationDate;
	private String modifiedDate;
	private ArrayList messageList;
	
	public ForumThread(int threadID, int forumID, int rootMessageID, String creationDate,
			String modifiedDate)
	{
		this.threadID = threadID;
		this.forumID = forumID;
		this.rootMessageID = rootMessageID;
		this.creationDate = creationDate;
		this.modifiedDate = modifiedDate;
	}
	
	public String toXML() {
		StringBuffer sb = new StringBuffer();
		sb.append("Thread id=\"");
		sb.append(threadID);
		sb.append("\">\n");
		sb.append("<CreationDate>");
		sb.append(creationDate);
		sb.append("</CreationDate>\n");
		sb.append("<ModifiedDate>");
		sb.append(modifiedDate);
		sb.append("</ModifiedDate>\n");
		
		/*
		<<Thread id="1">
              <CreationDate>2004/11/23 11:00:04.312 EST</CreationDate>
              <ModifiedDate>2004/11/24 10:10:55.396 EST</ModifiedDate>
        */
		
		return sb.toString();
	}
}
