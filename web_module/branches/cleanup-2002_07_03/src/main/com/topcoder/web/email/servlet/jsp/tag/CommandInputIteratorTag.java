package com.topcoder.web.email.servlet.jsp.tag;

import java.util.*;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.web.email.servlet.*;
import com.topcoder.web.email.bean.*;
import org.apache.log4j.Category;

/**
 * Custom tag to iterate through the list of parameter
 * id's/codes/descriptions/values required for a given
 * command id
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */


public class CommandInputIteratorTag
	extends IteratorTag
{
	static Category trace = Category.getInstance(CommandInputIteratorTag.class);

	int commandId;
	Map commandInputMap = null;

	public void setCommandId(String commandId)
	{
		try {
			this.commandId = Integer.parseInt(commandId);
		} catch (NumberFormatException e) {
			this.commandId = 0;
		}
	}

	public void setCommandInputMap(Map commandInputMap)
	{
		this.commandInputMap = commandInputMap;
	}

	public int doStartTag()
		throws JspException
	{
		try {
			Set commandInputSet = StatisticsUtilities.getCommandInputs(commandId);
			// set values (if they exist)
			if (commandInputMap != null) {
				for (Iterator i = commandInputSet.iterator(); i.hasNext(); ) {
					CommandInput commandInput = (CommandInput) i.next();
					String value = (String) commandInputMap.get(commandInput.getId());
					commandInput.setValue(value);
				}
			}

			setCollection(commandInputSet);
		} catch (ServletException e) {
			throw new JspException(e.toString());
		}

		return super.doStartTag();
	}

	public void release()
	{
		commandInputMap = null;
		super.release();
	}


}