package com.topcoder.web.common.tag;

import javax.servlet.jsp.JspException;
import java.lang.reflect.Method;
import java.util.Collection;

/**
 * @author dok
 * @version $Revision: 49522 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class ObjectSelectTag extends SelectTag {

    private static final Class[] NO_PARAMS = new Class[0];
    private static final Object[] NO_ARGS = new Object[0];

    private String valueField;
    private String textField;
    private Collection list;

    public ObjectSelectTag() {
        init();
    }

    public void setValueField(String valueField) {
        this.valueField = valueField;
    }

    public void setTextField(String textField) {
        this.textField = textField;
    }

    public void setList(Collection list) {
        this.list = list;
    }

    protected String getOptionValue(Object o) {
        return getPropertyValue(o, valueField);
    }

    protected String getOptionText(Object o) {
        return getPropertyValue(o, textField);
    }

    protected Collection getSelectOptions() throws JspException {
        return list;
    }

    private String getPropertyValue(Object o, String property) {
        if (property == null) {
            return null;
        }

        String methodName = new StringBuffer("get").append(Character.toUpperCase(property.charAt(0))).append(property.substring(1)).toString();
        try {
            Method method = o.getClass().getMethod(methodName, NO_PARAMS);
            Object out = method.invoke(o, NO_ARGS);
            return out.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }


    protected void init() {
        super.init();
        valueField = null;
        textField = null;
        list = null;
    }

}
