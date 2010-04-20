package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 4, 2006
 */
public class StudioSubmissionRanker {
    private static final Logger log = Logger.getLogger(StudioSubmissionRanker.class);

    public static void main(String[] args) {

        try {
            doit();
        } catch (Throwable e) {
            e.printStackTrace();
        } 
    }


    private static final String SUBMITTERS = "select distinct submitter_id, contest_id from submission where rank is null";
    private static final String SUBMISSIONS = "select submission_id, create_date " +
            "from submission where submitter_id = ? and contest_id = ? " +
            "order by create_date";
    private static final String UPDATE = "update submission set rank = ? where submission_id = ?";

    private static void doit() throws ClassNotFoundException, SQLException {
        Connection conn=null;
        PreparedStatement psSubmitters = null;
        ResultSet submitters = null;
        PreparedStatement psSubmissions = null;
        ResultSet submissions = null;
        PreparedStatement update = null;
        try {
            conn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty("STUDIO_CONNECT_STRING")).getConnection();

            psSubmitters = conn.prepareStatement(SUBMITTERS);
            psSubmissions = conn.prepareStatement(SUBMISSIONS);
            update = conn.prepareStatement(UPDATE);


            submitters = psSubmitters.executeQuery();
            int count = 0;
            while (submitters.next()) {
                long submitterId = submitters.getLong("submitter_id");
                long contestId = submitters.getLong("contest_id");

                psSubmissions.clearParameters();
                psSubmissions.setLong(1, submitterId);
                psSubmissions.setLong(2, contestId);

                submissions = psSubmissions.executeQuery();

                int rank = 1;
                while (submissions.next()) {
                    update.clearParameters();
                    update.setInt(1, rank);
                    update.setLong(2, submissions.getLong("submission_id"));
                    count+=update.executeUpdate();
                    if (count%25==0) {
                        log.info("processed " + count + " records");
                    }
                    rank++;
                }



            }
            log.info("done");

        } finally {
            DBMS.close(update);
            DBMS.close(submissions);
            DBMS.close(psSubmissions);
            DBMS.close(submitters);
            DBMS.close(psSubmitters);
            DBMS.close(conn);

        }

    }
}
