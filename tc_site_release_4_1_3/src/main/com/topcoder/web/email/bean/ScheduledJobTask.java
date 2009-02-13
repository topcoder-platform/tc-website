package com.topcoder.web.email.bean;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.ejb.EmailServices.EmailJob;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.servlet.EmailConstants;
import com.topcoder.web.email.servlet.TaskRouter;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;

/**
 * ScheduledJobTask.java
 *
 * Description: Task bean to add/edit/remove scheduled jobs
 *
 * @author	James Lee (jameslee@cs.stanford.edu)
 * @version	1.0
 *
 */

public class ScheduledJobTask
        implements Task, Serializable {
    private static Logger log = Logger.getLogger(ScheduledJobTask.class);

    public TaskRouter perform(HttpServlet servlet,
                              HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException, ServletException {
        String step = request.getParameter(EmailConstants.STEP);
        String nextPage = "";

        // determine the desired step
        try {
            step = step.trim();
            if (step.equals(EmailConstants.SCHEDULEDJOB_LIST)) {
                nextPage = list(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CREATE)) {
                nextPage = create(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_RELOAD_CREATE)) {
                nextPage = reloadCreate(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_ADD)) {
                nextPage = add(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_EDIT)) {
                nextPage = edit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_VIEW)) {
                nextPage = view(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_RELOAD_EDIT)) {
                nextPage = reloadEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SHOW_EDIT)) {
                nextPage = showEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SAVE)) {
                nextPage = save(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_DELETE)) {
                nextPage = delete(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_LIST_ADD)) {
                nextPage = chooseListAdd(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_RELOAD_CHOOSE_LIST_ADD)) {
                nextPage = reloadChooseListAdd(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SET_LIST_ADD)) {
                nextPage = setListAdd(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_QUERY_ADD)) {
                nextPage = chooseQueryAdd(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_TEMPLATE_ADD)) {
                nextPage = chooseTemplateAdd(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD)) {
                nextPage = chooseCommandInputsAdd(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SET_COMMAND_INPUTS_ADD)) {
                nextPage = setCommandInputsAdd(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_ASK_SEND_TEST)) {
                nextPage = askSendTest(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_TEST_LIST)) {
                nextPage = chooseTestList(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE)) {
                nextPage = chooseReportTemplate(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SEND_TEST)) {
                nextPage = sendTestMessage(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_LIST_EDIT)) {
                nextPage = chooseListEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SET_LIST_EDIT)) {
                nextPage = setListEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT)) {
                nextPage = chooseTemplateEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SET_TEMPLATE_EDIT)) {
                nextPage = setTemplateEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_QUERY_EDIT)) {
                nextPage = chooseQueryEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_EDIT)) {
                nextPage = chooseCommandInputsEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SET_COMMAND_INPUTS_EDIT)) {
                nextPage = setCommandInputsEdit(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SHOW_LOG)) {
                nextPage = showLog(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SHOW_LOG_DATA)) {
                nextPage = showLogData(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SHOW_SEARCH)) {
                nextPage = showSearch(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_SHOW_SEARCH_RESULTS)) {
                nextPage = showSearchResults(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_CANCEL_JOB)) {
                nextPage = cancelJob(request, response);
            } else if (step.equals(EmailConstants.SCHEDULEDJOB_RESUME_JOB)) {
                nextPage = resumeJob(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        // forward to the next page
        return new TaskRouter(nextPage);
    }

    /**
     * Displays a list of jobs.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String list(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve jobs from last "RECENT_JOB_DAYS" days
        ArrayList jobIdList = retrieveRecentJobs(EmailConstants.RECENT_JOB_DAYS);

        request.getSession().setAttribute("JobList", jobIdList);

        return EmailConstants.SCHEDULEDJOB_LIST_PAGE;
    }

    /**
     * Begins the job creation process.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String create(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // create a new scheduled job form bean
        ScheduledJobForm job = new ScheduledJobForm();

        // set default start/end times to current time/tomorrow
        // current date
        Calendar calendar = new GregorianCalendar();
        job.setStartDate(calendar.getTime());

        // next day
        calendar.add(Calendar.DAY_OF_MONTH, 1);
        job.setEndDate(calendar.getTime());

        job.setSendTest("x");
        job.setSendReport("x");
        job.setSendReminder("x");

        // clear error list
        request.setAttribute("Error", null);

        request.getSession().setAttribute("ScheduledJob", job);

        log.debug("Creating job: " + job);

        // forward to the first scheduled job creation form
        return EmailConstants.SCHEDULEDJOB_CREATE_PAGE;
    }

    /**
     * Loads the job creation screen.  Called mostly when the months and years
     * are changed (to update the allowable days in the month)
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String reloadCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        setProperties(job, request);

        // forward to the first scheduled job creation form
        return EmailConstants.SCHEDULEDJOB_CREATE_PAGE;
    }


    /**
     * Adds a newly created job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String add(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the newly created scheduled job
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        if (!job.isAdded()) {
            if (job.getSendTestState()) {
                ScheduledJobForm testJob = null;

                // clone it
                try {
                    testJob = (ScheduledJobForm) job.clone();
                } catch (CloneNotSupportedException e) {

                    throw new ServletException(e.toString());
                }

                testJob.setSubject("TEST: " + testJob.getSubject());

                // set address list to test address list
                testJob.setListId(testJob.getTestId());
                testJob.setCommandId("0");

                // set start time to now
                Calendar calendar = new GregorianCalendar();
                testJob.setStartDate(calendar.getTime());

                // set end time to tomorrow...
                calendar.add(Calendar.DAY_OF_MONTH, 1);
                testJob.setEndDate(calendar.getTime());

                log.debug("Creating test job:\n" + testJob);
                // create test job
                createJob(testJob);
            }

            if (job.getSendReminderState()) {
                ScheduledJobForm testJob = null;

                // clone it
                try {
                    testJob = (ScheduledJobForm) job.clone();
                } catch (CloneNotSupportedException e) {

                    throw new ServletException(e.toString());
                }

                testJob.setSubject("REMINDER: " + testJob.getSubject());

                // set address list to test address list
                testJob.setListId(testJob.getTestId());
                testJob.setCommandId("0");

                // set start time to 15 minutes before job's real start
                Calendar calendar = new GregorianCalendar();
                calendar.setTime(testJob.getStartDate());
                calendar.add(Calendar.MINUTE, -15);
                testJob.setStartDate(calendar.getTime());

                log.debug("Creating reminder job:\n" + testJob);
                createJob(testJob);
            }

            ScheduledJobForm testJob = null;
            if (job.getSendReportState()) {

                // clone it
                try {
                    testJob = (ScheduledJobForm) job.clone();
                } catch (CloneNotSupportedException e) {

                    throw new ServletException(e.toString());
                }

                testJob.setSubject("REPORT: " + testJob.getSubject());

                // set address list to test address list
                testJob.setListId(testJob.getTestId());
                testJob.setCommandId("0");

                testJob.setTemplateId(request.getParameter(EmailConstants.REPORT_TEMPLATE_ID));

                // set start time to 1 minute after job's real start
                // set end time to 1 hour after job's real end
                Calendar calendar = new GregorianCalendar();
                calendar.setTime(testJob.getStartDate());
                calendar.add(Calendar.MINUTE, 1);
                testJob.setStartDate(calendar.getTime());

                calendar.setTime(testJob.getEndDate());
                calendar.add(Calendar.HOUR, 1);
                testJob.setEndDate(calendar.getTime());
            }

            log.debug("Adding scheduled job:\n" + job);

            // create the job
            int baseJobId = createJob(job);

            if (testJob != null) {
                log.debug("Creating report job:\n" + testJob);
                createReportJob(testJob, baseJobId);
            }

            job.setAdded(true);
        } else {
            log.debug("Already added the job");
        }

        // forward to scheduled job list page
        return list(request, response);
    }


    /**
     * Begins the job editing process.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int jobId;

        try {
            jobId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        ScheduledJobForm job = retrieveJob(jobId);
        request.getSession().setAttribute("ScheduledJob", job);

        log.debug("Editing scheduled job\n " + job);

        // forward to scheduled job editing page
        return showEdit(request, response);
    }


    /**
     * Views a job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String view(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int jobId;

        try {
            jobId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (Exception e) {
            throw new ServletException(e.toString());
        }

        ScheduledJobForm job = retrieveJob(jobId);
        request.setAttribute("ScheduledJob", job);

        log.debug("Viewing scheduled job\n " + job);

        // forward to scheduled job viewing page
        return EmailConstants.SCHEDULEDJOB_VIEW_PAGE;
    }


    /**
     * Loads the job editing screen.  Called mostly when the months and years
     * are changed (to update the allowable days in the month)
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String reloadEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        setProperties(job, request);

        // forward to scheduled job editing page
        return EmailConstants.SCHEDULEDJOB_EDIT_PAGE;
    }

    /**
     * Shows the job editing screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String showEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // forward to scheduled job editing page
        return EmailConstants.SCHEDULEDJOB_EDIT_PAGE;
    }


    /**
     * Saves an edited job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String save(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // set properties..
        setProperties(job, request);

        // validate job form
        ArrayList errorList = job.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Job form validation failed - errors: " + errorList);

            // set error list attribute
            request.setAttribute("Error", errorList);

            // forward back to job editing page
            return reloadEdit(request, response);
        } else {
            log.debug("Saving job:\n" + job);

            saveJob(job);

            // forward to job listings
            return list(request, response);
        }
    }

    /**
     * Deletes a job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        return list(request, response);
    }


    /**
     * Chooses a static list for the job.  If the job form is validated successfully,
     * loads the list chooser page - otherwise it forwards back to the initial creation
     * screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page

     */

    private String chooseListAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // set properties..
        setProperties(job, request);

        // validate job form
        ArrayList errorList = job.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Job form validation failed - errors: " + errorList);

            // set error list attribute
            request.setAttribute("Error", errorList);

            // forward back to job creation page
            return EmailConstants.SCHEDULEDJOB_CREATE_PAGE;
        } else {
            return reloadChooseListAdd(request, response);
        }
    }

    /**
     * Loads the list chooser screen.  Called mostly when the list group is changed
     * and the screen needs to be reloaded.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String reloadChooseListAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        String group = request.getParameter(EmailConstants.GROUP);
        if (group == null) {
            log.debug("No group specified - choosing first group");

            group = String.valueOf(AddressListTask.getFirstAddressListGroupId());
        }
        request.setAttribute(EmailConstants.GROUP, group);

        log.debug("Listing address lists for group: " + group);

        return EmailConstants.SCHEDULEDJOB_CHOOSE_LIST_ADD_PAGE;
    }

    /**
     * Chooses a predefined query for the job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseQueryAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");


        // set properties..
        setProperties(job, request);

        // validate job form
        ArrayList errorList = job.validate();
        if (errorList.size() > 0) {
            // error - go back
            log.debug("Job form validation failed - errors: " + errorList);

            // set error list attribute
            request.setAttribute("Error", errorList);

            // forward back to job creation page
            return EmailConstants.SCHEDULEDJOB_CREATE_PAGE;
        } else {
            return EmailConstants.SCHEDULEDJOB_CHOOSE_COMMAND_ADD_PAGE;
        }
    }


    /**
     * Sets command input parameters for a new job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String setCommandInputsAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // parse query inputs
        Map commandInputMap = getCommandInputs(request);

        job.setCommandInputMap(commandInputMap);

        log.debug("command inputs: " + commandInputMap);

        // forward to template choosing screen
        return chooseTemplateAdd(request, response);
    }


    /**
     * Sets the address list for a new job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String setListAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        String listId = request.getParameter(EmailConstants.LIST_ID);

        job.setListId(listId);
        job.setCommandId("0");

        log.debug("address list: " + job.getListId());

        // forward to template choosing screen
        return chooseTemplateAdd(request, response);
    }


    /**
     * Loads the template chooser screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseTemplateAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        String group = request.getParameter(EmailConstants.GROUP);
        if (group == null) {
            log.debug("No group specified - choosing first group");

            group = String.valueOf(TemplateTask.getFirstTemplateGroupId());
        }
        request.setAttribute(EmailConstants.GROUP, group);

        log.debug("Listing templates for group: " + group);

        // forward to template chooser page
        return EmailConstants.SCHEDULEDJOB_CHOOSE_TEMPLATE_ADD_PAGE;
    }

    /**
     * Loads the template chooser screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseReportTemplate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        String param = request.getParameter(EmailConstants.ID);
        if (param != null)
            job.setTestId(request.getParameter(EmailConstants.ID));

        if (job.getSendReport().length() == 0) {
            // no more information needed, create job
            return add(request, response);
        }

        String group = request.getParameter(EmailConstants.REPORT_GROUP);
        if (group == null) {
            log.debug("No group specified - choosing first group");

            group = String.valueOf(TemplateTask.getFirstTemplateGroupId());
        }
        request.setAttribute(EmailConstants.REPORT_GROUP, group);

        log.debug("Listing templates for group: " + group);

        // forward to template chooser page
        return EmailConstants.SCHEDULEDJOB_CHOOSE_REPORT_TEMPLATE_PAGE;
    }


    /**
     * Chooses command inputs for a predefined query for a new job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseCommandInputsAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        job.setCommandId(request.getParameter(EmailConstants.COMMAND_ID));
        job.setListId("0");

        log.debug("command: " + job.getCommandId());



        // retrieve command inputs for the command
        Set commandInputSet = StatisticsUtilities.getCommandInputs(Integer.parseInt(job.getCommandId()));

        // check that we need to go to the input entry screen
        if (commandInputSet.size() > 0) {
            // forward to command inputs chooser page
            return EmailConstants.SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_ADD_PAGE;
        } else {
            // forward to template choosing screen
            return chooseTemplateAdd(request, response);
        }
    }


    /**
     * Ask if user wants to send a test message.
     *
     * @param request	the HttpServletRequest object

     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page



     */

    private String askSendTest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // first set the template id
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");
        job.setTemplateId(request.getParameter("templateId"));
        log.debug("template id: " + job.getTemplateId());

        // forward to page that asks if user wants a test
        return EmailConstants.SCHEDULEDJOB_ASK_SEND_TEST_PAGE;
    }


    /**
     * Chooses list for test message.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseTestList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        job.setTemplateId(request.getParameter("templateId"));
        log.debug("template id: " + job.getTemplateId());
        job.setTestId(null);

        if (!job.getSendTestState()
                && !job.getSendReportState()
                && !job.getSendReminderState()) {
            // no more information needed, create job
            return add(request, response);
        }

        // forward to test list chooser page
        return EmailConstants.SCHEDULEDJOB_CHOOSE_TEST_LIST_PAGE;
    }


    /**
     * Sends a test message.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String sendTestMessage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        if (!job.isAdded()) {
            ScheduledJobForm testJob = null;

            // clone it
            try {
                testJob = (ScheduledJobForm) job.clone();
            } catch (CloneNotSupportedException e) {

                throw new ServletException(e.toString());
            }
            // set address list to test address list
            testJob.setListId(request.getParameter(EmailConstants.ID));
            testJob.setCommandId("0");

            // set start time to now
            Calendar calendar = new GregorianCalendar();
            testJob.setStartDate(calendar.getTime());

            // set end time to tomorrow...
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            testJob.setEndDate(calendar.getTime());

            log.debug("Creating test job:\n" + testJob);
            // create test job

            createJob(testJob);
        } else {
            log.debug("Already created job.");
        }


        // create regular job
        return add(request, response);
    }


    /**
     * Chooses a list when editing a template.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseListEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // set properties..
        setProperties(job, request);


        String group = request.getParameter(EmailConstants.GROUP);
        if (group == null) {
            log.debug("No group specified - choosing first group");

            group = String.valueOf(AddressListTask.getFirstAddressListGroupId());
        }
        request.setAttribute(EmailConstants.GROUP, group);

        log.debug("Listing address lists for group: " + group);

        // forward to the list selection page
        return EmailConstants.SCHEDULEDJOB_CHOOSE_LIST_EDIT_PAGE;
    }

    /**
     * Set the list property of the job and go back to the edit page.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page

     */

    private String setListEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        String listId = request.getParameter(EmailConstants.LIST_ID);

        job.setListId(listId);
        job.setCommandId("0");

        log.debug("address list: " + job.getListId());

        // go back to the edit page
        return showEdit(request, response);
    }

    /**
     *
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseTemplateEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // set properties..
        setProperties(job, request);

        String group = request.getParameter(EmailConstants.GROUP);
        if (group == null) {
            log.debug("No group specified - choosing first group");

            group = String.valueOf(TemplateTask.getFirstTemplateGroupId());
        }
        request.setAttribute(EmailConstants.GROUP, group);

        log.debug("Listing templates for group: " + group);

        // forward to template editing page
        return EmailConstants.SCHEDULEDJOB_CHOOSE_TEMPLATE_EDIT_PAGE;
    }

    /**
     *  Sets the template property of a job and goes back to the edit page.
     *
     * @param request	the HttpServletRequest object

     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String setTemplateEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // set the template id
        job.setTemplateId(request.getParameter("templateId"));
        log.debug("template id: " + job.getTemplateId());

        // go back to the edit page
        return showEdit(request, response);
    }

    /**
     * Shows screen to choose query while editing a job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseQueryEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // set properties..
        setProperties(job, request);

        // forward to query editing page
        return EmailConstants.SCHEDULEDJOB_CHOOSE_COMMAND_EDIT_PAGE;
    }

    /**
     * Shows screen to choose command inputs when editing a job.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String chooseCommandInputsEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // set the command id
        job.setCommandId(request.getParameter(EmailConstants.COMMAND_ID));
        job.setListId("0");

        log.debug("command: " + job.getCommandId());

        // retrieve command inputs for the command
        Set commandInputSet = StatisticsUtilities.getCommandInputs(Integer.parseInt(job.getCommandId()));

        // check that we need to go to the input entry screen
        if (commandInputSet.size() > 0) {
            // forward to command inputs chooser page
            return EmailConstants.SCHEDULEDJOB_CHOOSE_COMMAND_INPUTS_EDIT_PAGE;
        } else {
            // forward to template choosing screen
            return showEdit(request, response);
        }
    }

    /**
     * Sets command inputs for a job and goes back to the edit screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String setCommandInputsEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // retrieve the job form
        ScheduledJobForm job = (ScheduledJobForm) request.getSession().getAttribute("ScheduledJob");

        // parse query inputs
        Map commandInputMap = getCommandInputs(request);

        job.setCommandInputMap(commandInputMap);

        log.debug("command inputs: " + commandInputMap);

        // go back to the edit page
        return showEdit(request, response);
    }


    /**
     * Shows the log screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String showLog(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int jobId, sr, er;

        try {
            jobId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (NumberFormatException e) {
            throw new ServletException(e.toString());
        }

        // try to get sr/er parameters - if there are none, set to defaults
        try {
            sr = Integer.parseInt(request.getParameter(EmailConstants.SR));
            er = Integer.parseInt(request.getParameter(EmailConstants.ER));
        } catch (NumberFormatException e) {
            sr = 0;
            er = EmailConstants.DEFAULT_NUM_LOG_ENTRIES_PER_SCREEN;
        }

        log.debug("Showing log for job id: " + jobId);

        request.setAttribute(EmailConstants.SR, String.valueOf(sr));
        request.setAttribute(EmailConstants.ER, String.valueOf(er));

        Object[] jobDetails = getJobLog(jobId, sr, er);

        request.setAttribute(EmailConstants.LOG, jobDetails[0]);
        request.setAttribute(EmailConstants.PREV, jobDetails[1]);
        request.setAttribute(EmailConstants.NEXT, jobDetails[2]);

        // forward to log page
        return EmailConstants.SCHEDULEDJOB_LOG_PAGE;
    }


    /**
     * Shows the log data screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String showLogData(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int jobId, jobDetailId;

        try {
            jobId = Integer.parseInt(request.getParameter(EmailConstants.ID));
            jobDetailId = Integer.parseInt(request.getParameter(EmailConstants.JOB_DETAIL_ID));

        } catch (NumberFormatException e) {
            throw new ServletException(e.toString());
        }


        String data = getJobDetailData(jobId, jobDetailId);
        request.setAttribute(EmailConstants.JOB_LOG_DATA, data);

        // forward to log data page
        return EmailConstants.SCHEDULEDJOB_LOG_DATA_PAGE;
    }


    /**
     * Shows the search screen.
     *
     * @param request	the HttpServletRequest object

     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String showSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        // fill in dates from parameters (or use current date as defaults)
        Calendar calendar = new GregorianCalendar();
        Date currentDate = calendar.getTime();

        int startMonth, startDay, startYear, endMonth, endDay, endYear;

        try {
            startMonth = Integer.parseInt(request.getParameter("startMonth"));
        } catch (NumberFormatException e) {
            startMonth = calendar.get(Calendar.MONTH);
        }

        try {
            startDay = Integer.parseInt(request.getParameter("startDay"));
        } catch (NumberFormatException e) {
            startDay = calendar.get(Calendar.DAY_OF_MONTH);
        }

        try {
            startYear = Integer.parseInt(request.getParameter("startYear"));
        } catch (NumberFormatException e) {
            startYear = calendar.get(Calendar.YEAR);
        }

        Calendar startDate = new GregorianCalendar(startYear, startMonth, startDay);
        request.setAttribute("startDate", startDate);

        try {
            endMonth = Integer.parseInt(request.getParameter("endMonth"));
        } catch (NumberFormatException e) {
            endMonth = calendar.get(Calendar.MONTH);
        }

        try {
            endDay = Integer.parseInt(request.getParameter("endDay"));
        } catch (NumberFormatException e) {
            endDay = calendar.get(Calendar.DAY_OF_MONTH);
        }

        try {
            endYear = Integer.parseInt(request.getParameter("endYear"));
        } catch (NumberFormatException e) {
            endYear = calendar.get(Calendar.YEAR);
        }

        Calendar endDate = new GregorianCalendar(endYear, endMonth, endDay);
        request.setAttribute("endDate", endDate);

        // forward to search page
        return EmailConstants.SCHEDULEDJOB_SEARCH_PAGE;
    }

    /**
     * Performs the search and shows the results screen.
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String showSearchResults(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {

        String searchType = request.getParameter(EmailConstants.SEARCH_TYPE);

        // input map for stats query
        Map inputMap = new HashMap();
        // results of running the query
        Map resultMap = null;
        // result set container of query
        ResultSetContainer resultSetContainer = null;

        // determine the type of search requested
        if (EmailConstants.SEARCH_BY_SENDER_EMAIL.equals(searchType)) {
            // retrieve email address
            String emailAddress = request.getParameter("EmailAddress");

            log.debug("Searching on e-mail address: " + emailAddress);

            inputMap.put("email", emailAddress);

            // run query and get results
            resultMap = StatisticsUtilities.runStatsQuery(EmailConstants.JOBS_BY_SENDER_COMMAND, inputMap);
            resultSetContainer = (ResultSetContainer) resultMap.get(EmailConstants.JOBS_BY_SENDER_RESULT);
        } else if (EmailConstants.SEARCH_BY_SUBJECT.equals(searchType)) {


            // retrieve subject
            String subject = request.getParameter("Subject");

            log.debug("Searching on subject: " + subject);

            inputMap.put("subject", subject);

            // run query and get results
            resultMap = StatisticsUtilities.runStatsQuery(EmailConstants.JOBS_BY_SUBJECT_COMMAND, inputMap);
            resultSetContainer = (ResultSetContainer) resultMap.get(EmailConstants.JOBS_BY_SUBJECT_RESULT);
        } else if (EmailConstants.SEARCH_BY_DATE.equals(searchType)) {
            // get start and end dates from parameters
            try {
                int startYear = Integer.parseInt(request.getParameter("startYear"));
                int startMonth = Integer.parseInt(request.getParameter("startMonth"));
                int startDay = Integer.parseInt(request.getParameter("startDay"));
                GregorianCalendar calendar = new GregorianCalendar(startYear, startMonth, startDay);

                log.debug("Searching by date - start date: " + calendar.getTime());

                inputMap.put("sda", String.valueOf(new java.sql.Date(calendar.getTime().getTime())));

                int endYear = Integer.parseInt(request.getParameter("endYear"));
                int endMonth = Integer.parseInt(request.getParameter("endMonth"));
                int endDay = Integer.parseInt(request.getParameter("endDay"));
                calendar = new GregorianCalendar(endYear, endMonth, endDay);

                log.debug("Searching by date - end date: " + calendar.getTime());

                inputMap.put("ed", String.valueOf(new java.sql.Date(calendar.getTime().getTime())));
            } catch (Exception e) {
                throw new ServletException(e.toString());
            }

            // run query and get results
            resultMap = StatisticsUtilities.runStatsQuery(EmailConstants.JOBS_BY_DATE_COMMAND, inputMap);
            resultSetContainer = (ResultSetContainer) resultMap.get(EmailConstants.JOBS_BY_DATE_RESULT);
        }

        ArrayList jobIdList = new ArrayList();

        if (resultSetContainer != null) {
            for (int i = 0; i < resultSetContainer.size(); i++) {
                jobIdList.add(String.valueOf(resultSetContainer.getItem(i, 0)));
            }
        }

        request.getSession().setAttribute("JobList", jobIdList);

        // forward to results page
        return EmailConstants.SCHEDULEDJOB_SEARCH_RESULTS_PAGE;
    }


    /**
     * Cancels a job and returns the next page..
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String cancelJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int jobId;

        try {
            jobId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (NumberFormatException e) {
            throw new ServletException(e.toString());
        }

        cancelJob(jobId);

        String nextPage = request.getParameter(EmailConstants.NEXT_PAGE);

        return nextPage;
    }

    /**
     * Resumes a job and returns the next page..
     *
     * @param request	the HttpServletRequest object
     * @param response	the HttpServletResponse object
     *
     * @return String	the URL of the next page
     */

    private String resumeJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        int jobId;

        try {
            jobId = Integer.parseInt(request.getParameter(EmailConstants.ID));
        } catch (NumberFormatException e) {
            throw new ServletException(e.toString());
        }

        resumeJob(jobId);

        String nextPage = request.getParameter(EmailConstants.NEXT_PAGE);


        return nextPage;
    }



    // Utilities


    /**
     * Retrieves a list of job id's of recent jobs.
     *
     * @param numDaysBack	the number of days to look back
     *
     * @return ArrayList	a list of job id's
     */

    private static ArrayList retrieveRecentJobs(int numDaysBack)
            throws ServletException {
        ArrayList jobIdList;

        ResultSetContainer resultSetContainer = null;

        try {
            jobIdList = new ArrayList();

            Map m = new HashMap();

            Calendar calendar = new GregorianCalendar();
            calendar.add(Calendar.DAY_OF_MONTH, -1 * numDaysBack);
            m.put("sda", String.valueOf(new java.sql.Date(calendar.getTime().getTime())));

            Map recentJobsMap = StatisticsUtilities.runStatsQuery(EmailConstants.RECENT_JOBS_COMMAND, m);
            resultSetContainer = (ResultSetContainer) recentJobsMap.get(EmailConstants.RECENT_JOBS_RESULT);

            for (int i = 0; i < resultSetContainer.size(); i++) {
                jobIdList.add(String.valueOf(resultSetContainer.getItem(i, 0)));
            }
        } catch (Exception e) {
            log.error("Error getting recent jobs", e);
            throw new ServletException(e.toString());
        }

        return jobIdList;
    }


    /**
     * Creates a new job using the properties from a ScheduledJobForm object.
     *
     * @param job	the ScheduledJobForm containing the necessary information
     *
     * @return int	the job id of the new job
     */

    private static int createJob(ScheduledJobForm job)
            throws ServletException {
        int id = -1;

        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            id = emailJob.createEmailJob(
                    Integer.parseInt(job.getTemplateId()),
                    Integer.parseInt(job.getListId()),
                    Integer.parseInt(job.getCommandId()),
                    job.getStartDate(),
                    job.getEndDate(),
                    job.getFromAddress(),
                    job.getFromPersonal(),
                    job.getSubject());

            // if there's a predefined query, set the parameters
            if (Integer.parseInt(job.getCommandId()) != EmailConstants.NO_COMMAND_ID) {
                Map commandInputMap = job.getCommandInputMap();
                for (Iterator i = commandInputMap.keySet().iterator(); i.hasNext();) {
                    String field = (String) i.next();
                    String value = (String) commandInputMap.get(field);
                    emailJob.setCommandParam(id, Integer.parseInt(field), value);
                }
            }

        } catch (Exception e) {
            log.error("Error creating job", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return id;
    }

    /**
     * Creates a new job using the properties from a ScheduledJobForm object.
     *
     * @param job	the ScheduledJobForm containing the necessary information
     *
     * @return int	the job id of the new job
     */

    private static int createReportJob(ScheduledJobForm job, int baseJobId)
            throws ServletException {
        int id = -1;

        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            id = emailJob.createEmailReportJob(
                    baseJobId,
                    Integer.parseInt(job.getTemplateId()),
                    Integer.parseInt(job.getListId()),
                    Integer.parseInt(job.getCommandId()),
                    job.getStartDate(),
                    job.getEndDate(),
                    job.getFromAddress(),
                    job.getFromPersonal(),
                    job.getSubject());

            // if there's a predefined query, set the parameters
            if (Integer.parseInt(job.getCommandId()) != EmailConstants.NO_COMMAND_ID) {
                Map commandInputMap = job.getCommandInputMap();
                for (Iterator i = commandInputMap.keySet().iterator(); i.hasNext();) {
                    String field = (String) i.next();
                    String value = (String) commandInputMap.get(field);
                    emailJob.setCommandParam(id, Integer.parseInt(field), value);
                }
            }

        } catch (Exception e) {
            log.error("Error creating job", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        return id;
    }


    /**
     * Updates a job using properties from a ScheduledJobForm object.
     *
     * @param job	the ScheduledJobForm representing the job
     */

    private static void saveJob(ScheduledJobForm job)
            throws ServletException {
        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            int jobId = Integer.parseInt(job.getId());

            emailJob.setTemplateId(jobId, Integer.parseInt(job.getTemplateId()));
            emailJob.setListId(jobId, Integer.parseInt(job.getListId()));
            emailJob.setCommandId(jobId, Integer.parseInt(job.getCommandId()));
            emailJob.setStartAfterDate(jobId, job.getStartDate());
            emailJob.setStopBeforeDate(jobId, job.getEndDate());
            emailJob.setFromAddress(jobId, job.getFromAddress());
            emailJob.setFromPersonal(jobId, job.getFromPersonal());
            emailJob.setSubject(jobId, job.getSubject());

            // if there's a predefined query, set the parameters
            if (Integer.parseInt(job.getCommandId()) != EmailConstants.NO_COMMAND_ID) {

                Map commandInputMap = job.getCommandInputMap();
                for (Iterator i = commandInputMap.keySet().iterator(); i.hasNext();) {
                    String field = (String) i.next();

                    String value = (String) commandInputMap.get(field);
                    emailJob.setCommandParam(jobId, Integer.parseInt(field), value);
                }
            }
        } catch (Exception e) {
            log.error("Error saving scheduled job", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }
    }


    /**
     * Retrieves information about a job, and returns a
     * ScheduledJobForm object populated with the information.
     *
     * @param jobId		the id of the desired job
     *
     * @return ScheduledJobForm		the populated ScheduledJobForm
     */

    private static ScheduledJobForm retrieveJob(int jobId)
            throws ServletException {
        ScheduledJobForm job = new ScheduledJobForm();

        job.setId(String.valueOf(jobId));

        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            int templateId = emailJob.getTemplateId(jobId);
            int listId = emailJob.getListId(jobId);
            int commandId = emailJob.getCommandId(jobId);
            Date startDate = emailJob.getStartAfterDate(jobId);
            Date endDate = emailJob.getStopBeforeDate(jobId);
            String fromAddress = emailJob.getFromAddress(jobId);
            String fromPersonal = emailJob.getFromPersonal(jobId);
            String subject = emailJob.getSubject(jobId);
            Map commandInputs = emailJob.getCommandParams(jobId);
            // convert from Integer->String to String->String
            Map commandInputMap = new HashMap();
            for (Iterator i = commandInputs.keySet().iterator(); i.hasNext();) {
                Object key = i.next();
                commandInputMap.put(String.valueOf(key), commandInputs.get(key));
            }

            job.setTemplateId(String.valueOf(templateId));
            job.setListId(String.valueOf(listId));
            job.setCommandId(String.valueOf(commandId));
            job.setStartDate(startDate);
            job.setEndDate(endDate);
            job.setFromAddress(fromAddress);
            job.setFromPersonal(fromPersonal);
            job.setSubject(subject);
            job.setCommandInputMap(commandInputMap);
        } catch (Exception e) {
            log.error("Error creating job", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }


        }


        return job;




// this is from when I was using the stats bean to retrieve all this information
/*
		Context context = null;
		try {
			context = new InitialContext();
			StatisticsHome statisticsHome = (StatisticsHome) context.lookup(EmailConstants.STATISTICS_EJB);
			Statistics statistics = statisticsHome.create();
			Map m = new HashMap();

			m.put("c", "job_details");
			m.put("ji", job.getId());

			Map detailsMap = statistics.executeCommand(m, EmailConstants.DATA_SOURCE_NAME);
			ResultSetContainer rsc1 = (ResultSetContainer) detailsMap.get("Job_Details_1");
			ResultSetContainer rsc2 = (ResultSetContainer) detailsMap.get("Job_Details_2");

			for (int i = 0; i < rsc1.size(); i++) {
				TCResultItem templateId = rsc1.getItem(i, "email_template_id");
				TCResultItem commandId = rsc1.getItem(i, "command_id");
				TCResultItem listId = rsc1.getItem(i, "email_list_id");

				TCResultItem fromAddress = rsc1.getItem(i, "from_address");
				TCResultItem fromPersonal = rsc1.getItem(i, "from_personal");
				TCResultItem subject = rsc1.getItem(i, "subject");
				TCResultItem startDate = rsc2.getItem(i, "start_after_date");
				TCResultItem endDate = rsc2.getItem(i, "end_before_date");

				job.setTemplateId(String.valueOf(templateId));
				job.setCommandId(String.valueOf(commandId));
				job.setListId(String.valueOf(listId));
				job.setFromAddress(String.valueOf(fromAddress));
				job.setFromPersonal(String.valueOf(fromPersonal));
				job.setSubject(String.valueOf(subject));
				Date date = (Date) ((TCTimestampResult) startDate).getResultData();
				job.setStartDate(date);
				date = (Date) ((TCTimestampResult) endDate).getResultData();

				job.setEndDate(date);

				if (Integer.parseInt(job.getCommandId()) != 0) {
					job.setListType(EmailConstants.PREDEFINED_QUERY);
				} else {
					job.setListType(EmailConstants.STATIC_LIST);
				}
			}
		} catch (Exception e) {
			log.error("Error getting job details", e);
			throw new ServletException(e.toString());
		} finally {
			if (context != null) {
				try {
					context.close();

				} catch (NamingException e) {
				}
			}
		}
*/
    }

    /**
     * Cancels a job.
     *
     * @param jobId		the id of the job to cancel
     */

    private static void cancelJob(int jobId)
            throws ServletException {
        InitialContext context = null;

        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            emailJob.cancelEmailJob(jobId);
        } catch (Exception e) {
            log.error("Error creating job", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();


                } catch (NamingException e) {
                }
            }
        }
    }

    /**
     * Resumes a job.
     *
     * @param jobId		the id of the job to resume
     */

    private static void resumeJob(int jobId)
            throws ServletException {

        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            emailJob.resumeEmailJob(jobId);
        } catch (Exception e) {
            log.error("Error creating job", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }
    }


    /**
     * Retrieves job detail data as a String
     *
     * @param jobId		the id of the job
     * @param jobDetailId	the id of the job detail
     *
     * @return String	the job detail data
     */

    public static String getJobDetailData(int jobId, int jobDetailId)
            throws ServletException {
        String data = "";

        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            data = emailJob.getJobDetailData(jobId, jobDetailId);
        } catch (Exception e) {
            log.error("Error getting job detail data", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {

                    context.close();
                } catch (NamingException e) {

                }
            }
        }

        return data;
    }


    /**
     * Retrieves information about a job, and returns a
     * JobSummary object populated with the information.
     *
     * @param jobId		the id of the desired job
     *
     * @return JobSummary		the populated JobSummary
     */

    public static JobSummary getJobSummary(int jobId)
            throws ServletException {
        JobSummary jobSummary = new JobSummary();

        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            Date startDate = emailJob.getStartAfterDate(jobId);
            Date endDate = emailJob.getStopBeforeDate(jobId);

            String fromAddress = emailJob.getFromAddress(jobId);
            String fromPersonal = emailJob.getFromPersonal(jobId);
            String subject = emailJob.getSubject(jobId);
            int statusId = emailJob.getStatusId(jobId);
            int jobTypeId = emailJob.getJobTypeId(jobId);

            jobSummary.setStartDate(startDate);
            jobSummary.setEndDate(endDate);
            jobSummary.setFromAddress(fromAddress);
            jobSummary.setFromPersonal(fromPersonal);
            jobSummary.setSubject(subject);
            jobSummary.setStatus(emailJob.getStatusIdText(statusId));
            int rc[] = new int[4];
            Map rmap = emailJob.getJobDetailResults(jobId);
            Collection values = rmap.values();
            Iterator itr = values.iterator();
            for (int i = 0; itr.hasNext(); i++) {
                int value = ((Integer) itr.next()).intValue();
                if (value >= 0 && value < rc.length)
                    rc[value]++;
                else
                    rc[rc.length - 1]++;
            }
            jobSummary.setStatusTodo(String.valueOf("" + rc[0]));
            jobSummary.setStatusOk(String.valueOf("" + rc[1]));
            jobSummary.setStatusFailed(String.valueOf("" + rc[2]));
            jobSummary.setStatusOther(String.valueOf("" + rc[3]));

            jobSummary.setStatusId(String.valueOf(statusId));
            jobSummary.setJobTypeId(String.valueOf(jobTypeId));
        } catch (Exception e) {
            log.error("Error creating job summary", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {

                    context.close();
                } catch (NamingException e) {
                }
            }
        }


        return jobSummary;
    }


    /**
     * Retrieves log information about a job, and returns a
     * list of corresponding JobLogEntry objects.
     *
     * @param jobId		the id of the desired job
     * @param sr		starting row of result set
     * @param er		ending row of result set
     *
     * @return List		the list of JobLogEntry's
     */

    public static Object[] getJobLog(int jobId, int sr, int er)
            throws ServletException {
/*
		try {
			Map inputMap = new HashMap();
			// job id parameter
			inputMap.put("ji", String.valueOf(jobId));
			// set sr/er parameters
			inputMap.put("sr", String.valueOf(sr));
			inputMap.put("er", String.valueOf(er));

			// run query, get results
			Map resultMap = StatisticsUtilities.runStatsQuery(EmailConstants.JOB_LOG_COMMAND, inputMap);

			return (ResultSetContainer) resultMap.get(EmailConstants.JOB_LOG_RESULT);

		} catch (Exception e) {
			log.error("Error getting job log information", e);
			throw new ServletException(e.toString());
		}
*/


        List logList = new ArrayList();
        Object[] ret = new Object[3];

        InitialContext context = null;
        try {
            context = new InitialContext();
            EmailJob emailJob = (EmailJob) BaseProcessor.createEJB(context, EmailJob.class);

            Object[] jobDetailResults = emailJob.getJobDetailResults(jobId, sr, er);
            Map jobDetailResultMap = (Map) jobDetailResults[0];
            ret[1] = jobDetailResults[1];
            ret[2] = jobDetailResults[2];

            Iterator detailIterator = jobDetailResultMap.keySet().iterator();
            while (detailIterator.hasNext()) {
                Integer detailId = (Integer) detailIterator.next();
                String detailReason = emailJob.getJobDetailReason(jobId, detailId.intValue());
                Integer detailStatusId = (Integer) jobDetailResultMap.get(detailId);
                String detailStatus = emailJob.getDetailStatusIdText(detailStatusId.intValue());

                JobLogEntry jobLogEntry = new JobLogEntry();
                jobLogEntry.setDetailStatus(detailStatus);
                jobLogEntry.setDetailReason(detailReason);
                jobLogEntry.setDetailId(String.valueOf(detailId));
                logList.add(jobLogEntry);
            }
        } catch (Exception e) {
            log.error("Error getting log", e);
            throw new ServletException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (NamingException e) {
                }
            }
        }

        ret[0] = logList;
        return ret;
    }


    /**
     * Parses request parameters for command inputs.
     *
     * @param request	the HttpServletRequest object
     *
     * @return Map		Map of input id's to parameter values
     **/

    private static Map getCommandInputs(HttpServletRequest request) {
        Map commandInputMap = new HashMap();

        Enumeration fieldNames = request.getParameterNames();
        while (fieldNames.hasMoreElements()) {
            String field = (String) fieldNames.nextElement();

            // field names start with FIELD_PREFIX
            if (field.startsWith(EmailConstants.FIELD_PREFIX)) {
                String actualField = field.substring(EmailConstants.FIELD_PREFIX.length());
                String value = request.getParameter(field);

                commandInputMap.put(actualField, value);
            }
        }


        return commandInputMap;
    }


    /**
     * Populates a ScheduledJobForm with properties from a request.
     *
     * @param scheduledJob	the ScheduledJobForm to populate
     * @param request	the HttpServletRequest object
     */

    private static void setProperties(ScheduledJobForm scheduledJob, HttpServletRequest request) {
        scheduledJob.setFromPersonal(request.getParameter("fromPersonal"));
        scheduledJob.setFromAddress(request.getParameter("fromAddress"));
        scheduledJob.setSubject(request.getParameter("subject"));
        scheduledJob.setStartHour(request.getParameter("startHour"));
        scheduledJob.setStartMinutes(request.getParameter("startMinutes"));
        scheduledJob.setStartMonth(request.getParameter("startMonth"));
        scheduledJob.setStartDay(request.getParameter("startDay"));
        scheduledJob.setStartYear(request.getParameter("startYear"));
        scheduledJob.setEndHour(request.getParameter("endHour"));
        scheduledJob.setEndMinutes(request.getParameter("endMinutes"));
        scheduledJob.setEndMonth(request.getParameter("endMonth"));
        scheduledJob.setEndDay(request.getParameter("endDay"));
        scheduledJob.setEndYear(request.getParameter("endYear"));
        scheduledJob.setSendTest(request.getParameter("sendTest"));
        scheduledJob.setSendReport(request.getParameter("sendReport"));
        scheduledJob.setSendReminder(request.getParameter("sendReminder"));
    }

}
