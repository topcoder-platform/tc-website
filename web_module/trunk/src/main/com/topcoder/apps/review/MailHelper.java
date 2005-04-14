/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.Appeal;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.ScorecardQuestion;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.file.render.RecordTag;
import com.topcoder.file.render.ValueTag;
import com.topcoder.file.render.XMLDocument;
import com.topcoder.file.render.xsl.XSLTransformerWrapper;
import com.topcoder.file.render.xsl.XSLTransformerWrapperException;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;

import java.io.*;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Helper class for sending mails using the Email Engine component.
 *
 * @author adic
 * @version 1.0
 */
class MailHelper {

    /**
     * Type of project change constant: no change.
     */
    static final int NO_CHANGE = 0;

    /**
     * Type of project change constant: phase change.
     */
    static final int PHASE_CHANGE = 1;

    /**
     * Type of project change constant: timeline change.
     */
    static final int TIMELINE_CHANGE = 2;

    /**
     * Type of project change constant: role change.
     */
    static final int ROLE_CHANGE = 4;

    /**
     * Convention for place value for failed screening.
     */
    static final int PLACE_SCREENING_FAIL = -1;

    /**
     * Constructor (inhibits outside instantiation).
     */
    private MailHelper() {
    }

    private static String getPlaceString(int place) {
        switch (place % 10) {
            case 1:
                return place + "st";
            case 2:
                return place + "nd";
            case 3:
                return place + "rd";
            default:
                return place + "th";
        }
    }

    static void resultsMail(SecurityEnabledUser from, User to, double score, int place, Project project)
            throws Exception {
        // fill common data into the xml
        XMLDocument xmlDocument = new XMLDocument("MAILDATA");
        xmlDocument.addTag(new ValueTag("CODER_HANDLE", to.getHandle()));
        xmlDocument.addTag(new ValueTag("PROJECT_NAME", project.getName()));
        xmlDocument.addTag(new ValueTag("SCORE", formatNumber(score)));
        xmlDocument.addTag(new ValueTag("PLACE", getPlaceString(place)));



        if (place != PLACE_SCREENING_FAIL) {
            PhaseInstance[] phases = project.getTimeline();
            for (int i = 0; i < phases.length; i++) {
                if (phases[i].getPhase().getId() == Phase.ID_FINAL_FIXES) {
                    xmlDocument.addTag(new ValueTag("DEADLINE", formatDate(phases[i].getEndDate())));
                }
            }
            UserRole[] roles = project.getParticipants();
            for (int i = 0; i < roles.length; i++) {
                if (roles[i].getUser().equals(to) && roles[i].getRole().getId() == Role.ID_DESIGNER_DEVELOPER) {
                    float payment = roles[i].getPaymentInfo().getPayment();
                    xmlDocument.addTag(new ValueTag("INITIAL_PAYMENT", formatNumber(payment * .75)));
                    xmlDocument.addTag(new ValueTag("REMAINING_PAYMENT", formatNumber(payment * .25)));
                    xmlDocument.addTag(new ValueTag("TOTAL_PAYMENT", formatNumber(payment)));
                }
            }
        }

        // choose the template
        boolean isDesign = project.getProjectType().getId() == ProjectType.ID_DESIGN;
        String mailXSL = isDesign ? "design" : "development";
        if (place == PLACE_SCREENING_FAIL) {
            mailXSL += ConfigHelper.SCREEN_FAIL_XSL;
        } else if (score < ConfigHelper.getMinimumScore()) {
            mailXSL += ConfigHelper.MINSCORE_XSL;
        } else if (place > 1) {
            mailXSL += ConfigHelper.LOOSER_XSL;
        } else {
            mailXSL += ConfigHelper.WINNER_XSL;
        }

        String filenameXSL = ConfigHelper.getXSL(mailXSL);

        if (filenameXSL == null) {
            StringBuffer s = new StringBuffer();
            s.append("\nThe " + mailXSL + " property doesn't seem to exist in " + ConfigHelper.CONFIG_FILE + '\n');
            s.append("(place=" + place + " score=" + score + " design=" + isDesign + ")\n\n");
            s.append("The contents of the config file is: \n\n>>> ");

            InputStream is = MailHelper.class.getClassLoader().getResourceAsStream(ConfigHelper.CONFIG_FILE);
            int ch;
            while ((ch = is.read()) != -1) {
                s.append((char) ch);
                if (ch == '\n') {
                    s.append(">>> ");
                }
            }
            is.close();
            s.append('\n');

            throw new Exception(s.toString());
        }

        // format mail and send it
        String bodyText = formatBody(xmlDocument, filenameXSL);
        sendMail(from, to, project.getName() + " results", bodyText);
    }

