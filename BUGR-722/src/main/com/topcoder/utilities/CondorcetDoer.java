package com.topcoder.utilities;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.survey.Answer;
import com.topcoder.web.ejb.survey.SurveyQuestion;

import javax.naming.InitialContext;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision: 56004 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 9, 2007
 */
public class CondorcetDoer {
    public static void main(String[] args) {
        CondorcetDoer c = new CondorcetDoer();
        try {
            c.doit(Long.parseLong(args[0]));
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }

    }

    private void doit(long surveyId) throws Exception {
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            SurveyQuestion sq = (SurveyQuestion) BaseProcessor.createEJB(ctx, SurveyQuestion.class);
            Answer a = (Answer) BaseProcessor.createEJB(ctx, Answer.class);
            ResultSetContainer questions = sq.getQuestions(surveyId, DBMS.OLTP_DATASOURCE_NAME);

            ResultSetContainer.ResultSetRow question;
            long questionId;
            for (Iterator it = questions.iterator(); it.hasNext();) {
                question = (ResultSetContainer.ResultSetRow) it.next();
                questionId = question.getLongItem("question_id");
                for (int i = 0; i < questions.size(); i++) {
                    a.createAnswer(questionId, String.valueOf(i + 1), i + 1, DBMS.OLTP_DATASOURCE_NAME);
                }
            }
        } finally {
            ApplicationServer.close(ctx);
        }
    }
}


