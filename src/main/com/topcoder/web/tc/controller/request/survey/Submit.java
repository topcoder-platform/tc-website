package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.view.tag.AnswerInput;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.web.ejb.survey.Response;

import javax.naming.InitialContext;
import java.util.*;

public class Submit extends View {
    protected void surveyProcessing() throws TCWebException {

        try {
            String paramName = null;
            for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
                paramName = (String)params.nextElement();
                Question q = validateAnswer(paramName, questionInfo);
                if (hasErrors()) {
                    setNextPage(Constants.SURVEY_VIEW);
                    setIsNextPageInContext(true);
                } else {
                    Answer a = null;
                    Response response = (Response)createEJB(new InitialContext(), Response.class);
                    boolean hasAllFreeForm = true;
                    for (Iterator it = q.getAnswerInfo().iterator(); it.hasNext();) {
                        a = (Answer)it.next();
                        if (q.getStyleId()==Question.MULTIPLE_CHOICE || q.getStyleId()==Question.SINGLE_CHOICE) {
                            response.createResponse(getUser().getId(), q.getId(), a.getId());
                            hasAllFreeForm = false;
                        } else {
                            response.createResponse(getUser().getId(), q.getId());
                            response.setResponseText(getUser().getId(), q.getId(), a.getText());
                        }
                    }
                    if (hasAllFreeForm) {
                        setNextPage(Constants.SURVEY_THANKS);
                        setIsNextPageInContext(true);
                    } else {
                        setNextPage("?" + Constants.MODULE_KEY + "=SurveyResults&"+Constants.SURVEY_ID+"="+survey.getId());
                        setIsNextPageInContext(false);
                    }
                }
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private Question validateAnswer(String paramName, List questions) {

        Question question = null;
        String[] answers = getRequest().getParameterValues(paramName);
        List retAnswers = null;
        if (answers!=null) retAnswers=new ArrayList(answers.length);
        for (int i=0; i<answers.length; i++) {
            long questionId = -1;
            long answerId = -1;
            if (!paramName.startsWith(AnswerInput.PREFIX)) {
                addError(paramName, "Invalid answer.");
            } else {
                StringTokenizer st = new StringTokenizer(paramName.substring(AnswerInput.PREFIX.length()));
                if (st.hasMoreTokens()) {
                    questionId = Long.parseLong(st.nextToken());
                }
                if (question==null) {
                    question = findQuestion(questionId, questions);
                    if (question==null) {
                        addError(paramName, "Question doesn't exist");
                        return null;  //quit now
                    }
                }
                if (st.hasMoreTokens()) {
                    //this must be a multiple choice question
                    answerId = Long.parseLong(st.nextToken());
                    if (question.getStyleId()!=Question.MULTIPLE_CHOICE) {
                        addError(paramName, "Invalid answer.");
                    } else if (findAnswer(answerId, question)==null) {
                        addError(paramName, "Invalid answer.");
                    }
                } else {
                    //only when it's a multiple choice question should there be multiple answers
                    if (answers.length > 1) {
                        addError(paramName, "Invalid answer.");
                    }
                    answerId = Long.parseLong(answers[i]);
                    if (question.getStyleId()==Question.SINGLE_CHOICE && findAnswer(answerId, question)==null) {
                        addError(paramName, "Invalid answer.");
                    }
                }
            }
            if (!hasErrors()) {
                Answer a = new Answer();
                a.setQuestionId(question.getId());
                if (question.getStyleId()==Question.SINGLE_CHOICE || question.getStyleId()==Question.MULTIPLE_CHOICE) {
                    a.setId(answerId);
                } else {
                    a.setText(StringUtils.checkNull(answers[i]));
                }
                retAnswers.add(a);
            }
        }
        question.setAnswerInfo(retAnswers);
        return hasErrors()?null:question;
    }

    private Question findQuestion(long questionId, List questions) {
        Question q = null;
        boolean found = false;
        for (Iterator it = questions.iterator(); it.hasNext()&&!found;) {
            q = (Question)it.next();
            found = (q.getId()==questionId);
        }
        return found?q:null;
    }

    private Answer findAnswer(long answerId, Question question) {
        Answer a = null;
        boolean found = false;
        for (Iterator it = question.getAnswerInfo().iterator(); it.hasNext()&&!found;) {
            a = (Answer)it.next();
            found = (a.getId()==answerId);
        }
        return found?a:null;
    }
}


