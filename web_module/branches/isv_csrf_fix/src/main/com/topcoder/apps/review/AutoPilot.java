/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.rboard.RBoardPayment;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.date.workdays.WorkdaysUnitOfTime;
import com.topcoder.web.common.model.FixedPriceComponent;

import java.util.Date;

/**
 * <strong>Purpose</strong>:
 * Centralizes the actions to perform (emails, phase advance, etc.) when AutoPilot is ON.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * <code>aggregationReview()</code> was modified to send notification emails if a aggregation review was rejected.
 * In this case, AutoPilot automatically moves back to Aggregation phase. Another change is that when advancing to
 * Final Fixes, the timeline is updated.
 * </li>
 * <li>
 * <code>review()</code> was added to manage emails and phase changes after review is completed. After advancing the
 * phase, it also updates the timeline.
 * </li>
 * <li>
 * <code>reviewPMReview()</code> and <code>reviewEmail()</code> were deleted since PM review of reviews is no longer
 * needed and phase change is now automated.
 * </li>
 * <li>
 * <code>advancePhase()</code> was added as a helper method for the phase change and timeline update.
 * </li>
 * </ol>
 *
 * Version 1.0.2 Change notes:
 * <ol>
 * <li>
 * <code>review()</code> was changed to avoid checking for at least one passed score.
 * </li>
 * </ol>
 *
 * Version 1.0.3 Change notes:
 * <ol>
 * <li>
 * Added automated payment calculation when moving from screening to review phase.
 * </li>
 * </ol>
 *
 * Version 1.0.4 Change notes:
 * <ol>
 * <li>
 * Automated reviewer's payment resize (screening-review phase advance) when info is found in rboard_payment.
 * </li>
 * </ol>
 * @author rfairfax, pulky
 * @version 1.0.4
 */
public class AutoPilot {

    /**
     *
     * The id of the administrator.
     */
    public static final long ADMINISTRATOR_ID = 100129;

