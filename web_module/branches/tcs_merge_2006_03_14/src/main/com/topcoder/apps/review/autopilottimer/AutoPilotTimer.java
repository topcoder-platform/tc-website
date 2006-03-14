/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.review.autopilottimer;

import com.topcoder.apps.review.*;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.document.Appeal;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import org.apache.log4j.Logger;
import org.jboss.system.ServiceMBeanSupport;

import javax.naming.NameNotFoundException;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

/**
 * <strong>Purpose</strong>:
 * This class creates a timer that will perform auto pilot logic.
 * This functionality is implemented as a JBoss-specific MBean.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * Added mail notification to PM for the Appeals - Appeals response phase change if there weren't existing appeals.
 * </li>
 * </ol>
 *
 * Version 1.0.2 Change notes:
 * <ol>
 * <li>
 * Added notification when project is marked as allowing appeals responses during appeals phase and
 * when moving to appeal response phase there aren't unresolved appeals.
 * </li>
 * </ol>
 *
 * @author rfairfax, pulky
 * @version 1.0.2
 */
public class AutoPilotTimer
        extends ServiceMBeanSupport
        implements AutoPilotTimerMBean {
    /**
     * Number of minutes between refreshes.
     */
    private static final int DELAY = 5;
    private static Logger logger = Logger.getLogger(AutoPilotTimer.class);
    private static final String NAME = "AutoPilotTimer";
/*
    private String isInitialized = String.valueOf(false);
*/
    private static String status = "Not Initialized";

    private Timer timer;

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBeanSupport#stopService()
     */
    protected void stopService() throws Exception {
        super.stopService();
        timer.cancel();
    }

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBean#getName()
     */
    public String getName() {
        return NAME;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.cacherefresher.CacheRefresherMBean#isInitialised()
     */

    /*
    public String isInitialized() {
        return isInitialized;
    }
    */

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.cacherefresher.CacheRefresherMBean#getInitStatus()
     */
    public String getInitStatus() {
        return status;
    }

    private class SubmissionTask extends TimerTask {
        public void run() {
            logger.debug("AUTO PILOT TIMER FIRED");

            try {
                //setup user
                TCSubject subject = new TCSubject(100129);
                subject.addPrincipal(new RolePrincipal("Administrator", 1));

                UserManagerLocal userManager = EJBHelper.getUserManager();
                DocumentManagerLocal docManager = EJBHelper.getDocumentManager();

                SecurityEnabledUser user = userManager.getUser(subject);

                //get projects that are in submission phase and have submission end time > current
                ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();

                UserProjectInfo[] projs = projectTracker.getProjectInfo(user.getTCSubject());

                for (int i = 0; i < projs.length; i++) {
                    if (projs[i].getCurrentPhaseInstance().getPhase().getId() == Phase.ID_SUBMISSION) {
                        if (projs[i].getCurrentPhaseInstance() != null &&
                            projs[i].getCurrentPhaseInstance().getEndDate() != null &&
                                projs[i].getCurrentPhaseInstance().getEndDate().getTime()
                                    <= System.currentTimeMillis()) {
                            logger.debug("SELECTED: " + projs[i].getProjectName());

                            //move to screening
                            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, projs[i]);
                            ProjectForm form = new ProjectForm();

                            Project p = projectTracker.getProject(projs[i], user.getTCSubject());

                            if (!p.getAutoPilot()) continue;

                            form.fromProject(p);

                            form.setScorecardTemplates(docManager.getScorecardTemplates());

                            form.setCurrentPhase("Screening");

                            form.setReason("auto pilot advancing to screening");

                            //check for screening scorecard template
                            if (form.getScreeningTemplateId() == -1) {
                                String template = docManager.getDefaultScorecardTemplate(p.getProjectType().getId(),
                                    ScreeningScorecard.SCORECARD_TYPE).getName();
                                form.setScreeningTemplate(template);
                            }

                            ProjectData data = form.toActionData(orpd);
                            ResultData result = new BusinessDelegate().projectAdmin(data);
                            if (!(result instanceof SuccessResult)) {
                                logger.debug("ERROR " + result.toString());
                            }
                        }
                        // by cucu
                        // if in appeals phase and it ended, move to appeals response
                    } else if (projs[i].getCurrentPhaseInstance().getPhase().getId() == Phase.ID_APPEALS) {
                        if (projs[i].getCurrentPhaseInstance().getEndDate() != null &&
                            projs[i].getCurrentPhaseInstance().getEndDate().getTime() <= System.currentTimeMillis()) {
                            logger.debug("SELECTED: " + projs[i].getProjectName());

                            //move to appeals response
                            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, projs[i]);
                            ProjectForm form = new ProjectForm();

                            Project p = projectTracker.getProject(projs[i], user.getTCSubject());

                            if (!p.getAutoPilot()) continue;

                            form.fromProject(p);

                            form.setSendMail(true);

                            form.setScorecardTemplates(docManager.getScorecardTemplates());

                            form.setCurrentPhase("Appeals Response");

                            form.setReason("auto pilot advancing to Appeals Response");

                            ProjectData data = form.toActionData(orpd);

                            ResultData result = new BusinessDelegate().projectAdmin(data);

                            if (!(result instanceof SuccessResult)) {
                                logger.debug("ERROR " + result.toString());
                            } else {
                                Appeal[] appeals = docManager.getAppeals(p, -1, -1, user.getTCSubject());
                                UserRole[] participants = p.getParticipants();
                                StringBuffer mail = null;
                                String emailSubject = "";
                                // If there are no appeals, send email to PM
                                if (appeals.length == 0) {
                                    mail = new StringBuffer();
                                    mail.append("The following project: \n\n");
                                    mail.append(p.getName());
                                    mail.append("\n\nhas completed appeals phase and doesn't have");
                                    mail.append(" existing appeals.");
                                    logger.info("No appeals found, sending mail to PM...");
                                    emailSubject = "AutoPilotTimer: Appeals Notification (No Appeals found)";
                                } else {
                                    // if appeals responses are allowed during appeal phase,
                                    // check if all appeals are responded and then send notification.
                                    if (p.getResponseDuringAppeals()) {
                                        boolean allResolved = true;
                                        for (int j = 0; j < appeals.length && allResolved; j++) {
                                            allResolved = allResolved && appeals[j].isResolved();
                                        }
                                        if (allResolved) {
                                            mail = new StringBuffer();
                                            mail.append("The following project: \n\n");
                                            mail.append(p.getName());
                                            mail.append("\n\nhas completed appeals phase with all");
                                            mail.append(" appeals responded.");
                                            logger.info("All appeals resolved, sending mail to PM...");
                                            emailSubject =
                                                "AutoPilotTimer: Appeals Notification (All Appeals responded)";
                                        }
                                    }
                                }

                                if (mail != null) {
                                    //lookup pm
                                    String email = "";
                                    for (int j = 0; j < participants.length; j++) {
                                        if (participants[j].getRole().getId() == Role.ID_PRODUCT_MANAGER) {
                                            email = participants[j].getUser().getEmail();
                                        }
                                    }

                                    if (email.equals("")) {
                                        logger.debug("ERROR: Cannot locate PM for Appeals Notification");
                                        continue;
                                    }

                                    sendMail("autopilot@topcoder.com", email, emailSubject,
                                            mail.toString());
                                }
                            }
                        }
                    }
                    // end by cucu

                    /* commented by cucu
                    // It doesn't make too much sense to have the timer check for appeals to be finished, because this
                    // is already checked when an appeal is solved.

                    } else if(projs[i].getCurrentPhaseInstance().getPhase().getId() == Phase.ID_APPEALS) {
                        if(projs[i].getCurrentPhaseInstance() != null &&
                            projs[i].getCurrentPhaseInstance().getEndDate() !=null &&
                                projs[i].getCurrentPhaseInstance().getEndDate().getTime()
                                    <= System.currentTimeMillis()) {
                            logger.debug("SELECTED: " + projs[i].getProjectName());

                            OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, projs[i]);
                            ProjectForm form = new ProjectForm();

                            Project p = projectTracker.getProject(projs[i], user.getTCSubject());

                            if(!p.getAutoPilot()) continue;

                            //check appeals
                            boolean good = true;
                            Appeal[] appeals = docManager.getAppeals(p, -1, -1, user.getTCSubject());
                            for(int j = 0; j < appeals.length; j++) {
                                if(!appeals[j].isResolved()) {
                                    good = false;
                                    break;
                                }
                            }

                            if(!good) continue;

                            //lookup pm
                            String email = "";
                            UserRole[] participants = p.getParticipants();
                            for(int j = 0; j < participants.length;j++) {
                                if( participants[j].getRole().getId() == Role.ID_PRODUCT_MANAGER ) {
                                    email = participants[j].getUser().getEmail();
                                }
                            }

                            if(email.equals("")) {
                                continue;
                            }



                            //override, change me
                            //email = "rfairfax@topcoder.com";


                            //check if nothing passed, send email

                            StringBuffer mail = new StringBuffer();
                            mail.append("The following project: \n\n");
                            mail.append(p.getName());
                            mail.append("\n\nhas completed appeals");

                            //sendMail("autopilot@topcoder.com", email, "AutoPilot: Appeals Notification",
                                mail.toString());
                        }
                    }
                    */
                }
            } catch (Exception e) {
                if (!(e instanceof NameNotFoundException))
                    logger.error(e.getMessage());
            }
        }
    }

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBeanSupport#startService()
     */
    public void startService() throws Exception {
        try {

            timer = new Timer();
            Calendar c = Calendar.getInstance();
            String beginMonth = String.valueOf(c.get(Calendar.MONTH) + 1);
            String beginDay = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
            String beginYear = String.valueOf(c.get(Calendar.YEAR));
            String beginHour = String.valueOf(c.get(Calendar.HOUR_OF_DAY));

            Date beginDate = formDate(beginYear, beginMonth, beginDay, beginHour);

            timer.scheduleAtFixedRate(new SubmissionTask(), beginDate, //initial delay
                    DELAY * 60 * 1000); //subsequent rate
/*
            isInitialized = String.valueOf(true);
*/
        } catch (Exception e) {
            logger.error("AutoPilotTimer: Exception on init: " + e);
            status = "Exception on init: " + e;
            throw e;
        }
        status = "Initialized";
    }

    private Date formDate(String year, String month, String day, String hour) {
        //if we don't have all the values then just exit
        if (year == null || month == null || day == null || hour == null) {
            return new Date(); //so we don't blow up in certain places
        }
        Calendar c = Calendar.getInstance();
        c.set(Integer.parseInt(year),
                months[Integer.parseInt(month)],
                Integer.parseInt(day),
                Integer.parseInt(hour), 0, 0);
        c.set(Calendar.MILLISECOND, 0);
        return c.getTime();
    }

    private static int[] months =
            new int[]{-1, Calendar.JANUARY, Calendar.FEBRUARY, Calendar.MARCH,
                      Calendar.APRIL, Calendar.MAY, Calendar.JUNE, Calendar.JULY,
                      Calendar.AUGUST, Calendar.SEPTEMBER, Calendar.OCTOBER,
                      Calendar.NOVEMBER, Calendar.DECEMBER};

    static void sendMail(String from, String to, String subject, String messageText) throws Exception {
        TCSEmailMessage message = new TCSEmailMessage();
        message.setFromAddress(from);
        message.setToAddress(to, TCSEmailMessage.TO);
        message.setSubject(subject);
        message.setBody(messageText);
        EmailEngine.send(message);
    }
}
