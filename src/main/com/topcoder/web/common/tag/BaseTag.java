package com.topcoder.web.common.tag;

import com.topcoder.web.common.BaseProcessor;

import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.JspException;
import java.util.HashMap;


/**
 *
 * My comments/description/notes go here
 *
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public abstract class BaseTag extends BodyTagSupport {

    protected String name;

    /**
     * Sets the name.
     * @param name The name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    protected Object getDefaultValue() {
        try {
            HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
            return defaults.get(name);
        } catch (Exception e) {
            return null;
        }
    }

    public int doEndTag()  throws JspException {
        this.name = null;
        init();
        return super.doEndTag();
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    protected abstract void init();



}
