package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.query.bean.Task;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class ErrorTag extends TagSupport  {

    private Task task;
    private String key;

    public void setTask(Task task) {
        this.task = task;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public int doStartTag() throws JspException {
        try {
            if (task.hasError(key)) {
                pageContext.getOut().print(task.getError(key));
            }
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
}

