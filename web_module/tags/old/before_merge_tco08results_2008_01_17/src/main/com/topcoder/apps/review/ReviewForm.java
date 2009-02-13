/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Base form bean for the form editting. This form has the following fields,
 * with default values in square brackets:
 * <ul>
 * <li><b>id</b> - The project id.
 * </ul>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class ReviewForm extends ActionForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The project id.
     */
    private long id = -1;

    /**
     * Whether this form is valid.
     */
    private boolean isValid = true;

    /**
     * The login user.
     */
    protected SecurityEnabledUser user = null;

    /**
     * The project list.
     */
    private UserProjectInfo[] infos = null;

    // ----------------------------------------------------------- Properties

    /**
     * Return the project id.
     *
     * @return the project id.
     */
    public long getId() {
        return id;
    }

    /**
     * Set the project id.
     *
     * @param id The new project id.
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Return whether this form is valid.
     *
     * @return whether this form is valid.
     */
    public boolean getValid() {
        return isValid;
    }

    /**
     * Set whether this form is valid.
     *
     * @param isValid Whether this form is valid.
     */
    public void setValid(boolean isValid) {
        this.isValid = isValid;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Reset all properties to their default values.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     */
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.id = -1;
        this.isValid = true;
        this.user = (SecurityEnabledUser) request.getSession().getAttribute(Constants.USER_KEY);
        this.infos = (UserProjectInfo[]) request.getSession().getAttribute(Constants.PROJECT_LIST_KEY);
    }

    // --------------------------------------------------------- Protected Methods

    /**
     * Get the user project info by project id.
     *
     * @param id The project id.
     * @return the user project info according to the project id, or null if
     * it can not be found.
     */
    protected UserProjectInfo getInfoById(long id) {
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
