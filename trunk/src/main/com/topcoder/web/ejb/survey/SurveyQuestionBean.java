package com.topcoder.web.ejb.survey;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public class SurveyQuestionBean extends BaseEJB {
    private static final Logger log = Logger.getLogger(SurveyQuestionBean.class);

    public void createSurveyQuestion(long surveyId, long questionId, String dataSource) {
        log.debug("createSurveyQuestion called...  surveyid" + surveyId + " questionId" + questionId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);

            ps = conn.prepareStatement("INSERT INTO survey_question(survey_id, question_id) values (?,?)");
            ps.setLong(1, surveyId);
            ps.setLong(2, questionId);
            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException createSurveyQuestion...  surveyid" + surveyId + " questionId" + questionId);
        } catch (Exception e) {
            throw new EJBException("Exception createSurveyQuestion...  surveyid" + surveyId + " questionId" + questionId +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

    }

    public void removeSurveyQuestion(long surveyId, long questionId, String dataSource) {
        delete("survey_question", new String[]{"survey_id", "question_id"},
                new String[]{String.valueOf(surveyId), String.valueOf(questionId)}, dataSource);
    }

    private static final String getQuestions =
            " select q.question_id " +
                    " , q.question_text " +
                    " , q.status_id " +
                    " , q.keyword " +
                    " , q.question_type_id " +
                    " , q.question_style_id " +
                    " , q.is_required " +
                    " from survey_question sq " +
                    " , question q " +
                    " where sq.question_id = q.question_id " +
                    " and sq.survey_id = ?";

    public ResultSetContainer getQuestions(long surveyId, String dataSource) {
        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(getQuestions);
            ps.setLong(1, surveyId);
            rs = ps.executeQuery();
            return new ResultSetContainer(rs);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getQuestions...  surveyid" + surveyId);
        } catch (Exception e) {
            throw new EJBException("Exception getQuestions...  surveyid" + surveyId +
                    ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }


    }


}
