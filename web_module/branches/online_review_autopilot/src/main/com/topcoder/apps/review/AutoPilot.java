/*
 * AutoPilot.java
 *
 * Created on November 4, 2004, 7:25 AM
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.ScreeningScorecard;
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
                mail.append("has completed screening and has no passing submissions");

                sendMail("autopilot@topcoder.com", email, "AutoPilot: Screening Notification", mail.toString());
            } else {
                //send notification to start PM reviews

                StringBuffer mail = new StringBuffer();
                mail.append("The following project: \n\n");
                mail.append(project.getName());
                mail.append("has completed screening and is ready for PM review.");

                sendMail("autopilot@topcoder.com", email, "AutoPilot: Screening Notification", mail.toString());
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

