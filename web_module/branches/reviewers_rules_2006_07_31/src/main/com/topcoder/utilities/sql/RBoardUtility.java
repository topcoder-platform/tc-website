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
            query.append("select DATE(current) as current_date, DATE(min(p.rating_date)) as last_date, count(*) as num_projects ");
            query.append("from project p, project_result pr, comp_versions cv, comp_catalog cc, category_catalog cac ");
            query.append("where p.comp_vers_id = cv.comp_vers_id and ");
            query.append("cc.component_id = cv.component_id and p.project_id = pr.project_id and ");
            query.append("p.cur_version = 1 and DATE(p.rating_date) >= DATE(current) - ? UNITS DAY and ");
            query.append("cc.root_category_id = cac.category_id and pr.final_score >= ? and ");
            query.append("p.project_type_id = ? and pr.user_id = ? and cac.catalog_id = ? ");
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
                psSelDetails.setInt(1, 90);  // Days to analyze
                psSelDetails.setInt(2, 80);  // score threshold
                psSelDetails.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                psSelDetails.setLong(4, rsUsers.getLong("user_id"));  // user_id
                psSelDetails.setLong(5, rsUsers.getLong("catalog_id"));  // catalog_id

                boolean disqualify = true;
                long daysToBeDisqualified = 0;
                long daysToBeDisqualified2 = 0;
                String reason = " (no submission in the last " + 90 + " days.";

                log.debug("Analyzing user " + rsUsers.getLong("user_id") +
                        " Project Type: " + rsUsers.getInt("project_type_id") +
                        " Catalog Id: " + rsUsers.getLong("catalog_id"));

                rsDetails90 = psSelDetails.executeQuery();
                if (rsDetails90.next()) {
                    if (rsDetails90.getInt("num_projects") > 0) {
                        reason = " (no at least " + 4 + " submissions in the last " + 356 + " days.";

                        daysToBeDisqualified = 90 - (rsDetails90.getDate("current_date").getTime() -
                                rsDetails90.getDate("last_date").getTime()) / (1000*60*60*24);

                        psSelDetails.setInt(1, 356);  // Days to analyze
                        rsDetails356 = psSelDetails.executeQuery();
                        if (rsDetails356.next()) {
                            if (rsDetails356.getInt("num_projects") >= 4) {
                                long pepe = rsDetails356.getDate("current_date").getTime();
                                pepe = rsDetails356.getDate("last_date").getTime();

                                daysToBeDisqualified2 = 356 - (rsDetails356.getDate("current_date").getTime() -
                                        rsDetails356.getDate("last_date").getTime()) / (1000*60*60*24);

                                if (daysToBeDisqualified2 > daysToBeDisqualified) {
                                    daysToBeDisqualified = daysToBeDisqualified2;
                                }
                                disqualify = false;
                            }
                        }
                    }
                }

                if (disqualify) {
                    disqualified++;

                    // this reviewer should be disqualified.
                    psUpd.clearParameters();
                    psUpd.setInt(1, 110);  // status
                    psUpd.setLong(2, rsUsers.getLong("user_id"));  // user_id
                    psUpd.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                    psUpd.setLong(4, rsUsers.getLong("catalog_id"));  // catalog_id

                    if (!onlyAnalyze.equalsIgnoreCase("true")) {
                        psUpd.executeUpdate();
                    }
                    log.debug("Reviewer: " + rsUsers.getLong("user_id") +
                            " Project Type: " + rsUsers.getInt("project_type_id") +
                            " Catalog Id: " + rsUsers.getLong("catalog_id") +
                            " disqualified." + reason);

                    // send mail.
                } else {
                    // alert
                    if (daysToBeDisqualified <= 30) {
                        warnings++;
                        log.debug("Reviewer: " + rsUsers.getLong("user_id") +
                                "Project Type: " + rsUsers.getInt("project_type_id") +
                                "Catalog Id: " + rsUsers.getLong("catalog_id") +
                                "will be disqualified in " + daysToBeDisqualified + " days.");
                    }

                    // send mail.
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