    static void failedReviewMail(SecurityEnabledUser from, User to, int notFixedItems, String comment, Project project)
                     throws Exception {

        // fill common data into the xml
        XMLDocument xmlDocument = new XMLDocument("MAILDATA");
        xmlDocument.addTag(new ValueTag("USER_NAME", to.getHandle()));
        xmlDocument.addTag(new ValueTag("PROJECT_NAME", project.getName()));
        xmlDocument.addTag(new ValueTag("NOT_FIXED_ITEMS",notFixedItems ));
        xmlDocument.addTag(new ValueTag("COMMENT", comment));
        xmlDocument.addTag(new ValueTag("IS_COMMENTED", comment.trim().length() > 0 ? 1 : 0));

        String filenameXSL = ConfigHelper.getXSL(ConfigHelper.FINAL_REVIEW_FAIL_XSL);

        if (filenameXSL == null) {
            StringBuffer s = new StringBuffer();
            s.append("\nThe " + ConfigHelper.FINAL_REVIEW_FAIL_XSL + " property doesn't seem to exist in " + ConfigHelper.CONFIG_FILE + '\n');
            s.append("The contents of the config file is: \n\n>>> ");

            InputStream is = MailHelper.class.getClassLoader().getResourceAsStream(ConfigHelper.CONFIG_FILE);
            int ch;
            while ((ch = is.read()) != -1) {
                s.append((char) ch);
                if (ch == '\n') {
                    s.append(">>> ");
                }
            }
            is.close();
            s.append('\n');

            throw new Exception(s.toString());
        }

        // format mail and send it
        String bodyText = formatBody(xmlDocument, filenameXSL);

        sendMail(from, to, "Final Review results", bodyText);
    }

    static String formatNumber(double dscore) {
        long score = Math.round(dscore * 100);
        return score / 100 + "." + (score % 100 < 10 ? "0" : "") + score % 100;
    }

    /**
     * Send mail to a user when the project changes.
     *
     * @param from the sender (an admin)
     * @param to the user to send the mail to
     * @param oldProject the old state of the project (previous)
     *        not used right now but might be needed in the future
     * @param newProject the new state of the project (current/new)
     * @param reason an explanation from the admin
     * @param changeType the type of the change (combination of the constants defined above)
     *
     * @throws Exception propagate any exceptions
     */
    static void projectChangeMail(SecurityEnabledUser from, User to, Project proj, String reason) throws Exception {
        // get number of submissions
        InitialSubmission[] subms = EJBHelper.getDocumentManager().getInitialSubmissions(proj, false, from.getTCSubject());
        int count = 0;
        for (int i = 0; i < subms.length; i++) {
            if (!subms[i].isRemoved()) {
                count++;
            }
        }

        XMLDocument xmlDocument = new XMLDocument("MAILDATA");
        xmlDocument.addTag(new ValueTag("CODER_HANDLE", to.getHandle()));
        xmlDocument.addTag(new ValueTag("PROJECT_PHASE", proj.getCurrentPhase().getName()));
        xmlDocument.addTag(new ValueTag("SUBMISSIONS", count));
        generatePhaseDetail(xmlDocument, proj);
        generateProjectDetail(xmlDocument, proj);
        String bodyText = formatBody(xmlDocument, ConfigHelper.getProjectChangeXSL());
        sendMail(from, to, proj.getName() + " project change", bodyText);
    }

    /**
     * Send mail to a user to inform him about the weekly review assignments.
     *
     * @param to the user role of the user to be notified
     * @param project the project
     *
     * @throws Exception propagate any exceptions
     */
    static void weeklyAssignmentNotification(User sender, User[] users, Project[] projects) throws Exception {
        if (users.length > 0 && projects.length > 0) {
            XMLDocument xmlDocument = new XMLDocument("MAILDATA");
            ValueTag coderHandle = new ValueTag("CODER_HANDLE", "");
            xmlDocument.addTag(coderHandle);
            xmlDocument.addTag(new ValueTag("PROJECT_TYPE", projects[0].getProjectType().getName()));
            xmlDocument.addTag(new ValueTag("CURRENT_DATE", formatDate(new Date())));
            generatePhaseDetail(xmlDocument, projects[0]);
            for (int i = 0; i < projects.length; i++) {
                RecordTag projTag = new RecordTag("PROJECT");
                generateProjectDetail(projTag, projects[i]);
                xmlDocument.addTag(projTag);
            }
            for (int i = 0; i < users.length; i++) {
                coderHandle.setValue(users[i].getHandle());
                String bodyText = formatBody(xmlDocument, ConfigHelper.getWeeklyNotificationXSL());
                sendMail(sender, users[i], "Weekly review assignments", bodyText);
            }
        }
    }

