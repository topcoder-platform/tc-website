package com.topcoder.web.email.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.bean.ScheduledJobTask;

import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;

/**
 * Custom tag to retrieve a job summary, given a job id
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class ScheduledJobSummaryTag
        extends BodyTagSupport {
    private static Logger log = Logger.getLogger(ScheduledJobSummaryTag.class);

    // the job id
    protected int jobId;

    public void setJobId(String jobId) {
        try {
            this.jobId = Integer.parseInt(jobId);
        } catch (NumberFormatException e) {
            this.jobId = 0;
        }
    }


    public int doStartTag()
            throws JspException {
        return EVAL_BODY_BUFFERED;
    }

    public void doInitBody()
            throws JspException {
        try {
            pageContext.setAttribute(getId(), ScheduledJobTask.getJobSummary(jobId));
        } catch (ServletException e) {
            throw new JspException(e.toString());
        }
    }

    public int doAfterBody()
            throws JspException {
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
