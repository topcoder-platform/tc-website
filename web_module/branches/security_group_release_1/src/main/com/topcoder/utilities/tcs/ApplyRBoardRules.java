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
 * Utility to qualify/disqualify reviewers systematically.
 *
 * This utility analyzes the reviewers for a set of rules and decide whether to qualify
 * inactive reviewers or disqualify active ones. It also sends the corresponding notifications
 * and warnings for reviewers that are "about" to be disqualified.
 *
 * Version 1.0.1 (BUGR-2047) changelog:
 * - Added a new review board rule: a reviewer needs to have a certain number of submissions (with a score higher or
 *   equal that a certain threshold) during the last X projects, where X is configurable. A reviewer needs to satisfy
 *   either the "short term" rule *or* this new rule in order to be qualified.
 * - All rules parameters were made configurable by (project type, catalog) pair.
 * - Fixed the copy-paste error "PaymentFixUtility" in the ApplyRBoardRules.java file
 *
 * @author pulky
 * @version 1.0.1
 */
public class ApplyRBoardRules extends DBUtility {
    /**
     * Milliseconds in a day.
     */
    private static final int MILLIS_IN_DAY = 1000 * 60 * 60 * 24;

    /**
     * Status of disqualified reviewers.
     */
    private static final int DISQUALIFIED_STATUS = 110;

    /**
     * Status of active reviewers.
     */
    private static final int QUALIFIED_STATUS = 100;

    /**
     * Key for the days assumed for the short period rule.
     */
    private static final String DAYS_SHORT_PERIOD_KEY = "daysShortPeriod";

    /**
     * Key for the days assumed for the long period rule.
     */
    private static final String DAYS_LONG_PERIOD_KEY = "daysLongPeriod";

    /**
     * Key for the first day's interval in which send warning mails.
     */
    private static final String FIRST_WARNING_INTERVAL_KEY = "firstWarningInterval";

    /**
     * Key for the day's interval to send warning mails after first interval has been reached.
     */
    private static final String SECOND_WARNING_INTERVAL_KEY = "secondWarningInterval";

    /**
     * Key for the minimum amount of days to be disqualified to send a warning.
     */
    private static final String DAYS_BEFORE_WARNING_KEY = "daysBeforeWarning";

    /**
     * Key for the project's minimum score to be taken into consideration for short period restrictions.
     */
    private static final String SCORE_THRESHOLD_SHORT_KEY = "scoreThresholdShort";

    /**
     * Key for the project's minimum score to be taken into consideration for long period restrictions.
     */
    private static final String SCORE_THRESHOLD_LONG_KEY = "scoreThresholdLong";

    /**
     * Key for how many submissions should be in the short period.
     */
    private static final String SUBMISSION_THRESHOLD_SHORT_KEY = "submissionThresholdShort";

    /**
     * Key for how many submissions should be in the long period for each competition type.
     */
    private static final String SUBMISSION_THRESHOLD_LONG_KEY = "submissionThresholdLong";

    /**
     * Key for the minimum score for the new alternate first rule
     */
    private static final String ALTERNATE_RULE_MINIMUM_SCORE_KEY = "alternateRuleMinimumScore";

    /**
     * Key for the number of required submissions for the new alternate first rule
     */
    private static final String ALTERNATE_RULE_MINIMUM_SUBMISSIONS_KEY = "alternateRuleMinimumSubmissions";

    /**
     * Key for the number of last projects for the new alternate first rule
     */
    private static final String ALTERNATE_RULE_LAST_N_PROJECTS_KEY = "alternateRuleLastNProjects";

    private static final String TOP_N_SUBMISSIONS_KEY = "topNSubmissions";
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

    public ApplyRBoardRules() {
        super();
    }