    /**
     * <strong>Purpose</strong>:
     * Sends notification of completed final review to the PM
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData finalReviewEmail(FinalReviewData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());

            if (!project.getAutoPilot()) return new SuccessResult();

            //lookup pm
            String email = "";
            UserRole[] participants = project.getParticipants();
            for (int i = 0; i < participants.length; i++) {
                if (participants[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                    email = participants[i].getUser().getEmail();
                }
            }

            if (email.equals("")) {
                return new FailureResult("Cannot locate PM for Auto Pilot");
            }

            //override, change me
            //email = "rfairfax@topcoder.com";


            //check if nothing passed, send email

            StringBuffer mail = new StringBuffer();
            mail.append("The following project: \n\n");
            mail.append(project.getName());
            mail.append("\n\nhas completed final review");

            sendMail("autopilot@topcoder.com", email, "AutoPilot: Final Review Notification", mail.toString());


        } catch (Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }

    /**
     * <strong>Purpose</strong>:
     * Sends notification of failed final review to the PM, reviewers and the winner. Automated phase change back to
     * Final Fixes.
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData finalReviewFailed(FinalReviewData data, int notFixedItems, String comment) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());

            if(!project.getAutoPilot()) return new SuccessResult();

            // Send mails to the product Manager and reviewers
            UserRole[] participants = project.getParticipants();
            for(int i = 0; i < participants.length;i++) {
                if( (participants[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) ||
                    (participants[i].getRole().getId() == Role.ID_REVIEWER) )
                {
                    MailHelper.failedReviewMail(user, participants[i].getUser(), notFixedItems, comment, project);
                }
            }

            // add the winner for receiving the mail
            MailHelper.failedReviewMail(user, project.getWinner(), notFixedItems, comment, project);

            // Move to final fixes
            ProjectForm form = new ProjectForm();

            form.fromProject(project);

            form.setCurrentPhase("Final Fixes");

            form.setScorecardTemplates(docManager.getScorecardTemplates());

            form.setReason("auto pilot moving to Final Fixes");

            UserProjectInfo[] projs = projectTracker.getProjectInfo(user.getTCSubject());
            UserProjectInfo info = null;
            for(int i = 0; i < projs.length; i++) {
                if(projs[i].getId() == project.getId()) {
                    info = projs[i];
                }
            }
            if(info == null) return new FailureResult("Project not found");

            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, info);
            ProjectData new_data = form.toActionData(orpd);
            ResultData result = new BusinessDelegate().projectAdmin(new_data);
            if(!(result instanceof SuccessResult)) {
                return result;
            }
        } catch(Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }

    /**
     * <strong>Purpose</strong>:
     * Automated phase change to Final review.
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData finalFixes(SolutionData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());

            if (!project.getAutoPilot()) return new SuccessResult();

            //move to final review
            ProjectForm form = new ProjectForm();

            form.fromProject(project);

            form.setSendMail(true);

            form.setScorecardTemplates(docManager.getScorecardTemplates());

            form.setCurrentPhase("Final Review");

            form.setReason("auto pilot advancing to final review");

            UserProjectInfo[] projs = projectTracker.getProjectInfo(user.getTCSubject());
            UserProjectInfo info = null;
            for (int i = 0; i < projs.length; i++) {
                if (projs[i].getId() == project.getId()) {
                    info = projs[i];
                }
            }

            if (info == null) return new FailureResult("Project not found");

            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, info);

            ProjectData new_data = form.toActionData(orpd);
            ResultData result = new BusinessDelegate().projectAdmin(new_data);
            if (!(result instanceof SuccessResult)) {
                return result;
            }

        } catch (Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }

    /**
     * <strong>Purpose</strong>:
     * Automated phase change to Final Fixes or back to Aggregation. If there is at least one rejected aggregation
     * review, the phase goes to Aggregation and an email is sent with the summary of the aggregation review. Otherwise,
     * the project advances to Final Fixes. (With timeline update)
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData aggregationReview(AggregationReviewData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            UserProjectInfo info = data.getProject();
            SecurityEnabledUser user = userManager.getUser(subject);
            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());

            if (!project.getAutoPilot()) return new SuccessResult();

            //get all review worksheets
            AggregationReview[] aggReviews = docManager.getAggregationReview(project, user.getTCSubject());

            int count = 0;
            boolean rejected = false;

            for (int i = 0; i < aggReviews.length; i++) {
                if (aggReviews[i].isCompleted())
                    count++;
                else
                    return new SuccessResult();

                if (aggReviews[i].getStatus().getId() == AggregationApproval.ID_REJECTED) {
                    rejected = true;
                }
            }

            if (count < 2)
                return new SuccessResult();

            // The most common case is to advance to Final Fixes and update the timeline.
            boolean updateTimeline = true;
            String movePhase = "Final Fixes";
            if (rejected) {
                // Send mails to the product Manager and reviewers
                UserRole[] participants = project.getParticipants();
                for(int i = 0; i < participants.length;i++) {
                    if( (participants[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) ||
                        (participants[i].getRole().getId() == Role.ID_REVIEWER) )
                    {
                        MailHelper.rejectedAggregationReviewMail(user, participants[i].getUser(), project);
                    }
                }
                // move back to Aggregation
                updateTimeline = false;
                movePhase = "Aggregation";
            }
            return advancePhase(movePhase, docManager, user, project, info, updateTimeline);
        } catch (Exception e) {
            return new FailureResult(e.toString());
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Automated phase change to Aggregation review.
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData aggregation(AggregationData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());

            if (!project.getAutoPilot()) return new SuccessResult();

            if (!data.getAggregationWorksheet().isCompleted()) return new SuccessResult();

            //move to aggregation review
            ProjectForm form = new ProjectForm();

            form.fromProject(project);

            form.setSendMail(true);

            form.setScorecardTemplates(docManager.getScorecardTemplates());

            form.setCurrentPhase("Aggregation Review");

            form.setReason("auto pilot advancing to aggregation review");

            UserProjectInfo[] projs = projectTracker.getProjectInfo(user.getTCSubject());
            UserProjectInfo info = null;
            for (int i = 0; i < projs.length; i++) {
                if (projs[i].getId() == project.getId()) {
                    info = projs[i];
                }
            }

            if (info == null) return new FailureResult("Project not found");

            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, info);

            ProjectData new_data = form.toActionData(orpd);
            ResultData result = new BusinessDelegate().projectAdmin(new_data);
            if (!(result instanceof SuccessResult)) {
                return result;
            }

        } catch (Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }

    /**
     * <strong>Purpose</strong>:
     * Sends notification of completed appeals response to the PM
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData appeal(AppealData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());

            if (!project.getAutoPilot()) return new SuccessResult();

            //check if appeals phase should be over
/* by cucu
            if(data.getProject().getCurrentPhaseInstance().getPhase().getId() != Phase.ID_APPEALS) return new
             SuccessResult();
*/
            if (data.getProject().getCurrentPhaseInstance().getPhase().getId() != Phase.ID_APPEALS_RESPONSE) {
                return new SuccessResult();
            }

/* by cucu
            // we don't care if we're before or after the deadline, because appeals can't be created in
            appeals_response phase.
            if(data.getProject().getCurrentPhaseInstance().getEndDate() != null
                && data.getProject().getCurrentPhaseInstance().getEndDate().getTime() > System.currentTimeMillis() )
                return new SuccessResult();
*/

