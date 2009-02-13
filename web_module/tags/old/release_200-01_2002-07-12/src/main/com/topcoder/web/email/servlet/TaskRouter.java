package com.topcoder.web.email.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.log4j.Category;

/**
 * TaskRouter.java
 *
 * Description: Routes to a specified URL.
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class TaskRouter
{
	static Category trace = Category.getInstance(TaskRouter.class);

	// the URL to which this router forwards/redirects
	private final String url;

	private boolean forward;

	/**
	 * Constructor sets the specified URL
	 *
	 * @param url		a String representing the target URL
	 * @param forward	if true, forwards, else, redirects
	 */

	public TaskRouter(String url, boolean forward)
	{
		this.url = url;
		this.forward = forward;
	}

	public TaskRouter(String url)
	{
		this(url, true);
	}


	/**
	 * This method forwards/redirects to the URL.
	 *
	 * @param HttpServlet			the servlet object
	 * @param HttpServletRequest	the servlet request object
	 * @param HttpServletResponse	the servlet response object
	 *
	 * @throws IOException
	 * @throws ServletException
	 */

	public void route(HttpServlet servlet,
			HttpServletRequest request,
			HttpServletResponse response)
		throws ServletException, IOException
	{
		if (forward) {
			//response.setHeader("Cache-Control","no-store");
			//response.setHeader("Pragma","no-cache");
			//response.setDateHeader ("Expires", 0);
			trace.debug("Forwarding to url: " + url);
			servlet.getServletContext().getRequestDispatcher(
				response.encodeURL(url)
			).forward(request, response);
		} else {
			trace.debug("Redirecting to url: " + url);
			response.sendRedirect(response.encodeRedirectURL(url));
		}
	}
}

