/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.security.TCSubject;
import com.topcoder.util.scheduler.Job;
import com.topcoder.util.scheduler.Schedulable;
import com.topcoder.util.scheduler.Scheduler;

import java.util.*;

/**
 * Utility class that handles sending the weekly email notifications for review assignments.
 *
 * @author adic
 * @version 1.0
 */
public class ReviewerAssignmentNotification implements Runnable, Schedulable {

    /**
     * Flag that indicates whether the weekly notification is running or not.
     */
    private boolean isDone = true;

    /**
     * The main method (entry point when run from command line).
     * It reads the weekday and time for assignment notifications from the business_logic_config.properties file,
     * then it sets up a Job Scheduler job for the first day occuring on that weekday, at that time.
     *
     * @param args the command line params
     *        if there is exactly one param with the value "now" the assignment notification are
     *        launched immediatly
     */
    public static void main(String[] args) {
        if (args != null && args.length > 0 && args[0].equals("now")) {
            EJBHelper.setTestMode(true);
            LogHelper.log("Running reviewer assignment notification NOW ...");
            new ReviewerAssignmentNotification().run();
        }

        LogHelper.log("Setting up Job Scheduler ...");

        // start the Job scheduler
        Scheduler scheduler = new Scheduler(ConfigHelper.getConfigNamespace());
        List jobs = scheduler.getJobList();
        for (Iterator it = jobs.iterator(); it.hasNext();) {
            scheduler.stopJob((Job) it.next());
        }

        try {
            // get the weekday and time from config file
            int day = Integer.parseInt(ConfigHelper.getWeeklyNotificationsWeekday());
            String time = ConfigHelper.getWeeklyNotificationsTime();

            // find the next date falling on the value of day (weekday)
            GregorianCalendar startDate = new GregorianCalendar();
            while (startDate.get(Calendar.DAY_OF_WEEK) != day) {
                startDate.add(Calendar.DATE, 1);
            }

            // get the time
            int hour = Integer.parseInt(time.substring(0, time.indexOf(':')));
            int minute = Integer.parseInt(time.substring(time.indexOf(':') + 1));
            startDate.set(Calendar.HOUR_OF_DAY, hour);
            startDate.set(Calendar.MINUTE, minute);
            startDate.set(Calendar.SECOND, 0);

            LogHelper.log("Setting up a job for " + startDate.getTime() + "...");

            // add job
            scheduler.addJob(
                    new Job("weekly_notifications", startDate, null,
                            1, Calendar.WEEK_OF_YEAR, Scheduler.JOB_TYPE_JAVA_CLASS,
                            ReviewerAssignmentNotification.class.getName())
            );

            // start job
            LogHelper.log("Starting Job Scheduler ...");
            scheduler.start();
            LogHelper.log("Job Scheduler started");
        } catch (Throwable e) {
            LogHelper.log("Error adding the weekly notifications job", e);
        }
    }

    /**
     * Constructor.
     */
    public ReviewerAssignmentNotification() {
        LogHelper.log("ReviewerAssignmentNotification instantiated");
    }

    /**
     * This method is the entry point that is going to be called by the Job Scheduler when the time comes.
     * It logins the system-admin user specified in business_logic_config.properties then it
     * iterates all projects looking for project in review phase with notifications not yet sent.
     * All the participants in such projects which are reviewers are notified.
     */
    public synchronized void run() {
        LogHelper.log("ReviewerAssignmentNotification started ...");
        isDone = false;

        try {
            // get the system-admin user name and password from config file and login
            String username = ConfigHelper.getWeeklyNotificationsUser();
            String password = ConfigHelper.getWeeklyNotificationsPassword();
            TCSubject subject = EJBHelper.getLogin().login(username, password);
            UserManagerLocal userManager = EJBHelper.getUserManager();
            SecurityEnabledUser user = userManager.getUser(subject);

            // used to collect information to be sent
            List designProjects = new ArrayList();
            List developmentProjects = new ArrayList();
            Set designReviewers = new HashSet();
            Set developmentReviewers = new HashSet();

            // iterate projects and collection information
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            UserProjectInfo[] projects = projectTracker.getProjectInfo(subject);
            for (int i = 0; i < projects.length; i++) {
                Project project = projectTracker.getProject(projects[i], user.getTCSubject());

                // look for project in screening phase with notifications not yet sent
                if (PhaseHelper.canScreen(project) && !project.isNotificationSent()) {

                    // collect projects that need notifications to be sent
                    if (project.getProjectType().getId() == ProjectType.ID_DESIGN) {
                        designProjects.add(project);
                    } else {
                        developmentProjects.add(project);
                    }

                    // iterate participants
                    UserRole[] userRoles = project.getParticipants();
                    for (int j = 0; j < userRoles.length; j++) {
                        // notify reviewers & PM
                        if (userRoles[j].getUser() != null
                                && (RoleHelper.isReviewer(userRoles[j]) || RoleHelper.isProductManager(userRoles[j]))) {
                            if (project.getProjectType().getId() == ProjectType.ID_DESIGN) {
                                designReviewers.add(userRoles[j].getUser());
                            } else
                                developmentProjects.add(userRoles[j].getUser());
                        }
                    }

                }
            }

            // send the mails
            MailHelper.weeklyAssignmentNotification(
                    user,
                    (User[]) designReviewers.toArray(new User[0]),
                    (Project[]) designProjects.toArray(new Project[0]));
            MailHelper.weeklyAssignmentNotification(
                    user,
                    (User[]) developmentReviewers.toArray(new User[0]),
                    (Project[]) developmentProjects.toArray(new Project[0]));

            // set notification flags to true
            for (Iterator it = designProjects.iterator(); it.hasNext();) {
                ((Project) it.next()).setNotificationSent(true);
            }
            for (Iterator it = developmentProjects.iterator(); it.hasNext();) {
                ((Project) it.next()).setNotificationSent(true);
            }
            LogHelper.log("ReviewerAssignmentNotification terminated without errors");
        } catch (Exception e) {
            LogHelper.log("Error while sending weekly review assignment notifications: ", e);
        } finally {
            isDone = true;
        }
    }

    /**
     * Called by the Job Scheduler to see if the job is done.
     *
     * @return true if the job is done, false otherwise
     */
    public boolean isDone() {
        return isDone;
    }

    /**
     * Called by the Job Scheduler to get a human readable description of the status.
     *
     * @return the status
     */
    public String getStatus() {
        return "working";
    }

    /**
     * Called by the Job Scheduler then the job should finish.
     */
    public void close() {
    }

}

