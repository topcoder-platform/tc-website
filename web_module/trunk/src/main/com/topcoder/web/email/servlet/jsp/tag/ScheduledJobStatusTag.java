package com.topcoder.web.email.servlet.jsp.tag;

import java.util.*;
import java.io.*;
import javax.naming.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.web.email.servlet.*;
import com.topcoder.web.email.bean.*;
import com.topcoder.shared.ejb.EmailServices.*;

/**
 * ScheduledJobStatusTag.java
 *
 * Description: Custom tag to retrieve the status of a job, given its id
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class ScheduledJobStatusTag
	extends BodyTagSupport
{
	// the job id
	protected int jobId;

	public void setJobId(String jobId)
	{
		try {
			this.jobId = Integer.parseInt(jobId);
		} catch (NumberFormatException e) {
			this.jobId = 0;
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
/*
		Context context = null;
		try {
			context = new InitialContext();
			EmailJobHome emailJobHome = (EmailJobHome) context.lookup(EmailConstants.SCHEDULEDJOB_EJB);
			EmailJob emailJob = emailJobHome .create();

// retrieve status here...
			pageContext.setAttribute(getId(), status);
		} catch (Exception e) {
			trace.error("Error getting template name", e);
			throw new JspException(e.toString());
		} finally {
			if (context != null) {
				try {
					context.close();
				} catch (NamingException e) {
				}
			}
		}
*/
// testing
		pageContext.setAttribute(getId(), "[job status goes here]");
// end testing
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
