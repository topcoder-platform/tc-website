/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractSubmission;
import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;

/**
 * <p>
 * Generate a URL-encoded hyperlink to the specified URI, with
 * associated query parameters selecting a specified submission.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class LinkSubmissionTag extends BaseBodyTag {

    // ----------------------------------------------------- Instance Variables

    /**
     * The attribute name.
     */
    private String name = null;

    /**
     * The context-relative URI.
     */
    protected String page = null;

    /**
     * Name of the property to be accessed on the specified bean.
     */
    protected String property = null;

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
     * Return the context-relative URI.
     *
     * @return the context-relative URI.
     */
    public String getPage() {
        return (this.page);
    }


    /**
     * Set the context-relative URI.
     *
     * @param page Set the context-relative URI
     */
    public void setPage(String page) {
        this.page = page;
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
        AbstractSubmission submission =
                (AbstractSubmission) RequestUtils.lookup(pageContext, name,
                        property, null);
        StringBuffer url = new StringBuffer(request.getContextPath());
        StringBuffer result = new StringBuffer("<a href=\"");
        String msg = null;

        if (submission == null) {
            return (EVAL_PAGE);  // Nothing to output
        }

        // Generate the URL to be encoded
        url.append(page);
        if (page.indexOf("?") < 0) {
            url.append("?");
        } else {
            url.append("&");
        }
        url.append(Constants.ID_KEY + "=");
        url.append(submission.getProject().getId());
        url.append("&");
        url.append(Constants.SUBMITTER_ID_KEY + "=");
        url.append(submission.getSubmitter().getId());

        // Generate the hyperlink start element
        result.append(response.encodeURL(url.toString()));
        result.append("\">");

        if (text == null) {
            result.append(msg + "</a>");
        } else {
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
        this.name = null;
        this.page = null;
    }
}
