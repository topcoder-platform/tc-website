/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.MessageResources;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Form bean for the contact project manager page.  This form has the following
 * fields, with default values in square brackets:
 * <ul>
 * <li><b>messageType</b> - Selected message type
 * <li><b>messageText</b> - Entered message text
 * </ul>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public final class ContactPMForm extends ActionForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The message text.
     */
    private String messageText = null;

    /**
     * The message subject.
     */
    private String messageSubject = null;

    /**
     * The project id.
     */
    private long id = 0;

    /**
     * The subject types.
     */
    private List types = null;

    /**
     * The related project.
     */
    private UserProjectInfo project = null;

    // ----------------------------------------------------------- Properties

    /**
     * Return the project id.
     *
     * @return the project id.
     */
    public long getId() {
        return (this.id);
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
     * Return the message text.
     *
     * @return the message text.
     */
    public String getMessageText() {
        return (this.messageText);
    }

    /**
     * Set the message text.
     *
     * @param messageText The new message text.
     */
    public void setMessageText(String messageText) {
        this.messageText = messageText.trim();
    }

    /**
     * Return the message subject.
     *
     * @return the message subject.
     */
    public String getSubject() {
        return (this.messageSubject);
    }

    /**
     * Set the message subject.
     *
     * @param messageSubject The new message subject
     */
    public void setSubject(String messageSubject) {
        this.messageSubject = messageSubject;
    }

    /**
     * Return the related project.
     *
     * @return the related project.
     */
    public UserProjectInfo getProject() {
        return project;
    }

    /**
     * Set the related project.
     *
     * @param project The new related project.
     */
    public void setProject(UserProjectInfo project) {
        this.project = project;
    }

    /**
     * Return the message subject types.
     *
     * @return the message subject types.
     */
    public List getSubjectTypes() {
        return (this.types);
    }

    // --------------------------------------------------------- Constructor

    /**
     * Creates the form bean instance.
     */
    public ContactPMForm() {
        super();

        MessageResources messages =
                MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);

        types = new ArrayList();
        types.add(messages.getMessage("contactPM.subject.question"));
        types.add(messages.getMessage("contactPM.subject.comment"));
        types.add(messages.getMessage("contactPM.subject.complaint"));
        types.add(messages.getMessage("contactPM.subject.other"));
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
        this.messageText = null;
        this.messageSubject = null;
    }

    /**
     * Validate the properties that have been set from this HTTP request,
     * and return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.  If no errors are found, return
     * <code>null</code> or an <code>ActionErrors</code> object with no
     * recorded error messages.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     *
     * @return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.
     */
    public ActionErrors validate(ActionMapping mapping,
                                 HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();

        if ((messageSubject == null) || (messageSubject.length() < 1)) {
            errors.add("subject",
                    new ActionError("error.messageSubject.required"));
        }

        if ((messageText == null) || (messageText.length() < 1)) {
            errors.add("messageText",
                    new ActionError("error.messageText.required"));
        }

        return errors;
    }

    /**
     * Creates the ContactPMData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the
     * ContactPMData.
     * @return the ContactPMData created from this form bean.
     */
    protected ContactPMData toContactPMData(OnlineReviewProjectData orpd) {
        return new ContactPMData(orpd, messageSubject, messageText);
    }
}
