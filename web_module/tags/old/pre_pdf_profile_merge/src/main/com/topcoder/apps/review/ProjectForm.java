/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ScorecardTemplate;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.util.format.DateFormatMethod;
import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.util.format.PrimitiveFormatter;
import com.topcoder.util.format.PrimitiveFormatterFactory;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.MessageResources;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * Form bean for the project editing page and admin project detail page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public final class ProjectForm extends ReviewForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The project.
     */
    private Project project = null;

    /**
     * Whether the corresponding participant should be shown.
     */
    private int[] showParticipants = null;

    /**
     * The reviewer sequence of corresponding participant.
     */
    private int[] reviewerSeqs = null;

    /**
     * The formater for the date.
     */
    private DateFormatMethod dateFormatter = null;

    /**
     * The formater for the currency.
     */
    private PrimitiveFormatter currencyFormatter = null;

    /**
     * The list of possible responsibilities.
     */
    private ReviewerResponsibility[] responsibilityTypes = null;

    /**
     * The list of possible responsibilities as string.
     */
    private String[] responsibilityAnswers = null;

    /**
     * The list of possible payment statuses.
     */
    private PaymentStatus[] paymentStatuses = null;

    /**
     * The user action.
     */
    private String action = null;

    /**
     * The reason of termination.
     */
    private String reason = null;

    /**
     * The terminated status.
     */
    private ProjectStatus terminatedStatus = null;

    /**
     * Whether the timeline is valid.
     */
    private boolean timelineValid = true;

    /**
     * Whether the reason is valid.
     */
    private boolean reasonValid = true;

    /**
     * Whether the participants are valid.
     */
    private boolean[] participantsValid = null;

    /**
     * Whether the scorecard templates are valid.
     */
    private boolean templatesValid = true;

    /**
     * The handle of participants.
     */
    private String[] participantsHandle = null;

    /**
     * The start dates.
     */
    private String[] startDates = null;

    /**
     * The end dates.
     */
    private String[] endDates = null;

    /**
     * The possible project statuses.
     */
    private ProjectStatus[] projectStatuses = null;

    /**
     * The possible termination types.
     */
    private String[] terminationTypes = null;

    /**
     * If mail notification should be sent.
     */
    private boolean sendMail = false;

    private boolean autopilot = false;

    /**
     * If a submitter role can be removed.
     * Used if admin assigns a submitter a review role.
     */
    private boolean submitterRemoval = false;

    private Set submitterRemovalSet = null;

    private ScorecardTemplate[] templates = null;
    private String[] screeningTemplates = null;
    private String[] reviewTemplates = null;

    private String screeningTemplate = null;
    private String reviewTemplate = null;
    // ----------------------------------------------------------- Properties

    /**
     * Return the project.
     *
     * @return the project.
     */
    public Project getProject() {
        return project;
    }

    /**
     * Return the current phase.
     *
     * @return the current phase.
     */
    public String getCurrentPhase() {
        return project.getCurrentPhase().getName();
    }

    /**
     * Set the current phase.
     *
     * @param phase The new current phase.
     */
    public void setCurrentPhase(String phase) {
        if (project != null) {
            for (int i = 0; i < project.getTimeline().length; i++) {
                if (project.getTimeline()[i].getPhase().getName().equals(phase)) {
                    project.setCurrentPhase(project.getTimeline()[i].getPhase());
                }
            }
        }
    }

    /**
     * Return the project notes.
     *
     * @return the project notes.
     */
    public String getNotes() {
        return project.getNotes();
    }

    /**
     * Set the project notes.
     *
     * @param notes The new project notes.
     */
    public void setNotes(String notes) {
        if (project != null) {
            project.setNotes(notes.trim());
        }
    }

    /**
     * Return the project name.
     *
     * @return the project name.
     */
    public String getName() {
        return project.getName();
    }

    /**
     * Return the project version.
     *
     * @return the project version.
     */
    public String getVersion() {
        return project.getVersion();
    }

    /**
     * Return the project overview.
     *
     * @return the project overview.
     */
    public String getOverview() {
        return project.getOverview();
    }

    /**
     * Return the project timeline.
     *
     * @return the project timeline.
     */
    public PhaseInstance[] getTimeline() {
        return project.getTimeline();
    }

    /**
     * Return the project participants.
     *
     * @return the project participants.
     */
    public UserRole[] getParticipants() {
        return project.getParticipants();
    }

    /**
     * Return whether the corresponding participant should be shown.
     *
     * @return whether the corresponding participant should be shown.
     */
    public int getShowParticipants(int index) {
        return showParticipants[index];
    }

    /**
     * Return the reviewer sequence of corresponding participant.
     *
     * @return the reviewer sequence of corresponding participant.
     */
    public int getReviewerSeqs(int index) {
        return reviewerSeqs[index];
    }

    /**
     * Return whether the participant is PM.
     *
     * @return whether the participant is PM.
     */
    public boolean getProjectManager(int index) {
        return (project.getParticipants()[index].getRole().getId() == Constants.ROLE_PROJECT_MANAGER);
    }

    /**
     * Return the project winner.
     *
     * @return the project winner.
     */
    public User getWinner() {
        return project.getWinner();
    }

    /**
     * Return whether the project winner exists.
     *
     * @return whether the project winner exists.
     */
    public boolean getWinnerValid() {
        return (project.getWinner() != null);
    }

    /**
     * Return the specified phase's start time.
     *
     * @param index The index of phase.
     * @return the specified phase's start time.
     */
    public String getPhaseStart(int index) {
        return startDates[index];
    }

    /**
     * Return the specified phase's end time.
     *
     * @param index The index of phase.
     * @return the specified phase's end time.
     */
    public String getPhaseEnd(int index) {
        return endDates[index];
    }

    /**
     * Set the specified phase's start time.
     *
     * @param index The index of phase.
     * @param start The new phase's start time.
     */
    public void setPhaseStart(int index, String start) {
        if (project != null) {
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
            SimpleDateFormat sdf2 = new SimpleDateFormat(Constants.DATE_FORMAT2);
            PhaseInstance phase = project.getTimeline()[index];

            startDates[index] = start.trim();
            if (start.indexOf(".") >= 0) {
                phase.setStartDate(sdf.parse(start.trim(), new ParsePosition(0)));
            } else {
                phase.setStartDate(sdf2.parse(start.trim(), new ParsePosition(0)));
            }
        }
    }

    /**
     * Set the specified phase's end time.
     *
     * @param index The index of phase.
     * @param end The new phase's end time.
     */
    public void setPhaseEnd(int index, String end) {
        if (project != null) {
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
            SimpleDateFormat sdf2 = new SimpleDateFormat(Constants.DATE_FORMAT2);
            PhaseInstance phase = project.getTimeline()[index];

            endDates[index] = end.trim();
            if (end.indexOf(".") >= 0) {
                phase.setEndDate(sdf.parse(end.trim(), new ParsePosition(0)));
            } else {
                phase.setEndDate(sdf2.parse(end.trim(), new ParsePosition(0)));
            }
        }
    }

    /**
     * Return the name of specified role.
     *
     * @param index The index of role.
     * @return the name of specified role.
     */
    public String getRole(int index) {
        return project.getParticipants()[index].getRole().getName();
    }

    /**
     * Return the name of specified user.
     *
     * @param index The index of user.
     * @return the name of specified user.
     */
    public String getUser(int index) {
        return participantsHandle[index];
    }

    /**
     * Set the specified user.
     *
     * @param index The index of user.
     * @param handle The new user's name.
     */
    public void setUser(int index, String handle) {
        if (project != null && handle != null) {
            participantsHandle[index] = handle.trim();
            if (handle.trim().equals("")) {
                participantsValid[index] = true;
                project.getParticipants()[index].setUser(null);
            } else {
                User user = new BusinessDelegate().getUserByHandle(handle.trim());
                if (user == null) {
                    participantsValid[index] = false;
                } else {
                    project.getParticipants()[index].setUser(user);
                    participantsValid[index] = true;
                }
            }
        }
    }

    /**
     * Return the specified responsibility.
     *
     * @param index The index of responsibility.
     * @return the specified responsibility.
     */
    public String getResponsibility(int index) {
        UserRole userRole = project.getParticipants()[index];
        if (userRole.getReviewerResponsibility() != null) {
            return userRole.getReviewerResponsibility().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the specified responsibility.
     *
     * @param index The index of responsibility.
     * @param responsibility The new responsibility.
     */
    public void setResponsibility(int index, String responsibility) {
        if (project != null) {
            for (int i = 0; i < responsibilityTypes.length; i++) {
                if (responsibilityTypes[i].getName().equals(responsibility)) {
                    UserRole userRole = project.getParticipants()[index];
                    userRole.setReviewerResponsibility(responsibilityTypes[i]);
                    return;
                }
            }
            project.getParticipants()[index].setReviewerResponsibility(null);
        }
    }

    /**
     * Return the specified payment.
     *
     * @param index The index of payment.
     * @return the specified payment.
     */
    public String getPayment(int index) {
        PaymentInfo info = project.getParticipants()[index].getPaymentInfo();
        if (info != null) {
            return currencyFormatter.format(info.getPayment());
        } else {
            return null;
        }
    }

    /**
     * Set the specified payment.
     *
     * @param index The index of payment.
     * @param payment The new payment.
     */
    public void setPayment(int index, String payment) {
        if (project != null) {
            PaymentInfo info = project.getParticipants()[index].getPaymentInfo();
            DecimalFormat df = new DecimalFormat(Constants.CURRENCY_FORMAT);
            Number number = df.parse(payment.trim(), new ParsePosition(0));

            if (info != null) {
                if (number != null) {
                    info.setPayment(number.floatValue());
                } else {
                    number = df.parse("$" + payment.trim(), new ParsePosition(0));
                    if (number != null) {
                        info.setPayment(number.floatValue());
                    } else {
                        info.setPayment(-1.0f);
                    }
                }
            }
        }
    }

    /**
     * Return the specified payment status.
     *
     * @param index The index of payment status.
     * @return the specified payment status.
     */
    public String getPaymentStatus(int index) {
        PaymentInfo info = project.getParticipants()[index].getPaymentInfo();
        if (info != null && info.getPaymentStatus() != null) {
            return info.getPaymentStatus().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the specified payment status.
     *
     * @param index The index of payment status.
     * @param payment The new payment status.
     */
    public void setPaymentStatus(int index, String status) {
        if (project != null) {
            PaymentInfo info = project.getParticipants()[index].getPaymentInfo();

            if (info != null) {
                for (int i = 0; i < paymentStatuses.length; i++) {
                    if (paymentStatuses[i].getName().equals(status)) {
                        info.setPaymentStatus(paymentStatuses[i]);
                    }
                }
            }
        }
    }

    /**
     * Return the list of possible payment status answers.
     *
     * @return the list of possible payment status answers.
     */
    public PaymentStatus[] getPaymentStatusAnswers() {
        return paymentStatuses;
    }

    /**
     * Return the list of possible responsibility answers.
     *
     * @return the list of possible responsibility answers.
     */
    public String[] getResponsibilityAnswers() {
        return responsibilityAnswers;
    }

    /**
     * Return the user action.
     *
     * @return the user action.
     */
    public String getAction() {
        return action;
    }

    /**
     * Set the user action.
     *
     * @param action The user action.
     */
    public void setAction(String action) {
        this.action = action;
    }

    /**
     * Return the user reason.
     *
     * @return the user reason.
     */
    public String getReason() {
        return reason;
    }

    /**
     * Set the user reason.
     *
     * @param action The user reason.
     */
    public void setReason(String reason) {
        this.reason = reason.trim();
    }

    /**
     * Return whether the timeline is valid.
     *
     * @return whether the timeline is valid.
     */
    public boolean getTimelineValid() {
        return timelineValid;
    }

    /**
     * Return whether the participants is valid.
     *
     * @param index The index of participant.
     * @return whether the participants is valid.
     */
    public boolean getParticipantsValid(int index) {
        return participantsValid[index];
    }

    /**
     * Return whether the reason is valid.
     *
     * @return whether the reason is valid.
     */
    public boolean getReasonValid() {
        return reasonValid;
    }

    /**
     * Return the possible statuses of project.
     *
     * @return the possible statuses of project.
     */
    public String[] getTerminationTypes() {
        return terminationTypes;
    }

    /**
     * Return the status of project.
     *
     * @return the status of project.
     */
    public String getProjectStatus() {
        if (project.getProjectStatus() != null) {
            return project.getProjectStatus().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the status of project.
     *
     * @param status The new status.
     */
    public void setProjectStatus(String status) {
        for (int i = 0; i < projectStatuses.length; i++) {
            if (projectStatuses[i].getName().equals(status)) {
                project.setProjectStatus(projectStatuses[i]);
                break;
            }
        }
    }

    /**
     * Return the sendMail-flag.
     *
     * @return the sendMail-flag.
     */
    public boolean getSendMail() {
        return sendMail;
    }

    /**
     * Set the sendMail-flag.
     *
     * @param sendMail The sendMail-flag.
     */
    public void setSendMail(boolean sendMail) {
        this.sendMail = sendMail;
    }

    /**
     * @return Returns the submitterRemoval.
     */
    public boolean getSubmitterRemoval() {
        return submitterRemoval;
    }

    /**
     * @param submitterRemoval The submitterRemoval to set.
     */
    public void setSubmitterRemoval(boolean submitterRemoval) {
        this.submitterRemoval = submitterRemoval;
    }

    /**
     * @return Returns the submitterRemovalSet.
     */
    public Set getSubmitterRemovalSet() {
        return submitterRemovalSet;
    }

    /**
     * @param submitterRemovalSet The submitterRemovalSet to set.
     */
    public void setSubmitterRemovalSet(Set submitterRemovalSet) {
        this.submitterRemovalSet = submitterRemovalSet;
    }

    public String[] getScreeningTemplates() {
        return screeningTemplates;
    }

    public String[] getReviewTemplates() {
        return reviewTemplates;
    }

    public void setScorecardTemplates(ScorecardTemplate[] templates) {
        List screeningList = new LinkedList();
        List reviewList = new LinkedList();
        if (project.getScreeningTemplateId() == -1) {
            screeningList.add("[ScreeningTemplate...]");
        }
        if (project.getReviewTemplateId() == -1) {
            reviewList.add("[ReviewTemplate...]");
        }
        this.screeningTemplate = "";
        this.reviewTemplate = "";
        for (int i = 0; i < templates.length; i++) {
            if (templates[i].getStatus() == 1 &&
                    templates[i].getProjectType() == project.getProjectType().getId()) {
                if (templates[i].getScorecardType() == 1) {
                    screeningList.add(templates[i].getName());
                    if (templates[i].getId() == project.getScreeningTemplateId()) {
                        this.screeningTemplate = templates[i].getName();
                    }
                } else if (templates[i].getScorecardType() == 2) {
                    reviewList.add(templates[i].getName());
                    if (templates[i].getId() == project.getReviewTemplateId()) {
                        this.reviewTemplate = templates[i].getName();
                    }
                }
            }
        }
        this.templates = templates;
        this.screeningTemplates = (String[]) screeningList.toArray(new String[0]);
        this.reviewTemplates = (String[]) reviewList.toArray(new String[0]);
    }

    public String getScreeningTemplate() {
        return screeningTemplate;
    }

    public long getScreeningTemplateId() {
        for (int i = 0; i < templates.length; i++) {
            if (screeningTemplate.equals(templates[i].getName())) {
                return templates[i].getId();
            }
        }
        return -1;
    }

    public void setScreeningTemplate(String template) {
        this.screeningTemplate = template;
        this.project.setScreeningTemplateId(getScreeningTemplateId());
    }

    public String getReviewTemplate() {
        return reviewTemplate;
    }

    public long getReviewTemplateId() {
        for (int i = 0; i < templates.length; i++) {
            if (reviewTemplate.equals(templates[i].getName())) {
                return templates[i].getId();
            }
        }
        return -1;
    }

    public void setReviewTemplate(String template) {
        this.reviewTemplate = template;
        this.project.setReviewTemplateId(getReviewTemplateId());
    }

    /**
     * @return Returns the templatesValid.
     */
    public boolean isTemplatesValid() {
        return templatesValid;
    }

// --------------------------------------------------------- Public Methods

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
        setValid(true);

        if (Constants.ACTION_TERMINATE.equals(action)) {
            if (reason == null || reason.equals("")) {
                setValid(false);
                errors.add(ActionErrors.GLOBAL_ERROR,
                        new ActionError("error.reason.required"));
            }
        } else if (Constants.ACTION_EDIT.equals(action)) {
            timelineValid = true;

            for (int i = 0; i < project.getTimeline().length; i++) {
                String phaseName = project.getTimeline()[i].getPhase().getName();
                Date start = project.getTimeline()[i].getStartDate();
                Date end = project.getTimeline()[i].getEndDate();

                if (start == null) {
                    errors.add("timeline",
                            new ActionError("error.format", "Error in the start date of phase " + phaseName));
                    timelineValid = false;
                }
                if (end == null) {
                    errors.add("timeline",
                            new ActionError("error.format", "Error in the end date of phase " + phaseName));
                    timelineValid = false;
                }
                if (start != null && end != null && start.compareTo(end) > 0) {
                    errors.add("timeline",
                            new ActionError("error.format",
                                    "Start date of phase " + phaseName + " must be ahead of end date"));
                    timelineValid = false;
                }
                if (start != null && i > 0 && project.getTimeline()[i - 1].getEndDate() != null
                        && start.compareTo(project.getTimeline()[i - 1].getEndDate()) < 0) {
                    errors.add("timeline",
                            new ActionError("error.format",
                                    "Start date of phase " + phaseName
                            + " must be after the previous end date"));
                    timelineValid = false;
                }
            }

            if (!timelineValid) {
                setValid(false);
            }

            for (int i = 0; i < project.getParticipants().length; i++) {
                if (!participantsValid[i]) {
                    setValid(false);
                    errors.add("participants[" + i + "]",
                            new ActionError("error.format", "Error in the user handle"));
                }
            }

            for (int i = 0; i < project.getParticipants().length; i++) {
                if (project.getParticipants()[i].getPaymentInfo() != null
                        && project.getParticipants()[i].getPaymentInfo().getPayment() < 0.0f) {
                    setValid(false);
                    participantsValid[i] = false;
                    errors.add("participants[" + i + "]",
                            new ActionError("error.format", "Error in the payment amount"));
                }
            }

            if (project.getCurrentPhase().getId() == Phase.ID_SCREENING) {
                if (project.getScreeningTemplateId() == -1) {
                    setValid(false);
                    templatesValid = false;
                    errors.add("templates",
                            new ActionError("error.screeningTemplate.required"));
                }
            } else if (project.getCurrentPhase().getId() == Phase.ID_REVIEW) {
                if (project.getReviewTemplateId() == -1) {
                    setValid(false);
                    templatesValid = false;
                    errors.add("templates",
                            new ActionError("error.reviewTemplate.required"));
                }
            }
            reasonValid = true;
            if (reason == null || reason.trim().equals("")) {
                errors.add("reason",
                        new ActionError("error.format", "Please input reason."));
                setValid(false);
                reasonValid = false;
            }
        }

        return errors;
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the form bean from the project.
     *
     * @param project The project for creating the form bean.
     */
    public void fromProject(Project project) {
        BusinessDelegate businessDelegate = new BusinessDelegate();
        MessageResources messages =
                MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);
        int seq = 0;
        int show = 1;

        this.project = project;
        responsibilityTypes = businessDelegate.getReviewerResponsibilities();
        paymentStatuses = businessDelegate.getPaymentStatuses();
        projectStatuses = businessDelegate.getProjectStatuses();
        responsibilityAnswers = new String[responsibilityTypes.length + 1];
        responsibilityAnswers[0] = messages.getMessage("prompt.nonAvailable");
        terminationTypes = new String[projectStatuses.length];
        for (int i = 1; i < responsibilityAnswers.length; i++) {
            responsibilityAnswers[i] = responsibilityTypes[i - 1].getName();
        }
        for (int i = 0; i < projectStatuses.length; i++) {
            terminationTypes[i] = projectStatuses[i].getName();
        }

        dateFormatter = FormatMethodFactory.getDefaultDateFormatMethod(Constants.DATE_FORMAT);
        currencyFormatter = PrimitiveFormatterFactory.getFormatter(Constants.CURRENCY_FORMAT);

        showParticipants = new int[project.getParticipants().length];
        participantsValid = new boolean[project.getParticipants().length];
        participantsHandle = new String[project.getParticipants().length];
        startDates = new String[project.getTimeline().length];
        endDates = new String[project.getTimeline().length];
        reviewerSeqs = new int[project.getParticipants().length];
        for (int i = 0; i < project.getParticipants().length; i++) {
            long roleId = project.getParticipants()[i].getRole().getId();
            if (roleId != Role.ID_DESIGNER_DEVELOPER && roleId != Role.ID_REMOVED) {
                showParticipants[i] = show;
                show = 3 - show;
            } else {
                showParticipants[i] = 0;
            }
            participantsValid[i] = true;
            participantsHandle[i] = (project.getParticipants()[i].getUser() == null)
                    ? null
                    : project.getParticipants()[i].getUser().getHandle();

            if (roleId == Role.ID_REVIEWER) {
                seq++;
                reviewerSeqs[i] = seq;
            } else {
                reviewerSeqs[i] = 0;
            }
        }

        for (int i = 0; i < project.getTimeline().length; i++) {
            if (project.getTimeline()[i].getStartDate() == null) {
                startDates[i] = null;
            } else {
                startDates[i] = dateFormatter.format(project.getTimeline()[i].getStartDate());
            }
            if (project.getTimeline()[i].getEndDate() == null) {
                endDates[i] = null;
            } else {
                endDates[i] = dateFormatter.format(project.getTimeline()[i].getEndDate());
            }
        }

        for (int i = 0; i < projectStatuses.length; i++) {
            if (projectStatuses[i].getId() == ProjectStatus.ID_TERMINATED) {
                terminatedStatus = businessDelegate.getProjectStatuses()[i];
                break;
            }
        }

        this.autopilot = project.getAutoPilot();

        setId(project.getId());
        // Default sending mail to false
        this.sendMail = false;
        this.submitterRemoval = false;
        this.submitterRemovalSet = null;
    }

    /**
     * Creates the ProjectData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the
     * ProjectData.
     * @return the ProjectData created from this form bean.
     */
    public ProjectData toActionData(OnlineReviewProjectData orpd) {
        ProjectData pData = new ProjectData(orpd, project, reason, null);
        pData.setSendMail(sendMail);
        pData.setSubmitterRemoval(submitterRemoval);
        return pData;
    }

    public boolean getAutoPilot() {
        return project.getAutoPilot();
    }

    public void setAutoPilot(boolean b) {
        project.setAutoPilot(b);
    }

    /**
     * @see org.apache.struts.action.ActionForm#reset(org.apache.struts.action.ActionMapping, javax.servlet.http.HttpServletRequest)
     */
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        super.reset(mapping, request);
        this.sendMail = false;
    }

}
