package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.query.bean.QueryBean;

import javax.servlet.jsp.JspException;
import java.util.List;

public class QuerySelect extends Select {

    private List list;

    public QuerySelect() {
        super();
    }

    public void setList(List list) {
        this.list = list;
    }

    String getOptionValue(Object o) {
        return ""+((QueryBean)o).getQueryId();
    }

    String getOptionText(Object o) {
        return ((QueryBean)o).getName();
    }

    List getSelectOptions() throws JspException {
        return list;
    }

}

