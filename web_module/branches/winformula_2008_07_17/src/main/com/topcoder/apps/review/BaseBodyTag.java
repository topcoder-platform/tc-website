/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import org.apache.struts.util.MessageResources;
import org.apache.struts.util.RequestUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * <p>
 * The base tag class for all the tags that have body text.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public abstract class BaseBodyTag extends BodyTagSupport {

    // ----------------------------------------------------- Instance Variables

    /**
     * The message resources for this package.
     */
    protected static MessageResources messages =
            MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);

    /**
     * The body content of this tag (if any).
     */
    protected String text = null;

    // --------------------------------------------------------- Public Methods

    /**
     * Render the beginning of the hyperlink.
     *
     * @return EVAL_BODY_BUFFERED to evaluate the body of this tag.
     * @exception JspException if a JSP exception has occurred.
     */
    public int doStartTag() throws JspException {
        // Do nothing until doEndTag() is called
        this.text = null;
        return (EVAL_BODY_BUFFERED);
    }

    /**
     * Save the associated label from the body content.
     *
     * @return SKIP_BODY
     * @exception JspException if a JSP exception has occurred
     */
    public int doAfterBody() throws JspException {
        if (bodyContent != null) {
            String value = bodyContent.getString().trim();
            if (value.length() > 0) {
                text = value;
            }
        }

        return (SKIP_BODY);
    }

    /**
     * Get the user project info by project id.
     *
     * @param id The project id.
     * @return the user project info according to the project id, or null if
     * it can not be found.
     * @exception JspException if a JSP exception has occurred
     */
    protected UserProjectInfo getInfoById(long id) throws JspException {
        UserProjectInfo[] infos =
                (UserProjectInfo[]) RequestUtils.lookup(pageContext,
                        Constants.PROJECT_LIST_KEY,
                        null);
        if (infos != null) {
            for (int i = 0; i < infos.length; i++) {
                if (infos[i].getId() == id) {
                    return infos[i];
                }
            }
        }
        return null;
    }
}
