package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.io.IOException;

public class ResultSetItemTag extends BodyTagSupport {

    private ResultSetContainer.ResultSetRow row;
    private String name;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int doStartTag() throws JspException {
        if (row!=null) {
            try {
                pageContext.getOut().print(row.getItem(name).toString());
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
        }
        return SKIP_BODY;
    }

    public void release() {
        row = null;
        name = null;
    }

}

