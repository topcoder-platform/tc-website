package com.topcoder.web.query.servlet.jsp.tag;

import javax.servlet.jsp.JspException;
import java.util.ArrayList;
import java.util.List;

public class BooleanSelect extends Select {

    private List list;

    public BooleanSelect() {
        super();
        list = new ArrayList();
        list.add("true");
        list.add("false");
    }

    String getOptionValue(Object o) {
        return o.toString();
    }

    String getOptionText(Object o) {
        return o.toString();
    }

    List getSelectOptions() throws JspException {
        return list;
    }
}

