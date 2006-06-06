package com.topcoder.web.tc.view.reg.tag;


import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Class GetProperty
 *
 * Handler for the getProperty tag, for example:
 *
 * <samm:getProperty [id="affiliate"]
 *                   [type="java.lang.String"]
 *                   [scope="page"]
 *                    name="BeanName"
 *                    property="PropertyName"/>
 */
public class GetProperty
        extends TagSupport {
    protected static final String DEFAULT_TYPE = "java.lang.String";
    private static final int DEFAULT_SCOPE = PageContext.PAGE_SCOPE;

    private String type = DEFAULT_TYPE;
    private int scope = DEFAULT_SCOPE;

    private String name = null;
    private String property = null;


    public void setType(String type) throws ClassNotFoundException {
        Class.forName(type);
        this.type = type;
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
        } else {
        }
    }

    public void setName(String name) {
        if ((name == null) || (name.trim().length() == 0))
            return;
        this.name = name.trim();
    }

    public void setProperty(String property) {
        if ((property == null) || (property.trim().length() == 0))
            return;
        this.property = property.trim();
    }

    public int doStartTag() {
        Object prop = getProperty(name, property);

        if (prop != null) {
            if ((id == null) || (id.trim().length() == 0)) {
                try {
                    pageContext.getOut().print(prop);
                } catch (java.io.IOException ioe) {
                }
            } else {
                pageContext.setAttribute(id, prop, scope);
            }
        } else {
        }

        return SKIP_BODY;
    }

    public int doEndTag() {
        return EVAL_PAGE;
    }

    private Object getProperty(String name, String property) {
        Object object = null;
        Object propertyObject = null;

        if (name == null || name.length() == 0) {
            return null;
        }

        if (property == null || property.length() == 0) {
            return null;
        }

        object = pageContext.findAttribute(name);
        if (object != null) {
            Method getMethod = null;
            Method[] methods = null;

            try {
                getMethod = object.getClass().getMethod("get" + capitalize(property), null);
            } catch (NoSuchMethodException nsme) {
            }

            if (getMethod == null) {
                methods = object.getClass().getMethods();
                for (int i = 0; i < methods.length; i++) {
                    if (methods[i].getName().equalsIgnoreCase("get" + property) &&
                            methods[i].getParameterTypes().length == 0) {
                        getMethod = methods[i];
                        break;
                    }
                }
            }

            if (getMethod != null) {
                try {
                    propertyObject = getMethod.invoke(object, null);
                } catch (IllegalAccessException iae) {
                    propertyObject = null;
                } catch (InvocationTargetException ite) {
                    propertyObject = null;
                }
            } else {
            }
        } else {
        }

        return propertyObject;
    }

    private String capitalize(String in) {
        if (in == null) return null;
        if (in.length() <= 1) return in.toUpperCase();
        return in.substring(0, 1).toUpperCase() + in.substring(1);
    }
}
