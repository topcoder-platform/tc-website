package com.topcoder.web.query.servlet.jsp.tag;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class RSCTag extends BodyTagSupport {

    private ResultSetContainer.ResultSetRow row;
    private String colName;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setColName(String name) {
        this.colName = name;
    }

    public void doInitBody() throws JspException {
        pageContext.setAttribute(getId(), row.getItem(colName));
    }

    public int doAfterBody() throws JspException {
        pageContext.setAttribute(getId(), row.getItem(colName));
        return EVAL_BODY_TAG;
    }


    public void release() {
        row = null;
    }

}

