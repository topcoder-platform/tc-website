package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.jsp.JspException;
import java.util.List;

/**
 * @author lars
 */
public class ListSelectTag extends SelectTag {
    static public class Option{
        private String v, t;
        private boolean s;
        public Option(String val, String text){
            this(val,text,false);
        }
        public Option(String val, String text, boolean selected){
            v=  val;
            t= text;
            s = selected;
        }
    }
    private List list = null;

    public void setList(List l) {
        list = l;
    }

    /**
     *
     * @see com.topcoder.web.common.tag.SelectTag#getOptionText(java.lang.Object)
     */
    protected String getOptionText(Object o) {
        Option t = (Option) o;
        if(t.s){
            setSelectedText(t.t);
        }
        return t.t;
    }

    /**
     * @see com.topcoder.web.common.tag.SelectTag#getOptionValue(java.lang.Object)
     */
    protected String getOptionValue(Object o) {
        Option t = (Option) o;
        if(t.s){
            setSelectedValue(t.v);
        }
        return t.v;
    }

    /**
     * @see com.topcoder.web.common.tag.SelectTag#getSelectOptions()
     */
    protected List getSelectOptions() throws JspException {
        return list;
    }
}
