package com.topcoder.apps.review.autopilottimer;

import com.topcoder.date.workdays.WorkdaysUnitOfTime;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.ConfigHelper;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.*;
import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.document.TestCase;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.ScreeningScorecard;
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

/********************************************************************
 * This class creates a timer that will perform auto pilot logic.
 * This functionality is implemented as a JBoss-specific MBean.
 *
 * @author rfairfax
 *******************************************************************/
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
                        if (projs[i].getCurrentPhaseInstance() != null && projs[i].getCurrentPhaseInstance().getEndDate() != null && projs[i].getCurrentPhaseInstance().getEndDate().getTime() <= System.currentTimeMillis()) {
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
                                String template = docManager.getDefaultScorecardTemplate(p.getProjectType().getId(), ScreeningScorecard.SCORECARD_TYPE).getName();
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
                        if (projs[i].getCurrentPhaseInstance().getEndDate() != null && projs[i].getCurrentPhaseInstance().getEndDate().getTime() <= System.currentTimeMillis()) {
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
                            }
                        }
// end by cucu
                    } else if (projs[i].getCurrentPhaseInstance().getPhase().getId() == Phase.ID_REVIEW) {
                        // PLK esto lo voy a usar para ajustar las fechas.
                        // if (projs[i].getCurrentPhaseInstance().getEndDate() != null && projs[i].getCurrentPhaseInstance().getEndDate().getTime() <= System.currentTimeMillis()) {
                        // timeDiff < 0 early phase change.

                        logger.info("PLK SELECTED: " + projs[i].getProjectName());

                        Project p = projectTracker.getProject(projs[i], user.getTCSubject());
                        if (!p.getAutoPilot()) continue;

                        /* PLK copiado */
                        //check if all screenings are done,check to see if something passes
                        boolean passed = false;
                        double minscore = ConfigHelper.getMinimumScore();
                        ReviewScorecard[] scorecard = null;

                        logger.info("1");

                        try {
                            scorecard = docManager.getReviewScorecard(p, user.getTCSubject());
                        } catch (RuntimeException re) {
                            logger.info("AutoPilotTimer: " + re.getMessage());
                            continue;
                        }

                        logger.info("2");

                        int count = 0;
                        for (int j = 0; j < scorecard.length; j++) {
                            if (!scorecard[j].isCompleted()) {
                                //nothing to do
                                logger.info("Unable to move to appeals phase: Uncomplete scorecards ");
                                passed = false;
                                continue;
                            }

                            count++;

                            if (scorecard[j].getScore() >= minscore) {
                                passed = true;
                            }
                        }

                        logger.info("3");

                        if (!passed) {
                            logger.info("Unable to move to appeals phase: Uncomplete scorecards or no submission passed review");
                            continue;
                        }

                        logger.info("4");

                        int sub_count = 0;
                        InitialSubmission[] arr = docManager.getInitialSubmissions(p, false, user.getTCSubject());
                        for (int j = 0; j < arr.length; j++) {
                            if (arr[j].isAdvancedToReview())
                                sub_count++;
                        }

                        logger.info("5");

                        //get submission count
                        if (count != (sub_count * 3)) {
                            logger.info("Unable to move to appeals phase: Submission count mismatch");
                            continue;
                        }

                        logger.info("6");

                        //check test cases
                        TestCase[] testcases = null;
                        testcases = docManager.getTestCases(p, -1, user.getTCSubject());

                        if (testcases.length != 3) {
                            logger.info("Unable to move to appeals phase: Incorrect number of testcases");
                            continue;
                        }
                        /* PLK copiado */

                        logger.info("7");
                        logger.info(new Date(System.currentTimeMillis()).toString());

                        TCWorkdays workDays = null;
                        try {
                            workDays = new TCWorkdays(ConfigHelper.getString(ConfigHelper.WORKDAYS_CONF_FILE), TCWorkdays.XML_FILE_FORMAT);
                        } catch (Exception e) {
                            logger.info("Couldn't load the TCWorkdays configuration due to: " + e.getMessage());
                            continue;
                        }

                        // timeline update
//                        long timeDiff = System.currentTimeMillis() - projs[i].getCurrentPhaseInstance().getEndDate().getTime();

                        Date curDate = new Date(System.currentTimeMillis());

                        logger.info("current date: " + curDate.toString());

                        int timeDiff = 0;
                        if (curDate.getTime() > projs[i].getCurrentPhaseInstance().getEndDate().getTime()) {
                            timeDiff = workDays.getWorkableMinutes(projs[i].getCurrentPhaseInstance().getEndDate(), curDate);
                        } else {
                            timeDiff = workDays.getWorkableMinutes(curDate, projs[i].getCurrentPhaseInstance().getEndDate()) * -1;
                        }

                        logger.info("timeDiff: " + timeDiff);
                        if (timeDiff != 0) {
                            boolean startUpdatingPhases = false;
                            PhaseInstance[] timeline = p.getTimeline();
                            for (int j = 0; j < timeline.length; j++) {
                                if (startUpdatingPhases) {
                                    logger.info("Original start: " + timeline[j].getStartDate().toString());
                                    logger.info("Original end: " + timeline[j].getEndDate().toString());

                                    if (timeDiff > 0) {
                                        timeline[j].setStartDate(workDays.add(timeline[j].getStartDate(), WorkdaysUnitOfTime.MINUTES, timeDiff));
                                        timeline[j].setEndDate(workDays.add(timeline[j].getEndDate(), WorkdaysUnitOfTime.MINUTES, timeDiff));
                                    } else {
                                        timeline[j].setStartDate(workDays.sub(timeline[j].getStartDate(), WorkdaysUnitOfTime.MINUTES, timeDiff * -1));
                                        timeline[j].setEndDate(workDays.sub(timeline[j].getEndDate(), WorkdaysUnitOfTime.MINUTES, timeDiff * -1));
                                    }

                                    logger.info("Changed start: " + timeline[j].getStartDate().toString());
                                    logger.info("Changed end: " + timeline[j].getEndDate().toString());
                                }
                                if (timeline[j].getPhase().getId() == projs[i].getCurrentPhaseInstance().getPhase().getId()) {
                                    // If the phase ends early. In this case, adjust the duration of the phase to the correct time.
                                    if (timeDiff < 0) {
                                        logger.info("Original end: " + timeline[j].getEndDate().toString());
                                        timeline[j].setEndDate(workDays.sub(timeline[j].getEndDate(), WorkdaysUnitOfTime.MINUTES, timeDiff * -1));
                                        logger.info("Changed end: " + timeline[j].getEndDate().toString());
                                    }
                                    startUpdatingPhases = true;
                                }
                            }
                        }

                        //move to appeals
                        OnlineReviewProjectData orpd = new OnlineReviewProjectData(user, projs[i]);
                        ProjectForm form = new ProjectForm();

                        form.fromProject(p);

 //                       form.setSendMail(true); // PLK
                        form.setSendMail(false); // PLK
                        form.setScorecardTemplates(docManager.getScorecardTemplates());
                        form.setCurrentPhase("Appeals");
                        form.setReason("auto pilot advancing to Appeals");

                        logger.info("8");

                        ProjectData data = form.toActionData(orpd);
                        ResultData result = new BusinessDelegate().projectAdmin(data);
                        if (!(result instanceof SuccessResult)) {
                            logger.debug("ERROR " + result.toString());
                        }

                        logger.info("Moved ok!");
                    }
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
