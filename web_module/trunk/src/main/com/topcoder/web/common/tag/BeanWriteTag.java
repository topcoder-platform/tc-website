package com.topcoder.web.common.tag;

import java.lang.reflect.Method;
import javax.servlet.jsp.JspException;

/** 
 * <p>
 * This tag will takes a bean name, property and optional format and 
 * tries to write outthe value received from the bean for that property. If
 * The object gotten is a date object and format is set, then it will format
 * the output to the format specified.
 * </p>
 *
 * @author Grimicus
 * @version 1.0
 */
public class BeanWriteTag extends FormatTag {
    private static Class[] NO_PARAMS = new Class[0];
    private static Object[] NO_ARGS = new Object[0];

    private String name;
    private String property;


    /**
     * Sets the value of <code>name</code>.
     *
     * @param val
     */
    public void setName(String val) {
        name = val;
    }

    /**
     * Sets the value of <code>property</code>.
     *
     * @param val
     */
    public void setProperty(String val) {
        property = val;
    }


    /** 
     * Method specific to JSP Tags.  Validates inputs and writes out property
     * if possible.  If it is not possible because bean does not exist, exits
     * quietly
     * 
     * @return The JSP Tag specific return specifying the next action
     *          (Should always return SKIP_BODY)
     * @throws JspException Thrown if name and property are not set or if
     *                  there is IO trouble writing out the tag.
     */
    public int doStartTag() throws JspException {
        if (name == null || property == null) {
            throw new JspException("Name and property must both be set");
        }

        Object bean = pageContext.findAttribute(name);

        if (bean == null) {
            return SKIP_BODY;
        }

        String methodName = buildGetMethodName(property);

        try {
            Method method = bean.getClass().getMethod(methodName, NO_PARAMS);
            Object out = method.invoke(bean, NO_ARGS);
            setObject(out);
        } catch (Exception e) {
            //do we care? we exit quietly either way
        }
        return super.doStartTag();
    }

    private String buildGetMethodName(String property) {
        if (property == null) {
            return null;
        }

        return new StringBuffer("get").append(Character.toUpperCase(property.charAt(0))).append(property.substring(1)).toString();
    }

}
