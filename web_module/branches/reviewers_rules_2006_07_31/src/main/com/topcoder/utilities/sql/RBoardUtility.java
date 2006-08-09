/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
    private static final int MILLIS_IN_DAY = 1000*60*60*24;
    private static final int DAYS_THREE_MONTHS = 90;
    private static final int DAYS_YEAR = 356;
    private static final int DISQUALIFIED_STATUS = 110;
    private static final int QUALIFIED_STATUS = 100;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private int firstWarningInterval = 7;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private int secondWarningInterval = 2;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private int daysBeforeWarning = 30;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private int scoreThreshold = 80;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private int submissionThresholdLastYear = 4;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String adminEmail = null;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String systemEmail = null;


    private StringBuffer digestMail = new StringBuffer(500);

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

        digestMail.append("Today's reviewer movements:\n");
        try {
            query = new StringBuffer(200);
            query.append("select u.handle, ru.user_id, ru.project_type_id, ru.catalog_id, ru.status_id, ru.immune_ind, pt.project_type_name, c.catalog_name, ");
            query.append("(select address from email e where e.user_id = ru.user_id and e.primary_ind = 1) as email_address ");
            query.append("from rboard_user ru, project_type pt, user u, catalog c ");
            query.append("where ru.immune_ind = 0 and ru.status_id in (?, ?) and pt.project_type_id = ru.project_type_id and ru.user_id = u.user_id ");
            query.append("and c.catalog_id = ru.catalog_id ");
            psSelUsers = prepareStatement("tcs_catalog", query.toString());
            psSelUsers.setInt(1, QUALIFIED_STATUS);
            psSelUsers.setInt(2, DISQUALIFIED_STATUS);

            query = new StringBuffer(200);
            query.append("select DATE(current) as current_date, DATE(p.rating_date) as rating_date ");
            query.append("from project p, project_result pr, comp_versions cv, comp_catalog cc, category_catalog cac ");
            query.append("where p.comp_vers_id = cv.comp_vers_id and ");
            query.append("cc.component_id = cv.component_id and p.project_id = pr.project_id and ");
            query.append("p.cur_version = 1 and DATE(p.rating_date) >= DATE(current) - ? UNITS DAY and ");
            query.append("cc.root_category_id = cac.category_id and pr.final_score >= ? and ");
            query.append("p.project_type_id = ? and pr.user_id = ? and cac.catalog_id = ? ");
            query.append("order by DATE(p.rating_date) desc ");
            psSelDetails = prepareStatement("tcs_catalog", query.toString());

            query = new StringBuffer(200);
            query.append("update rboard_user ");
            query.append("set status_id = ? ");
            query.append("where user_id = ? and project_type_id = ? and catalog_id = ? ");
            psUpd = prepareStatement("tcs_catalog", query.toString());

            log.debug("");
            log.debug("-----------------------------------------------");
            rsUsers = psSelUsers.executeQuery();
            int i = 0;
            int j = 0;
            int disqualified = 0;
            int qualified = 0;
            int warnings = 0;
            while (rsUsers.next()) {
                psSelDetails.clearParameters();
                psSelDetails.setInt(1, DAYS_THREE_MONTHS);  // Days to analyze
                psSelDetails.setInt(2, scoreThreshold);  // score threshold
                psSelDetails.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                psSelDetails.setLong(4, rsUsers.getLong("user_id"));  // user_id
                psSelDetails.setLong(5, rsUsers.getLong("catalog_id"));  // catalog_id

                boolean disqualify = true;
                long daysToBeDisqualified = 0;
                long daysToBeDisqualified2 = 0;
                String reason = " (no submission in the last " + DAYS_THREE_MONTHS + " days.";

                log.debug("Analyzing " + ((rsUsers.getInt("ru.status_id") == DISQUALIFIED_STATUS) ? "Inactive" : "Active") +
                        " user " + rsUsers.getLong("user_id") +
                        " Project Type: " + rsUsers.getInt("project_type_id") +
                        " Catalog Id: " + rsUsers.getLong("catalog_id"));

                rsDetails90 = psSelDetails.executeQuery();

                if (rsDetails90.next()) {
                    reason = " (no at least " + submissionThresholdLastYear + " submissions in the last " + DAYS_YEAR + " days.";

                    daysToBeDisqualified = DAYS_THREE_MONTHS - (rsDetails90.getDate("current_date").getTime() -
                            rsDetails90.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

                    psSelDetails.setInt(1, DAYS_YEAR);  // Days to analyze
                    rsDetails356 = psSelDetails.executeQuery();


                    int count = 0;
                    for (;count < submissionThresholdLastYear && rsDetails90.next(); count++);

                    if (count == submissionThresholdLastYear) {
                        daysToBeDisqualified2 = DAYS_YEAR - (rsDetails356.getDate("current_date").getTime() -
                                rsDetails356.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

                        if (daysToBeDisqualified2 < daysToBeDisqualified) {
                            daysToBeDisqualified = daysToBeDisqualified2;
                        }
                        disqualify = false;
                    }
                }

                if (rsUsers.getInt("ru.status_id") == DISQUALIFIED_STATUS) {
                    j++;
                    if (!disqualify) {
                        qualified++;

                        // this reviewer should be activated.
                        psUpd.clearParameters();
                        psUpd.setInt(1, QUALIFIED_STATUS);  // status
                        psUpd.setLong(2, rsUsers.getLong("user_id"));  // user_id
                        psUpd.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                        psUpd.setLong(4, rsUsers.getLong("catalog_id"));  // catalog_id

                        if (!onlyAnalyze.equalsIgnoreCase("true")) {
                            psUpd.executeUpdate();
                        }
                        log.debug("... qualified ");

                        if (qualified < 5) {
                            // send mail.
                            sendActivationMail(rsUsers.getString("handle"), "pwolfus@topcoder.com",
                                    rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"));
    //                        sendDisqualificationMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
    //                                rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"));
                        }
                    }
                } else {
                    i++;
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

                        if (disqualified < 5) {
                            // send mail.
                            sendDisqualificationMail(rsUsers.getString("handle"), "pwolfus@topcoder.com",
                                    rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"));
    //                        sendDisqualificationMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
    //                                rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"));
                        }
                    } else {
                        // alert
                        if (daysToBeDisqualified <= daysBeforeWarning) {
                            warnings++;
                            log.debug("... will be disqualified in " + daysToBeDisqualified + " days  < ------------------------- WARNING!! ");
                            // send mail.
                            if (daysToBeDisqualified % firstWarningInterval == 0 || daysToBeDisqualified == 1 ||
                                (daysToBeDisqualified < firstWarningInterval && daysToBeDisqualified % secondWarningInterval == 0)) {
                                sendWarningMail(rsUsers.getString("handle"), "pwolfus@topcoder.com",
                                        rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"),
                                        daysToBeDisqualified);
    //                            sendWarningMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
    //                                    rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"),
    //                                    daysToBeDisqualified);
                            }
                        } else {
                            log.debug("... ok");
                        }
                    }
                }
            }

            digestMail.append("\n-----------------------------------------------\n");
            digestMail.append("Successfully analyzed " + i + " active reviewers.\n");
            digestMail.append("Successfully analyzed " + j + " inactive reviewers.\n");
            digestMail.append("Successfully disqualified " + disqualified + " reviewers.\n");
            digestMail.append("Successfully qualified " + qualified + " reviewers.\n");
            digestMail.append("Successfully warned " + warnings + " reviewers.\n");

            // send digest mail for admin.
            sendDigestMail();

            log.debug("-----------------------------------------------");
            log.debug("Successfully analyzed " + i + " active reviewers.");
            log.debug("Successfully analyzed " + j + " inactive reviewers.");
            log.debug("Successfully disqualified " + disqualified + " reviewers.");
            log.debug("Successfully qualified " + qualified + " reviewers.");
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
    }

    private void sendDigestMail() throws Exception {
        if (digestMail != null) {
            String emailSubject = "Review Board Digest";

            try {
                sendMail(systemEmail, adminEmail, emailSubject, digestMail.toString());
            } catch (Exception e) {
                throw new Exception("Unable to send digest mail.", e);
            }
        }
    }

    private void sendActivationMail(String handle, String userEmail, String projectTypeName, String catalogName) throws Exception {
        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("We are pleased to inform you that you have been reactivated for performing ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects.\n\n");
        mail.append("Remember that to stay active you must complete at least one project ");
        mail.append("in the last 90 days and four in the last year in the corresponding catalog / ");
        mail.append("development or design with a score equal or higher to 80 in each one.\n\n");
        mail.append("If you have any questions, please contact us at service@topcodersoftware.com.\n\n");
        mail.append("Thank you, \nTopCoder Software.\n");

        String emailSubject = "Review Board: Activation";

        try {
            digestMail.append(" Activated - " + handle + " for " + catalogName + " " + projectTypeName + " projects.\n");
            if (userEmail != null && userEmail != ""){
                sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                log.debug("Sending disq. mail to: " + userEmail);
            } else{
                log.debug("Warning!!! null email for: " + handle);
                digestMail.append("Warning!!! null email for: " + handle + "\n********************** \n\n");
            }
        } catch (Exception e) {
            throw new Exception("Unable to send mails.", e);
        }
    }

    private void sendDisqualificationMail(String handle, String userEmail, String projectTypeName, String catalogName) throws Exception {
        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("We are sorry to inform you that you have been disqualified for performing additional ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects, but you will still be ");
        mail.append("able to complete current ones.\n\n");
        mail.append("This is temporary . You no longer fulfill the rules to be a reviewer, ");
        mail.append("but when this is fixed you will be able to perform reviews again.\n\n");
        mail.append("Note: To be qualified as a reviewer you must complete at least one project ");
        mail.append("in the last 90 days and four in the last year in the corresponding catalog / ");
        mail.append("development or design with a score equal or higher to 80 in each one.\n\n");
        mail.append("If you have any questions, please contact us at service@topcodersoftware.com.\n\n");
        mail.append("Thank you, \nTopCoder Software.\n");

        String emailSubject = "Review Board: Disqualification";

        try {
            digestMail.append(" Disqualified - " + handle + " for " + catalogName + " " + projectTypeName + " projects.\n");
            if (userEmail != null && userEmail != ""){
                sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                log.debug("Sending disq. mail to: " + userEmail);
            } else{
                log.debug("Warning!!! null email for: " + handle);
                digestMail.append("Warning!!! null email for: " + handle + "\n********************** \n\n");
            }
        } catch (Exception e) {
            throw new Exception("Unable to send mails.", e);
        }
    }

    private void sendWarningMail(String handle, String userEmail, String projectTypeName, String catalogName, long daysToBeDisqualified) throws Exception {
        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("This mail is to warn you that in " + daysToBeDisqualified + " day/s you will be disqualified to perform ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects.\n\n");
        mail.append("Note: To be qualified as a reviewer you must complete at least one project ");
        mail.append("in the last 90 days and four in the last year in the corresponding catalog / ");
        mail.append("development or design with a score equal or higher to 80 in each one.\n\n");
        mail.append("If you have any questions, please contact us at service@topcodersoftware.com.\n\n");
        mail.append("Thank you, \nTopCoder Software.\n");

        String emailSubject = "Review Board: Warning";

        try {
            if (userEmail != null && userEmail != ""){
                sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                log.debug("Sending warning mail to: " + userEmail);
            } else{
                log.debug("Warning!!! null email for: " + handle);
                digestMail.append("Warning!!! null email for: " + handle + "\n********************** \n\n");
            }
        } catch (Exception e) {
            throw new Exception("Unable to send mails.", e);
        }
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

        adminEmail = (String) params.get("adminEmail");
        if (adminEmail == null)
            setUsageError("Please specify a adminEmail.\n");
        params.remove("adminEmail");

        systemEmail = (String) params.get("systemEmail");
        if (systemEmail == null)
            setUsageError("Please specify a systemEmail.\n");
        params.remove("systemEmail");

        String temp = (String) params.get("firstWarningInterval");
        if (temp == null)
            setUsageError("Please specify a firstWarningInterval.\n");
        firstWarningInterval = Integer.parseInt(temp);
        params.remove("firstWarningInterval");

        temp = (String) params.get("secondWarningInterval");
        if (temp == null)
            setUsageError("Please specify a secondWarningInterval.\n");
        secondWarningInterval = Integer.parseInt(temp);
        params.remove("secondWarningInterval");

        temp = (String) params.get("daysBeforeWarning");
        if (temp == null)
            setUsageError("Please specify a daysBeforeWarning.\n");
        daysBeforeWarning = Integer.parseInt(temp);
        params.remove("daysBeforeWarning");

        temp = (String) params.get("scoreThreshold");
        if (temp == null)
            setUsageError("Please specify a scoreThreshold.\n");
        scoreThreshold = Integer.parseInt(temp);
        params.remove("scoreThreshold");

        temp = (String) params.get("submissionThresholdLastYear");
        if (temp == null)
            setUsageError("Please specify a submissionThresholdLastYear.\n");
        submissionThresholdLastYear = Integer.parseInt(temp);
        params.remove("submissionThresholdLastYear");

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
        log.debug(to);
        message.setToAddress(to, TCSEmailMessage.TO);
        message.setSubject(subject);
        message.setBody(messageText);
        EmailEngine.send(message);
    }
}
