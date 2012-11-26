package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Allows a coder to register for a round.
 *
 * @author farsight
 * @version 1.0
 */
public class ViewReg extends Base {

    // The logger
    protected static final Logger log = Logger.getLogger(ViewReg.class);

    protected List questionInfo = null;

    protected void longContestProcessing() throws TCWebException {

        User user = getAuthentication().getUser();
        // You need to be logged in before continuing...
        if (!SecurityHelper.hasPermission(user, new ClassResource(this.getClass()))) {
            throw new PermissionException(user, new ClassResource(this.getClass()));
        }

        // Get the round ID we want to register for
        String roundID = getRequest().getParameter(Constants.ROUND_ID);

        try {
            long round = Long.parseLong(roundID);
            // Is the coder already registered for the round?
            if (isUserRegistered(user.getId(), round)) {
                Integer type = (Integer) getRequest().getAttribute(Constants.ROUND_TYPE_ID);
                setNextPage(buildProcessorRequestString("ViewActiveContests",
                        new String[]{Constants.ROUND_TYPE_ID}, new String[]{type.toString()}));
                setIsNextPageInContext(false);
            } else if (!isRegistrationOpen(round)) {
                throw new NavigationException("Registration is not currently open");
            } else {

                if (!checkMemberCountry(getUser().getId())) {
                    throw new NavigationException("You are not eligible to participate in this competition. Please contact support@topcoder.com if you have any questions.");
                }

                if (requiresInvitation(round) && !isInvited(user.getId(), round)) {
                    throw new NavigationException("Sorry, this round is by invitation only.");
                }

                if (isParallelRound(user.getId(), round)) {
                    throw new NavigationException("Sorry, you can not register for this round, you must compete in the version of this round that you were invited to.");
                }

                // Get the round terms.
                DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                boolean res = loadRoundTerms(dai, roundID);
                if (!res) { // the round terms were not in the DB
                    throw new TCWebException("Could not find specified round terms.");
                }
                // Get the round questions.
                loadQuestionInfo(dai, roundID);
                // All the data is nicely loaded, now go to the registration page and display it.
                getRequest().setAttribute(Constants.ROUND_ID, roundID);
                setNextPage(Constants.PAGE_VIEW_REG);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    /**
     * Get the terms for the specified round
     *
     * @param dai     Data Access Source
     * @param roundID The specified round id
     * @return True if round terms were loaded properly, false otherwise.
     * @throws Exception Propegates unexpected exeptions
     */
    protected boolean loadRoundTerms(DataAccessInt dai, String roundID) throws Exception {
        // Prepare request
        Request r = new Request();
        r.setContentHandle("long_contest_round_terms");
        r.setProperty("rd", roundID);

        // Get the round term data
        Map m = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_round_terms");

        // Were there round term's in the DB?
        if (rsc.isEmpty()) {
            log.error("Could not find round terms for: " + roundID);
            return false;
        } else {
            getRequest().setAttribute(Constants.ROUND_TERMS_KEY, rsc.getStringItem(0, "terms_content"));
            getRequest().setAttribute(Constants.CONTEST_NAME, rsc.getStringItem(0, "contest_name"));
            getRequest().setAttribute(Constants.ROUND_NAME, rsc.getStringItem(0, "round_name"));
            return true;
        }
    }

    /**
     * Loads the survey questions for the given round into the http request object
     *
     * @param dai     Data source
     * @param roundID The round id to which the survey question's will be retrieved for.
     * @throws Exception Propagates unexpected exceptions
     */
    protected void loadQuestionInfo(DataAccessInt dai, String roundID) throws Exception {
        // Gets the round survey questions
        questionInfo = getQuestionInfo(dai, roundID);
        // Puts those questions into the http request object
        getRequest().setAttribute("questionInfo", questionInfo);
    }

    /**
     * Gets the survey questions for the given round.
     *
     * @param dai     Data source
     * @param roundID The round id to which the survey question's will be retrieved for.
     * @return A list of survey questions for the given round
     * @throws Exception Propagates unexpected exceptions
     */
    protected List getQuestionInfo(DataAccessInt dai, String roundID) throws Exception {

        // Prepare database query request
        Request r = new Request();
        r.setContentHandle("long_contest_round_questions");
        r.setProperty("rd", roundID);

        // Fetch results from DB
        Map qMap = dai.getData(r);

        // These are the questions retrieved from the DB.
        ResultSetContainer questions = (ResultSetContainer) qMap.get("long_contest_round_questions");

        log.debug("got " + questions.size() + " questions");

        // Go through each survey question and packages the question and answers into a nice package. 
        ResultSetRow question = null;
        List questionList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetRow) it.next(); // Get the next question
            questionList.add(makeQuestion(dai, question)); // Packages the question and answers into a nice package.
        }

        // Returns the list of survey questions
        return questionList;
    }

    /**
     * Packages the question and answers into a nice package.
     *
     * @param dai Data source
     * @param row A ResultSetRow representing a survey question
     * @return Q & A package
     * @throws Exception Propagates unexpected exceptions
     */
    private Question makeQuestion(DataAccessInt dai, ResultSetRow row) throws Exception {
        Question q = new Question();
        q.setId(row.getLongItem("question_id"));
        q.setStyleId(row.getIntItem("question_style_id"));
        q.setTypeId(row.getIntItem("question_type_id"));
        q.setText(row.getStringItem("question_text"));
        q.setRequired(true);
        // Get the possible answers to the specified question
        q.setAnswerInfo(makeAnswerInfo(dai, q.getId()));
        return q;
    }

    /**
     * Retrieves the possible answers for a specified survey question.
     *
     * @param dai        Data source
     * @param questionId The survey question of interest
     * @return A list of possible answers to the survey question
     * @throws Exception Propagates unexpected exceptions
     */
    private List makeAnswerInfo(DataAccessInt dai, long questionId) throws Exception {
        // Prepare database query request
        Request req = new Request();

        req.setContentHandle("long_contest_round_questions_answers");
        req.setProperty("qid", String.valueOf(questionId));

        // Fetch results from DB
        ResultSetContainer rsc = (ResultSetContainer) dai.getData(req).get("long_contest_round_questions_answers");

        List ret = null;

        // This is not a valid question id?
        if (rsc == null) {
            log.debug("No answers found for question qid = " + questionId);
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(rsc.size());
            ResultSetRow row = null;
            Answer a = null;
            // Go through each answer and build a collection of them.
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetRow) it.next();
                a = new Answer();
                a.setId(new Long(row.getLongItem("answer_id")));
                a.setQuestionId(row.getLongItem("question_id"));
                a.setSort(row.getIntItem("sort_order"));
                a.setText(row.getStringItem("answer_text"));
                a.setCorrect(new Boolean(row.getIntItem("correct") == 1));
                ret.add(a);
            }
        }

