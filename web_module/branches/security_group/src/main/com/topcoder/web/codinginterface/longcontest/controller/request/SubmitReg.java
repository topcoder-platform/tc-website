package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.netCommon.contest.SurveyAnswerData;
import com.topcoder.netCommon.contest.SurveyChoiceData;
import com.topcoder.server.ejb.TestServices.LongContestServicesException;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.i18n.MessageProvider;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.QuestionType;
import com.topcoder.web.common.tag.AnswerInput;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * Registers a coder for a round.
 *
 * @author farsight
 * @version 1.0
 */
public class SubmitReg extends ViewReg {

    // The logger
    protected static final Logger log = Logger.getLogger(SubmitReg.class);

    protected void longContestProcessing() throws TCWebException {

        log.debug("SubmitReg called");

        User user = getAuthentication().getUser();
        // The user must be logged in to register for a round
        if (!SecurityHelper.hasPermission(user, new ClassResource(this.getClass()))) {
            throw new PermissionException(user, new ClassResource(this.getClass()));
        }

        // Gets the round id the user wants to register for
        String roundID = getRequest().getParameter(Constants.ROUND_ID);
        try {
            long userID = user.getId();

            long round = Long.parseLong(roundID);
            if (isUserRegistered(userID, round)) {
                setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getAbsoluteServletPath());
                setIsNextPageInContext(false);
            }

            if (!isRegistrationOpen(round)) {
                throw new NavigationException("Registration is not currently open");
            }

            // Put variables back into the http request
            getRequest().setAttribute(Constants.ROUND_ID, roundID);

            // Gets the user's id

            // Gets a handle to the data source
            DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

            // Load round survey related data
            loadRoundTerms(dai, roundID);
            loadQuestionInfo(dai, roundID);

            String paramName = null;
            List responses = new ArrayList(10); // User's survey responses

            // Go through the params and look for survey questions
            Map questions = new HashMap();
            for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
                paramName = (String) params.nextElement(); // A possible survey question?
                log.debug("param: " + paramName);
                if (paramName.startsWith(AnswerInput.PREFIX)) { // It is if it starts with....
                    SurveyAnswerData r = validateAnswer(paramName); // Get the user's answers for the question
                    if (r != null) {
                        Integer questionID = new Integer(r.getQuestionID());
                        if (questions.containsKey(questionID)) {
                            SurveyAnswerData response = (SurveyAnswerData) questions.get(questionID);
                            response.getChoices().addAll(r.getChoices());
                            response.getAnswers().addAll(r.getAnswers());
                        } else {
                            questions.put(questionID, r);
                            responses.add(r);
                        }
                    }
                }
            }

            // Checks to make sure the user responed to all required questions
            checkRequiredQuestions(responses);

            if (requiresInvitation(round) && !isInvited(user.getId(), round)) {
                throw new NavigationException("Sorry, this round is by invitation only.");
            }

            if (isParallelRound(user.getId(), round)) {
                throw new NavigationException("Sorry, you can not register for this round, you must compete in the version of this round that you were invited to.");
            }

            if (!hasErrors()) { // If the user responded to all the questions, let's go...
                try {
                    LongContestServicesLocator.getService().register((int) round, (int) getUser().getId(), responses);
                } catch (LongContestServicesException e) {
                    throw new NavigationException(MessageProvider.getText(e.getLocalizableMessage()));
                }
            }