            //after appeals phase end, check for open appeals
            Appeal[] appeals = docManager.getAppeals(project, -1, -1, user.getTCSubject());
            for (int i = 0; i < appeals.length; i++) {
                if (!appeals[i].isResolved())
                    return new SuccessResult();
            }

            //lookup pm
            String email = "";
            UserRole[] participants = project.getParticipants();
            for (int i = 0; i < participants.length; i++) {
                if (participants[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                    email = participants[i].getUser().getEmail();
                }
            }

            if (email.equals("")) {
                return new FailureResult("Cannot locate PM for Auto Pilot");
            }

            //override, change me
            //email = "rfairfax@topcoder.com";


            //check if nothing passed, send email

            StringBuffer mail = new StringBuffer();
            mail.append("The following project: \n\n");
            mail.append(project.getName());
            mail.append("\n\nhas completed appeals response");

            sendMail("autopilot@topcoder.com", email, "AutoPilot: Appeals Response Notification", mail.toString());
        } catch(Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }


    /**
     * <strong>Purpose</strong>:
     * Intermediate method for review-appeals phase change.
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     * @since 1.0.1
     */
    public static ResultData reviewFromTestcase(SolutionData data) {
        try {
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));
            UserManagerLocal userManager = EJBHelper.getUserManager();
            SecurityEnabledUser user = userManager.getUser(subject);
            UserProjectInfo info = data.getProject();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(info, user.getTCSubject());
            return (review(user, project, info));
        } catch (Exception e) {
            return new FailureResult(e.toString());
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Intermediate method for review-appeals phase change.
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     * @since 1.0.1
     */
    public static ResultData reviewFromScorecard(ReviewData data) {
        try {
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));
            UserManagerLocal userManager = EJBHelper.getUserManager();
            return (review(userManager.getUser(subject), data.getReviewScorecard().getProject(), data.getProject()));
        } catch (Exception e) {
            return new FailureResult(e.toString());
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Automated phase change to review.
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData screeningPMReview(ProjectData data) {
        try {
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            RBoardPayment rBoardPayment = EJBHelper.getRBoardPayment();
            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = data.getProject();

            if (!project.getAutoPilot()) return new SuccessResult();

            //check if all screenings are done,check to see if something passes
            //double minscore = ConfigHelper.getMinimumScore();
            int count = 0;
            int passedCount = 0;
            ScreeningScorecard[] scorecard = docManager.getScreeningScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if (!scorecard[i].isCompleted() || !scorecard[i].isPMReviewed()) {
                    //nothing to do
                    return new SuccessResult();
                }

                count++;

                if (scorecard[i].getSubmission().isAdvancedToReview()) {
                    passedCount++;
                }

                // Shouldn't take into consideration the score, only the pass mark.
               /* if (scorecard[i].getScore() >= minscore) {
                    passedCount++;
                }*/
            }

            if (passedCount == 0)
                return new SuccessResult();

            //get submission count
            if (count != docManager.getInitialSubmissions(project, false, user.getTCSubject()).length)
                return new SuccessResult();

            // only permitted levels
            int levelId = ((new Long(project.getLevelId())).intValue() == FixedPriceComponent.LEVEL2) ?
                    FixedPriceComponent.LEVEL2 : FixedPriceComponent.LEVEL1;

            float primaryFixedPayment = 0;
            float secondaryFixedPayment = 0;

            // resize payments if there is info in rboard_payment
            // TCS Release 2.2.1 - fixed the mapping from project type ID to phase ID so that other competition
            // types are supported
//            ResultSetContainer rsc = rBoardPayment.getPayments(project.getId(), project.getProjectType().getId() == ProjectType.ID_DESIGN ?
//                    112 : 113, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);
            ResultSetContainer rsc = rBoardPayment.getPayments(project.getId(), project.getProjectType().getId() + 111,
                                                               DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);
            if (rsc != null) {
                for (int i = 0; i < rsc.size(); i++) {
                    if (rsc.getIntItem(i, "primary_ind") == 1) {
                        primaryFixedPayment = rsc.getFloatItem(i, "amount");
                    } else {
                        secondaryFixedPayment = rsc.getFloatItem(i, "amount");
                    }
                }
            }

            // TCS Release 2.2.1 - fixed the mapping from project type ID to phase ID so that other competition
            // types are supported
//            FixedPriceComponent fpc = new FixedPriceComponent(
//                    levelId, count, passedCount,
//                    project.getProjectType().getId() == ProjectType.ID_DESIGN ? 112 : 113,
//                    primaryFixedPayment, secondaryFixedPayment);
            FixedPriceComponent fpc = new FixedPriceComponent(
                    levelId, count, passedCount,
                    (int) (project.getProjectType().getId() + 111),
                    primaryFixedPayment, secondaryFixedPayment, 0);

            // check project for reviewers
            UserRole[] participants = project.getParticipants();

            // get primary screener ID
            long primaryScreenerId = -1;
            for (int i = 0; i < participants.length && primaryScreenerId == -1; i++) {
                if (participants[i].getRole().getId() == Role.ID_PRIMARY_SCREENER) {
                    primaryScreenerId = participants[i].getUser().getId();
                }
            }

            for (int i = 0; i < participants.length; i++) {
                long roleId = participants[i].getRole().getId();
                if (roleId == Role.ID_REVIEWER) {
                    if (participants[i].getUser() == null) {
                        //nothing to do, need to fill reviewer spots
                        return new SuccessResult();
                    }
                }

                // calculate payment for reviewers tasks. If the primary screener is also a reviewer,
                // he only gets CoreCost for the review since startup time is already calculated
                // for the screening.
                float amountToPay = 0;
                if (roleId == Role.ID_AGGREGATOR)
                    amountToPay = fpc.getAggregationCost();
                else if (roleId == Role.ID_PRIMARY_SCREENER)
                    amountToPay = fpc.getScreeningCost();
                else if (roleId == Role.ID_FINAL_REVIEWER)
                    amountToPay = fpc.getFinalReviewCost();
                else if (roleId == Role.ID_REVIEWER)
                    amountToPay = (participants[i].getUser().getId() == primaryScreenerId) ?
                            fpc.getCoreReviewCost() : fpc.getReviewCost();

                // update payment info.
                if (amountToPay > 0) {
                    PaymentInfo paymentInfo = participants[i].getPaymentInfo();
                    paymentInfo.setPayment(amountToPay);
                }
            }

            //advance to review
            ProjectForm form = new ProjectForm();

            form.fromProject(project);

            form.setSendMail(true);

            form.setScorecardTemplates(docManager.getScorecardTemplates());

            form.setCurrentPhase("Review");

            form.setReason("auto pilot advancing to review");

            //check for screening scorecard template
            if (form.getReviewTemplateId() == -1) {
                String template = docManager.getDefaultScorecardTemplate(project.getProjectType().getId(),
                    ReviewScorecard.SCORECARD_TYPE).getName();
                form.setReviewTemplate(template);
            }

            UserProjectInfo[] projs = projectTracker.getProjectInfo(user.getTCSubject());
            UserProjectInfo info = null;
            for (int i = 0; i < projs.length; i++) {
                if (projs[i].getId() == project.getId()) {
                    info = projs[i];
                }
            }

            if (info == null) return new FailureResult("Project not found");

            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, info);

            ProjectData new_data = form.toActionData(orpd);
            ResultData result = new BusinessDelegate().projectAdmin(new_data);
            if (!(result instanceof SuccessResult)) {
                return result;
            }


        } catch (Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }

    /**
     * <strong>Purpose</strong>:
     * Sends notification of completed screening to the PM
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    public static ResultData screeningEmail(ScreeningData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());

            if (!project.getAutoPilot()) return new SuccessResult();

            //check if all screenings are done,check to see if something passes
            boolean passed = false;
            double minscore = ConfigHelper.getMinimumScore();

            int count = 0;
            ScreeningScorecard[] scorecard = docManager.getScreeningScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if (!scorecard[i].isCompleted()) {
                    //nothing to do
                    return new SuccessResult();
                }

                count++;

                if (scorecard[i].getScore() >= minscore) {
                    passed = true;
                }
            }

            //get submission count
            if (count != docManager.getInitialSubmissions(project, false, user.getTCSubject()).length)
                return new SuccessResult();

            //lookup pm
            String email = "";
            UserRole[] participants = project.getParticipants();
            for (int i = 0; i < participants.length; i++) {
                if (participants[i].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                    email = participants[i].getUser().getEmail();
                }
            }

            if (email.equals("")) {
                return new FailureResult("Cannot locate PM for Auto Pilot");
            }

            //override, change me
            //email = "rfairfax@topcoder.com";


            //check if nothing passed, send email
            if (!passed) {

                StringBuffer mail = new StringBuffer();
                mail.append("The following project: \n\n");
                mail.append(project.getName());
                mail.append("\n\nhas completed screening and has no passing submissions");

                sendMail("autopilot@topcoder.com", email, "AutoPilot: Screening Notification", mail.toString());
            } else {
                //send notification to start PM reviews

                StringBuffer mail = new StringBuffer();
                mail.append("The following project: \n\n");
                mail.append(project.getName());
                mail.append("\n\nhas completed screening and is ready for PM review.");

                sendMail("autopilot@topcoder.com", email, "AutoPilot: Screening Notification", mail.toString());
            }


        } catch (Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }

    /**
     * <strong>Purpose</strong>:
     * Helper method for sending mails.
     *
     * @param from The sender of the mail.
     * @param to The reciever of the mail.
     * @param subject The subject of the mail.
     * @param messageText The Body of the mail.
     *
     * @throws Exception propagate any exceptions
     */
    static void sendMail(String from, String to, String subject, String messageText) throws Exception {
        TCSEmailMessage message = new TCSEmailMessage();
        message.setFromAddress(from);
        message.setToAddress(to, TCSEmailMessage.TO);
        message.setSubject(subject);
        message.setBody(messageText);
        EmailEngine.send(message);
    }


    /**
     * <strong>Purpose</strong>:
     * Automated phase change to Appeals with timeline update.
     *
     * @param data The data from the Action.
     *
     * @return the ResultData of the operation.
     */
    private static ResultData review(SecurityEnabledUser user, Project project, UserProjectInfo info) {
        try {
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();

            if (!project.getAutoPilot()) return new SuccessResult();

            int count = 0;
            ReviewScorecard[] scorecard = docManager.getReviewScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if (!scorecard[i].isCompleted()) {
                    //nothing to do
                    return new SuccessResult();
                }

                count++;
            }

            int sub_count = 0;
            InitialSubmission[] arr = docManager.getInitialSubmissions(project, false, user.getTCSubject());
            for (int i = 0; i < arr.length; i++) {
                if (arr[i].isAdvancedToReview())
                    sub_count++;
            }

            //get submission count
            if (count != (sub_count * 3))
                return new SuccessResult();

            // if development project, check test cases.
            if (project.getProjectType().getId() == ProjectType.ID_DEVELOPMENT) {
                TestCase[] testcases = null;
                testcases = docManager.getTestCases(project, -1, user.getTCSubject());

                if (testcases.length != 3)
                    return new SuccessResult();
            }

            // Advance to Appeals.
            return advancePhase("Appeals", docManager, user, project, info, true);

        } catch (Exception e) {
            return new FailureResult(e.toString());
        }
    }

    /**
     * Helper method for advancing phases and timeline updates.
     *
     * @param phase The phase to move to.
     * @param docManager The manager for project retrieval and update.
     * @param user The user triggering the action.
     * @param project The project in reference.
     * @param info The project info.
     * @param updateTimeline True if timeline should be updated.
     *
     * @return the ResultData of the operation.
     * @since 1.0.1
     */
    private static ResultData advancePhase(String phase, DocumentManagerLocal docManager, SecurityEnabledUser user,
        Project project, UserProjectInfo info, boolean updateTimeline) {
        try {
            if (updateTimeline) {
                // Gets the workdays component for thetimeline update.
                TCWorkdays workDays = null;
                workDays = new TCWorkdays(ConfigHelper.getString(ConfigHelper.WORKDAYS_CONF_FILE),
                    TCWorkdays.XML_FILE_FORMAT);

                Date curDate = new Date(System.currentTimeMillis());
                int timeDiff = 0;

                Date phaseEndDate = project.getCurrentPhaseInstance().getEndDate();
                if (curDate.getTime() > phaseEndDate.getTime()) {
                    timeDiff = workDays.getWorkableMinutes(phaseEndDate, curDate);
                } else {
                    timeDiff = workDays.getWorkableMinutes(curDate, phaseEndDate) * -1;
                }

                // Just for now, timeline is updated only for late completion.
                //if (timeDiff != 0) {
                if (timeDiff > 0) {
                    boolean startUpdatingPhases = false;
                    PhaseInstance[] timeline = project.getTimeline();
                    for (int j = 0; j < timeline.length; j++) {
                        if (startUpdatingPhases) {
                            if (timeDiff > 0) {
                                timeline[j].setStartDate(workDays.add(timeline[j].getStartDate(),
                                    WorkdaysUnitOfTime.MINUTES, timeDiff));
                                timeline[j].setEndDate(workDays.add(timeline[j].getEndDate(),
                                    WorkdaysUnitOfTime.MINUTES, timeDiff));
                            } else {
                                timeline[j].setStartDate(workDays.sub(timeline[j].getStartDate(),
                                    WorkdaysUnitOfTime.MINUTES, timeDiff * -1));
                                timeline[j].setEndDate(workDays.sub(timeline[j].getEndDate(),
                                    WorkdaysUnitOfTime.MINUTES, timeDiff * -1));
                            }
                        }
                        if (timeline[j].getPhase().getId() == project.getCurrentPhaseInstance().getPhase().getId()) {
                            // If the phase ends early, in this case, adjust the duration of the phase to
                            // the correct time.
                            if (timeDiff < 0) {
                                timeline[j].setEndDate(workDays.sub(timeline[j].getEndDate(),
                                    WorkdaysUnitOfTime.MINUTES, timeDiff * -1));
                            }
                            startUpdatingPhases = true;
                        }
                    }
                }
            }

            //advance phase
            ProjectForm form = new ProjectForm();
            form.fromProject(project);
            form.setSendMail(true);
            form.setScorecardTemplates(docManager.getScorecardTemplates());
            form.setCurrentPhase(phase);
            form.setReason("auto pilot advancing to " + phase);

            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, info);
            ProjectData new_data = form.toActionData(orpd);
            ResultData result = new BusinessDelegate().projectAdmin(new_data);

            return result;
        } catch (Exception e) {
            return new FailureResult(e.toString());
        }
    }
}

