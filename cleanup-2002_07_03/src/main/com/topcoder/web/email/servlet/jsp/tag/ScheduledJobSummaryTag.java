package com.topcoder.web.email.servlet.jsp.tag;

import java.util.*;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.web.email.servlet.*;
import com.topcoder.web.email.bean.*;

/**
 * Custom tag to retrieve a job summary, given a job id
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class ScheduledJobSummaryTag
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
        try {
            pageContext.setAttribute(getId(), ScheduledJobTask.getJobSummary(jobId));
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
