package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.query.common.Constants;

import javax.servlet.jsp.JspException;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

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

