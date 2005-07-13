/*
 * AutoPilot.java
 *
 * Created on November 4, 2004, 7:25 AM
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;

import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;

import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author  rfairfax
 */
public class AutoPilot {
    public static final long ADMINISTRATOR_ID = 100129;

    public static ResultData finalReviewEmail(FinalReviewData data) {
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

    public static ResultData aggregationReview(AggregationReviewData data) {
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

            //get all review worksheets
            AggregationReview[] aggReviews = docManager.getAggregationReview(project, user.getTCSubject());

            int count = 0;

            for (int i = 0; i < aggReviews.length; i++) {
                if (aggReviews[i].isCompleted())
                    count++;
                else
                    return new SuccessResult();
            }

            if (count < 2)
                return new SuccessResult();

            //move to final fixes
            ProjectForm form = new ProjectForm();

            form.fromProject(project);

            form.setSendMail(true);

            form.setScorecardTemplates(docManager.getScorecardTemplates());

            form.setCurrentPhase("Final Fixes");

            form.setReason("auto pilot advancing to final fixes");

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
            if(data.getProject().getCurrentPhaseInstance().getPhase().getId() != Phase.ID_APPEALS) return new SuccessResult();
*/
            if (data.getProject().getCurrentPhaseInstance().getPhase().getId() != Phase.ID_APPEALS_RESPONSE) return new SuccessResult();

/* by cucu
            // we don't care if we're before or after the deadline, because appeals can't be created in appeals_response phase.
            if(data.getProject().getCurrentPhaseInstance().getEndDate() != null
                && data.getProject().getCurrentPhaseInstance().getEndDate().getTime() > System.currentTimeMillis() ) return new SuccessResult();
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

    public static ResultData reviewPMReview(ProjectData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = data.getProject();

            if (!project.getAutoPilot()) return new SuccessResult();

            //check if all screenings are done,check to see if something passes
            boolean passed = false;
            double minscore = ConfigHelper.getMinimumScore();

            int count = 0;
            ReviewScorecard[] scorecard = docManager.getReviewScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if (!scorecard[i].isCompleted() || !scorecard[i].isPMReviewed()) {
                    //nothing to do
                    return new SuccessResult();
                }

                count++;

                if (scorecard[i].getScore() >= minscore) {
                    passed = true;
                }
            }

            if (!passed)
                return new SuccessResult();

            int sub_count = 0;
            InitialSubmission[] arr = docManager.getInitialSubmissions(project, false, user.getTCSubject());
            for (int i = 0; i < arr.length; i++) {
                if (arr[i].isAdvancedToReview())
                    sub_count++;
            }

            //get submission count
            if (count != (sub_count * 3))
                return new SuccessResult();

            //check test cases
            TestCase[] testcases = null;
            testcases = docManager.getTestCases(project, -1, user.getTCSubject());

            if (testcases.length != 3)
                return new SuccessResult();

            //advance to appeals
            ProjectForm form = new ProjectForm();

            form.fromProject(project);

            form.setSendMail(true);

            form.setScorecardTemplates(docManager.getScorecardTemplates());

            form.setCurrentPhase("Appeals");

            form.setReason("auto pilot advancing to appeals");

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

    public static ResultData screeningPMReview(ProjectData data) {
        try {
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = data.getProject();

            if (!project.getAutoPilot()) return new SuccessResult();

            //check if all screenings are done,check to see if something passes
            boolean passed = false;
            double minscore = ConfigHelper.getMinimumScore();

            int count = 0;
            ScreeningScorecard[] scorecard = docManager.getScreeningScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if (!scorecard[i].isCompleted() || !scorecard[i].isPMReviewed()) {
                    //nothing to do
                    return new SuccessResult();
                }

                count++;

                if (scorecard[i].getScore() >= minscore) {
                    passed = true;
                }
            }

            if (!passed)
                return new SuccessResult();

            //get submission count
            if (count != docManager.getInitialSubmissions(project, false, user.getTCSubject()).length)
                return new SuccessResult();

            //check project for reviewers
            UserRole[] participants = project.getParticipants();
            for (int i = 0; i < participants.length; i++) {
                if (participants[i].getRole().getId() == Role.ID_REVIEWER) {
                    if (participants[i].getUser() == null) {
                        //nothing to do, need to fill reviewer spots
                        return new SuccessResult();
                    }
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
                String template = docManager.getDefaultScorecardTemplate(project.getProjectType().getId(), ReviewScorecard.SCORECARD_TYPE).getName();
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

    public static ResultData reviewEmail(ReviewData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(ADMINISTRATOR_ID);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = data.getReviewScorecard().getProject();

            if (!project.getAutoPilot()) return new SuccessResult();

            //check if all screenings are done,check to see if something passes
            boolean passed = false;
            double minscore = ConfigHelper.getMinimumScore();

            int count = 0;
            ReviewScorecard[] scorecard = docManager.getReviewScorecard(project, user.getTCSubject());
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

            int sub_count = 0;
            InitialSubmission[] arr = docManager.getInitialSubmissions(project, false, user.getTCSubject());
            for (int i = 0; i < arr.length; i++) {
                if (arr[i].isAdvancedToReview())
                    sub_count++;
            }

            //get submission count
            if (count != (sub_count * 3))
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
                mail.append("\n\nhas completed review and has no passing submissions");

                sendMail("autopilot@topcoder.com", email, "AutoPilot: Review Notification", mail.toString());
            } else {
                //send notification to start PM reviews

                StringBuffer mail = new StringBuffer();
                mail.append("The following project: \n\n");
                mail.append(project.getName());
                mail.append("\n\nhas completed review and is ready for PM review.");

                sendMail("autopilot@topcoder.com", email, "AutoPilot: Review Notification", mail.toString());
            }


        } catch (Exception e) {
            return new FailureResult(e.toString());
        }

        return new SuccessResult();
    }

    static void sendMail(String from, String to, String subject, String messageText) throws Exception {
        TCSEmailMessage message = new TCSEmailMessage();
        message.setFromAddress(from);
        message.setToAddress(to, TCSEmailMessage.TO);
        message.setSubject(subject);
        message.setBody(messageText);
        EmailEngine.send(message);
    }
}

