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
import java.sql.Timestamp;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public class SurveyBean extends BaseEJB {

    private static final Logger log = Logger.getLogger(SurveyBean.class);

    public long createSurvey(String name, Timestamp startDate, Timestamp endDate,
                             int statusId, String dataSource) {
        log.debug("createSurvey called...  name " + name + " start " +
                startDate + " end " + endDate + " status " + statusId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        long surveyId = 0;
        try {
            conn = DBMS.getConnection(dataSource);
            surveyId = IdGeneratorClient.getSeqId("SURVEY_SEQ");

            ps = conn.prepareStatement("INSERT INTO survey(survey_id, name, start_date, end_date, status_id) values (?,?,?,?,?)");
            ps.setLong(1, surveyId);
            ps.setString(2, name);
            ps.setTimestamp(3, startDate);
            ps.setTimestamp(4, endDate);
            ps.setInt(5, statusId);
            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException createSurvey...  name=" + name + " start: " + startDate + " end: " +
                    endDate + " status: " + statusId);
        } catch (Exception e) {
            throw new EJBException("Exception createSurvey...  name=" + name + " start: " + startDate + " end: " +
                    endDate + " status " + statusId +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
        return surveyId;
    }

    public void setName(long surveyId, String name, String dataSource) {
        update("survey", new String[]{"name"}, new String[]{name},
                new String[]{"survey_id"}, new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public void setStartDate(long surveyId, Timestamp startDate, String dataSource) {
        updateTimestamp("survey", "start_date", startDate,
                new String[]{"survey_id"}, new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public void setEndDate(long surveyId, Timestamp endDate, String dataSource) {
        updateTimestamp("survey", "end_date", endDate,
                new String[]{"survey_id"}, new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public void setStatusId(long surveyId, int statusId, String dataSource) {
        update("survey", new String[]{"status_id"}, new String[]{String.valueOf(statusId)},
                new String[]{"survey_id"}, new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public void setText(long surveyId, String text, String dataSource) {
        update("survey", new String[]{"text"}, new String[]{text},
                new String[]{"survey_id"}, new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public String getName(long surveyId, String dataSource) {
        return selectString("survey", "name", new String[]{"survey_id"},
                new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public Timestamp getStartDate(long surveyId, String dataSource) {
        return selectTimestamp("survey", "startDate", new String[]{"survey_id"},
                new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public Timestamp getEndDate(long surveyId, String dataSource) {
        return selectTimestamp("survey", "end_date", new String[]{"survey_id"},
                new String[]{String.valueOf(surveyId)}, dataSource);
    }

    public int getStatusId(long surveyId, String dataSource) {
        return selectInt("survey", "status_id", new String[]{"survey_id"},
                new String[]{String.valueOf(surveyId)}, dataSource).intValue();
    }

    public String getText(long surveyId, String dataSource) {
        return selectString("survey", "text", new String[]{"survey_id"},
                new String[]{String.valueOf(surveyId)}, dataSource);
    }


}
