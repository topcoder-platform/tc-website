package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.common.tag.SelectTag;

import javax.servlet.jsp.JspException;
import java.util.ArrayList;
import java.util.List;

public class BooleanSelect extends SelectTag {

    private List list;

    public BooleanSelect() {
        super();
        list = new ArrayList();
        list.add("true");
        list.add("false");
    }

    protected String getOptionValue(Object o) {
        return o.toString();
    }

    protected String getOptionText(Object o) {
        return o.toString();
    }

    protected List getSelectOptions() throws JspException {
        return list;
    }
}

