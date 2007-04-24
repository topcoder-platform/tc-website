/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.*;
import org.apache.struts.util.MessageResources;
import org.apache.struts.util.RequestUtils;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.jsp.JspException;

/**
 * <p>
 * Generate the string of roles for a specified user in a specified
 * project.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class ShowRolesTag extends BaseTag {

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
        UtilityBean utility = (UtilityBean) RequestUtils.lookup(pageContext, Constants.UTILITY_KEY, null);
        MessageResources messages =
                MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);
        StringBuffer result = new StringBuffer("");
        String buf = null;
        Object obj = RequestUtils.lookup(pageContext, name, property, null);
        UserRole[] userRoles = null;
        long typeId;

        if (obj instanceof Project) {
            userRoles = ((Project) obj).getParticipants();
            typeId = ((Project) obj).getProjectType().getId();
        } else {
            userRoles = ((UserProjectInfo) obj).getUserRoles();
            typeId = ((UserProjectInfo) obj).getProjectType().getId();
        }

        if (userRoles == null || user == null) {
            return (SKIP_BODY);  // Nothing to output
        }

        // Make the output string
        for (int i = 0; i < userRoles.length; i++) {
            UserRole userRole = userRoles[i];
            if (user.equals(userRole.getUser()) && userRole.getRole().getId() != Constants.ROLE_REMOVED) {
                if (result.length() > 0 && userRole.getRole().getId() != Constants.ROLE_DESINGER_DEVELOPER) {
                    result.append("<br>");
                }

                if (userRole.getRole().getId() == Constants.ROLE_DESINGER_DEVELOPER) {
                    if (typeId == ProjectType.ID_DESIGN) {
                        buf = "Designer";
                    } else {
                        buf = "Developer";
                    }
                } else {
                    result.append(userRole.getRole().getName());
                }
            }
        }
        if (utility.getAdmin() && result.length() == 0) {
            result.append(messages.getMessage("prompt.roleAdmin"));
        }
        if (buf != null && result.length() == 0) {
            result.append(buf);
        }

        // Print this result to our output writer, no filtered
        ResponseUtils.write(pageContext, result.toString());

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
