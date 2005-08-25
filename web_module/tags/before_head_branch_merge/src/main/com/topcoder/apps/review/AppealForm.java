/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.MessageResources;

import javax.servlet.http.HttpServletRequest;

/**
 * Form bean for the appeal page.
 *
 * @author FatClimber
 * @version 1.0
 */

public final class AppealForm extends ReviewForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The appeal text.
     */
    private String appealText = null;

    /**
     * The appeal response.
     */
    private String appealResponse = null;

    /**
     * The related project.
     */
    private UserProjectInfo project = null;

    /**
     * The possible response type strings.
     */
    private String[] responseAnswers = null;
    private ResponseType[] responseTypes = null;
    /**
     * The list of possible evaluation strings.
     */
    private String[] evaluationAnswers = null;
    private Evaluation[] evaluations = null;

    private Appeal appeal = null;
    // ----------------------------------------------------------- Properties

    /**
     * @return Returns the appealResponse.
     */
    public String getAppealResponse() {
        return appealResponse;
    }

    /**
     * @param appealResponse The appealResponse to set.
     */
    public void setAppealResponse(String appealResponse) {
        this.appealResponse = appealResponse;
    }

    /**
     * @return Returns the appealText.
     */
    public String getAppealText() {
        return appealText;
    }

    /**
     * @param appealText The appealText to set.
     */
    public void setAppealText(String appealText) {
        this.appealText = appealText;
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

    public Appeal getAppeal() {
        return this.appeal;
    }

    public ScorecardQuestion getQuestion() {
        return appeal.getQuestion();
    }

    /**
     * @return Returns the evaluation.
     */
    public String getEvaluation() {
        Evaluation eval = appeal.getQuestion().getEvaluation();
        if (eval == null)
            return null;
        else
            return eval.getName();
    }

    public void setEvaluation(String eval) {
        for (int i = 0; i < evaluations.length; i++) {
            if (evaluations[i].getName().equals(eval)) {
                appeal.getQuestion().setEvaluation(evaluations[i]);
                break;
            }
        }
    }

    public String getResponseType(int idx) {
        ScorecardQuestion q = appeal.getQuestion();
        SubjectiveResponse resp = null;
        if (q instanceof SubjectiveScorecardQuestion) {
            resp = ((SubjectiveScorecardQuestion) q).getResponses()[idx];
        } else if (q instanceof TestCaseScorecardQuestion) {
            resp = ((TestCaseScorecardQuestion) q).getResponses()[idx];
        }
        if (resp != null) {
            return resp.getResponseType().getName();
        }
        return null;
    }

    public void setResponseType(int idx, String text) {
        ScorecardQuestion q = appeal.getQuestion();
        SubjectiveResponse resp = null;
        if (q instanceof SubjectiveScorecardQuestion) {
            resp = ((SubjectiveScorecardQuestion) q).getResponses()[idx];
        } else if (q instanceof TestCaseScorecardQuestion) {
            resp = ((TestCaseScorecardQuestion) q).getResponses()[idx];
        }
        for (int i = 0; i < responseTypes.length; i++) {
            if (text.equals(responseTypes[i].getName())) {
                resp.setResponseType(responseTypes[i]);
                break;
            }
        }
    }

    public int getTotalPass() {
        if (appeal.getQuestion() instanceof TestCaseScorecardQuestion) {
            return ((TestCaseScorecardQuestion) appeal.getQuestion()).getTotalPass();
        }
        return -1;
    }

    public void setTotalPass(int nr) {
        if (appeal.getQuestion() instanceof TestCaseScorecardQuestion) {
            ((TestCaseScorecardQuestion) appeal.getQuestion()).setTotalPass(nr);
        }
    }

    public int getTotalTests() {
        if (appeal.getQuestion() instanceof TestCaseScorecardQuestion) {
            return ((TestCaseScorecardQuestion) appeal.getQuestion()).getTotalTests();
        }
        return -1;
    }

    public void setTotalTests(int nr) {
        if (appeal.getQuestion() instanceof TestCaseScorecardQuestion) {
            ((TestCaseScorecardQuestion) appeal.getQuestion()).setTotalTests(nr);
        }
    }

    /**
     * @return Returns the evaluationAnswers.
     */
    public String[] getEvaluationAnswers() {
        return evaluationAnswers;
    }

    /**
     * @return Returns the responseAnswers.
     */
    public String[] getResponseAnswers() {
        return responseAnswers;
    }
// --------------------------------------------------------- Constructor

    /**
     * Creates the form bean instance.
     */
    public AppealForm() {
        super();
        MessageResources messages =
                MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Reset all properties to their default values.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     */
    public void reset(ActionMapping mapping, HttpServletRequest request) {
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

/*
        if ((messageSubject == null) || (messageSubject.length() < 1)) {
            errors.add("subject",
                       new ActionError("error.messageSubject.required"));
        }
        */
        return errors;
    }

    /**
     * Creates the AppealData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the
     * AppealData.
     * @return the AppealData created from this form bean.
     */
    protected AppealData toAppealData(OnlineReviewProjectData orpd) {
        appeal.setAppealText(this.appealText);
        appeal.setAppealResponse(this.appealResponse);
        return new AppealData(orpd,
                new Appeal[]{appeal},
                appeal.getAppealer().getId(),
                appeal.getQuestion().getId());
    }

    /**
     * @param appeal
     */
    public void fromAppeal(Appeal appeal, long projectId) {
        this.appeal = appeal;
        this.appealText = appeal.getAppealText();
        this.appealResponse = appeal.getAppealResponse();

        // Prepare the values for the <html:options>
        responseTypes = new BusinessDelegate().getResponseTypes();
        this.responseAnswers = new String[responseTypes.length];
        for (int i = 0; i < responseTypes.length; i++) {
            responseAnswers[i] = responseTypes[i].getName();
        }

        ScorecardQuestion question = appeal.getQuestion();
        if (question instanceof SubjectiveScorecardQuestion) {
            evaluations = new BusinessDelegate().getSubjectiveEvaluations(
                    ((SubjectiveScorecardQuestion) question).getAnswerType());
        } else {
            evaluations = new Evaluation[0];
        }
        // Prepare the values for the <html:options>
        this.evaluationAnswers = new String[evaluations.length];
        for (int i = 0; i < evaluations.length; i++) {
            evaluationAnswers[i] = evaluations[i].getName();
        }
        setId(projectId);
    }
}
