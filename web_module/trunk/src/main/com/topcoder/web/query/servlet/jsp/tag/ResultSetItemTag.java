package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

public class ResultSetItemTag extends BodyTagSupport {

    private static Logger log = Logger.getLogger(ResultSetItemTag.class);
    private ResultSetContainer.ResultSetRow row;
    private String name;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void doInitBody() throws JspException {
        log.debug("doInitBody called...");
        pageContext.setAttribute(getId(), row.getItem(name));
    }

    public int doStartTag() throws JspException {
        log.debug("doStartTag called...");
        return (row!=null&&name!=null)?EVAL_BODY_TAG:SKIP_BODY;
    }

    public void release() {
        row = null;
        name = null;
    }

}