    /**
     * Runs the ApplyRBoardRules utility.
     * <p/>
     * This utility analyzes the reviewers for a set of rules and decide whether to qualify
     * inactive reviewers or disqualify active ones. It also sends the corresponding notifications
     * and warnings for reviewers that are "about" to be disqualified.
     */
    public void runUtility() throws Exception {
        PreparedStatement psSelUsers = null;
        PreparedStatement psSelAlternate = null;
        PreparedStatement psSelDetails = null;

        ResultSet rsUsers = null;
        ResultSet rsDetailsShort = null;
        ResultSet rsDetailsLong = null;
        ResultSet rsAlternate = null;

        digestMail.append("Today's reviewer movements:\n\n");
        try {
            psSelUsers = prepareUsersStatement();
            psSelDetails = prepareDetailsStatement();
            psSelAlternate = prepareAlternateRuleStatement();

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

                Long projectTypeId = rsUsers.getLong("project_type_id");
                Long catalogId = rsUsers.getLong("catalog_id");

                // get specific parameters using project type, catalog pair.
                int daysShortPeriod = getParam(DAYS_SHORT_PERIOD_KEY, projectTypeId, catalogId);
                int daysLongPeriod = getParam(DAYS_LONG_PERIOD_KEY, projectTypeId, catalogId);
                int scoreThresholdShort = getParam(SCORE_THRESHOLD_SHORT_KEY, projectTypeId, catalogId);
                int scoreThresholdLong = getParam(SCORE_THRESHOLD_LONG_KEY, projectTypeId, catalogId);
                int submissionThresholdLong = getParam(SUBMISSION_THRESHOLD_LONG_KEY, projectTypeId, catalogId);
                int submissionThresholdShort = getParam(SUBMISSION_THRESHOLD_SHORT_KEY, projectTypeId, catalogId);
                int daysBeforeWarning = getParam(DAYS_BEFORE_WARNING_KEY, projectTypeId, catalogId);
                int firstWarningInterval = getParam(FIRST_WARNING_INTERVAL_KEY, projectTypeId, catalogId);
                int secondWarningInterval = getParam(SECOND_WARNING_INTERVAL_KEY, projectTypeId, catalogId);
                int alternateRuleMinimumScore = getParam(ALTERNATE_RULE_MINIMUM_SCORE_KEY, projectTypeId, catalogId);
                int alternateRuleMinimumSubmissions = getParam(ALTERNATE_RULE_MINIMUM_SUBMISSIONS_KEY, projectTypeId, catalogId);
                int alternateRuleLastNProjects = getParam(ALTERNATE_RULE_LAST_N_PROJECTS_KEY, projectTypeId, catalogId);
                int topNSubmissions = getParam(TOP_N_SUBMISSIONS_KEY, projectTypeId, catalogId);

                psSelDetails.clearParameters();
                psSelDetails.setInt(1, daysShortPeriod);  // Days to analyze
                psSelDetails.setInt(2, scoreThresholdShort);  // score threshold
                psSelDetails.setInt(3, topNSubmissions);  // top N submissions counted
                psSelDetails.setInt(4, rsUsers.getInt("project_type_id"));  // project_type
                psSelDetails.setLong(5, rsUsers.getLong("user_id"));  // user_id
                psSelDetails.setLong(6, rsUsers.getLong("catalog_id"));  // catalog_id


//                String possibleDisqualificationReason = " (no " + submissionThresholdShort + " submissions in the last " + daysShortPeriod + " days.";

                log.debug("Analyzing " + ((rsUsers.getInt("status_id") == DISQUALIFIED_STATUS) ? "Inactive" : "Active") +
                        " user " + rsUsers.getLong("user_id") + "("+ rsUsers.getString("handle") + ")" +
                        " Project Type: " + rsUsers.getString("project_type_name") +
                        " Catalog Id: " + rsUsers.getString("catalog_name"));

                logMsg = " - <" + rsUsers.getString("handle") + "> <" + rsUsers.getString("project_type_name") + "> <" +
                        rsUsers.getString("catalog_name") + ">";

                rsDetailsShort = psSelDetails.executeQuery();

                // counts submissions
                int countShort = 0;
                for (; countShort < submissionThresholdShort && rsDetailsShort.next(); countShort++) ;

                boolean passedShortPeriodRule = (countShort >= submissionThresholdShort);

                // check alternate first rule (certain number of submissions (with a score higher or equal that a certain threshold) during the last X projects)
                psSelAlternate.clearParameters();
                psSelAlternate.setInt(1, alternateRuleLastNProjects);  // Number of project to take into consideration
                psSelAlternate.setLong(2, rsUsers.getLong("user_id"));  // user_id
                psSelAlternate.setLong(3, rsUsers.getLong("user_id"));  // user_id
                psSelAlternate.setInt(4, rsUsers.getInt("project_type_id"));  // project_type
                psSelAlternate.setLong(5, rsUsers.getLong("catalog_id"));  // catalog
                rsAlternate = psSelAlternate.executeQuery();

                // counts submissions
                int countSub = 0;
                for (; countSub < alternateRuleMinimumSubmissions && rsAlternate.next(); ) {
                    if (rsAlternate.getObject("user_score") != null && rsAlternate.getInt("user_score") >= alternateRuleMinimumScore) {
                        if (rsAlternate.getObject("placed") != null && rsAlternate.getInt("placed") >= 1 && rsAlternate.getInt("placed") <= topNSubmissions)
                        countSub++;
                    }
                }

				boolean passedAlternateFirstRule = (countSub >= alternateRuleMinimumSubmissions);

                if (passedShortPeriodRule || passedAlternateFirstRule) {
                    // passed the short period rule successfully.

//                  possibleDisqualificationReason = " (no " + submissionThresholdLong + " submissions in the last " + daysLongPeriod + " days.";

                    // calculates how many days will be needed to be disqualified with the short period rule.
                    if (passedShortPeriodRule && submissionThresholdShort > 0) {
                        daysToBeDisqualified = daysShortPeriod - (rsDetailsShort.getDate("current_date").getTime() -
                                rsDetailsShort.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);
                    } else {
                        daysToBeDisqualified = Long.MAX_VALUE;
                    }

                    psSelDetails.setInt(1, daysLongPeriod);  // Days to analyze
                    psSelDetails.setInt(2, scoreThresholdLong);  // score threshold
                    rsDetailsLong = psSelDetails.executeQuery();

                    // counts submissions
                    int countLong = 0;
                    for (; countLong < submissionThresholdLong && rsDetailsLong.next(); countLong++) ;

                    if (countLong >= submissionThresholdLong) {
                        // passed the long period rule successfully.

                        // calculates how many days will be needed to be disqualified with the long period rule.
                        daysToBeDisqualified2 = daysLongPeriod - (rsDetailsLong.getDate("current_date").getTime() -
                                rsDetailsLong.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

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
//               log.debug("... activated!!! ");
                        log.debug("ACT" + logMsg);

                        // send mail.
                        sendActivationMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
                                rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"),
                                submissionThresholdLong, submissionThresholdShort, daysShortPeriod, scoreThresholdShort, scoreThresholdLong,
                                alternateRuleMinimumScore, alternateRuleMinimumSubmissions, alternateRuleLastNProjects, topNSubmissions);
                    }
                } else {
                    activeReviewersCount++;
                    if (disqualify) {
                        // if the reviewer is active, but after the analysis he doesn't fulfill the requirements
                        // he should be disqualified.
                        disqualifiedReviewersCount++;
                        updateReviewerStatus(DISQUALIFIED_STATUS, rsUsers.getLong("user_id"),
                                rsUsers.getInt("project_type_id"), rsUsers.getLong("catalog_id"));
//                        log.debug("... disqualified " + possibleDisqualificationReason);
                        log.debug("DISQ" + logMsg);

                        // send mail.
                        sendDisqualificationMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
                                rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"),
                                submissionThresholdLong, submissionThresholdShort, daysShortPeriod, scoreThresholdShort, scoreThresholdLong,
                                alternateRuleMinimumScore, alternateRuleMinimumSubmissions, alternateRuleLastNProjects, topNSubmissions);
                    } else {
                        // reviewer shouldn't be disqualified, but maybe a warning mail is appropriate if he is
                        // near to be disqualified.
                        if (daysToBeDisqualified <= daysBeforeWarning && !passedAlternateFirstRule) {
                            warnedReviewersCount++;
//                            log.debug("... will be disqualified in " + daysToBeDisqualified + " days  < ------------------------- WARNING!! ");
                            log.debug("WARN" + logMsg);

                            // send mail.
                            if (daysToBeDisqualified % firstWarningInterval == 0 || daysToBeDisqualified == 1 ||
                                    (daysToBeDisqualified < firstWarningInterval && daysToBeDisqualified % secondWarningInterval == 0)) {
                                sendWarningMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
                                        rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"),
                                        daysToBeDisqualified, submissionThresholdLong, submissionThresholdShort,
                                        daysShortPeriod, scoreThresholdShort, scoreThresholdLong, alternateRuleMinimumScore,
                                        alternateRuleMinimumSubmissions, alternateRuleLastNProjects, topNSubmissions);
                            }
                        } else {
                            log.debug("OK" + logMsg);
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
            throw new Exception("ApplyRBoardRules failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psSelUsers);
            DBMS.close(psSelDetails);
            DBMS.close(psSelAlternate);
            DBMS.close(rsUsers);
            DBMS.close(rsAlternate);
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
     * @param handle          the reviewer's handle.
     * @param userEmail       the reviewer's email address.
     * @param projectTypeName the project's type.
     * @param catalogName     the catalogs description.
     */
    private void sendActivationMail(String handle, String userEmail, String projectTypeName, String catalogName,
            int submissionThresholdLong, int submissionThresholdShort, int daysShortPeriod, int scoreThresholdShort, int scoreThresholdLong,
            int alternateRuleMinimumScore, int alternateRuleMinimumSubmissions, int alternateRuleLastNProjects, int topNSubmissions) throws Exception {

        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("We are pleased to inform you that you have been reactivated for performing ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects.\n\n");

        mail.append("Remember that to stay active you must complete at least " + submissionThresholdLong + " project" + (submissionThresholdLong > 1 ? "s" : ""));
        mail.append(" overall in the corresponding catalog and track with a score equal or higher than " + scoreThresholdLong + " in each one.\n");

        mail.append("You also have to complete at least " + submissionThresholdShort + " project" + (submissionThresholdShort > 1 ? "s" : ""));
        mail.append(" with a score equal or higher than " + scoreThresholdShort + " in the last " + daysShortPeriod + " days");
        mail.append(" or at least " + alternateRuleMinimumSubmissions + " project" + (alternateRuleMinimumSubmissions > 1 ? "s" : "") + " with a score equal or higher than ");
        mail.append(alternateRuleMinimumScore + " in the last " + alternateRuleLastNProjects + " project" + (alternateRuleLastNProjects > 1 ? "s" : "") + ".\n");

        mail.append("Only the submissions resulted in the Top" + topNSubmissions + " for each project are counted towards the reviewer statistics.\n\n");

        mail.append("If you have any questions, please contact us at service@topcodersoftware.com.\n\n");
        mail.append("Thank you, \nTopCoder Software.\n");

        String emailSubject = "Review Board: Activation";

        try {
            digestMail.append(" Activated - " + handle + " for " + catalogName + " " + projectTypeName + " projects.\n");
            if (userEmail != null && userEmail != "") {
                if (sendMails.equalsIgnoreCase("true")) {
                    sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                    log.debug("Sending disq. mail to: " + userEmail);
                }
            } else {
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
     * @param handle          the reviewer's handle.
     * @param userEmail       the reviewer's email address.
     * @param projectTypeName the project's type.
     * @param catalogName     the catalogs description.
     */
    private void sendDisqualificationMail(String handle, String userEmail, String projectTypeName, String catalogName,
            int submissionThresholdLong, int submissionThresholdShort, int daysShortPeriod, int scoreThresholdShort, int scoreThresholdLong,
            int alternateRuleMinimumScore, int alternateRuleMinimumSubmissions, int alternateRuleLastNProjects, int topNSubmissions) throws Exception {

        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("We are sorry to inform you that you have been disqualified from performing additional ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects, but you will still be ");
        mail.append("able to complete your current projects.\n\n");
        mail.append("This is temporary. You no longer fulfill the requirements to be a reviewer, ");
        mail.append("but if you resolve this, you will be able to perform reviews again.\n\n");

        mail.append("Note:\n");
        mail.append("To be qualified as a reviewer you must complete at least " + submissionThresholdLong + " project" + (submissionThresholdLong > 1 ? "s" : ""));
        mail.append(" overall in the corresponding catalog and track with a score equal or higher than " + scoreThresholdLong + " in each one.\n");

        mail.append("You also have to complete at least " + submissionThresholdShort + " project" + (submissionThresholdShort > 1 ? "s" : ""));
        mail.append(" with a score equal or higher than " + scoreThresholdShort + " in the last " + daysShortPeriod + " days");
        mail.append(" or at least " + alternateRuleMinimumSubmissions + " project" + (alternateRuleMinimumSubmissions > 1 ? "s" : "") + " with a score equal or higher than ");
        mail.append(alternateRuleMinimumScore + " in the last " + alternateRuleLastNProjects + " project" + (alternateRuleLastNProjects > 1 ? "s" : "") + ".\n");

        mail.append("Only the submissions resulted in the Top" + topNSubmissions + " for each project are counted towards the reviewer statistics.\n\n");

        mail.append("If you have any questions, please contact us at service@topcodersoftware.com.\n\n");
        mail.append("Thank you, \nTopCoder Software.\n");

        String emailSubject = "Review Board: Disqualification";

        try {
            digestMail.append(" Disqualified - " + handle + " for " + catalogName + " " + projectTypeName + " projects.\n");
            if (userEmail != null && userEmail != "") {
                if (sendMails.equalsIgnoreCase("true")) {
                    sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                    log.debug("Sending disq. mail to: " + userEmail);
                }
            } else {
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
     * @param handle               the reviewer's handle.
     * @param userEmail            the reviewer's email address.
     * @param projectTypeName      the project's type.
     * @param catalogName          the catalogs description.
     * @param daysToBeDisqualified the days left to be disqualified.
     */
    private void sendWarningMail(String handle, String userEmail, String projectTypeName, String catalogName, long daysToBeDisqualified,
            int submissionThresholdLong, int submissionThresholdShort, int daysShortPeriod, int scoreThresholdShort, int scoreThresholdLong,
            int alternateRuleMinimumScore, int alternateRuleMinimumSubmissions, int alternateRuleLastNProjects, int topNSubmissions) throws Exception {

        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("This mail is to warn you that in " + daysToBeDisqualified + " day" + (daysToBeDisqualified > 1 ? "s" : "") + " you will be disqualified from performing ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects.\n\n");

        mail.append("Note:\n");
        mail.append("To be qualified as a reviewer you must complete at least " + submissionThresholdLong + " project" + (submissionThresholdLong > 1 ? "s" : ""));
        mail.append(" overall in the corresponding catalog and track with a score equal or higher than " + scoreThresholdLong + " in each one.\n");

        mail.append("You also have to complete at least " + submissionThresholdShort + " project" + (submissionThresholdShort > 1 ? "s" : ""));
        mail.append(" with a score equal or higher than " + scoreThresholdShort + " in the last " + daysShortPeriod + " days");
        mail.append(" or at least " + alternateRuleMinimumSubmissions + " project" + (alternateRuleMinimumSubmissions > 1 ? "s" : "") + " with a score equal or higher than ");
        mail.append(alternateRuleMinimumScore + " in the last " + alternateRuleLastNProjects + " project" + (alternateRuleLastNProjects > 1 ? "s" : "") + ".\n");

        mail.append("Only the submissions resulted in the Top" + topNSubmissions + " for each project are counted towards the reviewer statistics.\n\n");

        mail.append("If you have any questions, please contact us at service@topcodersoftware.com.\n\n");
        mail.append("Thank you, \nTopCoder Software.\n");

        String emailSubject = "Review Board: Warning";

        try {
            if (userEmail != null && userEmail != "") {
                if (sendMails.equalsIgnoreCase("true")) {
                    sendMail(systemEmail, userEmail, emailSubject, mail.toString());
                    log.debug("Sending warning mail to: " + userEmail);
                }
            } else {
                log.debug("Warning!!! null email for: " + handle);
                digestMail.append("Warning!!! null email for: " + handle + "\n********************** \n\n");
            }
        } catch (Exception e) {
            throw new Exception("Unable to send mails.", e);
        }
    }


    /**
     * Get a specific parameter (using project type, catalog pair)
     *
     * First it will try project type, catalog
     * Then project type.
     * And finally the default.
     *
     * @param key the key to find
     * @param projectTypeId the contextual project type id
     * @param catalogId the contextual catalog id
     *
     * @return an int with the parameter value
     */
    private int getParam(String key, Long projectTypeId, Long catalogId) {
        String prefixTypeCatalog = "t-" + projectTypeId.toString() + "-c-" + catalogId.toString() + "-";
        String prefixType = "t-" + projectTypeId.toString() + "-";

        String temp = (String) params.get(prefixTypeCatalog+key);
        if (temp != null) {
            return Integer.parseInt(temp);
        }

        temp = (String) params.get(prefixType+key);
        if (temp != null) {
            return Integer.parseInt(temp);
        }

        temp = (String) params.get(key);
        if (temp == null)
            setUsageError("Please specify a "+ key + ".\n");
        return Integer.parseInt(temp);
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

        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the ApplyRBoardRules.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ApplyRBoardRules:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line\n");
        sErrorMsg.append("   -daysShortPeriod : days for the short period.\n");
        sErrorMsg.append("   -daysLongPeriod : days for the long period.\n");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        sErrorMsg.append("   -sendMails : whether to send mails or not.\n");
        sErrorMsg.append("   -firstWarningInterval : first day's interval in which send warning mails.\n");
        sErrorMsg.append("   -secondWarningInterval : day's interval to send warning mails after first interval has been reached.\n");
        sErrorMsg.append("   -daysBeforeWarning : minimum amount of days to be disqualified to send a warning.\n");
        sErrorMsg.append("   -scoreThresholdShort : project's minimum score to be taken into consideration for the short period restrictions.\n");
        sErrorMsg.append("   -scoreThresholdLong : project's minimum score to be taken into consideration for the long period restrictions.\n");
        sErrorMsg.append("   -submissionThresholdShort : how many submissions should be in the short period.\n");
        sErrorMsg.append("   -submissionThresholdLong : how many submissions should be in the long period.\n");
        sErrorMsg.append("   -alternateRuleMinimumScore : the minimum score for the new alternate first rule.\n");
        sErrorMsg.append("   -alternateRuleMinimumSubmissions : the number of required submissions for the new alternate first rule.\n");
        sErrorMsg.append("   -alternateRuleLastNProjects : the number of last projects for the new alternate first rule.\n");
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
        query.append("select u.handle, ru.user_id, ru.project_type_id, ru.catalog_id, ru.status_id, ru.immune_ind,  ");
        query.append("pcl.name as project_type_name, c.catalog_name,  ");
        query.append("(select address from email e where e.user_id = ru.user_id and e.primary_ind = 1) as email_address  ");
        query.append("from rboard_user ru, user u, catalog c, project_category_lu pcl ");
        query.append("where ru.immune_ind = 0 and ru.status_id in (?, ?) and  ru.user_id = u.user_id  ");
        query.append("and c.catalog_id = ru.catalog_id  and  pcl.project_category_id = ru.project_type_id ");

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
        query.append("select DATE(current) as current_date, mdy(substr(pi_rating_date.value,1,2), substr(pi_rating_date.value,4,2), substr(pi_rating_date.value,7,4)) as rating_date  ");
        query.append("from project p, project_result pr, comp_catalog cc, category_catalog cac, ");
        query.append("project_info pi_rating_date, project_info pi_comp_id ");
        query.append("where pi_rating_date.project_info_type_id = 22 and ");
        query.append("pi_rating_date.project_id = p.project_id and ");
        query.append("pi_comp_id.project_info_type_id = 2 and ");
        query.append("pi_comp_id.project_id = p.project_id and ");
        query.append("p.project_id not in (select ce.contest_id from contest_eligibility ce where ce.is_studio = 0) and ");
        query.append("p.project_status_id in (1,4,5,6,7,8) and ");  // active or completed or canceled
        query.append("cc.component_id = pi_comp_id.value and p.project_id = pr.project_id and  ");
        query.append("mdy(substr(pi_rating_date.value,1,2), substr(pi_rating_date.value,4,2), substr(pi_rating_date.value,7,4)) >= DATE(current) - ? UNITS DAY and  ");
        query.append("cc.root_category_id = cac.category_id and pr.final_score >= ? and pr.placed >= 1 and pr.placed <= ? and ");
        query.append("p.project_category_id = ? and pr.user_id = ? and cac.catalog_id = ?  ");
        query.append("order by mdy(substr(pi_rating_date.value,1,2), substr(pi_rating_date.value,4,2), substr(pi_rating_date.value,7,4)) desc  ");
        PreparedStatement ps = prepareStatement("tcs_catalog", query.toString());
        return ps;
    }

    /**
     * Helper method to prepare alternate rule statement
     *
     * @return the details PreparedStatement
     */
    private PreparedStatement prepareAlternateRuleStatement() throws SQLException {
        StringBuffer query = new StringBuffer(200);
        query.append("select first ? p.project_id, ");
        query.append("(select pr.final_score from project_result pr where pr.project_id = p.project_id and pr.user_id = ?) as user_score, ");
        query.append("(select pr.placed from project_result pr where pr.project_id = p.project_id and pr.user_id = ?) as placed ");
        query.append("from project p, project_info pi_rating_date, project_info pi_comp_id, comp_catalog cc, category_catalog cac, project_info pi_open ");
        query.append("where pi_rating_date.project_info_type_id = 22 and pi_rating_date.project_id = p.project_id and  ");
        query.append("      pi_comp_id.project_info_type_id = 2 and ");
        query.append("      pi_comp_id.project_id = p.project_id and ");
        query.append("      pi_open.project_info_type_id = 12 and ");
        query.append("      pi_open.project_id = p.project_id and ");
        query.append("      pi_open.value = 'Yes' and ");
        query.append("      p.project_id not in (select ce.contest_id from contest_eligibility ce where ce.is_studio = 0) and ");
        query.append("      p.project_status_id in (4,5,6,7,8) and ");  // completed or canceled (active projects are not counted for the alternate rule)
        query.append("      cc.component_id = pi_comp_id.value and  ");
        query.append("      cc.root_category_id = cac.category_id and  ");
        query.append("      p.project_category_id = ? and cac.catalog_id = ? ");
        query.append("order by mdy(substr(pi_rating_date.value,1,2), substr(pi_rating_date.value,4,2), substr(pi_rating_date.value,7,4)) desc");

        PreparedStatement ps = prepareStatement("tcs_catalog", query.toString());
        return ps;
    }

    /**
     * Helper method to update a reviewer status
     *
     * @param statusId      the status id to update.
     * @param userId        the reviewer's ID.
     * @param projectTypeId the project's type ID.
     * @param catalogId     the catalog ID.
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