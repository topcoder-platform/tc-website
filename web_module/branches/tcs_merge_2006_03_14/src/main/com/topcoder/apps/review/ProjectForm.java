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
import com.topcoder.project.phases.TCPhase;
import com.topcoder.project.phases.PhaseDateComparator;


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
import java.util.Iterator;
import java.util.Set;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;

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
     * Whether the reason is valid.
     */
    private boolean reasonValid = true;

    /**
     * Whether the participants are valid.
     */
    private boolean[] participantsValid = null;

    /**
     * Whether the phases are valid.
     */
    private boolean[] phaseValid = null;

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
     * The start dates when the timeline is edited.
     */
    private String[] forcedStartDates = null;

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

    /**
     * Indicate what page is currently present. It can take the values "project" or "timeline",
     */
    private String currentEdition = null;


    /**
     * The Project from the ProjectPhases component to store a set of phases.
     */
     private com.topcoder.project.phases.Project projectPhases = null;


    /**
     * The length in minutes of each phase.
     */
    private int[] phaseMinutes = null;

    /**
     * The length of each phase as hh:mm
     */
    private String[] phaseLengths = null;

    /**
     * Indicates for each phase if it must adjust its start date to the end date of the previous phase.
     */
    private boolean[] adjustStartDates = null;

    /**
     * Logging instance
     */
    private Log log = null;



    // ----------------------------------------------------------- Properties


    /**
     * log a message.
     *
     * @param level the logging level.
     * @message the text to be logged.
     */
    protected void log(Level level, java.lang.Object message) {
        try {
            if (log == null) {
                log = LogFactory.getInstance().getLog("com.topcoder.apps.review");
            }
            log.log(level, message);
        } catch (LogException e) {
        }
    }



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
     * Return the specified phase's start time.
     *
     * @param index The index of phase.
     * @return the specified phase's start time.
     */
    public String getForcedPhaseStart(int index) {
        return forcedStartDates[index];
    }

    /**
     * Set the specified phase's start time.
     *
     * @param index The index of phase.
     * @param start The new phase's start time.
     */
    public void setForcedPhaseStart(int index, String start) {
        if (project != null) {
            forcedStartDates[index] = start.trim();
        }
    }

    /**
     * Converts a date in string representation to a Date object.
     */
    private Date parseDate(String date) {
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
        SimpleDateFormat sdf2 = new SimpleDateFormat(Constants.DATE_FORMAT2);

        if (date.indexOf(".") >= 0) {
            return sdf.parse(date.trim(), new ParsePosition(0));
        } else {
            return sdf2.parse(date.trim(), new ParsePosition(0));
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
     * Return whether the participants is valid.
     *
     * @param index The index of participant.
     * @return whether the participants is valid.
     */
    public boolean getParticipantsValid(int index) {
        return participantsValid[index];
    }

    /**
     * Return whether the phase is valid.
     *
     * @param index The index of phase.
     * @return whether the phase is valid.
     */
    public boolean getPhaseValid(int index) {
        return phaseValid[index];
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

    /**
     * Get the key for the page that is being currently edited.
     *
     * @return the key for the page that is being currently edited.
     */
    public String getCurrentEdition() {
        return currentEdition;
    }

    /**
     * Set the key for the page that is being currently edited.
     */
    public void setCurrentEdition(String currentEdition) {
        this.currentEdition = currentEdition;
    }

    /**
     * Return the specified phase's length in minutes
     *
     * @param index The index of phase.
     * @return the specified phase's length in minutes
     */
    public String getPhaseLength(int index) {
        return phaseLengths[index];
    }

    /**
     * Set the specified phase's length in minutes
     *
     * @param index The index of phase.
     * @param start The new phase's length in minutes
     */
    public void setPhaseLength(int index, String phaseLength) {
        phaseLengths[index] = phaseLength;
        phaseMinutes[index] = parseLength(phaseLength);
    }


    /**
     * Get if the phase must adjust its start date to the end date of the previous phase.
     *
     * @param index The index of phase.
     * @return true if it must adjust its start date to the end date of the previous phase.
     */
    public String getAdjustStartDate(int index) {
        return Boolean.toString(adjustStartDates[index]);
    }

    /**
     * Set if the phase must adjust its start date to the end date of the previous phase.
     *
     * @param index The index of phase.
     * @param adjust true if it must adjust its start date to the end date of the previous phase.
     */
    public void setAdjustStartDate(int index, String adjust) {
        adjustStartDates[index] = Boolean.valueOf(adjust).booleanValue();
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
            return errors;
        }


        // if the user stored or refreshed the timeline, verify it
        if (Constants.EDITING_TIMELINE.equals(currentEdition)) {
            String timelineAction = request.getParameter(Constants.ACTION_KEY);
            if (Constants.ACTION_STORE.equals(timelineAction) || Constants.ACTION_REFRESH.equals(timelineAction))  {

                for (int i = 0; i < project.getTimeline().length; i++) {
                    phaseValid[i] = true;

                    if (!adjustStartDates[i]) {
                        Date start = parseDate(forcedStartDates[i]);

                        if (start == null) {
                            errors.add("phase[" + i + "]",
                                    new ActionError("error.format", "Error in the start date"));
                            phaseValid[i] = false;
                            setValid(false);
                        }
                    }
                    if  (phaseMinutes[i] < 0) {
                        errors.add("phase[" + i + "]",
                                   new ActionError("error.format", "Error in the phase duration"));
                        phaseValid[i] = false;
                        setValid(false);
                    }
                }
            }
        }

        // if the user edited the project, verify it.
        if (Constants.EDITING_PROJECT.equals(currentEdition) && Constants.ACTION_EDIT.equals(action)) {
            log(Level.INFO, "checking payments");
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


    /**
     * This method needs to be called when the timeline edition finish and it goes back to project edition.
     * It makes all participants to be valid, because if the user has written an invalid handle, when going
     * to edit timeline, this will be marked as an error.
     */
    public void backFromTimeline() {
        for (int i = 0; i < project.getParticipants().length; i++) {
            participantsValid[i] = true;
        }
    }


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
        forcedStartDates = new String[project.getTimeline().length];
        endDates = new String[project.getTimeline().length];
        phaseLengths = new String[project.getTimeline().length];
        phaseMinutes = new int[project.getTimeline().length];
        phaseValid = new boolean[project.getTimeline().length];
        adjustStartDates = new boolean[project.getTimeline().length];
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

            phaseValid[i] = true;
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
     * Sets the necessary fields for editing the timeline.
     *
     *
     * @return an instance of FailureResult if TCWorkdays configuration couldn't be loaded or an instance of SuccessResult
     * if all went fine.
     */
    public ResultData editTimeline() {
        // Create the project that handles the phases using a configuration file for Workdays
        try {

            projectPhases = new com.topcoder.project.phases.Project(project.getTimeline()[0].getStartDate(),
                            new TCWorkdays(ConfigHelper.getString(ConfigHelper.WORKDAYS_CONF_FILE), TCWorkdays.XML_FILE_FORMAT));
        } catch (Exception e) {
            return new FailureResult("Couldn't load the TCWorkdays configuration due to: ", e);
        }

        // The first phase can't be adjusted to previous phase and its starting date is equivalent to the project
        // starting date
        adjustStartDates[0] = false;
        forcedStartDates[0] = dateFormatter.format(project.getTimeline()[0].getStartDate());

        int n = startDates.length;
        TCPhase[] phases = new TCPhase[n];


        // create the phases.  Each phase depends on the previous.  If its start date equals the end date of the previous
        // phase, it is considered that it is adjusted to the previous phase.
        for (int i = 0; i < n; i++) {
            phases[i] = new TCPhase(projectPhases, project.getTimeline()[i].getStartDate(), project.getTimeline()[i].getEndDate());
            if (i > 0) {
                phases [i].addDependency(phases[i - 1]);
                adjustStartDates[i] = project.getTimeline()[i].getStartDate().equals(project.getTimeline()[i-1].getEndDate());
                forcedStartDates[i] = adjustStartDates[i]? "" : dateFormatter.format(project.getTimeline()[i].getStartDate());
            }

            phaseMinutes[i] = phases[i].getLength();
            phaseLengths[i] = formatLength(phaseMinutes[i]);
        }

        return new SuccessResult();
    }



    /**
     * Adjust the phases to the start dates and lengths specified by the user.
     * If a phase's start date is before the end of the previous date, it will be adjusted to its end,
     *
     * @return an instance of SuccessResult.
     */
    public ResultData refreshTimeline() {
        int n = startDates.length;

        // Clear the project and re enter the phases.
        projectPhases.clearPhases();
        Date startDate = projectPhases.getStartDate();
        TCPhase[] phases = new TCPhase[n];

        for (int i = 0; i < n; i++) {
            if (!adjustStartDates[i]) {
                Date newStartDate = parseDate(forcedStartDates[i]);

                // Just change the date if it is after the last phase start.  If not, it would give an error.
                // If the date for the phase is earlier than the date for a previous phase, it is not taken into account.
                if (newStartDate.after(startDate) || (i == 0)) {
                    startDate = newStartDate;
                } else {
                    adjustStartDates[i] = true;
                    forcedStartDates[i] = "";
                }
            }

            // If we're changing the start date of the first phase, we may
            // need to change the start date of the project.
            if (i == 0 && startDate.before(projectPhases.getStartDate())) {
                projectPhases.setStartDate(startDate);
            }

            phases[i] = new TCPhase(projectPhases, startDate, phaseMinutes[i]);

            if (i > 0) {
                phases [i].addDependency(phases[i - 1]);
            }

            startDates[i] = dateFormatter.format(phases[i].getStartDate());
            endDates[i] = dateFormatter.format(phases[i].calcEndDate());
            startDate = phases[i].calcEndDate();
        }
        return new SuccessResult();
    }


    /**
     * Commit the changes in the timeline to the project.
     *
     * @return an instance of SuccessResult.
     */
    public ResultData commitTimeline() {
        for (int i = 0; i < startDates.length; i++)  {
            setPhaseStart(i, startDates[i]);
            setPhaseEnd(i, endDates[i]);
        }
        return new SuccessResult();

    }

    /**
     * Parse a time length with format "hh:mm" and return the equivalent in minutes.
     *
     * @param length a length with format hh:mm
     * @return the number of minutes or -1 if the string can't be parsed.
     */
    public int parseLength(String length) {
        try {
            String fields[] = length.trim().split(":");

            if (fields.length != 2) {
                return -1;
            }

            int hours = Integer.parseInt(fields[0]);
            int minutes = Integer.parseInt(fields[1]);

            if ((hours < 0) || (minutes < 0)) {
                return -1;
            }

            return hours * 60 + minutes;
        } catch (Exception e) {
            return -1;
        }

    }


    /**
     * Formats a quantity of minutes to "hh:mm"
     *
     * @param minutes the quantity of minutes
     * @return a string with format "hh:mm.
     */
    public String formatLength(int minutes) {
        int h = minutes / 60;
        int m = minutes % 60;
        return h + ":" + (m < 10? "0" : "") + m;
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
