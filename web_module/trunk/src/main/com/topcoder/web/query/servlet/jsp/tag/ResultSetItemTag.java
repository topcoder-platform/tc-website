package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.io.IOException;

public class ResultSetItemTag extends TagSupport  {

    private static Logger log = Logger.getLogger(ResultSetItemTag.class);
    private ResultSetContainer.ResultSetRow row;
    private String name;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int doStartTag() throws JspException {
        try {
            pageContext.getOut().print(row.getItem(name).toString());
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }

    public void release() {
        row = null;
        name = null;
    }

}

