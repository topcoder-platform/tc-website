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
 * Custom tag to retrieve the name of a stats query, given its id
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class CommandNameTag
	extends BodyTagSupport
{
	static Category trace = Category.getInstance(CommandNameTag.class);

	// the list id
	protected int commandId;

	public void setCommandId(String commandId)
	{
		try {
			this.commandId = Integer.parseInt(commandId);
		} catch (NumberFormatException e) {
			this.commandId = 0;
		}
	}


	public int doStartTag()
		throws JspException
	{
		return EVAL_BODY_TAG;
	}

	public void doInitBody()
		throws JspException
	{
		try {
			String name = StatisticsUtilities.getCommandName(commandId);

			pageContext.setAttribute(getId(), name);
		} catch (ServletException e) {
			throw new JspException(e.toString());
		}
	}

	public int doAfterBody()
		throws JspException
	{
		try {
			if (bodyContent != null) {
				bodyContent.writeOut(getPreviousOut());
			}
		} catch (IOException e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

}