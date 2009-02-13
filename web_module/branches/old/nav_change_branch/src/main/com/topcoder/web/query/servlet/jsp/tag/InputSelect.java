package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.query.common.InputBean;

import javax.servlet.jsp.JspException;
import java.util.List;


public class InputSelect extends Select {

    private List list;

    public InputSelect() {
        super();
    }

    public void setList(List list) {
        this.list = list;
    }

    String getOptionValue(Object o) {
        return ""+((InputBean)o).getInputId();
    }

    String getOptionText(Object o) {
        return ((InputBean)o).getInputCode() + " - " +
               ((InputBean)o).getInputDesc();
    }

    List getSelectOptions() throws JspException {
        return list;
    }
}

