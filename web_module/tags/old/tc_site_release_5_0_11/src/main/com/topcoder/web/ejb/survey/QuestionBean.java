package com.topcoder.web.ejb.survey;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

import javax.ejb.EJBException;
import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public class QuestionBean extends BaseEJB {
    private static final Logger log = Logger.getLogger(QuestionBean.class);

    public long createQuestion(String text, int statusId, String keyword, int questionTypeId,
                               int questionStyleId, boolean required, String dataSource) {
        log.debug("createQuestion called...  text=" + text + " status: " + statusId + " keyword: " +
                keyword + " type: " + questionTypeId + " style " + questionStyleId + " required " + required);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        long questionId = 0;
        try {
            conn = DBMS.getConnection(dataSource);
            questionId = IdGeneratorClient.getSeqId("SURVEY_SEQ");

            ps = conn.prepareStatement("INSERT INTO question(question_id, question_text, status_id, keyword, " +
                    " question_type_id, question_style_id, is_required) values (?,?,?,?,?,?,?)");
            ps.setLong(1, questionId);
            ps.setString(2, text);
            ps.setInt(3, statusId);
            ps.setString(4, keyword);
            ps.setInt(5, questionTypeId);
            ps.setInt(6, questionStyleId);
            ps.setInt(7, required ? 1 : 0);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException createQuestion ...  text=" + text + " status: " + statusId + " keyword: " +
                    keyword + " type: " + questionTypeId + " style " + questionStyleId + " required " + required);
        } catch (Exception e) {
            throw new EJBException("Exception createQuestion...  text=" + text + " status: " + statusId + " keyword: " +
                    keyword + " type: " + questionTypeId + " style " + questionStyleId + " required " + required +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return questionId;
    }

    public void setText(long questionId, String text, String dataSource) {
        update("question", new String[]{"question_text"}, new String[]{text},
                new String[]{"question_id"}, new String[]{String.valueOf(questionId)}, dataSource);
    }

    public void setStatusId(long questionId, int statusId, String dataSource) {
        update("question", new String[]{"status_id"}, new String[]{String.valueOf(statusId)},
                new String[]{"question_id"}, new String[]{String.valueOf(questionId)}, dataSource);
    }

    public void setKeyword(long questionId, String keyword, String dataSource) {
        update("question", new String[]{"keyword"}, new String[]{keyword},
                new String[]{"question_id"}, new String[]{String.valueOf(questionId)}, dataSource);
    }

    public void setQuestionTypeId(long questionId, int questionTypeId, String dataSource) {
        update("question", new String[]{"question_type_id"}, new String[]{String.valueOf(questionTypeId)},
                new String[]{"question_id"}, new String[]{String.valueOf(questionId)}, dataSource);
    }

    public void setQuestionStyleId(long questionId, int questionStyleId, String dataSource) {
        update("question", new String[]{"question_style_id"}, new String[]{String.valueOf(questionStyleId)},
                new String[]{"question_id"}, new String[]{String.valueOf(questionId)}, dataSource);
    }

    public void setRequired(long questionId, boolean required, String dataSource) {
        update("question", new String[]{"is_required"}, new String[]{required ? "1" : "0"},
                new String[]{"question_id"}, new String[]{String.valueOf(questionId)}, dataSource);
    }

    public String getText(long questionId, String dataSource) {
        return selectString("question", "question_text", new String[]{"question_id"},
                new String[]{String.valueOf(questionId)}, dataSource);
    }

    public int getStatusId(long questionId, String dataSource) {
        return selectInt("question", "status_id", new String[]{"question_id"},
                new String[]{String.valueOf(questionId)}, dataSource).intValue();
    }

    public String getKeyword(long questionId, String dataSource) {
        return selectString("question", "keyword", new String[]{"question_id"},
                new String[]{String.valueOf(questionId)}, dataSource);
    }

    public int getQuestionTypeId(long questionId, String dataSource) {
        return selectInt("question", "question_type_id", new String[]{"question_id"},
                new String[]{String.valueOf(questionId)}, dataSource).intValue();
    }

    public int getQuestionStyleId(long questionId, String dataSource) {
        return selectInt("question", "question_style_id", new String[]{"question_id"},
                new String[]{String.valueOf(questionId)}, dataSource).intValue();
    }

    public boolean isRequired(long questionId, String dataSource) {
        return selectInt("question", "is_required", new String[]{"question_id"},
                new String[]{String.valueOf(questionId)}, dataSource).equals(new Integer(1));
    }

}
