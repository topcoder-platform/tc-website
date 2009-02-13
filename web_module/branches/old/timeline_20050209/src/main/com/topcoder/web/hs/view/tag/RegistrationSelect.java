package com.topcoder.web.hs.view.tag;

import com.topcoder.web.hs.model.ListPairBean;

import java.util.List;

public class RegistrationSelect extends Select {

    private List list;

    public RegistrationSelect() {
        super();
    }

    public void setList(List _list) {
        list = _list;
    }

    public String getOptionValue(Object _option) {
        Object value = ((ListPairBean) _option).getValue();
        return (value != null ? value.toString() : "");
    }

    public String getOptionText(Object _option) {
        Object text = ((ListPairBean) _option).getText();
        return (text != null ? text.toString() : "");
    }

    public List getOptionsList() {
        return (list);
    }
}

;
