/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.projectview;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.service.pipeline.CommonPipelineData;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.tc.Constants;

/**
 * <p>This class will process a request to view project report.</p>
 *
 * <p>
 *     The processor will get contests information from pipeline service facade and will process it
 *     to aggregate contest fees and group contests by projects and clients.
 * </p>
 *
 * @author pulky
 * @version 1.0
 * @since Project View
 */
public class ProjectView extends BaseProcessor {
    
    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws Exception {

        if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
        }

        // prepare principal and alternate date formats
        SimpleDateFormat sdf = new SimpleDateFormat(Constants.PROJECT_VIEW_DATE_FORMAT);
        SimpleDateFormat alternateSdf = new SimpleDateFormat(Constants.ALTERNATE_PROJECT_VIEW_DATE_FORMAT);

        // retrieve start date from request and apply logic
        Date startDate = processStartDate(sdf, alternateSdf);

        // retrieve end date from request and apply logic
        Date endDate = processEndDate(sdf, alternateSdf, startDate);

        // get data from pipeline service facade
        if (!hasErrors()) {
            List<CommonPipelineData> commonPipelineData =
                PipelineServiceFacadeServiceLocator.getServices().getCommonPipelineData(startDate, endDate, true);

            if (commonPipelineData.size() > 0) {
                // process aggregations
                List<ProjectViewClientRow> clients = processPipelineData(commonPipelineData);
    
                getRequest().setAttribute(Constants.CLIENTS, clients);
            }
        }

        setNextPage(Constants.PROJECT_VIEW_PAGE);
        setIsNextPageInContext(true);
    }

    /**
     * This method processes end date.
     *
     * - If the request parameter is empty it will calculate end date based on the configured interval.
     *   (unless start date is wrong)
     * - Then both formats will be applied. If both are wrong, an error message is added
     * - Finally, precedence is verified    
     * 
     * @param sdf the main date format
     * @param alternateSdf the alternate date format
     * @param startDate the processed start date
     * 
     * @return the processed end date
     */
    private Date processEndDate(SimpleDateFormat sdf, SimpleDateFormat alternateSdf, Date startDate) {
        String endDateStr = StringUtils.checkNull(getRequest().getParameter(Constants.END_DATE));
        Date endDate = null;
        if (endDateStr.trim().length() == 0) {
            if (startDate != null) {
                endDate = calculateEndDate(startDate);
            }
        } else {
            try {
                endDate = sdf.parse(endDateStr);
            } catch (ParseException pe) {
                try {
                    endDate = alternateSdf.parse(endDateStr);
                } catch (ParseException pe2) {
                    addError(Constants.END_DATE, "Please enter a valid end date");
                }
            }
            if (!hasErrors() && endDate.before(startDate)) {
                addError(Constants.END_DATE, "End date must be after start date");
            }
        }
        setDefault(Constants.END_DATE, endDate != null ? sdf.format(endDate) : endDateStr);
        return endDate;
    }

    /**
     * This method processes start date.
     *
     * - If the request parameter is empty the start date is set to current
     * - Then both formats will be applied. If both are wrong, an error message is added
     * 
     * @param sdf the main date format
     * @param alternateSdf the alternate date format
     * 
     * @return the processed start date
     */
    private Date processStartDate(SimpleDateFormat sdf, SimpleDateFormat alternateSdf) {
        String startDateStr = StringUtils.checkNull(getRequest().getParameter(Constants.START_DATE));
        Date startDate = null;
        if (startDateStr.trim().length() == 0) {
            startDate = new Date();
        } else {
            try {
                startDate = sdf.parse(startDateStr);
            } catch (ParseException pe) {
                try {
                    startDate = alternateSdf.parse(startDateStr);
                } catch (ParseException pe2) {
                    addError(Constants.START_DATE, "Please enter a valid start date");
                }
            }
        }
        setDefault(Constants.START_DATE, startDate != null ? sdf.format(startDate) : startDateStr);
        return startDate;
    }

    /**
     * Private helper method to calculate end date based on start date
     *
     * The method will add DEFAULT_WEEKS_INTERVAL weeks to the date
     *
     * @param startDate the start date
     * @return the calculated date
     */
    private Date calculateEndDate(Date startDate) {
        Calendar cal = new GregorianCalendar();
        cal.setTime(startDate);
        cal.add(Calendar.WEEK_OF_YEAR, Constants.PROJECT_VIEW_DEFAULT_WEEKS_INTERVAL);
        return cal.getTime();
    }

    /**
     * This method process the data retrieved from pipeline service and generates aggregation information for contest
     * fees. It also returns processed information in a simple and direct way to be presented in view.
     *
     * @param commonPipelineData the data retrieved from pipeline service facade
     *
     * @return a list of <code>ProjectViewClientRow</code> with the aggregated information
     */
    private List<ProjectViewClientRow> processPipelineData(List<CommonPipelineData> commonPipelineData) {
        // first, sort to be able to aggregate via control-break
        Collections.sort(commonPipelineData, getComparator());

        // initialize collections
        List<ProjectViewClientRow> clients = new ArrayList<ProjectViewClientRow>();
        List<ProjectViewProjectRow> projects = new ArrayList<ProjectViewProjectRow>();
        List<ProjectViewContestRow> contests= new ArrayList<ProjectViewContestRow>();

        // initialize totals
        double clientTotalFee = 0;
        double projectTotalFee = 0;

        // prepare for control break
        String client = commonPipelineData.get(0).getClientName();
        String project = commonPipelineData.get(0).getPname();

        // start processing
        for (CommonPipelineData data : commonPipelineData) {
            // control-break
            if (!client.equals(data.getClientName()) || !project.equals(data.getPname())) {
                projects.add(new ProjectViewProjectRow(project, contests, projectTotalFee));
                contests = new ArrayList<ProjectViewContestRow>();
                projectTotalFee = 0;

                if (!client.equals(data.getClientName())) {
                    clients.add(new ProjectViewClientRow(client, projects, clientTotalFee));
                    projects = new ArrayList<ProjectViewProjectRow>();
                    clientTotalFee = 0;
                }
            }

            Double fee = data.getContestFee();
            if (fee == null) {
                fee = 0d;
            }

            contests.add(new ProjectViewContestRow(data.getCname(), data.getContestCategory(),
                    data.getSname(), fee));

            clientTotalFee += fee;
            projectTotalFee += fee;

            client = data.getClientName();
            project = data.getPname();
        }

        // add final rows
        projects.add(new ProjectViewProjectRow(project, contests, projectTotalFee));
        clients.add(new ProjectViewClientRow(client, projects, clientTotalFee));

        return clients;
    }

    /**
     * Protected method to define the comparison between contest data rows before processing
     *
     * Basically it will sort based on client / project / contest name
     *
     * @return a CommonPipelineData comparator
     */
    private Comparator<CommonPipelineData> getComparator() {
        return new Comparator<CommonPipelineData>() {
            public int compare(CommonPipelineData arg0, CommonPipelineData arg1) {
                int result = arg0.getClientName().compareTo(arg1.getClientName());

                if (result == 0) {
                    result = arg0.getPname().compareTo(arg1.getPname());
                }

                if (result == 0) {
                    result = arg0.getCname().compareTo(arg1.getCname());
                }

                return result;
            }
        };
    }
}
