package com.topcoder.web.hs.view.tag;

import com.topcoder.web.hs.model.ListPairBean;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class RegistrationValue extends TagSupport {

    private Object value = null;

    private List list = null;

    public void setValue(Object _value) {
        value = _value;
    }

    public void setList(List _list) {
        list = _list;
    }

    public int doStartTag() throws JspException {
        return (Tag.SKIP_BODY);
    }

    public int doEndTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.write(getText());
        } catch (IOException _ioe) {
            _ioe.printStackTrace();
            throw(new JspException(_ioe.getMessage()));
        }
        return (Tag.EVAL_PAGE);
    }

    String getText() {
        return (getText(value, list));
    }

    String getText(Object _value, List _list) {
        if (_value == null) {
            return ("");
        }
        for (Iterator iterator = _list.iterator(); iterator.hasNext();) {
            ListPairBean lpb = (ListPairBean) iterator.next();
            if (_value.equals(lpb.getValue())) {
                return (lpb.getText().toString());
            }
        }
        return ("");
    }

}

;