        // Return the collection of possible answers for the specified survey question
        return ret;
    }




    protected boolean isRegistrationOpen(long roundId) throws Exception {
        ResultSetContainer rsc = getRoundInfo(roundId);

        if (rsc.isEmpty()) {
            throw new Exception("Round doesn't exist " + roundId);
        } else {
            Timestamp end = (Timestamp) rsc.getItem(0, "reg_end").getResultData();
            Timestamp start = (Timestamp) rsc.getItem(0, "reg_start").getResultData();
            Timestamp now = new Timestamp(System.currentTimeMillis());
            return now.before(end) && now.after(start);
        }

    }

    /**
     * This method checks if member's country is eligible.
     */
    protected boolean checkMemberCountry(long userId) throws Exception {
        DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("is_eligible_country");
        r.setProperty(Constants.CODER_ID, String.valueOf(userId));
        ResultSetContainer rsc = ((ResultSetContainer) dai.getData(r).get("is_eligible_country"));
        return !rsc.isEmpty();
    }

    //check if the round requires an invitation
    protected boolean requiresInvitation(long roundId) throws Exception {
        boolean ret = getRoundInfo(roundId).getIntItem(0, "invitational") == 1;
        if (log.isDebugEnabled()) {
            log.debug("requiresinvitation " + ret);
        }
        return getRoundInfo(roundId).getIntItem(0, "invitational") == 1;
    }

    //if so, check if the user is invited
    protected boolean isInvited(long userId, long roundId) throws Exception {
        DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("long_contest_check_invite_list");
        r.setProperty(Constants.CODER_ID, String.valueOf(userId));
        r.setProperty(Constants.ROUND_ID, String.valueOf(roundId));
        ResultSetContainer rsc = ((ResultSetContainer) dai.getData(r).get("long_contest_check_invite_list"));
        if (log.isDebugEnabled()) {
            log.debug("isinvited rsc size " + rsc.size());
        }
        return !rsc.isEmpty();
    }

    //check if the round is running in parallel with a tournament version of the round
    //and if the user is invited to the tournament round, don't let them register
    //for this one
    protected boolean isParallelRound(long userId, long roundId) throws Exception {
        DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("long_contest_check_parallel_round");
        r.setProperty(Constants.CODER_ID, String.valueOf(userId));
        r.setProperty(Constants.ROUND_ID, String.valueOf(roundId));
        ResultSetContainer rsc = ((ResultSetContainer) dai.getData(r).get("long_contest_check_parallel_round"));
        if (log.isDebugEnabled()) {
            log.debug("isparrallel rsc size " + rsc.size());
        }
        return !rsc.isEmpty();
    }

}
