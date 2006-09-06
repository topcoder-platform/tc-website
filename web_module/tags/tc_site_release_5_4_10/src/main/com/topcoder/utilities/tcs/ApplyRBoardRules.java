/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.tcs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <strong>Purpose</strong>:
 * Utility to qualify/disqualify reviewers sistematically.
 *
 * This utility analyzes the reviwers for a set of rules and decide whether to qualify
 * inactive reviewers or disqualify active ones. It also sends the corresponding notifications
 * and warnings for reviewers that are "about" to be disqualified.
 *
 * @author pulky
 * @version 1.0.0
 */
public class ApplyRBoardRules extends DBUtility {
    /**
     * Milliseconds in a day.
     */
    private static final int MILLIS_IN_DAY = 1000*60*60*24;

    /**
     * Days assumed for the three months rule.
     */
    private static final int DAYS_THREE_MONTHS = 90;

    /**
     * Days assumed for the year rule.
     */
    private static final int DAYS_YEAR = 356;

    /**
     * Status of disqualified reviewers.
     */
    private static final int DISQUALIFIED_STATUS = 110;

    /**
     * Status of active reviewers.
     */
    private static final int QUALIFIED_STATUS = 100;

    /**
     * This variable tells the first day's interval in which send warning mails.
     */
    private int firstWarningInterval = 7;

    /**
     * This variable tells the day's interval to send warning mails after first interval has been reached.
     */
    private int secondWarningInterval = 2;

    /**
     * This variable tells the minimum amount of days to be disqualified to send a warning.
     */
    private int daysBeforeWarning = 30;

    /**
     * This variable tells the project's minimum score to be taken into consideration for the restrictions.
     */
    private int scoreThreshold = 80;

    /**
     * This variable tells how many submissions should be in the last year.
     */
    private int submissionThresholdLastYear = 4;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    /**
     * This variable tells if the process should send mails.
     */
    private String sendMails = null;

    /**
     * This variable stores the admin email address.
     */
    private String adminEmail = null;

    /**
     * This variable stores the system email address.
     */
    private String systemEmail = null;

    /**
     * This variable stores the digest mail text to be sent to the admin.
     */
    private StringBuffer digestMail = new StringBuffer(500);

