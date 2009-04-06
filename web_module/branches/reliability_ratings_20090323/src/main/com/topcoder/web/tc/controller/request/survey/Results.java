package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.CacheClient;
import com.topcoder.web.common.cache.CacheClientFactory;
import com.topcoder.web.common.model.Question;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.voting.*;
import com.topcoder.web.tc.Constants;

import java.util.*;

public class Results extends SurveyData {
    protected void surveyProcessing() throws TCWebException {
        //we're assuming that the survey had some questions associated with
        //it originally, and the got pruned because they were all free
        //form questions
        try {
            if (!survey.areResultsViewable() || questionInfo.isEmpty()) {
                setNextPage(Constants.SURVEY_THANKS);
                setIsNextPageInContext(true);
            } else if (((Question) questionInfo.get(0)).getTypeId() == Question.SCHULZE_ELECTION_TYPE) {
                getRequest().setAttribute("results", getResults());
                setNextPage(Constants.SCHULZE_RESULTS);
                setIsNextPageInContext(true);
            } else {
                getRequest().setAttribute("results", getQuestionTotals());
                setNextPage(Constants.SURVEY_RESULTS);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected Map getQuestionTotals() throws Exception {
        Map ret = new HashMap();
        for (Iterator it = questionInfo.iterator(); it.hasNext();) {
            Question q = (Question) it.next();
            Request responseRequest = new Request();
            DataAccessInt dataAccess = getDataAccess();
            responseRequest.setContentHandle("survey_responses");
            responseRequest.setProperty("qid", String.valueOf(q.getId()));
            if (getUser().isAnonymous()) {
                responseRequest.setProperty("cr", "-1");
            } else {
                responseRequest.setProperty("cr", String.valueOf(getUser().getId()));
            }
            ret.put(new Long(q.getId()), (ResultSetContainer) dataAccess.getData(responseRequest).get("response_info"));
        }
        return ret;
    }

    protected final List getQuestionInfo(long surveyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("survey_questions");
        r.setProperty("sid", String.valueOf(surveyId));
        //response data has to be live, no cache
        DataAccessInt dataAccess = getDataAccess();
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("question_list");

        ResultSetContainer.ResultSetRow question;
        List questionList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetContainer.ResultSetRow) it.next();
            int temp = question.getIntItem("question_style_id");
            if (!Question.isFreeForm(temp) &&
                    question.getIntItem("question_type_id") != Question.GENERAL_DO_NOT_SHOW_RESULTS_TYPE) {
                questionList.add(makeQuestion(question));
            }
        }
        return questionList;
    }

    /**
     * @return the results
     */
    protected CondorcetSchulzeResults getResults() throws Exception {

        String key = "condorcet_schulze_election_results:" + survey.getId();
        boolean hasCacheConnection = true;
        CondorcetSchulzeResults results = null;
        CacheClient cc = null;
        try {
            cc = CacheClientFactory.create();
            results = (CondorcetSchulzeResults) (cc.get(key));
        } catch (Exception e) {
            log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
            hasCacheConnection = false;
        }
        /* if it was not found in the cache */
        if (results == null) {
            DataAccessInt dai = getDataAccess(true);
            Request r = new Request();
            r.setContentHandle("condorcet_schulze_results");
            r.setProperty(Constants.SURVEY_ID, String.valueOf(survey.getId()));
            ResultSetContainer rsc = (ResultSetContainer) dai.getData(r).get("condorcet_schulze_results");

            Candidate[] candidates = getCandidates();
            CondorcetSchulzeElection election = new CondorcetSchulzeElection();

            //build a mapping for candidates so that we don't have to create a
            //bunch of Candidates objects when we create the votes
            HashMap map = new HashMap();
            for (int i = 0; i < candidates.length; i++) {
/*
                if (log.isDebugEnabled()) {
                    log.debug("candidate : " + candidates[i].toString());
                }
*/
                map.put(candidates[i].getId(), candidates[i]);
                election.getCandidates().add(candidates[i]);
            }

            ResultSetContainer.ResultSetRow curr;
            long lastUserId = -1;
            RankBallot ballot = null;
            Vote v;
            User u;
            //create the ballots/votes and add them to the election
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                curr = (ResultSetContainer.ResultSetRow) it.next();
                if (lastUserId != curr.getLongItem("user_id")) {
                    if (ballot != null) {
/*
                        if (log.isDebugEnabled()) {
                            log.debug("add ballot: " + ballot.toString());
                        }
*/
                        election.getBallots().add(ballot);
                    }
                    ballot = new RankBallot();
                    ballot.setElection(election);
                    u = new User();
                    u.setId(new Long(curr.getLongItem("user_id")));
                    ballot.setUser(u);
                }
                v = new Vote();
                v.getId().setCandidate((Candidate) map.get(new Long(curr.getLongItem("question_id"))));
                v.setRank(new Integer(curr.getStringItem("sort_order")));
                v.getId().setBallot(ballot);
                ballot.getVotes().add(v);
                lastUserId = curr.getLongItem("user_id");
            }
            if (ballot != null) {
/*
                if (log.isDebugEnabled()) {
                    log.debug("add balot: " + ballot.toString());
                }
*/
                election.getBallots().add(ballot);
            }
/*
            if (log.isDebugEnabled()) {
                log.debug("election: " + election.getSumMatrix().toString());
            }
*/
            results = new CondorcetSchulzeResults(election);
            if (hasCacheConnection) {
                try {
                    cc.set(key, results);
                } catch (Exception e) {
                    log.error("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
                }
            }
        }

        return results;
    }

    protected Candidate[] getCandidates() {
        Candidate[] ret = new Candidate[questionInfo.size()];
        Question q;
        for (int i = 0; i < questionInfo.size(); i++) {
            q = (Question) questionInfo.get(i);
            ret[i] = new Candidate(q.getText());
            ret[i].setId(new Long(q.getId()));
        }
        return ret;
    }


}
