package com.topcoder.utilities;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.model.QuestionType;
import com.topcoder.web.common.model.QuestionStyle;
import com.topcoder.web.ejb.survey.Survey;
import com.topcoder.web.ejb.survey.Question;
import com.topcoder.web.ejb.survey.Answer;
import com.topcoder.web.ejb.survey.SurveyQuestion;

import javax.naming.InitialContext;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Timestamp;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 18, 2007
 */
public class PostTournamentSurveyHelper {
    private static Logger log = Logger.getLogger(PostTournamentSurveyHelper.class);

    public static void main(String[] args) {
        if (args.length!=2) {
            System.out.println("usage: java " + PostTournamentSurveyHelper.class.getName() + " <filename> <survey name>");
            System.exit(1);
        } else {
            try {
                doit(args[0], args[1]);
            } catch (Exception e) {
                e.printStackTrace();
                System.exit(1);
            }
        }
    }

    private static void doit(String s, String name) throws Exception {
        BufferedReader br = new BufferedReader(new FileReader(s));

        //create survey
        InitialContext ctx = null;

        long surveyId = 0;
        try {
            ctx = TCContext.getInitial();
            Survey survey = (Survey)BaseProcessor.createEJB(ctx, Survey.class);
            Question q = (Question)BaseProcessor.createEJB(ctx, Question.class);
            Answer a  = (Answer)BaseProcessor.createEJB(ctx, Answer.class);
            SurveyQuestion sq = (SurveyQuestion)BaseProcessor.createEJB(ctx, SurveyQuestion.class);

            surveyId = survey.createSurvey(name, new Timestamp(System.currentTimeMillis()), new Timestamp(System.currentTimeMillis()),
                    83, false, DBMS.OLTP_DATASOURCE_NAME);

            log.debug("id " + surveyId);

            String line;
            while ((line = br.readLine()) !=null) {
                if (Character.isDigit(line.charAt(0))) {
                    createRatingQuestion(surveyId, line, q, a, sq);
                } else if (line.startsWith("Please") && line.endsWith(":")) {
                    createLongAnswerQuestion(surveyId, line, q, sq);
                } else {
                    throw new RuntimeException("Can not recognize line " + line);
                }
            }
        } finally {
            ApplicationServer.close(ctx);
        }



    }

    private static void createLongAnswerQuestion(long surveyId, String line, Question q, SurveyQuestion sq) throws RemoteException {

        long questionId = q.createQuestion(line.trim(), 83, "", QuestionType.TOURNAMENT_SURVEY_QUESTION,
                QuestionStyle.LONG_ANSWER, false, DBMS.OLTP_DATASOURCE_NAME);
        sq.createSurveyQuestion(surveyId, questionId, DBMS.OLTP_DATASOURCE_NAME);


    }

    private static void createRatingQuestion(long surveyId, String line, Question q, Answer a, SurveyQuestion sq) throws RemoteException {
        long questionId = q.createQuestion(line.substring(line.indexOf(".")+1).trim(), 83, "", QuestionType.TOURNAMENT_SURVEY_QUESTION,
                QuestionStyle.SINGLE_CHOICE, false, DBMS.OLTP_DATASOURCE_NAME);
        sq.createSurveyQuestion(surveyId, questionId, DBMS.OLTP_DATASOURCE_NAME);
        for (int i=0; i<5; i++) {
            String text;
            switch (i) {
                case 0: text = "1 = strongly disagree"; break;
                case 1: text = "2 = disagree"; break;
                case 2: text = "3 = somewhat agree"; break;
                case 3: text = "4 = agree"; break;
                case 4: text = "5 = Strongly agree"; break;
                default: throw new RuntimeException("hell!!!");
            }
            a.createAnswer(questionId, text, i+1, DBMS.OLTP_DATASOURCE_NAME);
        }
    }


}
