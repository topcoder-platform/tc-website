/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <strong>Purpose</strong>:
 * Utility to maintain review boards.
 *
 * This utility analyze the rboard and disqualify the users that cannot be reviewers anymore.
 *
 * @author pulky
 * @version 1.0.0
 */
public class RBoardUtility extends DBUtility{
    private static final int SCORE_THRESHOLD = 80;
    private static final int SUBMISSION_THRESHOLD_LAST_YEAR = 4;
    private static final int MILLIS_IN_DAY = 1000*60*60*24;
    private static final int DAYS_THREE_MONTHS = 90;
    private static final int DAYS_YEAR = 356;
    private static final int DISQUALIFIED_STATUS = 110;
    private static final int DAYS_BEFORE_WARNING = 60;
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    /**
     * Runs the RBoardUtility.
     *
     */
    public void runUtility() throws Exception {
        PreparedStatement psSelUsers = null;
        PreparedStatement psSelDetails = null;
        PreparedStatement psUpd = null;

        ResultSet rsUsers = null;
        ResultSet rsDetails90 = null;
        ResultSet rsDetails356 = null;
        StringBuffer query = null;

        try {
            query = new StringBuffer(200);
            query.append("select user_id, project_type_id, catalog_id, status_id, immune_ind ");
            query.append("from rboard_user2 ru ");
            query.append("where ru.immune_ind = 0 and status_id = ? ");
            psSelUsers = prepareStatement("tcs_catalog", query.toString());
            psSelUsers.setString(1, "100");

            query = new StringBuffer(200);
            query.append("select DATE(current) + 30 UNITS DAY as current_date, DATE(p.rating_date) as rating_date ");
            query.append("from project p, project_result pr, comp_versions cv, comp_catalog cc, category_catalog cac ");
            query.append("where p.comp_vers_id = cv.comp_vers_id and ");
            query.append("cc.component_id = cv.component_id and p.project_id = pr.project_id and ");
            query.append("p.cur_version = 1 and DATE(p.rating_date) >= DATE(current) - ? UNITS DAY and ");
            query.append("cc.root_category_id = cac.category_id and pr.final_score >= ? and ");
            query.append("p.project_type_id = ? and pr.user_id = ? and cac.catalog_id = ? ");
            query.append("order by DATE(p.rating_date) desc ");
            psSelDetails = prepareStatement("tcs_catalog", query.toString());

            query = new StringBuffer(200);
            query.append("update rboard_user2 ");
            query.append("set status_id = ? ");
            query.append("where user_id = ? and project_type_id = ? and catalog_id = ? ");
            psUpd = prepareStatement("tcs_catalog", query.toString());

            log.debug("");
            log.debug("-----------------------------------------------");
            rsUsers = psSelUsers.executeQuery();
            int i = 0;
            int disqualified = 0;
            int warnings = 0;
            for (; rsUsers.next(); i++ ) {
                psSelDetails.clearParameters();
                psSelDetails.setInt(1, DAYS_THREE_MONTHS);  // Days to analyze
                psSelDetails.setInt(2, SCORE_THRESHOLD);  // score threshold
                psSelDetails.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                psSelDetails.setLong(4, rsUsers.getLong("user_id"));  // user_id
                psSelDetails.setLong(5, rsUsers.getLong("catalog_id"));  // catalog_id

                boolean disqualify = true;
                long daysToBeDisqualified = 0;
                long daysToBeDisqualified2 = 0;
                String reason = " (no submission in the last " + DAYS_THREE_MONTHS + " days.";

                log.debug("Analyzing user " + rsUsers.getLong("user_id") +
                        " Project Type: " + rsUsers.getInt("project_type_id") +
                        " Catalog Id: " + rsUsers.getLong("catalog_id"));

                rsDetails90 = psSelDetails.executeQuery();

                if (rsDetails90.next()) {
                    reason = " (no at least " + SUBMISSION_THRESHOLD_LAST_YEAR + " submissions in the last " + DAYS_YEAR + " days.";

                    daysToBeDisqualified = DAYS_THREE_MONTHS - (rsDetails90.getDate("current_date").getTime() -
                            rsDetails90.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

                    psSelDetails.setInt(1, DAYS_YEAR);  // Days to analyze
                    rsDetails356 = psSelDetails.executeQuery();


                    int count = 0;
                    for (;count < SUBMISSION_THRESHOLD_LAST_YEAR && rsDetails90.next(); count++);

                    if (count == SUBMISSION_THRESHOLD_LAST_YEAR) {
                        daysToBeDisqualified2 = DAYS_YEAR - (rsDetails356.getDate("current_date").getTime() -
                                rsDetails356.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

                        if (daysToBeDisqualified2 > daysToBeDisqualified) {
                            daysToBeDisqualified = daysToBeDisqualified2;
                        }
                        disqualify = false;
                    }
                }

                if (disqualify) {
                    disqualified++;

                    // this reviewer should be disqualified.
                    psUpd.clearParameters();
                    psUpd.setInt(1, DISQUALIFIED_STATUS);  // status
                    psUpd.setLong(2, rsUsers.getLong("user_id"));  // user_id
                    psUpd.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                    psUpd.setLong(4, rsUsers.getLong("catalog_id"));  // catalog_id

                    if (!onlyAnalyze.equalsIgnoreCase("true")) {
                        psUpd.executeUpdate();
                    }
                    log.debug("... disqualified " + reason);

                    // send mail.
                } else {
                    // alert
                    if (daysToBeDisqualified <= DAYS_BEFORE_WARNING) {
                        warnings++;
                        log.debug("... will be disqualified in " + daysToBeDisqualified + " days  < ------------------------- WARNING!! ");
                        // send mail.
                    } else {
                        log.debug("... ok");
                    }
                }
            }
            log.debug("-----------------------------------------------");
            log.debug("Successfully analyzed " + i + " active reviewers.");
            log.debug("Successfully disqualified " + disqualified + " reviewers.");
            log.debug("Successfully warned " + warnings + " reviewers.");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("PaymentFixUtility failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psSelUsers);
            DBMS.close(psSelDetails);
            DBMS.close(rsUsers);
            DBMS.close(psUpd);
        }

        /*StringBuffer mail = new StringBuffer();
        mail.append("The following project: \n\n");
        mail.append("\n\nhas completed appeals phase with all");
        mail.append(" appeals responded.");
        String emailSubject =
            "AutoPilotTimer: Appeals Notification (All Appeals responded)";

        String email = "pwolfus@topcoder.com";

        sendMail("autopilot@topcoder.com", email, emailSubject,
                mail.toString());*/

    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null)
            setUsageError("Please specify a onlyAnalyze.\n");

        params.remove("onlyAnalyze");

        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the PaymentFixUtility.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PaymentFixUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -sourcedb URL : URL of source database.\n");
        sErrorMsg.append("   -startDate : the start date to analyze..\n");
        sErrorMsg.append("   -endDate : the end date to analyze..\n");
        sErrorMsg.append("   -onlyAnalyze : wheter to just analyze without updates.\n");
        fatal_error();
    }

    private static void sendMail(String from, String to, String subject, String messageText) throws Exception {
        TCSEmailMessage message = new TCSEmailMessage();
        message.setFromAddress(from);
        message.setToAddress(to, TCSEmailMessage.TO);
        message.setSubject(subject);
        message.setBody(messageText);
        EmailEngine.send(message);
    }
}
