package com.topcoder.web.query.servlet.jsp.tag;

import com.topcoder.web.common.tag.SelectTag;
import com.topcoder.web.query.bean.InputBean;

import javax.servlet.jsp.JspException;
import java.util.Collection;
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

    protected Collection getSelectOptions() throws JspException {
        return list;
    }

    protected void init() {
        list = null;
        super.init();
    }
}

