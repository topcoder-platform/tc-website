package com.topcoder.web.common.tag;

import java.lang.reflect.Method;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/** 
 * <p>
 * This tag will takes a bean name, property and scope and tries to write out
 * the value received from the bean for that property.
 * </p>
 *
 * @author Grimicus
 * @version 1.0
 * @copyright Copyright (C) 2002, TopCoder, Inc. All rights reserved
 */
public class BeanWriteTag extends TagSupport {
    private static Class[] NO_PARAMS = new Class [0];
    private static Object[] NO_ARGS = new Object [0];

    private String name;
    private String property;
    private String scope;

    /**
     * Sets the value of <code>name</code>.
     *
     * @param name
     */
    public void setName( String val )
    {
        name = val;
    }

    /**
     * Sets the value of <code>property</code>.
     *
     * @param property
     */
    public void setProperty( String val )
    {
        property = val;
    }

    /** 
     * Method specific to JSP Tags.  Validates inputs and writes out property
     * if possible.  If it is not possible because bean does not exist, exits
     * quietly
     * 
     * @return The JSP Tag specific return specifying the next action
     *          (Should always throw EVAL_BODY_INCLUDE)
     * @throws JspException Thrown if name and property are not set or if
     *                  there is IO trouble writing out the tag.
     */
    public int doStartTag() throws JspException {
        if(name == null || property == null) {
            throw new JspException("Name and property must both be set");
        }

        Object bean = pageContext.findAttribute(name);

        if(bean == null) {
            return SKIP_BODY;
        }

        String methodName = buildGetMethodName(property);

        String output = null;
        try
        {
            Method method = bean.getClass().getMethod(methodName, NO_PARAMS);
            Object out = method.invoke(bean, NO_ARGS);
            if(out != null) {
                output = out.toString();
            }
        }
        catch(Exception e) {
            //do we care? we exit quietly either way
        }
        if(output == null) {
            return SKIP_BODY;
        }

        try
        {
            pageContext.getOut().print(output);
        }
        catch(IOException e)
        {
            throw new JspException(e.getMessage());
        }

        return SKIP_BODY;
    }

    private String buildGetMethodName(String property) {
        if(property == null) {
            return null;
        }

        return new StringBuffer("get").append(Character.toUpperCase(property.charAt(0))).append(property.substring(1)).toString();
    }

}
