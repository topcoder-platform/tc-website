package com.topcoder.web.email.bean;

import com.topcoder.web.email.servlet.TaskRouter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Task.java
 *
 * Description: Interface for defining tasks.
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public interface Task
{
	/**
	 * This method will perform an appropriate task and return a
	 * TaskRouter object that tells the servlet where to go next.
	 *
	 * @param HttpServlet		the servlet object
	 * @param HttpServletRequest	the servlet request object
	 * @param HttpServletResponse	the servlet response object
	 *
	 * @return TaskRouter	the TaskRouter object leading to the next page
	 *
	 * @throws IOException
	 * @throws ServletException
	 */

	public abstract TaskRouter perform(HttpServlet servlet,
				HttpServletRequest request,
				HttpServletResponse response)
		throws IOException, ServletException;

}

