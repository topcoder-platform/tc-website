package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.common.tag.SelectTag;
import com.topcoder.web.query.bean.InputBean;

import javax.servlet.jsp.JspException;
import java.util.List;


public class InputSelect extends SelectTag {

    private List list;

    public InputSelect() {
        super();
    }

    public void setList(List list) {
        this.list = list;
    }

    protected String getOptionValue(Object o) {
        return "" + ((InputBean) o).getInputId();
    }

    protected String getOptionText(Object o) {
        return ((InputBean) o).getInputCode() + " - " +
                ((InputBean) o).getInputDesc();
    }

    protected List getSelectOptions() throws JspException {
        return list;
    }
}

