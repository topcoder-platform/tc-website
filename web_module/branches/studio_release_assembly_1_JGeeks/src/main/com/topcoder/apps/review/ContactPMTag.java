/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;

/**
 * <p>
 * Generate a URL-encoded hyperlink or button to the a URL for
 * contacting the project manager.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class ContactPMTag extends BaseBodyTag {

    // ----------------------------------------------------- Instance Variables

    /**
     * The attribute name.
     */
    private String name = Constants.PROJECT_KEY;

    /**
     * Name of the property to be accessed on the specified bean.
     */
    protected String property = null;

    /**
     * The attribute button.
     */
    private boolean button = false;

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
     * Return the attribute button.
     *
     * @return the attribute button.
     */
    public boolean getButton() {
        return (this.button);
    }

    /**
     * Set the attribute button.
     *
     * @param button The new attribute button
     */
    public void setButton(boolean button) {
        this.button = button;
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
     * Render the end of the hyperlink.
     *
     * @return EVAL_PAGE
     * @exception JspException if a JSP exception has occurred
     */
    public int doEndTag() throws JspException {
        HttpServletRequest request =
                (HttpServletRequest) pageContext.getRequest();
        HttpServletResponse response =
                (HttpServletResponse) pageContext.getResponse();
        long id = Long.parseLong(
                RequestUtils.lookup(pageContext, name,
                        property, null).toString());
        UserProjectInfo project = getInfoById(id);
        User user =
                (User) RequestUtils.lookup(pageContext, Constants.USER_KEY, null);
        StringBuffer url = new StringBuffer(request.getContextPath());
        StringBuffer result = new StringBuffer("");

        if (project == null || user == null) {
            return (EVAL_PAGE);  // Nothing to output
        }

        if (text == null) {
            text = messages.getMessage("button.contactPM");
        }

        // Generate the URL to be encoded
        url.append("/contactPM.do?");
        url.append(Constants.ID_KEY + "=");
        url.append(project.getId());

        if (button) {
            // Generate the button
            result.append("<input type=\"button\" onClick='document.location=\"");
            result.append(response.encodeURL(url.toString()));
            result.append("\"' value=\"");
            result.append(text);
            result.append("\"");
            if (styleClass != null) {
                result.append(" class=\"" + styleClass + "\"");
            }
            result.append(">");
        } else {
            // Generate the hyperlink element
            result.append("<a href=\"");
            result.append(response.encodeURL(url.toString()));
            result.append("\">");
            result.append(text + "</a>");
        }

        // Print this result to our output writer, no filtered
        ResponseUtils.write(pageContext, result.toString());

        return (EVAL_PAGE);
    }


    /**
     * Release any acquired resources.
     */
    public void release() {
        super.release();
        this.name = Constants.PROJECT_KEY;
        this.button = false;
        this.styleClass = null;
    }
}