            if (hasErrors()) { // The user did not fill in all the survey questions...
                setDefaults(responses);
                setNextPage(Constants.PAGE_VIEW_REG);
                setIsNextPageInContext(true);
            } else { // go to active contest page
                Integer type = (Integer) getRequest().getAttribute(Constants.ROUND_TYPE_ID);
                setNextPage(buildProcessorRequestString("ViewActiveContests",
                        new String[]{Constants.ROUND_TYPE_ID}, new String[]{type.toString()}));
                setIsNextPageInContext(false);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    /**
     * Go through the request and pull out the users answers
     *
     * @param paramName
     * @return a list of the user's responses
     */
    private SurveyAnswerData validateAnswer(String paramName) {

        Question question = null;
        String[] values = getRequest().getParameterValues(paramName);
        SurveyAnswerData response = null;
        String errorKey = null;
        if (values != null) {
            long questionId = -1;
            long answerId = -1;
            for (int i = 0; i < values.length; i++) {
                log.debug("param: " + paramName + " value: " + values[i]);
                /* single choice will be in the format <prefix><question_id>
                 * multiple choice will be in the format <prefix><question_id>,<answer_id>
                 */
                StringTokenizer st = new StringTokenizer(paramName.substring(AnswerInput.PREFIX.length()), ",");
                if (st.hasMoreTokens()) {
                    questionId = Long.parseLong(st.nextToken());
                }
                errorKey = AnswerInput.PREFIX + questionId;
                if (question == null) {
                    question = findQuestion(questionId);
                    if (question == null) {
                        addError(errorKey, "Question doesn't exist");
                        return null;  //quit now
                    }
                }
                Answer answer = null;
                if (st.hasMoreTokens()) {
                    //this must be a multiple choice question
                    try {
                        answerId = Long.parseLong(st.nextToken());
                        answer = findAnswer(answerId, question);
                    } catch (NumberFormatException e) {
                        log.debug("numberformat trying to get answer for multiple choice");
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() != Question.MULTIPLE_CHOICE) {
                        log.debug("param has answerid but it's not multiple choice");
                        addError(errorKey, "Invalid answer.");
                    } else if (answer == null) {
                        log.debug("can't find multiple choice answer");
                        addError(errorKey, "Invalid answer.");
                    }
                } else {
                    //only when it's a multiple choice question should there be multiple answers
                    if (values.length > 1) {
                        log.debug("not multiple choice, but there are multiple answers");
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() == Question.SINGLE_CHOICE) {
                        try {
                            answerId = Long.parseLong(values[i]);
                            answer = findAnswer(answerId, question);
                        } catch (NumberFormatException e) {
                            log.debug("numberformat trying to get answer for single choice");
                            addError(errorKey, "Invalid answer.");
                        }
                        if (answer == null) {
                            log.debug("can't find single choice answer");
                            addError(errorKey, "Invalid answer.");
                        }
                    }
                }
                //This is ugly, we should unify survey management. Using Core services format.
                if (response == null) {
                    response = new SurveyAnswerData((int) questionId, question.getStyleId(), question.isRequired() && question.getType().getId() == QuestionType.ELIGIBLE);
                    ArrayList answers = new ArrayList();
                    ArrayList choices = new ArrayList();
                    response.setAnswers(answers);
                    response.setChoices(choices);
                }
                if (question.isFreeForm()) {
                    String text = StringUtils.checkNull(values[i]).trim();
                    if (text.length() != 0) {
                        response.getAnswers().add(StringUtils.checkNull(values[i]));
                        response.getChoices().add(new SurveyChoiceData(0, "", true));
                    }
                } else {
                    response.getAnswers().add("");
                    response.getChoices().add(new SurveyChoiceData((int) answerId, answer.getText(), answer.isCorrect()));
                }
            }
        }
        log.debug("q: " + question.getId() + "required: " + question.isRequired() + " ret: " + response == null ? 0 : response.getAnswers().size());
        return response;
    }

    // Checks to make sure the user responed to all required questions
    private void checkRequiredQuestions(List responses) {
        Question q = null;
        for (Iterator it = questionInfo.iterator(); it.hasNext();) {
            q = (Question) it.next();
            if (q.isRequired() && !containsQuestion(responses, q)) {
                addError(AnswerInput.PREFIX + q.getId(), "Please respond to this question.");
            }

        }
    }

    // Checks the list of response to see if it contains the given question
    private boolean containsQuestion(List responses, Question question) {
        SurveyAnswerData r = null;
        boolean found = false;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            r = (SurveyAnswerData) it.next();
            found = (r.getQuestionID() == question.getId());
        }
        return found;
    }


    // Returns the Question with the given questionID
    private Question findQuestion(long questionId) {
        Question q = null;
        boolean found = false;
        for (Iterator it = questionInfo.iterator(); it.hasNext() && !found;) {
            q = (Question) it.next();
            found = (q.getId() == questionId);
        }
        return found ? q : null;
    }

    // Returns the Answer with the given answerID
    private Answer findAnswer(long answerId, Question question) {
        Answer a = null;
        log.debug("looking :" + answerId);
        for (Iterator it = question.getAnswerInfo().iterator(); it.hasNext();) {
            a = (Answer) it.next();
            log.debug(a.getId()+"-"+a.getText());
            if (a.getId().longValue() == answerId) {
                log.debug("found");
                return a;
            }
        }
        return null;
    }

    // Set default response answers
    private void setDefaults(List responses) {
        SurveyAnswerData r = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (SurveyAnswerData) it.next();
            Question question = findQuestion(r.getQuestionID());
            if (question.getStyleId() == Question.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + r.getQuestionID() + "," + ((SurveyChoiceData)(r.getChoices().get(0))).getID(), "true");
            } else if (question.isFreeForm()) {
                setDefault(AnswerInput.PREFIX + r.getQuestionID(), r.getAnswers().get(0));
            } else {
                setDefault(AnswerInput.PREFIX + r.getQuestionID(), new Long(((SurveyChoiceData)(r.getChoices().get(0))).getID()));
            }
        }
    }

}