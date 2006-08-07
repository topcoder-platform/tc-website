/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.shared.util.DBMS;
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
        StringBuffer mail = new StringBuffer();
        mail.append("The following project: \n\n");
        mail.append("\n\nhas completed appeals phase with all");
        mail.append(" appeals responded.");
        String emailSubject =
            "AutoPilotTimer: Appeals Notification (All Appeals responded)";

        String email = "pwolfus@topcoder.com";

        sendMail("autopilot@topcoder.com", email, emailSubject,
                mail.toString());

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
