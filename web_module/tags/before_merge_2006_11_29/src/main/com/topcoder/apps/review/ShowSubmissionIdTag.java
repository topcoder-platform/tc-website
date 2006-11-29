/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.UserRole;
import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.jsp.JspException;

/**
 * <p>
 * Generate the id of specified submission.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class ShowSubmissionIdTag extends BaseTag {

    // ----------------------------------------------------- Instance Variables

    /**
     * The attribute name.
     */
    private String name = null;

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
     * Render the roles.
     *
     * @return SKIP_BODY to skip the body text.
     * @exception JspException if a JSP exception has occurred.
     */
    public int doStartTag() throws JspException {
        User user = (User) RequestUtils.lookup(pageContext, Constants.USER_KEY, null);
        AbstractSubmission submission = (AbstractSubmission) RequestUtils.lookup(pageContext, name, property, null);

        if (submission == null || user == null) {
            return (SKIP_BODY);  // Nothing to output
        }

        // Make the output string
        for (int i = 0; i < submission.getProject().getParticipants().length; i++) {
            UserRole userRole = submission.getProject().getParticipants()[i];
            if (submission.getSubmitter().equals(userRole.getUser())) {
                ResponseUtils.write(pageContext, String.valueOf(userRole.getId()));
                break;
            }
        }

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
