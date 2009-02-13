package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class ResultSetItemTag extends FormatTag {

    private ResultSetContainer.ResultSetRow row;
    private String name;

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int doStartTag() throws JspException {
        setObject(row.getItem(name).getResultData());
        return super.doStartTag();
    }

}

