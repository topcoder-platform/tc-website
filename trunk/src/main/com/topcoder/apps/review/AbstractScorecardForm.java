/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.document.TestCaseScorecardQuestion;
import com.topcoder.apps.review.projecttracker.Project;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * Form bean for the scorecard editing page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public abstract class AbstractScorecardForm extends ReviewForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The scorecard.
     */
    protected AbstractScorecard scorecard = null;

    /**
     * The question list.
     */
    private ScorecardQuestionBean[] questions = null;

    /**
     * The user action.
     */
    protected String action = null;

    /**
     * The question index for the adding and deleting responses.
     */
    private int questionIndex = -1;

    /**
     * The response index for the adding and deleting responses.
     */
    private int responseIndex = -1;

    /**
     * The reviewer id
     */
    protected long rid = -1;

    /**
     * The submitter id
     */
    protected long sid = -1;

    // ----------------------------------------------------------- Properties

    /**
     * Return the reviewer id related to this scorecard.
     *
     * @return the reviewer id related to this scorecard.
     */
    public long getRid() {
        return scorecard.getAuthor().getId();
    }

    /**
     * Set the reviewer id related to this scorecard.
     *
     * @param rId The reviewer id related to this scorecard.
     */
    public void setRid(long rid) {
        this.rid = rid;
    }

    /**
     * Return the submitter id related to this scorecard.
     *
     * @return the submitter id related to this scorecard.
     */
    public long getSid() {
        return scorecard.getSubmission().getSubmitter().getId();
    }

    /**
     * Set the submitter id related to this scorecard.
     *
     * @param sId The submitter id related to this scorecard.
     */
    public void setSid(long sid) {
        this.sid = sid;
    }

    /**
     * Return the submission URL related to this scorecard.
     *
     * @return the submission URL related to this scorecard.
     */
    public String getSubmissionURL() {
        return String.valueOf(scorecard.getSubmission().getURL());
    }

    /**
     * Return the submission id related to this scorecard.
     *
     * @return the submission id related to this scorecard.
     */
    public long getSubmissionId() {
        return scorecard.getSubmission().getId();
    }

    /**
     * Return the submission related to this scorecard.
     *
     * @return the submission related to this scorecard.
     */
    public AbstractSubmission getSubmission() {
        return scorecard.getSubmission();
    }

    /**
     * Return the submitter related to this scorecard.
     *
     * @return the submitter related to this scorecard.
     */
    public String getSubmitter() {
        return scorecard.getSubmission().getSubmitter().getHandle();
    }

    /**
     * Return the author related to this scorecard.
     *
     * @return the author related to this scorecard.
     */
    public String getAuthor() {
        return scorecard.getAuthor().getHandle();
    }

    /**
     * Return the author id related to this scorecard.
     *
     * @return the author id related to this scorecard.
     */
    public long getAuthorId() {
        return scorecard.getAuthor().getId();
    }


    /**
     * Return the project related to this scorecard.
     *
     * @return the project related to this scorecard.
     */
    public Project getProject() {
        return scorecard.getProject();
    }

    /**
     * Return the questions in this scorecard.
     *
     * @return the questions in this scorecard.
     */
    public ScorecardQuestionBean[] getQuestions() {
        return questions;
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
     * Return the question index for the adding and deleting responses.
     *
     * @return the question index for the adding and deleting responses.
     */
    public int getQuestionIndex() {
        return questionIndex;
    }

    /**
     * Set the question index for the adding and deleting responses.
     *
     * @param questionIndex The question index for the adding and
     * deleting responses.
     */
    public void setQuestionIndex(int questionIndex) {
        this.questionIndex = questionIndex;
    }

    /**
     * Return the response index for the adding and deleting responses.
     *
     * @return the response index for the adding and deleting responses.
     */
    public int getResponseIndex() {
        return responseIndex;
    }

    /**
     * Set the response index for the adding and deleting responses.
     *
     * @param responseIndex The response index for the adding and
     * deleting responses.
     */
    public void setResponseIndex(int responseIndex) {
        this.responseIndex = responseIndex;
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

        if (questions == null) {
            return errors;
        } else if (Constants.ACTION_FINISH.equals(action)) {
            for (int i = 0; i < questions.length; i++) {
                questions[i].setValid(true);
                if (questions[i].getType().equals(ScorecardQuestionBean.TESTCASE)) {
                    int totalTests = ((TestCaseScorecardQuestion) scorecard.getQuestions()[i]).getTotalTests();
                    int totalPass = ((TestCaseScorecardQuestion) scorecard.getQuestions()[i]).getTotalPass();
                    if (totalTests <= 0 || totalPass < 0 || totalPass > totalTests) {
                        questions[i].setValid(false);
                        errors.add("questions[" + i + "]", new ActionError("error.answer.required"));
                        setValid(false);
                    }
                } else {
                    String answer = questions[i].getEvaluation();
                    if (answer == null || answer.length() < 1) {
                        questions[i].setValid(false);
                        errors.add("questions[" + i + "]", new ActionError("error.answer.required"));
                        setValid(false);
                    }
                }
                if (!questions[i].getType().equals(ScorecardQuestionBean.OBJECTIVE)) {
                    SubjectiveResponseBean[] responses = questions[i].getResponses();
                    String typeKey = "error.responseType.required";
                    String textKey = "error.responseText.required";
                    for (int j = 0; j < responses.length; j++) {
                        String responseType = responses[j].getResponseType();
                        String responseText = responses[j].getResponseText();
                        responses[j].setValid(true);
                        if (responseType == null || responseType.length() < 1) {
                            String property = "questions[" + i + "].responses["
                                    + j + "]";
                            errors.add(property, new ActionError(typeKey));
                            responses[j].setValid(false);
                            setValid(false);
                        }
                        if (responseText == null || responseText.length() < 1) {
                            String property = "questions[" + i + "].responses["
                                    + j + "]";
                            errors.add(property, new ActionError(textKey));
                            responses[j].setValid(false);
                            setValid(false);
                        }
                    }
                }
            }
        } else {
            for (int i = 0; i < questions.length; i++) {
                SubjectiveResponseBean[] responses = questions[i].getResponses();

                questions[i].setValid(true);
                if (responses != null) {
                    for (int j = 0; j < responses.length; j++) {
                        responses[j].setValid(true);
                    }
                }
            }
        }

        return errors;
    }

    /**
     * Reset all properties to their default values.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     */
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        super.reset(mapping, request);
        try {
            rid = Long.parseLong(String.valueOf(request.getParameter(Constants.REVIEWER_ID_KEY)));
            sid = Long.parseLong(String.valueOf(request.getParameter(Constants.SUBMITTER_ID_KEY)));
            setId(Long.parseLong(String.valueOf(request.getParameter(Constants.ID_KEY))));
            //retrieveScorecard();
        } catch (NumberFormatException e) {
            setId(-1);
            rid = -1;
            sid = -1;
        }
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Delete the response in a question.
     *
     * @param qIdx The question index for deleting responses.
     * @param rIdx The response index for deleting responses.
     */
    protected void deleteResponse(int qIdx, int rIdx) {
        if (qIdx >= 0 && qIdx < questions.length) {
            questions[qIdx].deleteResponse(rIdx);
        }
    }

    /**
     * Add the response in a question.
     *
     * @param qIdx The question index for adding responses.
     * @param rIdx The response index for adding responses.
     */
    protected void addResponse(int qIdx, int rIdx) {
        if (qIdx >= 0 && qIdx < questions.length) {
            questions[qIdx].addResponse(rIdx);
        }
    }

    /**
     * Creates the form bean from the scorecard.
     *
     * @param scorecard The scorecard for creating the form bean.
     */
    protected void fromScorecard(AbstractScorecard scorecard) {
        int len = scorecard.getQuestions() != null ? scorecard.getQuestions().length : 0;
        this.scorecard = scorecard;
        this.questions = new ScorecardQuestionBean[len];

        for (int i = 0; i < len; i++) {
            ScorecardQuestion question = scorecard.getQuestions()[i];
            ScorecardQuestion preQuestion = (i == 0)
                    ? null
                    : scorecard.getQuestions()[i - 1];
            ScorecardQuestion nextQuestion = (i == len - 1)
                    ? null
                    : scorecard.getQuestions()[i + 1];
            long curId = question.getScorecardSection().getId();
            long preId = (preQuestion == null)
                    ? (curId - 1)
                    : preQuestion.getScorecardSection().getId();
            long nextId = (nextQuestion == null)
                    ? (curId - 1)
                    : nextQuestion.getScorecardSection().getId();
            long curId2 = question.getScorecardSection().getSectionGroup().getId();
            long preId2 = (preQuestion == null)
                    ? (curId - 1)
                    : preQuestion.getScorecardSection().getSectionGroup().getId();
            long nextId2 = (nextQuestion == null)
                    ? (curId - 1)
                    : nextQuestion.getScorecardSection().getSectionGroup().getId();

            this.questions[i] =
                    new ScorecardQuestionBean(question, curId != preId, curId != nextId,
                            curId2 != preId2, curId2 != nextId2);
            //System.out.println("("+i+"):"+question.getQuestionText());
        }
        setId(scorecard.getProject().getId());
    }

    /**
     * Retrieve the scorecard.
     */
    protected abstract void retrieveScorecard();
}
