package com.topcoder.web.common;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.Response;
import com.topcoder.web.common.model.Survey;
import com.topcoder.web.common.tag.AnswerInput;

public class SurveyHelper {
    protected static final Logger log = Logger.getLogger(SurveyHelper.class);
    private TCRequest request = null;
    private Map errors = new HashMap();

    public SurveyHelper() {
        super();
    }

    public SurveyHelper(TCRequest request) {
        super();
        this.request = request;
    }

    public Response findResponse(Collection responses, long questionId) {
        Response r = null;
        boolean found = false;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            r = (Response) it.next();
            found = (r.getQuestion().getId() == questionId);
        }
        return found ? r : null;
    }

    public List processResponses(Survey s) {
        String paramName = null;
        List responses = new ArrayList(10);
        for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
            paramName = (String) params.nextElement();
            if (log.isDebugEnabled()) {
                log.debug("param: " + paramName);
            }
            if (paramName.startsWith(AnswerInput.PREFIX)) {
                List l = validateAnswer(s.getQuestions(), paramName);
                if (l != null)
                    responses.addAll(l);
            }
        }
        return responses;
    }
    

    /**
     * Go through the request and pull out the users answers
     *
     * @param paramName
     * @return a list of the user's responses
     */
    private List validateAnswer(Set questions, String paramName) {
        Question question = null;
        String[] values = getRequest().getParameterValues(paramName);
        List ret = null;
        String errorKey = null;
        if (values == null) {
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(values.length);
            long questionId = -1;
            long answerId = -1;
            for (int i = 0; i < values.length; i++) {
                if (log.isDebugEnabled()) {
                    log.debug("param: " + paramName + " value: " + values[i]);
                }
                /* single choice will be in the format <prefix><question_id>
                 * multiple choice will be in the format <prefix><question_id>,<answer_id>
                 */
                StringTokenizer st = new StringTokenizer(paramName.substring(AnswerInput.PREFIX.length()), ",");
                if (st.hasMoreTokens()) {
                    questionId = Long.parseLong(st.nextToken());
                }
                errorKey = AnswerInput.PREFIX + questionId;
                if (question == null) {
                    question = findQuestion(questions, questionId);
                    if (question == null) {
                        addError(errorKey, "Question doesn't exist");
                        return null;  //quit now
                    }
                }
                if (st.hasMoreTokens()) {
                    //this must be a multiple choice question
                    try {
                        answerId = Long.parseLong(st.nextToken());
                    } catch (NumberFormatException e) {
                        if (log.isDebugEnabled()) {
                            log.debug("numberformat trying to get answer for multiple choice");
                        }
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() != Question.MULTIPLE_CHOICE) {
                        if (log.isDebugEnabled()) {
                            log.debug("param has answerid but it's not multiple choice");
                        }
                        addError(errorKey, "Invalid answer.");
                    } else if (question.findAnswer(answerId) == null) {
                        if (log.isDebugEnabled()) {
                            log.debug("can't find multiple choice answer");
                        }
                        addError(errorKey, "Invalid answer.");
                    }
                } else {
                    //only when it's a multiple choice question should there be multiple answers
                    if (values.length > 1) {
                        if (log.isDebugEnabled()) {
                            log.debug("not multiple choice, but there are multiple answers");
                        }
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getTypeId() == Question.SCHULZE_ELECTION_TYPE) {
                        if (!"".equals(values[i])) {
                            try {
                                answerId = Long.parseLong(values[i]);
                            } catch (NumberFormatException e) {
                                if (log.isDebugEnabled()) {
                                    log.debug("numberformat trying to get answer for single choice");
                                }
                                addError(errorKey, "Invalid answer.");
                            }
                            if (question.findAnswer(answerId) == null) {
                                if (log.isDebugEnabled()) {
                                    log.debug("can't find single choice answer");
                                }
                                addError(errorKey, "Invalid answer.");
                            }
                        }
                    } else if (question.getStyleId() == Question.SINGLE_CHOICE) {
                        try {
                            answerId = Long.parseLong(values[i]);
                        } catch (NumberFormatException e) {
                            if (log.isDebugEnabled()) {
                                log.debug("numberformat trying to get answer for single choice");
                            }
                            addError(errorKey, "Invalid answer.");
                        }
                        if (question.findAnswer(answerId) == null) {
                            if (log.isDebugEnabled()) {
                                log.debug("can't find single choice answer");
                            }
                            addError(errorKey, "Invalid answer.");
                        }
                    }
                }
                Response response = new Response();
                response.setQuestion(question);
                Answer a = question.findAnswer(answerId);
                response.setAnswer(a);
                response.setText(a == null ? StringUtils.checkNull(values[i]) : null);
                ret.add(response);
            }
        }

        log.debug("q: " + question.getId() + "required: " + question.isRequired() + " ret: " + ret.size());
        return ret;
    }

    public void checkRequiredQuestions(Survey s, List responses) {
        Question q = null;
        for (Iterator it = s.getQuestions().iterator(); it.hasNext();) {
            q = (Question) it.next();
            if (q.isRequired() && !containsQuestion(responses, q)) {
                addError(AnswerInput.PREFIX + q.getId(), "Please respond to this question.");
            }

        }
    }

    private boolean containsQuestion(List responses, Question question) {
        Response r = null;
        boolean found = false;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            r = (Response) it.next();
            found = (r.getQuestion().getId() == question.getId());
        }
        return found;
    }

    private Question findQuestion(Set questions, long questionId) {
        Question q = null;
        boolean found = false;
        for (Iterator it = questions.iterator(); it.hasNext() && !found;) {
            q = (Question) it.next();
            found = (q.getId() == questionId);
        }
        return found ? q : null;
    }

    public Map getErrors() {
        return errors;
    }

    public void setErrors(Map errors) {
        this.errors = errors;
    }

    protected void addError(String key, Object error) {
        errors.put(key, error);
    }

    public boolean hasErrors() {
        return errors.size() > 0;
    }
    
    public TCRequest getRequest() {
        return request;
    }

    public void setRequest(TCRequest request) {
        this.request = request;
    }

}
