package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class ResultSetItemTag extends FormatTag {

    private ResultSetContainer.ResultSetRow row;
    private ResultSetContainer set;
    private String name;
    private int rowIndex=0;   //default to the first row

    public void setRow(ResultSetContainer.ResultSetRow row) {
        this.row = row;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSet(ResultSetContainer set) {
        this.set = set;
    }

    public void setRowIndex(int rowIndex) {
        this.rowIndex = rowIndex;
    }

    public int doStartTag() throws JspException {
        if (row==null) {
            setObject(set.getItem(rowIndex, name).getResultData());
        } else {
            setObject(row.getItem(name).getResultData());
        }
        return super.doStartTag();
    }

}

