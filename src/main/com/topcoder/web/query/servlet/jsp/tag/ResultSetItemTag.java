package com.topcoder.web.query.servlet.jsp.tag;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class ResultSetItemTag extends BodyTagSupport {

    private ResultSetContainer.ResultSetRow row;
    private String name;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void doInitBody() throws JspException {
        pageContext.setAttribute(getId(), row.getItem(name));
    }

    public int doAfterBody() throws JspException {
        pageContext.setAttribute(getId(), row.getItem(name));
        return EVAL_BODY_TAG;
    }

    public void release() {
        row = null;
    }

}

