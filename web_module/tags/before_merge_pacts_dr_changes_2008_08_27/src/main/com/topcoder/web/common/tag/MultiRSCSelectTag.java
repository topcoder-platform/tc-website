package com.topcoder.web.common.tag;


import javax.servlet.jsp.JspException;
import java.util.Set;

/**
 * @author lars
 * This is a hacked version of RSCSelectTag that should allow multiple
 * items to be selected by default.
 */
public class MultiRSCSelectTag extends RSCSelectTag {
    Set selected;
    public void setSelected(Set s){
        selected = s;
    }
    protected String getOptionValue(Object o) {
        String ret = super.getOptionValue(o);
        if(selected != null && selected.contains(ret)){
            setSelectedValue(ret);
        }
        return ret;
    }
}
