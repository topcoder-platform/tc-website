package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.*;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.SurveyResponse;
import com.topcoder.web.common.tag.AnswerInput;
import com.topcoder.web.ejb.longcompresult.LongCompResult;
import com.topcoder.web.ejb.longcompresult.LongCompResultLocal;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;
import com.topcoder.web.ejb.survey.Response;

import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.util.*;

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

        // The user must be logged in to register for a round
        if (!SecurityHelper.hasPermission(getUser(), new ClassResource(this.getClass()))) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        // Gets the round id the user wants to register for
        String roundID = getRequest().getParameter(Constants.ROUND_ID);
        try {
            long userID = getUser().getId();

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
            for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
                paramName = (String) params.nextElement(); // A possible survey question?
                log.debug("param: " + paramName);
                if (paramName.startsWith(AnswerInput.PREFIX)) { // It is if it starts with....
                    List l = validateAnswer(paramName); // Get the user's answers for the question
                    if (l != null)
                        responses.addAll(l);
                }
            }

            // Checks to make sure the user responed to all required questions
            checkRequiredQuestions(responses);

            if (requiresInvitation(round) && !isInvited(getUser().getId(), round)) {
                throw new NavigationException("Sorry, this round is by invitation only.");
            }

            if (isParallelRound(getUser().getId(), round)) {
                throw new NavigationException("Sorry, you can not register for this round, you must compete in the version of this round that you were invited to.");
            }

            if (!hasErrors()) { // If the user responded to all the questions, let's go...

                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                try {
                    tm.begin();
                    SurveyResponse resp = null;
                    Response response = (Response) createEJB(getInitialContext(), Response.class);
                    // Go through each of the user survey responses and put them into the DB
                    for (Iterator it = responses.iterator(); it.hasNext();) {
                        resp = (SurveyResponse) it.next();
                        if (resp.isFreeForm()) {
                            response.createResponse(resp.getUserId(), resp.getQuestionId(), resp.getText());
                        } else {
                            response.createResponse(resp.getUserId(), resp.getQuestionId(), resp.getAnswerId());
                        }
                    }

                    // register user for round
                    registerUser(userID, Long.parseLong(roundID));

                    tm.commit();
                } catch (Exception e) {
                    if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                        tm.rollback();
                    }
                    throw e;
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
     * Registers user for round
     *
     * @param userID  The coder's ID
     * @param roundID The round's ID
     * @throws Exception
     */
    protected void registerUser(long userID, long roundID) throws Exception {
        try {
            RoundRegistration reg = (RoundRegistration) createEJB(getInitialContext(), RoundRegistration.class);
            LongCompResultLocal longCompResult = (LongCompResultLocal) createLocalEJB(getInitialContext(), LongCompResult.class);
            reg.createRoundRegistration(userID, roundID);
            longCompResult.createLongCompResult(roundID, userID, DBMS.JTS_OLTP_DATASOURCE_NAME);
            longCompResult.setAttended(roundID, userID, false, DBMS.JTS_OLTP_DATASOURCE_NAME);
        } catch (Exception e) {
            log.error("Error registerating user: " + userID + " for round: " + roundID, e);
            throw e;
        }
    }

    /**
     * Go through the request and pull out the users answers
     *
     * @param paramName
     * @return a list of the user's responses
     */
    private List validateAnswer(String paramName) {

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
                if (st.hasMoreTokens()) {
                    //this must be a multiple choice question
                    try {
                        answerId = Long.parseLong(st.nextToken());
                    } catch (NumberFormatException e) {
                        log.debug("numberformat trying to get answer for multiple choice");
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() != Question.MULTIPLE_CHOICE) {
                        log.debug("param has answerid but it's not multiple choice");
                        addError(errorKey, "Invalid answer.");
                    } else if (findAnswer(answerId, question) == null) {
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
                        } catch (NumberFormatException e) {
                            log.debug("numberformat trying to get answer for single choice");
                            addError(errorKey, "Invalid answer.");
                        }
                        if (findAnswer(answerId, question) == null) {
                            log.debug("can't find single choice answer");
                            addError(errorKey, "Invalid answer.");
                        }
                    }
                }
                SurveyResponse response = new SurveyResponse();
                response.setQuestionId(question.getId());
                response.setUserId(getUser().getId());
                if (question.isFreeForm()) {
                    String text = StringUtils.checkNull(values[i]).trim();
                    if (text.length() != 0) {
                        response.setText(StringUtils.checkNull(values[i]));
                        response.setFreeForm(true);
                        ret.add(response);
                    }
                } else {
                    response.setAnswerId(answerId);
                    response.setFreeForm(false);
                    ret.add(response);
                }
            }
        }
        log.debug("q: " + question.getId() + "required: " + question.isRequired() + " ret: " + ret.size());
        return ret;
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
        SurveyResponse r = null;
        boolean found = false;
        for (Iterator it = responses.iterator(); it.hasNext() && !found;) {
            r = (SurveyResponse) it.next();
            found = (r.getQuestionId() == question.getId());
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
        boolean found = false;
        for (Iterator it = question.getAnswerInfo().iterator(); it.hasNext() && !found;) {
            a = (Answer) it.next();
            found = a.getId().equals(new Long(answerId));
        }
        return found ? a : null;
    }

    // Set default response answers
    private void setDefaults(List responses) {
        SurveyResponse r = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (SurveyResponse) it.next();
            if (findQuestion(r.getQuestionId()).getStyleId() == Question.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + r.getQuestionId() + "," + r.getAnswerId(), "true");
            } else if (r.isFreeForm()) {
                setDefault(AnswerInput.PREFIX + r.getQuestionId(), r.getText());
            } else {
                setDefault(AnswerInput.PREFIX + r.getQuestionId(), new Long(r.getAnswerId()));
            }
        }
    }

}
