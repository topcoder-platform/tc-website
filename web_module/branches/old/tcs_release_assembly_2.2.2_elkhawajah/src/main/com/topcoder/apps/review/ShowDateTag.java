/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.util.format.DateFormatMethod;
import com.topcoder.util.format.FormatMethodFactory;
import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.jsp.JspException;
import java.util.Date;

/**
 * <p>
 * Generate the string of formated date.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ShowDateTag extends BaseTag {

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
     * The formater for the date.
     */
    private DateFormatMethod dateFormatter =
            FormatMethodFactory.getDefaultDateFormatMethod(Constants.DATE_FORMAT);

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

    // --------------------------------------------------------- Public Methods

    /**
     * Render the formated date.
     *
     * @return SKIP_BODY to skip the body text.
     * @exception JspException if a JSP exception has occurred.
     */
    public int doStartTag() throws JspException {
        Date date =
                (Date) RequestUtils.lookup(pageContext, name, property, null);
        String result = null;

        if (date == null) {
            return (SKIP_BODY);  // Nothing to output
        }

        // Make the output string
        result = dateFormatter.format(date);

        // Print this result to our output writer, suitably filtered
        ResponseUtils.write(pageContext, ResponseUtils.filter(result));

        // Skip the body of this tag
        return (SKIP_BODY);
    }

    /**
     * Release any acquired resources.
     */
    public void release() {
        super.release();
        this.name = Constants.PROJECT_KEY;
        this.property = null;
    }
}