    /**
     * Runs the ApplyRBoardRules utility.
     *
     * This utility analyzes the reviwers for a set of rules and decide whether to qualify
     * inactive reviewers or disqualify active ones. It also sends the corresponding notifications
     * and warnings for reviewers that are "about" to be disqualified.
     *
     */
    public void runUtility() throws Exception {
        PreparedStatement psSelUsers = null;
        PreparedStatement psSelDetails = null;

        ResultSet rsUsers = null;
        ResultSet rsDetails90 = null;
        ResultSet rsDetails356 = null;

        digestMail.append("Today's reviewer movements:\n\n");
        try {
            psSelUsers = prepareUsersStatement();
            psSelDetails = prepareDetailsStatement();

            log.debug("");
            log.debug("-----------------------------------------------");
            rsUsers = psSelUsers.executeQuery();

            // some counters interesting for statistics.
            int activeReviewersCount = 0;
            int inactiveReviewersCount = 0;
            int disqualifiedReviewersCount = 0;
            int qualifiedReviewersCount = 0;
            int warnedReviewersCount = 0;

            while (rsUsers.next()) {
                boolean disqualify = true;
                long daysToBeDisqualified = 0;
                long daysToBeDisqualified2 = 0;
                String logMsg = "";

                psSelDetails.clearParameters();
                psSelDetails.setInt(1, DAYS_THREE_MONTHS);  // Days to analyze
                psSelDetails.setInt(2, scoreThreshold);  // score threshold
                psSelDetails.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                psSelDetails.setLong(4, rsUsers.getLong("user_id"));  // user_id
                psSelDetails.setLong(5, rsUsers.getLong("catalog_id"));  // catalog_id

                String possibleDisqualificationReason = " (no submission in the last " + DAYS_THREE_MONTHS + " days.";

                /*log.debug("Analyzing " + ((rsUsers.getInt("status_id") == DISQUALIFIED_STATUS) ? "Inactive" : "Active") +
                        " user " + rsUsers.getLong("user_id") + "("+ rsUsers.getString("handle") + ")" +
                        " Project Type: " + rsUsers.getString("project_type_name") +
                        " Catalog Id: " + rsUsers.getString("catalog_name"));*/

                logMsg = " - <" + rsUsers.getString("handle") + "> <" + rsUsers.getString("project_type_name") + "> <" +
                    rsUsers.getString("catalog_name") + ">";


                rsDetails90 = psSelDetails.executeQuery();

                if (rsDetails90.next()) {
                    // passed the 90 days rule successfully.

                    possibleDisqualificationReason = " (no at least " + submissionThresholdLastYear + " submissions in the last " + DAYS_YEAR + " days.";

                    // calculates how many days will be needed to be disqualified with the 90 days rule.
                    daysToBeDisqualified = DAYS_THREE_MONTHS - (rsDetails90.getDate("current_date").getTime() -
                        rsDetails90.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

                    psSelDetails.setInt(1, DAYS_YEAR);  // Days to analyze
                    rsDetails356 = psSelDetails.executeQuery();

                    // counts submissions
                    int count = 0;
                    for (;count < submissionThresholdLastYear && rsDetails90.next(); count++);

                    if (count == submissionThresholdLastYear) {
                        // passed the last year rule successfully.

                        // calculates how many days will be needed to be disqualified with the last year rule.
                        daysToBeDisqualified2 = DAYS_YEAR - (rsDetails356.getDate("current_date").getTime() -
                                rsDetails356.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

                        // The interesting amount is the lowest one. This will be the min days that the rev. will
                        // be disqualified.
                        if (daysToBeDisqualified2 < daysToBeDisqualified) {
                            daysToBeDisqualified = daysToBeDisqualified2;
                        }

                        // the reviewer passed both rules, he shouldn't get disqualified.
                        disqualify = false;
                    }
                }

                if (rsUsers.getInt("status_id") == DISQUALIFIED_STATUS) {
                    inactiveReviewersCount++;
                    if (!disqualify) {
                        // if the reviewer is inactive, but after the analysis he shouldn't be disqualified, it means
                        // he had reached again the requirements to be a reviewer, so he should be activated.
                        qualifiedReviewersCount++;
                        updateReviewerStatus(QUALIFIED_STATUS, rsUsers.getLong("user_id"),
                            rsUsers.getInt("project_type_id"), rsUsers.getLong("catalog_id"));
                        //log.debug("... activated!!! ");
                        log.debug("ACT" + logMsg);

                        // send mail.
                        sendActivationMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
                            rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"));
                    }
                } else {
                    activeReviewersCount++;
                    if (disqualify) {
                        // if the reviewer is active, but after the analysis he doesn't fulfill the requirements
                        // he should be disqualified.
                        disqualifiedReviewersCount++;
                        updateReviewerStatus(DISQUALIFIED_STATUS, rsUsers.getLong("user_id"),
                            rsUsers.getInt("project_type_id"), rsUsers.getLong("catalog_id"));
                        //log.debug("... disqualified " + possibleDisqualificationReason);
                        log.debug("DISQ" + logMsg);

                        // send mail.
                        sendDisqualificationMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
                            rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"));
                    } else {
                        // reviewer shouldn't be disqualified, but maybe a warning mail is appropriate if he is
                        // near to be disqualified.
                        if (daysToBeDisqualified <= daysBeforeWarning) {
                            warnedReviewersCount++;
                            //log.debug("... will be disqualified in " + daysToBeDisqualified + " days  < ------------------------- WARNING!! ");
                            log.debug("WARN" + logMsg);

                            // send mail.
                            if (daysToBeDisqualified % firstWarningInterval == 0 || daysToBeDisqualified == 1 ||
                                (daysToBeDisqualified < firstWarningInterval && daysToBeDisqualified % secondWarningInterval == 0)) {
                                sendWarningMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
                                        rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"),
                                        daysToBeDisqualified);
                            }
                        } else {
                            log.debug("OK" + logMsg);
//                            log.debug("... ok");
                        }
                    }
                }
            }

            // complete digest mail with statistics
            digestMail.append("\n-----------------------------------------------\n");
            digestMail.append("Successfully analyzed " + activeReviewersCount + " active reviewers.\n");
            digestMail.append("Successfully analyzed " + inactiveReviewersCount + " inactive reviewers.\n");
            digestMail.append("Successfully disqualified " + disqualifiedReviewersCount + " reviewers.\n");
            digestMail.append("Successfully qualified " + qualifiedReviewersCount + " reviewers.\n");
            digestMail.append("Successfully warned " + warnedReviewersCount + " reviewers.\n");

            // send digest mail for admin.
            sendDigestMail();

            log.debug("-----------------------------------------------");
            log.debug("Successfully analyzed " + activeReviewersCount + " active reviewers.");
            log.debug("Successfully analyzed " + inactiveReviewersCount + " inactive reviewers.");
            log.debug("Successfully disqualified " + disqualifiedReviewersCount + " reviewers.");
            log.debug("Successfully qualified " + qualifiedReviewersCount + " reviewers.");
            log.debug("Successfully warned " + warnedReviewersCount + " reviewers.");
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("PaymentFixUtility failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psSelUsers);
            DBMS.close(psSelDetails);
            DBMS.close(rsUsers);
        }
    }

    /**
     * Private helper method to send the digest mail.
     */
    private void sendDigestMail() throws Exception {
        if (digestMail != null) {
            String emailSubject = "Review Board Digest";

            try {
                if (sendMails.equalsIgnoreCase("true")) {
                    sendMail(systemEmail, adminEmail, emailSubject, digestMail.toString());
                    log.debug("Sending digest mail.");
                }
            } catch (Exception e) {
                throw new Exception("Unable to send digest mail.", e);
            }
        }
    }

    /**
     * Private helper method to send activation mails.
     *
     * @param handle the reviewer's handle.
     * @param userEmail the reviewer's email address.
     * @param projectTypeName the project's type.
     * @param catalogName the catalogs description.
     */
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
                if (sendMails.equalsIgnoreCase("true")) {
                    sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                    log.debug("Sending disq. mail to: " + userEmail);
                }
            } else{
                log.debug("Warning!!! null email for: " + handle);
                digestMail.append("Warning!!! null email for: " + handle + "\n********************** \n\n");
            }
        } catch (Exception e) {
            throw new Exception("Unable to send mails.", e);
        }
    }

    /**
     * Private helper method to send disqualification mails.
     *
     * @param handle the reviewer's handle.
     * @param userEmail the reviewer's email address.
     * @param projectTypeName the project's type.
     * @param catalogName the catalogs description.
     */
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
                if (sendMails.equalsIgnoreCase("true")) {
                    sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                    log.debug("Sending disq. mail to: " + userEmail);
                }
            } else{
                log.debug("Warning!!! null email for: " + handle);
                digestMail.append("Warning!!! null email for: " + handle + "\n********************** \n\n");
            }
        } catch (Exception e) {
            throw new Exception("Unable to send mails.", e);
        }
    }

    /**
     * Private helper method to send warning mails.
     *
     * @param handle the reviewer's handle.
     * @param userEmail the reviewer's email address.
     * @param projectTypeName the project's type.
     * @param catalogName the catalogs description.
     * @param daysToBeDisqualified the days left to be disqualified.
     */
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
                if (sendMails.equalsIgnoreCase("true")) {
                    sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                    log.debug("Sending warning mail to: " + userEmail);
                }
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

        sendMails = (String) params.get("sendMails");
        if (sendMails == null)
            setUsageError("Please specify a sendMails.\n");
        params.remove("sendMails");

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
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        sErrorMsg.append("   -sendMails : whether to send mails or not.\n");
        sErrorMsg.append("   -firstWarningInterval : first day's interval in which send warning mails.\n");
        sErrorMsg.append("   -secondWarningInterval : day's interval to send warning mails after first interval has been reached.\n");
        sErrorMsg.append("   -daysBeforeWarning : minimum amount of days to be disqualified to send a warning.\n");
        sErrorMsg.append("   -scoreThreshold : project's minimum score to be taken into consideration for the restrictions.\n");
        sErrorMsg.append("   -submissionThresholdLastYear : how many submissions should be in the last year.\n");
        sErrorMsg.append("   -adminEmail : admin email address.\n");
        sErrorMsg.append("   -systemEmail : system email address.\n");
        fatal_error();
    }

    /**
     * Helper method to prepare user's statement
     *
     * @return the users PreparedStatement
     */
    private PreparedStatement prepareUsersStatement() throws SQLException {
        StringBuffer query = new StringBuffer(200);
        query.append("select u.handle, ru.user_id, ru.project_type_id, ru.catalog_id, ru.status_id, ru.immune_ind, pt.project_type_name, c.catalog_name, ");
        query.append("(select address from email e where e.user_id = ru.user_id and e.primary_ind = 1) as email_address ");
        query.append("from rboard_user ru, project_type pt, user u, catalog c ");
        query.append("where ru.immune_ind = 0 and ru.status_id in (?, ?) and pt.project_type_id = ru.project_type_id and ru.user_id = u.user_id ");
        query.append("and c.catalog_id = ru.catalog_id ");

        PreparedStatement ps = prepareStatement("tcs_catalog", query.toString());
        ps.setInt(1, QUALIFIED_STATUS);
        ps.setInt(2, DISQUALIFIED_STATUS);
        return ps;
    }

    /**
     * Helper method to prepare user's detail statement
     *
     * @return the details PreparedStatement
     */
    private PreparedStatement prepareDetailsStatement() throws SQLException {
        StringBuffer query = new StringBuffer(200);
        query.append("select DATE(current) as current_date, DATE(p.rating_date) as rating_date ");
        query.append("from project p, project_result pr, comp_versions cv, comp_catalog cc, category_catalog cac ");
        query.append("where p.comp_vers_id = cv.comp_vers_id and ");
        query.append("cc.component_id = cv.component_id and p.project_id = pr.project_id and ");
        query.append("p.cur_version = 1 and DATE(p.rating_date) >= DATE(current) - ? UNITS DAY and ");
        query.append("cc.root_category_id = cac.category_id and pr.final_score >= ? and ");
        query.append("p.project_type_id = ? and pr.user_id = ? and cac.catalog_id = ? ");
        query.append("order by DATE(p.rating_date) desc ");
        PreparedStatement ps = prepareStatement("tcs_catalog", query.toString());
        return ps;
    }

    /**
     * Helper method to update a reviewer status
     *
     * @param statusId the status id to update.
     * @param userId the reviewer's ID.
     * @param projectTypeId the project's type ID.
     * @param catalogId the catalog ID.
     */
    private void updateReviewerStatus(int statusId, long userId, int projectTypeId, long catalogId) throws SQLException {
        StringBuffer query = new StringBuffer(200);
        query.append("update rboard_user ");
        query.append("set status_id = ? ");
        query.append("where user_id = ? and project_type_id = ? and catalog_id = ? ");

        PreparedStatement psUpd = null;
        try {
            psUpd = prepareStatement("tcs_catalog", query.toString());

            psUpd.clearParameters();
            psUpd.setInt(1, statusId);
            psUpd.setLong(2, userId);
            psUpd.setInt(3, projectTypeId);
            psUpd.setLong(4, catalogId);

            if (!onlyAnalyze.equalsIgnoreCase("true")) {
                psUpd.executeUpdate();
            }
        } finally {
            DBMS.close(psUpd);
        }
    }

}
