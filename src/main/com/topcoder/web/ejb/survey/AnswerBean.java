package com.topcoder.web.ejb.survey;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.ejb.EJBException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public class AnswerBean extends BaseEJB {
    private static final Logger log = Logger.getLogger(AnswerBean.class);


    public long createAnswer(long questionId, String text, int sort, String dataSource) {
        log.debug("createAnswr called... question_id=" + questionId + " text=" + text + " sort=" + sort);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        long answerId=0;
        try {
            conn = DBMS.getConnection(dataSource);
            answerId = IdGeneratorClient.getSeqId("SURVEY_SEQ");

            ps = conn.prepareStatement("INSERT INTO answer (answer_id, question_id, answer_text, sort_order) VALUES (?,?,?,?)");
            ps.setLong(1, answerId);
            ps.setLong(2, questionId);
            ps.setString(3, text);
            ps.setInt(4, sort);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating answer question_id=" + questionId + " text=" + text + " sort=" + sort);
        } catch (Exception e) {
            throw new EJBException("Exception creating answer question_id=" + questionId + " text=" + text + " sort=" + sort +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return answerId;
    }

    public void setText(long answerId, String text, String dataSource) {
        update("answer", new String[]{"answer_text"}, new String[] {text},
                new String[] {"answer_id"}, new String[]{String.valueOf(answerId)}, dataSource);

    }

    public void setSort(long answerId, int sort, String dataSource) {
        update("answer", new String[]{"sort_order"}, new String[] {String.valueOf(sort)},
                new String[] {"answer_id"}, new String[]{String.valueOf(answerId)}, dataSource);

    }

    public String getText(long answerId, String dataSource) {
        return selectString("answer", "answer_text", new String[] {"answer_id"},
                new String[] {String.valueOf(answerId)}, dataSource);
    }

    public int getSort(long answerId, String dataSource) {
        return selectInt("answer", "sort_order", new String[] {"answer_id"},
                new String[] {String.valueOf(answerId)}, dataSource).intValue();
    }

    public ResultSetContainer getAnswers(long questionId, String dataSource) {
        return selectSet("answer", new String[] {"answer_id", "question_id", "answer_text", "sort_order"},
                new String[] {"questionId_id"}, new String[] {String.valueOf(questionId)}, dataSource);
    }
}
