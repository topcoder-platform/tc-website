package com.topcoder.web.email.bean;

import com.topcoder.web.email.servlet.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Home.java
 *
 * Description: Task bean to return to the main menu
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class Home implements Task
{
	public TaskRouter perform(HttpServlet servlet,
				HttpServletRequest request,
				HttpServletResponse response)
		throws IOException, ServletException
	{
		// redirect to the main menu
		return new TaskRouter(EmailConstants.HOME_PAGE);
	}
}