    /**
     * Send mail to a reviewer to inform him that an appeal has been created.
     *
     * @param project the project.
     * @param appeal the appeal.
     *
     * @throws Exception propagate any exceptions
     */
    static void appealCreated(Project project, Appeal appeal) throws Exception {
        XMLDocument xmlDocument = new XMLDocument("MAILDATA");
        ScorecardQuestion question = appeal.getQuestion();
        xmlDocument.addTag(new ValueTag("PROJECT_NAME", project.getName()));
        xmlDocument.addTag(new ValueTag("QUESTION_TEXT", question.getQuestionText()));
        xmlDocument.addTag(new ValueTag("APPEAL_TEXT", appeal.getAppealText()));
        xmlDocument.addTag(new ValueTag("QUESTION_NUMBER",
                question.getSequenceLocation() + "." +
                question.getScorecardSection().getSequenceLocation() + "." +
                question.getScorecardSection().getSectionGroup().getSequenceLocation()));
        String bodyText = formatBody(xmlDocument, ConfigHelper.getAppealCreatedXSL());
        sendMail(project.getProjectManager(), appeal.getReviewer(), "Appeal created", bodyText);
    }

    /**
     * Send mail to a submitter to inform him that his appeal has been resolved.
     *
     * @param project the project.
     * @param appeal the appeal.
     *
     * @throws Exception propagate any exceptions
     */
    static void appealResolved(Project project, Appeal appeal) throws Exception {
        XMLDocument xmlDocument = new XMLDocument("MAILDATA");
        ScorecardQuestion question = appeal.getQuestion();
        xmlDocument.addTag(new ValueTag("PROJECT_NAME", project.getName()));
        xmlDocument.addTag(new ValueTag("QUESTION_TEXT", question.getQuestionText()));
        xmlDocument.addTag(new ValueTag("APPEAL_TEXT", appeal.getAppealText()));
        xmlDocument.addTag(new ValueTag("APPEAL_RESPONSE", appeal.getAppealResponse()));
        xmlDocument.addTag(new ValueTag("QUESTION_NUMBER",
                question.getSequenceLocation() + "." +
                question.getScorecardSection().getSequenceLocation() + "." +
                question.getScorecardSection().getSectionGroup().getSequenceLocation()));
        System.out.println("QUESTION_NUMBER = " + question.getSequenceLocation() + "." +
                question.getScorecardSection().getSequenceLocation() + "." +
                question.getScorecardSection().getSectionGroup().getSequenceLocation());
        String bodyText = formatBody(xmlDocument, ConfigHelper.getAppealResolvedXSL());
        sendMail(project.getProjectManager(), appeal.getAppealer(), "Appeal resolved", bodyText);
    }

    /**
     * Send a mail from a user to another user.
     *
     * @param from the sender
     * @param to the destination user
     * @param subject the subject
     * @param messageText the text of the message
     *
     * @throws Exception propagate any exceptions
     */
    static void sendMail(User from, User to, String subject, String messageText) throws Exception {
        if (!EJBHelper.isTestMode()) {
            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(formatAddress(from));
            message.setToAddress(formatAddress(to), TCSEmailMessage.TO);
            message.setSubject(subject);
            message.setBody(messageText);
            LogHelper.log("Sending e-mail to address: " + formatAddress(to));
            EmailEngine.send(message);
        } else {
            LogHelper.log("--mail--");
            LogHelper.log("From: " + formatAddress(from));
            LogHelper.log("To: " + formatAddress(to));
            LogHelper.log("Subject: " + subject);
            LogHelper.log(messageText);
            LogHelper.log("---end--");
        }
    }

    private static String formatDate(Date date) {
        Calendar c = new GregorianCalendar();
        c.setTime(date);
        return (c.get(Calendar.MONTH) + 1) + "/" + c.get(Calendar.DATE);
    }

