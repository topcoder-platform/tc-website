package com.topcoder.web.common.tag;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.jsp.tagext.BodyTagSupport;


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
	public static final String CONTAINER_NAME_FOR_ERRORS = "form-errors";
    public static final String CONTAINER_NAME_FOR_DEFAULTS = "form-defaults";
	
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
    		HashMap defaults = (HashMap)pageContext.getRequest().getAttribute(CONTAINER_NAME_FOR_DEFAULTS);
    		return defaults.get(name);
        }
        catch(Exception e) {
            return null;
        }
	}

    protected Iterator getErrIterator() {
        try {
            HashMap errors = (HashMap)pageContext.getRequest().getAttribute(CONTAINER_NAME_FOR_ERRORS);
            return ((Collection)errors.get(name)).iterator();
        }
        catch(Exception e) {
            return null;
        }
    }
}
