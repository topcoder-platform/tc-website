/*
 * AutoPilot.java
 *
 * Created on November 4, 2004, 7:25 AM
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.security.TCSubject;
import com.topcoder.security.RolePrincipal;

import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
/**
 *
 * @author  rfairfax
 */
public class AutoPilot {
    public static ResultData screeningPMReview(ProjectData data) {
        try {
            TCSubject subject = new TCSubject(100129);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);
            
            Project project = data.getProject();
            
            if(!project.getAutoPilot()) return new SuccessResult();
            
            //check if all screenings are done,check to see if something passes
            boolean passed = false;
            double minscore = ConfigHelper.getMinimumScore();

            ScreeningScorecard[] scorecard = docManager.getScreeningScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if(!scorecard[i].isCompleted() || !scorecard[i].isPMReviewed()) {
                    //nothing to do
                    return new SuccessResult();
                }

                if(scorecard[i].getScore() >= minscore) {
                    passed = true;
                }
            } 
            
            if(!passed)
                return new SuccessResult();
            
            //check project for reviewers
            UserRole[] participants = project.getParticipants(); 
            for(int i = 0; i < participants.length;i++) {
                if( participants[i].getRole().getId() == Role.ID_REVIEWER ) { 
                    if(participants[i].getUser() == null) {
                        //nothing to do, need to fill reviewer spots
                        return new SuccessResult();
                    }
                }
            }
            
            //advance to review
            ProjectForm form = new ProjectForm();
                            
            form.fromProject(project);

            form.setScorecardTemplates(docManager.getScorecardTemplates());

            form.setCurrentPhase("Review");

            form.setReason("auto pilot advancing to review");

            //check for screening scorecard template
            if(form.getReviewTemplateId() == -1 ) {
                String template = docManager.getDefaultScorecardTemplate(project.getProjectType().getId(), ReviewScorecard.SCORECARD_TYPE).getName();
                form.setReviewTemplate(template);
            }
            
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

    public static ResultData screeningEmail(ScreeningData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(100129);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = projectTracker.getProject(data.getProject(), user.getTCSubject());
            
            if(!project.getAutoPilot()) return new SuccessResult();

            //check if all screenings are done,check to see if something passes
            boolean passed = false;
            double minscore = ConfigHelper.getMinimumScore();

            ScreeningScorecard[] scorecard = docManager.getScreeningScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if(!scorecard[i].isCompleted()) {
                    //nothing to do
                    return new SuccessResult();
                }

                if(scorecard[i].getScore() >= minscore) {
                    passed = true;
                }
            } 

            //lookup pm
            String email = "";
            UserRole[] participants = project.getParticipants(); 
            for(int i = 0; i < participants.length;i++) {
                if( participants[i].getRole().getId() == Role.ID_PRODUCT_MANAGER ) { 
                    email = participants[i].getUser().getEmail();
                }
            }

            if(email.equals("")) {
                return new FailureResult("Cannot locate PM for Auto Pilot");
            }

            //override, change me
            email = "rfairfax@topcoder.com";


            //check if nothing passed, send email
            if(!passed) {

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



        } catch(Exception e) {
            return new FailureResult(e.toString());
        }
        
        return new SuccessResult();
    }
    
    public static ResultData reviewEmail(ReviewData data) {
        try {
            //setup user info
            TCSubject subject = new TCSubject(100129);
            subject.addPrincipal(new RolePrincipal("Administrator", 1));

            UserManagerLocal userManager = EJBHelper.getUserManager();
            DocumentManagerLocal docManager = EJBHelper.getDocumentManager();
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

            SecurityEnabledUser user = userManager.getUser(subject);

            Project project = data.getReviewScorecard().getProject();
            
            if(!project.getAutoPilot()) return new SuccessResult();

            //check if all screenings are done,check to see if something passes
            boolean passed = false;
            double minscore = ConfigHelper.getMinimumScore();

            ReviewScorecard[] scorecard = docManager.getReviewScorecard(project, user.getTCSubject());
            for (int i = 0; i < scorecard.length; i++) {
                if(!scorecard[i].isCompleted()) {
                    //nothing to do
                    return new SuccessResult();
                }

                if(scorecard[i].getScore() >= minscore) {
                    passed = true;
                }
            } 

            //lookup pm
            String email = "";
            UserRole[] participants = project.getParticipants(); 
            for(int i = 0; i < participants.length;i++) {
                if( participants[i].getRole().getId() == Role.ID_PRODUCT_MANAGER ) { 
                    email = participants[i].getUser().getEmail();
                }
            }

            if(email.equals("")) {
                return new FailureResult("Cannot locate PM for Auto Pilot");
            }

            //override, change me
            email = "rfairfax@topcoder.com";


            //check if nothing passed, send email
            if(!passed) {

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



        } catch(Exception e) {
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

