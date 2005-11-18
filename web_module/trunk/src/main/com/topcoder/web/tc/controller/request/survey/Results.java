package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.voting.*;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.Question;

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
                setNextPage(Constants.SURVEY_RESULTS);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected List makeAnswerInfo(long questionId) throws Exception {
        Request responseRequest = new Request();
        DataAccessInt dataAccess = getDataAccess();
        responseRequest.setContentHandle("survey_responses");
        responseRequest.setProperty("qid", String.valueOf(questionId));
        return (ResultSetContainer) dataAccess.getData(responseRequest).get("response_info");
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
            cc = CacheClientFactory.createCacheClient();
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

            //build a mapping for candidates so that we don't have to create a
            //bunch of Candidates objects when we create the votes
            HashMap map = new HashMap();
            for (int i = 0; i < candidates.length; i++) {
                map.put(new Long(candidates[i].getId()), candidates[i]);
            }

            CondorcetSchulzeElection election = new CondorcetSchulzeElection();
            ResultSetContainer.ResultSetRow curr;
            long lastUserId = 0;
            RankBallot ballot = null;
            //create the ballots/votes and add them to the election
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                curr = (ResultSetContainer.ResultSetRow) it.next();
                if (lastUserId != curr.getLongItem("user_id")) {
                    if (ballot != null) {
                        election.addBalot(ballot);
                    }
                    log.debug("add balot");
                    ballot = new RankBallot(candidates);
                }
                log.debug("add vote");
                ballot.add(new Vote((Candidate) map.get(new Long(curr.getLongItem("question_id"))),
                        Integer.parseInt(curr.getStringItem("answer_text"))));
            }
            if (ballot != null) {
                election.addBalot(ballot);
            }
            log.debug("election: " + election.getSumMatrix().toString());
            results = new CondorcetSchulzeResults(election);
            if (hasCacheConnection) {
                try {
                    cc.set(key, results, DataAccessConstants.DEFAULT_EXPIRE_TIME);
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
            ret[i] = new Candidate(q.getText(), q.getId());
        }
        return ret;
    }


}
