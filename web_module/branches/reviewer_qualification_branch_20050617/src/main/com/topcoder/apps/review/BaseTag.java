/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import org.apache.struts.util.MessageResources;
import org.apache.struts.util.RequestUtils;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p>
 * The base tag class for all the tags that don't have body text.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public abstract class BaseTag extends TagSupport {

    // ----------------------------------------------------- Instance Variables

    /**
     * The message resources for this package.
     */
    protected static MessageResources messages =
            MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);

    // --------------------------------------------------------- Public Methods

    /**
     * Render the end of the hyperlink.
     *
     * @return EVAL_PAGE to evaluate the rest of page.
     * @exception JspException if a JSP exception has occurred
     */
    public int doEndTag() throws JspException {
        return (EVAL_PAGE);
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
