package com.topcoder.web.common.tag;

import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.JspException;

/**
 * User: dok
 * Date: Dec 18, 2004
 * Time: 12:59:20 PM
 */
public class UseBeanTag extends BodyTagSupport {
    private static final String DEFAULT_TYPE = "java.lang.String";
    private static final int DEFAULT_SCOPE = PageContext.PAGE_SCOPE;

    private String clazz = DEFAULT_TYPE;
    private int scope = DEFAULT_SCOPE;
    private String id = null;
    private String name = null;

    public void setClass(String clazz) {
        this.clazz = clazz;
    }

    public void setScope(String scope) {
        if (scope.equalsIgnoreCase("REQUEST")) {
            this.scope = PageContext.REQUEST_SCOPE;
        } else if (scope.equalsIgnoreCase("PAGE")) {
            this.scope = PageContext.PAGE_SCOPE;
        } else if (scope.equalsIgnoreCase("SESSION")) {
            this.scope = PageContext.SESSION_SCOPE;
        } else if (scope.equalsIgnoreCase("APPLICATION")) {
            this.scope = PageContext.APPLICATION_SCOPE;
        }
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int doEndTag() throws JspException {
        pageContext.setAttribute(id, pageContext.getAttribute(name), scope);

        this.clazz= DEFAULT_TYPE;
        this.scope = DEFAULT_SCOPE;
        this.name = null;
        this.id = null;
        return super.doEndTag();
    }


}
