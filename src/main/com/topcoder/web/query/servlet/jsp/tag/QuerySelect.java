package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.common.tag.SelectTag;
import com.topcoder.web.query.bean.QueryBean;

import javax.servlet.jsp.JspException;
import java.util.List;

public class QuerySelect extends SelectTag {

    private List list;

    public QuerySelect() {
        super();
    }

    public void setList(List list) {
        this.list = list;
    }

    protected String getOptionValue(Object o) {
        return "" + ((QueryBean) o).getQueryId();
    }

    protected String getOptionText(Object o) {
        return ((QueryBean) o).getName();
    }

    protected List getSelectOptions() throws JspException {
        return list;
    }

    protected void init() {
        list=null;
        super.init();
    }


}

