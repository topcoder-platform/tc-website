/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.jsp.JspException;

/**
 * <p>
 * Generate the filtered string, which can be shown properly in the html page,
 * on the basis of the given string.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ShowStringTag extends BaseTag {

    // ----------------------------------------------------- Instance Variables

    /**
     * The attribute name.
     */
    private String name = null;

    /**
     * Name of the property to be accessed on the specified bean.
     */
    protected String property = null;

    /**
     * The attribute of CSS stylesheet class .
     */
    private String styleClass = null;

    // ------------------------------------------------------------- Properties

    /**
     * Return the attribute name.
     *
     * @return the attribute name.
     */
    public String getName() {
        return (this.name);
    }

    /**
     * Set the attribute name.
     *
     * @param name The new attribute name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Return the attribute property.
     *
     * @return the attribute property.
     */
    public String getProperty() {
        return (this.property);
    }

    /**
     * Set the attribute property.
     *
     * @param property The new attribute property
     */
    public void setProperty(String property) {
        this.property = property;
    }

    /**
     * Return the attribute styleClass.
     *
     * @return the attribute styleClass.
     */
    public String getStyleClass() {
        return (this.styleClass);
    }

    /**
     * Set the attribute styleClass.
     *
     * @param styleClass The new attribute styleClass
     */
    public void setStyleClass(String styleClass) {
        this.styleClass = styleClass;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Render the filtered string.
     *
     * @return SKIP_BODY to skip the body text.
     * @exception JspException if a JSP exception has occurred.
     */
    public int doStartTag() throws JspException {
        Object obj = RequestUtils.lookup(pageContext, name, property, null);
        String text = null;

        if (obj == null) {
            return (SKIP_BODY);  // Nothing to output
        }

        // Make the output string
        text = obj.toString();
        if (styleClass == null) {
            text = ResponseUtils.filter(text).replaceAll("\\\\n", "<br>");
            text = text.replaceAll("\\n", "<br>");
        } else {
            text = ResponseUtils.filter(text).replaceAll("\\\\n", "</p><p class='" + styleClass + "'>");
            text = text.replaceAll("\\n", "</p><p class='" + styleClass + "'>");
            text = "<p class='" + styleClass + "'>" + text + "</p>";
        }

        // Print this result to our output writer, no filtered
        ResponseUtils.write(pageContext, text);

        // Skip the body of this tag
        return (SKIP_BODY);
    }

    /**
     * Release any acquired resources.
     */
    public void release() {
        super.release();
        this.name = null;
        this.property = null;
    }
}
