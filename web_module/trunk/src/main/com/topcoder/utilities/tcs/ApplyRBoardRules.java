/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.tcs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * <strong>Purpose</strong>:
 * Utility to qualify/disqualify reviewers systematically.
 * <p/>
 * This utility analyzes the reviewers for a set of rules and decide whether to qualify
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
     * Days assumed for the short period rule.
     */
    private int daysShortPeriod = 90;

    /**
     * Days assumed for the long period rule.
     */
    private int daysLongPeriod = 3650;

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
     * This variable tells the project's minimum score to be taken into consideration for short period restrictions.
     */
    private int scoreThresholdShort = 85;

    /**
     * This variable tells the project's minimum score to be taken into consideration for long period restrictions.
     */
    private int scoreThresholdLong = 85;

    /**
     * This variable tells how many submissions should be in the short period.
     */
    private int submissionThresholdShort = 1;

    /**
     * This variable tells how many submissions should be in the long period for each competition type.
     */
    private HashMap<Integer, Integer> submissionThresholdLongMap = new HashMap<Integer, Integer>();

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
    	// TODO: Make this configurable again.
    	submissionThresholdLongMap.put(1, 10);
    	submissionThresholdLongMap.put(2, 10);
    	submissionThresholdLongMap.put(6, 3);
    	submissionThresholdLongMap.put(7, 3);
    	submissionThresholdLongMap.put(13, 3);
    	submissionThresholdLongMap.put(14, 3);
    	submissionThresholdLongMap.put(23, 3);
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
        PreparedStatement psSelDetails = null;

        ResultSet rsUsers = null;
        ResultSet rsDetailsShort = null;
        ResultSet rsDetailsLong = null;

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
                psSelDetails.setInt(1, daysShortPeriod);  // Days to analyze
                psSelDetails.setInt(2, scoreThresholdShort);  // score threshold
                psSelDetails.setInt(3, rsUsers.getInt("project_type_id"));  // project_type
                psSelDetails.setLong(4, rsUsers.getLong("user_id"));  // user_id
                psSelDetails.setLong(5, rsUsers.getLong("catalog_id"));  // catalog_id
                
                int submissionThresholdLong = submissionThresholdLongMap.get(rsUsers.getInt("project_type_id"));

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

                if (countShort >= submissionThresholdShort) {
                    // passed the short period rule successfully.

//                  possibleDisqualificationReason = " (no " + submissionThresholdLong + " submissions in the last " + daysLongPeriod + " days.";

                    // calculates how many days will be needed to be disqualified with the 90 days rule.
                    daysToBeDisqualified = daysShortPeriod - (rsDetailsShort.getDate("current_date").getTime() -
                            rsDetailsShort.getDate("rating_date").getTime()) / (MILLIS_IN_DAY);

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
                                submissionThresholdLong);
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
                                submissionThresholdLong);
                    } else {
                        // reviewer shouldn't be disqualified, but maybe a warning mail is appropriate if he is
                        // near to be disqualified.
                        if (daysToBeDisqualified <= daysBeforeWarning) {
                            warnedReviewersCount++;
//                            log.debug("... will be disqualified in " + daysToBeDisqualified + " days  < ------------------------- WARNING!! ");
                            log.debug("WARN" + logMsg);

                            // send mail.
                            if (daysToBeDisqualified % firstWarningInterval == 0 || daysToBeDisqualified == 1 ||
                                    (daysToBeDisqualified < firstWarningInterval && daysToBeDisqualified % secondWarningInterval == 0)) {
                                sendWarningMail(rsUsers.getString("handle"), rsUsers.getString("email_address"),
                                        rsUsers.getString("project_type_name"), rsUsers.getString("catalog_name"),
                                        daysToBeDisqualified, submissionThresholdLong);
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
     * @param handle          the reviewer's handle.
     * @param userEmail       the reviewer's email address.
     * @param projectTypeName the project's type.
     * @param catalogName     the catalogs description.
     */
    private void sendActivationMail(String handle, String userEmail, String projectTypeName, String catalogName,
    		int submissionThresholdLong) throws Exception {
    	
        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("We are pleased to inform you that you have been reactivated for performing ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects.\n\n");
        mail.append("Remember that to stay active you must complete at least " + submissionThresholdShort + " project" + (submissionThresholdShort > 1 ? "s" : " "));
        mail.append("in the last " + daysShortPeriod + " days and " + submissionThresholdLong + " overall in the corresponding catalog and ");
        mail.append("track with a score equal or greater than " + scoreThresholdShort + " in each one.\n\n");
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
    		int submissionThresholdLong) throws Exception {
    	
        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("We are sorry to inform you that you have been disqualified from performing additional ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects, but you will still be ");
        mail.append("able to complete your current projects.\n\n");
        mail.append("This is temporary. You no longer fulfill the requirements to be a reviewer, ");
        mail.append("but if you resolve this, you will be able to perform reviews again.\n\n");
        mail.append("Note: To be qualified as a reviewer you must complete at least " + submissionThresholdShort + " project" + (submissionThresholdShort > 1 ? "s" : " "));
        mail.append("in the last " + daysShortPeriod + " days and " + submissionThresholdLong + " overall in the corresponding catalog and ");
        mail.append("track with a score equal or greater than " + scoreThresholdShort + " in each one.\n\n");        
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
    		int submissionThresholdLong) throws Exception {
    	
        StringBuffer mail = new StringBuffer();
        mail.append("Hello " + handle + ",\n\n");
        mail.append("This mail is to warn you that in " + daysToBeDisqualified + " day/s you will be disqualified from performing ");
        mail.append("reviews on " + catalogName + " " + projectTypeName + " projects.\n\n");
        mail.append("Note: To be qualified as a reviewer you must complete at least " + submissionThresholdShort + " project" + (submissionThresholdShort > 1 ? "s" : " "));
        mail.append("in the last " + daysShortPeriod + " days and " + submissionThresholdLong + " overall in the corresponding catalog and ");
        mail.append("track with a score equal or greater than " + scoreThresholdShort + " in each one.\n\n");        
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

        String temp = (String) params.get("daysShortPeriod");
        if (temp == null)
            setUsageError("Please specify a daysShortPeriod.\n");
        daysShortPeriod = Integer.parseInt(temp);
        params.remove("daysShortPeriod");

        temp = (String) params.get("daysLongPeriod");
        if (temp == null)
            setUsageError("Please specify a daysLongPeriod.\n");
        daysLongPeriod = Integer.parseInt(temp);
        params.remove("daysLongPeriod");

        temp = (String) params.get("firstWarningInterval");
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

        temp = (String) params.get("scoreThresholdShort");
        if (temp == null)
            setUsageError("Please specify a scoreThresholdShort.\n");
        scoreThresholdShort = Integer.parseInt(temp);
        params.remove("scoreThresholdShort");

        temp = (String) params.get("scoreThresholdLong");
        if (temp == null)
            setUsageError("Please specify a scoreThresholdLong.\n");
        scoreThresholdLong = Integer.parseInt(temp);
        params.remove("scoreThresholdLong");

        temp = (String) params.get("submissionThresholdShort");
        if (temp == null)
            setUsageError("Please specify a submissionThresholdShort.\n");
        submissionThresholdShort = Integer.parseInt(temp);
        params.remove("submissionThresholdShort");

        //temp = (String) params.get("submissionThresholdLong");
        //if (temp == null)
        //    setUsageError("Please specify a submissionThresholdLong.\n");
        //submissionThresholdLong = Integer.parseInt(temp);
        //params.remove("submissionThresholdLong");

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
        query.append("cc.component_id = pi_comp_id.value and p.project_id = pr.project_id and  ");
        query.append("mdy(substr(pi_rating_date.value,1,2), substr(pi_rating_date.value,4,2), substr(pi_rating_date.value,7,4)) >= DATE(current) - ? UNITS DAY and  ");
        query.append("cc.root_category_id = cac.category_id and pr.final_score >= ? and  ");
        query.append("p.project_category_id = ? and pr.user_id = ? and cac.catalog_id = ?  ");
        query.append("order by mdy(substr(pi_rating_date.value,1,2), substr(pi_rating_date.value,4,2), substr(pi_rating_date.value,7,4)) desc  ");
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
