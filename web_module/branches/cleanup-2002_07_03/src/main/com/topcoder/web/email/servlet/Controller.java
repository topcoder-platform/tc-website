package com.topcoder.web.email.servlet;

import com.topcoder.web.email.bean.*;

import org.apache.log4j.Category;
import org.apache.log4j.BasicConfigurator;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Controller.java
 *
 * Description: Controller servlet for the e-mail app.
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class Controller
	extends HttpServlet
{
	// take out the following static block
	static
	{
		BasicConfigurator.configure();
	}

	static Category trace = Category.getInstance(Controller.class);

	// TaskFactory for creating tasks
	private TaskFactory taskFactory;


	/**
	 * Initializes the servlet.
	 *
	 * @throws ServletException
	 */

	public void init()
		throws ServletException
	{
		taskFactory = TaskFactory.getTaskFactory();

		EmailConstants.initialize(getServletConfig());
	}

	/**
	 * This method handles requests by getting the appropropriate task
	 * bean, having that bean perform its task, and then routing to the
	 * resulting page.  Tasks are specified by their class name in the
	 * TASK parameter.
	 *
	 * @param HttpServletRequest	the servlet request object
	 * @param HttpServletResponse	the servlet response object
	 *
	 * @throws ServletException
	 * @throws IOException
	 */

	public void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		try {
			String taskName = request.getParameter(EmailConstants.TASK);
			trace.debug("Requested task: " + taskName);

			// if there's no task parameter, go home
			if (taskName == null) {
				trace.debug("No task parameter - going home");
				taskName = EmailConstants.HOME_TASK;
			}

			String taskClassName = EmailConstants.TASK_PACKAGE + "." + taskName;
			trace.debug("Task bean: " + taskClassName);

			try {
				Task task = taskFactory.getTask(taskClassName, getClass().getClassLoader());

				TaskRouter taskRouter = task.perform(this, request, response);
				taskRouter.route(this, request, response);
			} catch (Exception e) {
				forwardToErrorPage(request, response, e);
			}
		} catch (Exception e) {
			throw new ServletException(e.toString());
		}
	}

	/**
	 * Forwards to the navigation error page.  This method is called when an exception
	 * occurs while instantiating a Task object and routing to the appropriate page.
	 *
	 * @param HttpServletRequest	the servlet request object
	 * @param HttpServletResponse	the servlet response object
	 *
	 * @throws ServletException
	 * @throws IOException
	 */

	private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
					Throwable exception)
		throws ServletException, IOException
	{
		trace.error("Controller error - forwarding to error page", exception);
		request.setAttribute("Exception", exception);
		getServletContext().getRequestDispatcher(
			response.encodeURL(EmailConstants.ERROR_PAGE)
		).forward(request, response);
	}
}
