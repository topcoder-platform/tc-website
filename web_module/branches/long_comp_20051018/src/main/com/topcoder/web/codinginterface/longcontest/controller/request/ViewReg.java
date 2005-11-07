package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Answer;
import com.topcoder.web.common.model.Question;

public class ViewReg extends Base {

    protected static final Logger log = Logger.getLogger(ViewReg.class);

    protected List questionInfo = null;
    
    protected void businessProcessing() throws TCWebException {

    	if(getUser().isAnonymous()) {            
			throw new PermissionException(getUser(), new ClassResource(this.getClass()));                		
    	}
    	
    	String roundID = getRequest().getParameter(Constants.ROUND_ID);

    	try {
	    	DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
	    	loadRoundTerms(dai, roundID);
	    	loadQuestionInfo(dai, roundID);
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new TCWebException("Error retrieving page.");
    	}
    	getRequest().setAttribute(Constants.ROUND_ID, roundID);
    	setNextPage(Constants.PAGE_VIEW_REG);
    	setIsNextPageInContext(true);
    }

    protected void loadRoundTerms(DataAccessInt dai, String roundID) throws Exception {
    	Request r = new Request();
    	r.setContentHandle("long_contest_round_terms");
    	r.setProperty("rd", roundID);
    	
    	Map m = dai.getData(r);
    	ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_round_terms");

    	if(rsc.isEmpty()) {
    		log.error("Could not find round terms for: " + roundID);
    		throw new TCWebException("Error retrieving page.");
    	} else {	    		
    		getRequest().setAttribute(Constants.ROUND_TERMS_KEY, rsc.getStringItem(0, "terms_content"));
    	}
    }
    
    protected void loadQuestionInfo(DataAccessInt dai, String roundID) throws Exception {
    	questionInfo = getQuestionInfo(dai, roundID);
    	getRequest().setAttribute("questionInfo", questionInfo);
    }
    
    protected List getQuestionInfo(DataAccessInt dai, String roundID) throws Exception {
        Request r = new Request();
        r.setContentHandle("long_contest_round_questions");
        r.setProperty("rd", roundID);
        Map qMap = dai.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("long_contest_round_questions");

        log.debug("got " + questions.size() + " questions");

        ResultSetRow question = null;
        List questionList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetRow) it.next();
            questionList.add(makeQuestion(dai, question));
        }
        return questionList;
    }

    private Question makeQuestion(DataAccessInt dai, ResultSetRow row) throws Exception {
        Question q = new Question();
        q.setId(row.getLongItem("question_id"));
        q.setStyleId(row.getIntItem("question_style_id"));
        q.setTypeId(row.getIntItem("question_type_id"));
        q.setText(row.getStringItem("question_text"));
        q.setRequired(true);
        q.setAnswerInfo(makeAnswerInfo(dai, q.getId()));
        return q;
    }

    private List makeAnswerInfo(DataAccessInt dai, long questionId) throws Exception {
        Request req = new Request();
        req.setContentHandle("long_contest_round_questions_answers");
        req.setProperty("qid", String.valueOf(questionId));
        ResultSetContainer rsc = (ResultSetContainer) dai.getData(req).get("long_contest_round_questions_answers");
        List ret = null;
        if (rsc == null) {
        	log.debug("No answers found for question qid = " + questionId);
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(rsc.size());
            ResultSetRow row = null;
            Answer a = null;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetRow) it.next();
                a = new Answer();
                a.setId(row.getLongItem("answer_id"));
                a.setQuestionId(row.getLongItem("question_id"));
                a.setSort(row.getIntItem("sort_order"));
                a.setText(row.getStringItem("answer_text"));
                ret.add(a);
            }
        }

        return ret;
    }
}