    private static void generatePhaseDetail(XMLDocument xmlDocument, Project proj) {
        PhaseInstance[] phases = proj.getTimeline();
        xmlDocument.addTag(new ValueTag("SCREENING_DATE",
                formatDate(phases[0].getStartDate()) + " - " + formatDate(phases[0].getEndDate())));
        xmlDocument.addTag(new ValueTag("REVIEW_DATE",
                formatDate(phases[1].getStartDate()) + " - " + formatDate(phases[1].getEndDate())));
        xmlDocument.addTag(new ValueTag("AGGREGATION_DATE",
                formatDate(phases[2].getStartDate()) + " - " + formatDate(phases[2].getEndDate())));
        xmlDocument.addTag(new ValueTag("FINAL_REVIEW_DATE",
                formatDate(phases[3].getStartDate()) + " - " + formatDate(phases[3].getEndDate())));
    }

    /**
     * Formats the body of the email by appling an XSL transformation to an XML file which is dinamically
     * generated (containing info such as the names of the sender and receiver, the project name and id and the reason.
     *
     * @param from the sender user
     * @param to the receiver user
     * @param proj the project
     * @param reason the reason
     * @param changeType the type of the project change (a combination of the constants defined in this class)
     * @param bodyXSL the name of the XSL file (template of the body) to be applied
     *
     * @return the formatted body
     *
     * @exception XSLTransformerWrapperException propagated from the document generator
     * @exception FileNotFoundException if the XSL file is not found
     */
    private static String formatBody(XMLDocument xmlDocument, String bodyXSL)
            throws XSLTransformerWrapperException, FileNotFoundException {
        String xmlData = xmlDocument.createXML();
        if (EJBHelper.isTestMode()) {
            LogHelper.log(xmlData);
        }
        XSLTransformerWrapper xslt = new XSLTransformerWrapper(new FileInputStream(bodyXSL));
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        xslt.transform(new ByteArrayInputStream(xmlData.getBytes()), out);
        String result = out.toString();
        return result;
    }

    private static void generateProjectDetail(RecordTag recordTag, Project proj) {
        recordTag.addTag(new ValueTag("PROJECT_NAME", proj.getName()));
        UserRole[] roles = proj.getParticipants();

        // calculate the additional payment for the primary reviewer
        int primaryExtraPayment = 0;
        for (int i = 0; i < roles.length; i++) {
            long roleId = roles[i].getRole().getId();
            if (roleId == Role.ID_PRIMARY_SCREENER || roleId == Role.ID_AGGREGATOR || roleId == Role.ID_FINAL_REVIEWER) {
                primaryExtraPayment += (int) roles[i].getPaymentInfo().getPayment();
            }
        }

        for (int i = 0; i < roles.length; i++) {
            ReviewerResponsibility resp = roles[i].getReviewerResponsibility();
            if (resp != null) {
                RecordTag comp = new RecordTag("REVIEWER");
                comp.addTag(new ValueTag("REVIEWER_ROLE", resp.getName()));
                comp.addTag(new ValueTag("REVIEWER_HANDLE",
                        roles[i].getUser() == null ? "" : roles[i].getUser().getHandle()));
                int payment = (int) roles[i].getPaymentInfo().getPayment();
                if (resp.getId() == ReviewerResponsibility.ID_FAILURE) {
                    payment += primaryExtraPayment;
                }
                comp.addTag(new ValueTag("REVIEWER_PAYMENT", payment));
                recordTag.addTag(comp);
            }
        }
        recordTag.addTag(new ValueTag("PM_HANDLE", proj.getProjectManager().getHandle()));
    }

    /**
     * Format the email address for a user ("name surname [handle]" <email@address>).
     *
     * @param user the user
     *
     * @return the formatted address
     */
    private static String formatAddress(User user) {
        return "\"" + user.getFirstName() + " " + user.getLastName()
                + " [" + user.getHandle() + "]\" <" + user.getEmail() + ">";
    }

    /**
     *
     */
    /*public static void main(String[] args) throws Exception {
        EJBHelper.setTestMode(true);
        LoginResult res = (LoginResult) new Login().start(new LoginData("marc", "secret"));
        //MailHelper.resultsMail(res.getUser(), MockupData.user3, 75.99, 1, MockupData.proj1);
        MailHelper.projectChangeMail(res.getUser(), MockupData.user3, MockupData.proj1, "");
     }*/

}

