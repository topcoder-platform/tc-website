package com.topcoder.web.common.tag;

import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.JspException;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

/**
 * User: dok
 * Date: Dec 18, 2004
 * Time: 12:59:20 PM
 */
public class UseBeanTag extends BodyTagSupport {
    private static final String DEFAULT_TYPE= "java.lang.String";
    private static final int DEFAULT_SCOPE = PageContext.PAGE_SCOPE;

    private String type= DEFAULT_TYPE;
    private int scope = DEFAULT_SCOPE;
    private String id = null;
    private String name = null;
    private String property = null;

    public void setType(String type) {
        this.type= type;
    }

    public void setProperty(String property) {
        this.property = property;
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
        Object propertyObject = null;
        Object o = pageContext.findAttribute(name);
        if (o==null) {
            throw new JspException("attribute " + name + " not found");
        } else if (property!=null) {
            Method getMethod = null;
            Method[] methods = null;

            try {
                getMethod = o.getClass().getMethod("get" + capitalize(property), null);
            } catch (NoSuchMethodException nsme) {
                methods = o.getClass().getMethods();
                for (int i = 0; i < methods.length; i++) {
                    System.out.println("method: " + methods[i].getName());
                    if (methods[i].getName().equalsIgnoreCase("get" + property) &&
                            methods[i].getParameterTypes().length == 0) {
                        getMethod = methods[i];
                        break;
                    }
                }
            }

            if (getMethod != null) {
                try {
                    propertyObject = getMethod.invoke(o, null);
                } catch (IllegalAccessException iae) {
                    propertyObject = null;
                } catch (InvocationTargetException ite) {
                    propertyObject = null;
                }
            } else {
                throw new JspException("unknown property " + property);
            }

        }
        pageContext.setAttribute(id, propertyObject==null?o:propertyObject, scope);

        this.type= DEFAULT_TYPE;
        this.scope = DEFAULT_SCOPE;
        this.name = null;
        this.id = null;
        this.property = null;
        return super.doEndTag();
    }


    private String capitalize(String in) {
        if (in == null) return null;
        if (in.length() <= 1) return in.toUpperCase();
        return in.substring(0, 1).toUpperCase() + in.substring(1);
    }

}
