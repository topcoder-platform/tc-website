package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import java.util.Collection;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 20, 2006
 */
public class StringSelectTag extends SelectTag {

    private List list;


    public StringSelectTag() {
        init();
    }

    public void setList(List list) {
        this.list = list;
    }


    protected String getOptionValue(Object o) {
        return o.toString();
    }

    protected String getOptionText(Object o) {
        return o.toString();
    }

    protected Collection getSelectOptions() throws JspException {
        return list;
    }


    protected void init() {
        super.init();
        list = null;
    }

}
