/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMappings;
import org.apache.struts.util.ResponseUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

/**
 * <p>
 * Generate the form name for this page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class FormNameTag extends BaseTag {

    // ----------------------------------------------------- Instance Variables

    /**
     * The action name.
     */
    private String action = null;

    // ------------------------------------------------------------- Properties

    /**
     * Return the attribute action.
     *
     * @return the attribute action.
     */
    public String getAction() {
        return (this.action);
    }

    /**
     * Set the attribute action.
     *
     * @param action The new attribute action
     */
    public void setAction(String action) {
        this.action = action;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Render the filtered string.
     *
     * @return SKIP_BODY to skip the body text.
     * @exception JspException if a JSP exception has occurred.
     */
    public int doStartTag() throws JspException {
        ActionMappings mappings = (ActionMappings)
                pageContext.getAttribute(Action.MAPPINGS_KEY,
                        PageContext.APPLICATION_SCOPE);

        if (mappings != null) {
            // Look up the action mapping we will be submitting to
            String mappingName = getActionMappingName();
            ActionMapping mapping = mappings.findMapping(mappingName);
            if (mapping != null) {
                // Print this result to our output writer, no filtered
                ResponseUtils.write(pageContext, mapping.getName());
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
        this.action = null;
    }

    // --------------------------------------------------------- Private Methods

    /**
     * Return the form action converted into an action mapping path.  The
     * value of the <code>action</code> property is manipulated as follows in
     * computing the name of the requested mapping:
     * <ul>
     * <li>Any filename extension is removed (on the theory that extension
     *     mapping is being used to select the controller servlet).</li>
     * <li>If the resulting value does not start with a slash, then a
     *     slash is prepended.</li>
     * </ul>
     */
    private String getActionMappingName() {

        String value = action;
        int question = action.indexOf("?");
        if (question >= 0)
            value = value.substring(0, question);
        int slash = value.lastIndexOf("/");
        int period = value.lastIndexOf(".");
        if ((period >= 0) && (period > slash))
            value = value.substring(0, period);
        if (value.startsWith("/"))
            return (value);
        else
            return ("/" + value);

    }
}
