/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import org.apache.struts.util.MessageResources;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * Java bean for the scorecard question.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ScorecardQuestionBean {

    // --------------------------------------------------- Instance Variables

    /**
     * The type of subjective question.
     */
    public final static String SUBJECTIVE = "subjective";

    /**
     * The type of objective question.
     */
    public final static String OBJECTIVE = "objective";

    /**
     * The type of test case question.
     */
    public final static String TESTCASE = "testcase";

    /**
     * The scorecard question.
     */
    private ScorecardQuestion question = null;

    /**
     * The list of responses.
     */
    private List responses = null;

    /**
     * The list of possible evaluations.
     */
    private Evaluation[] evaluations = null;

    /**
     * The list of possible evaluation strings.
     */
    private String[] evaluationAnswers = null;

    /**
     * Whether the question is the first in the section.
     */
    private boolean isFirst = false;

    /**
     * Whether the question is the last in the section.
     */
    private boolean isLast = false;

    /**
     * Whether the section is the first in the group.
     */
    private boolean isGroupFirst = false;

    /**
     * Whether the section is the last in the group.
     */
    private boolean isGroupLast = false;

    /**
     * Whether the input of this question is valid.
     */
    private boolean isValid = true;

    // --------------------------------------------------------- Constructors

    /**
     * Creates the <code>ScorecardQuestionBean</code> instance from the
     * ScorecardQuestion.
     *
     * @param question The ScorecardQuestion.
     * @param isFirst Whether the question is the first in the section.
     * @param isLast Whether the question is the last in the section.
     * @param isGroupFirst Whether the section is the first in the group.
     * @param isGroupLast Whether the section is the last in the group.
     */
    protected ScorecardQuestionBean(ScorecardQuestion question,
                                    boolean isFirst, boolean isLast,
                                    boolean isGroupFirst, boolean isGroupLast) {
        MessageResources messages =
                MessageResources.getMessageResources(Constants.MESSAGE_RESOURCE_KEY);
        BusinessDelegate businessDelegate = new BusinessDelegate();

        this.question = question;
        this.isFirst = isFirst;
        this.isLast = isLast;
        this.isGroupFirst = isGroupFirst;
        this.isGroupLast = isGroupLast;
        responses = new ArrayList();

        if (question instanceof SubjectiveScorecardQuestion
                || question instanceof TestCaseScorecardQuestion) {
            SubjectiveResponse[] responses = null;
            if (question instanceof SubjectiveScorecardQuestion) {
                SubjectiveScorecardQuestion subjectiveQuestion = (SubjectiveScorecardQuestion) question;
                responses = subjectiveQuestion.getResponses();
                evaluations = businessDelegate.getSubjectiveEvaluations(subjectiveQuestion.getAnswerType());
            } else {
                TestCaseScorecardQuestion testCaseQuestion = (TestCaseScorecardQuestion) question;
                responses = testCaseQuestion.getResponses();
                evaluations = businessDelegate.getSubjectiveEvaluations();
            }

            if (responses == null || responses.length == 0) {
                // Each subjective question has at least one response
                responses = new SubjectiveResponse[1];
                responses[0] = new SubjectiveResponse(null, null);
            }

            if (question instanceof SubjectiveScorecardQuestion) {
                ((SubjectiveScorecardQuestion) question).setResponses(responses);
            } else {
                ((TestCaseScorecardQuestion) question).setResponses(responses);
            }

            for (int i = 0; i < responses.length; i++) {
                this.responses.add(new SubjectiveResponseBean(responses[i]));
            }

        } else {
            evaluations = businessDelegate.getObjectiveEvaluations();
        }

        // Prepare the values for the <html:options>
        evaluationAnswers = new String[evaluations.length + 1];
        evaluationAnswers[0] = messages.getMessage("prompt.answer");
        for (int i = 0; i < evaluations.length; i++) {
            evaluationAnswers[i + 1] = evaluations[i].getName();
        }
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Return the question text.
     *
     * @return the question text.
     */
    public String getQuestionText() {
        String text = question.getQuestionText();
        return text;
    }

    /**
     * Return the evaluation of this question.
     *
     * @return the evaluation of this question.
     */
    public String getEvaluation() {
        if (question.getEvaluation() != null) {
            return question.getEvaluation().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the evaluation of this question.
     *
     * @param eval The evaluation of this question.
     */
    public void setEvaluation(String eval) {
        for (int i = 0; i < evaluations.length; i++) {
            if (evaluations[i].getName().equals(eval)) {
                question.setEvaluation(evaluations[i]);
            }
        }
    }

    /**
     * Return the section name of this question.
     *
     * @return the section name of this question.
     */
    public String getScorecardSection() {
        return question.getScorecardSection().getName();
    }

    /**
     * Return the section group name of this question.
     *
     * @return the section group name of this question.
     */
    public String getSectionGroup() {
        return question.getScorecardSection().getSectionGroup().getName();
    }

    /**
     * Return the type of this question.
     *
     * @return the type of this question.
     */
    public String getType() {
        if (question instanceof SubjectiveScorecardQuestion) {
            return SUBJECTIVE;
        } else if (question instanceof TestCaseScorecardQuestion) {
            return TESTCASE;
        } else {
            return OBJECTIVE;
        }
    }

    /**
     * Return the responses of this question.
     *
     * @return the responses of this question.
     */
    public SubjectiveResponseBean[] getResponses() {
        SubjectiveResponseBean[] srbs =
                new SubjectiveResponseBean[responses.size()];

        for (int i = 0; i < responses.size(); i++) {
            srbs[i] = (SubjectiveResponseBean) responses.get(i);
        }
        return srbs;
    }

    /**
     * Return the number of responses of this question.
     *
     * @return the number of responses of this question.
     */
    public int getResponseNum() {
        return responses.size();
    }

    /**
     * Return whether the question is the first in the section.
     *
     * @return whether the question is the first in the section.
     */
    public boolean getFirst() {
        return isFirst;
    }

    /**
     * Return whether the question is the last in the section.
     *
     * @return whether the question is the last in the section.
     */
    public boolean getLast() {
        return isLast;
    }

    /**
     * Return whether the section is the first in the group.
     *
     * @return whether the section is the first in the group.
     */
    public boolean getGroupFirst() {
        return isGroupFirst;
    }

    /**
     * Return whether the section is the last in the group.
     *
     * @return whether the section is the last in the group.
     */
    public boolean getGroupLast() {
        return isGroupLast;
    }

    /**
     * Set whether the input of this question is valid.
     *
     * @param isValid Whether the input of this question is valid.
     */
    protected void setValid(boolean isValid) {
        this.isValid = isValid;
    }

    /**
     * Return whether the input of this question is valid.
     *
     * @return whether the input of this question is valid.
     */
    public boolean getValid() {
        return isValid;
    }

    /**
     * Return the list of possible evaluation strings.
     *
     * @return the list of possible evaluation strings.
     */
    public String[] getEvaluationAnswers() {
        return evaluationAnswers;
    }

    /**
     * Return the total test cases.
     *
     * @return the total test cases.
     */
    public String getTotalTests() {
        if (question instanceof TestCaseScorecardQuestion) {
            return String.valueOf(((TestCaseScorecardQuestion) question).getTotalTests());
        } else {
            return "-1";
        }
    }

    /**
     * Set the total test cases.
     *
     * @param totalTests The total test cases.
     */
    public void setTotalTests(String totalTests) {
        int num = -1;
        try {
            num = Integer.parseInt(totalTests.trim());
        } catch (NumberFormatException e) {
            num = -1;
        }
        if (question instanceof TestCaseScorecardQuestion) {
            ((TestCaseScorecardQuestion) question).setTotalTests(num);
        }
    }

    /**
     * Return the total passed test cases.
     *
     * @return the total passed test cases.
     */
    public String getTotalPass() {
        if (question instanceof TestCaseScorecardQuestion) {
            return String.valueOf(((TestCaseScorecardQuestion) question).getTotalPass());
        } else {
            return "-1";
        }
    }

    /**
     * Set the total passed test cases.
     *
     * @param totalPass The total passed test cases.
     */
    public void setTotalPass(String totalPass) {
        int num = -1;
        try {
            num = Integer.parseInt(totalPass.trim());
        } catch (NumberFormatException e) {
            num = -1;
        }
        if (question instanceof TestCaseScorecardQuestion) {
            ((TestCaseScorecardQuestion) question).setTotalPass(num);
        }
    }

    /**
     * @return id of the scorecardQuestion
     */
    public long getId() {
        if (question != null)
            return question.getId();
        else
            return -1;
    }
    // ------------------------------------------------------ Protected Methods

    /**
     * Delete the response in the question.
     *
     * @param rIdx The response index for deleting responses.
     */
    protected void deleteResponse(int rIdx) {
        if (rIdx >= 0 && rIdx < responses.size() && responses.size() > 1) {
            responses.remove(rIdx);
            saveResponses();
        }
    }

    /**
     * Add the response in a question.
     *
     * @param rIdx The response index for adding responses.
     */
    protected void addResponse(int rIdx) {
        if (rIdx >= 0 && rIdx <= responses.size() - 1) {
            SubjectiveResponse response = new SubjectiveResponse("", null);
            SubjectiveResponseBean bean = new SubjectiveResponseBean(response);

            bean.setResponseType(bean.getResponseAnswers()[0]);
            responses.add(rIdx + 1, bean);
            saveResponses();
        }
    }

    /**
     * Save the responses in the question.
     */
    protected void saveResponses() {
        SubjectiveResponse[] rspns = new SubjectiveResponse[responses.size()];
        for (int i = 0; i < rspns.length; i++) {
            rspns[i] = ((SubjectiveResponseBean) responses.get(i)).getResponse();
        }
        if (question instanceof SubjectiveScorecardQuestion) {
            ((SubjectiveScorecardQuestion) question).setResponses(rspns);
        } else if (question instanceof TestCaseScorecardQuestion) {
            ((TestCaseScorecardQuestion) question).setResponses(rspns);
        }
    }

    /**
     * @return Returns the question.
     */
    public ScorecardQuestion getQuestion() {
        return question;
    }
}
