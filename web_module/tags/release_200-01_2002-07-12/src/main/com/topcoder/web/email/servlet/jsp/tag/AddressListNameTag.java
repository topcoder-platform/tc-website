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
 * Custom tag to retrieve the name of an address list, given its id
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class AddressListNameTag
	extends BodyTagSupport
{
	static Category trace = Category.getInstance(AddressListNameTag.class);

	// the list id
	protected int listId;

	public void setListId(String listId)
	{
		try {
			this.listId = Integer.parseInt(listId);
		} catch (NumberFormatException e) {
			this.listId = 0;
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
			pageContext.setAttribute(getId(), AddressListTask.getAddressListName(listId));
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