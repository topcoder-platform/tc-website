package com.topcoder.web.common.tag;

import java.util.HashMap;
import javax.servlet.jsp.tagext.TagSupport;

public abstract class BaseTag extends TagSupport {
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

    protected Object getErrorMessage() {
        try {
            HashMap errors = (HashMap)pageContext.getRequest().getAttribute(CONTAINER_NAME_FOR_ERRORS);
            return errors.get(name);
        }
        catch(Exception e) {
            return null;
        }
    }
}
