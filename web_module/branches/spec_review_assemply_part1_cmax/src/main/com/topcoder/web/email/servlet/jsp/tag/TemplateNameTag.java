package com.topcoder.web.email.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.bean.TemplateTask;

import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;

/**
 * Custom tag to retrieve the name of a template, given its id
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */

public class TemplateNameTag
        extends BodyTagSupport {
    private static Logger log = Logger.getLogger(TemplateNameTag.class);
    // the template id
    protected int templateId;

    public void setTemplateId(String templateId) {
        try {
            this.templateId = Integer.parseInt(templateId);
        } catch (NumberFormatException e) {
            this.templateId = 0;
        }
    }


    public int doStartTag()
            throws JspException {
        return EVAL_BODY_BUFFERED;
    }

    public void doInitBody()
            throws JspException {
        try {
            pageContext.setAttribute(getId(), TemplateTask.getTemplateName(templateId));
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
