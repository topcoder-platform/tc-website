/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.view.tags;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * <p>A custom tag to be used for rendering review item answer.</p>
 *
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class ReviewItemAnswerTag extends TagSupport {
    /**
     * Represents the serial verison unique id.
     */
    private static final long serialVersionUID = 324123423L;

    /**
     * Represents the mapping from the scorecard question type and review item answer to the user friendly message.
     */
    private static final Map<Integer, Map<String, String>> QUESTION_ANSWERS = new HashMap<Integer, Map<String, String>>();

    /**
     * Represents the id of the test case scorecard question type. 
     */
    private static final int TEST_CASE_QUESTION_TYPE_ID = 3;

    static {
        // Scale (1-4)
        Map<String, String> answers = new HashMap<String, String>();
        answers.put("1/4", "1 - Strongly Disagree");
        answers.put("2/4", "2 - Somewhat Agree");
        answers.put("3/4", "3 - Agree");
        answers.put("4/4", "4 - Strongly Agree");
        QUESTION_ANSWERS.put(1, answers);

        // Scale (1-10)
        answers = new HashMap<String, String>();
        for (int i = 1; i <= 10; i++) {
            answers.put(i + "/10", "Rating " + i);
        }
        QUESTION_ANSWERS.put(2, answers);

        // Yes/No
        answers = new HashMap<String, String>();
        answers.put("0", "No");
        answers.put("1", "Yes");
        QUESTION_ANSWERS.put(4, answers);

        // Scale (0-3)
        answers = new HashMap<String, String>();
        answers.put("0/3", "0 - Strongly Disagree");
        answers.put("1/3", "1 - Somewhat Agree");
        answers.put("2/3", "2 - Agree");
        answers.put("3/3", "3 - Strongly Agree");
        QUESTION_ANSWERS.put(5, answers);

        // Scale (0-9)
        answers = new HashMap<String, String>();
        for (int i = 0; i < 10; i++) {
            answers.put(i + "/9", "Rating " + i);
        }
        QUESTION_ANSWERS.put(6, answers);

        // Scale (0-4)
        answers = new HashMap<String, String>();
        answers.put("0/4", "0 - Poor");
        answers.put("1/4", "1 - Below Average");
        answers.put("2/4", "2 - Average");
        answers.put("3/4", "3 - Very Good");
        answers.put("4/4", "4 - Excellent");
        QUESTION_ANSWERS.put(7, answers);
    }

    /**
     * Represents the id of scorecard question type.
     */
    private Integer questionType;

    /**
     * Represents the review item answer.
     */
    private String answer;

    /**
     * Empty constructor.
     */
    public ReviewItemAnswerTag() {

    }

    /**
     * Sets the id of scorecard question type.
     * 
     * @param questionType the id of scorecard question type.
     */
    public void setQuestionType(Integer questionType) {
        this.questionType = questionType;
    }

    /**
     * Sets the review item answer.
     * 
     * @param answer the review item answer.
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * <p>
     * Starts processing this tag.
     * </p>
     * 
     * @return {@link #SKIP_BODY} always.
     * @throws JspException
     *             if an unexpected error occurs.
     */
    public int doStartTag() throws JspException {
        if (questionType != null && answer != null && answer.trim().length() > 0) {
            String text = answer;
            if (questionType.intValue() == TEST_CASE_QUESTION_TYPE_ID) {
                text = answer.replace("/", " of ");
            } else {
                if (QUESTION_ANSWERS.containsKey(questionType)
                        && QUESTION_ANSWERS.get(questionType).containsKey(answer)) {
                    text = QUESTION_ANSWERS.get(questionType).get(answer);
                }
            }
            try {
                pageContext.getOut().print(text);
            } catch (Exception e) {
                throw new JspException(e.getMessage());
            }
        }
        return SKIP_BODY;
    }

    /**
     * <p>
     * Releases the resources held by this tag instance.
     * </p>
     */
    public void release() {
        this.answer = null;
        this.questionType = null;
        super.release();
    }
}
