package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.jsp.JspException;

public class ResultSetItemTag extends FormatTag {

    private ResultSetContainer.ResultSetRow row;
    private ResultSetContainer set;
    private String name;
    private int rowIndex = 0;   //default to the first row

    protected String getTimeZone() {
        ResultSetContainer.ResultSetRow row = this.row == null ? set.getRow(rowIndex) : this.row;
        return !row.isValidColumn(super.getTimeZone())?
                super.getTimeZone() : row.getStringItem(super.getTimeZone());
    }

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
        if (row == null) {
            setObject(set.getItem(rowIndex, name).getResultData());
        } else {
            setObject(row.getItem(name).getResultData());
        }
        return super.doStartTag();
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.row = null;
        this.set = null;
        this.name = null;
        this.rowIndex = 0;
        return super.doEndTag();

    }

}

