package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.query.common.DatabaseBean;

import javax.servlet.jsp.JspException;
import java.util.List;

public class DBSelect extends Select {

    private List list;

    public DBSelect() {
        super();
    }

    public void setList(List list) {
        this.list = list;
    }

    String getOptionValue(Object o) {
        return ((DatabaseBean)o).getValue();
    }

    String getOptionText(Object o) {
        return ((DatabaseBean)o).getDisplayName();
    }

    List getSelectOptions() throws JspException {
        return list;
    }
}
