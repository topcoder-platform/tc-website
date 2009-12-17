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

import com.topcoder.service.pipeline.CommonPipelineData;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;

/**
 * <p>This class will process a request to view project report.</p>
 *
 * <p>
 *     The processor will get contests information from pipeline service facade and will process it
 *     to aggregate contest fees and group contests by projects and clients.
 * </p>
 *
 * @author TCSDEVELOPER
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
        // get start and end dates from request, if empty start will be current and end will be current +
        // DEFAULT_DATE_INTERVAL

        SimpleDateFormat sdf = new SimpleDateFormat(Constants.PROJECT_VIEW_DATE_FORMAT);

        String startDateStr = StringUtils.checkNull(getRequest().getParameter(Constants.START_DATE));
        Date startDate;
        if ("".equals(startDateStr)) {
            startDate = new Date();
        } else {
            try {
                startDate = sdf.parse(startDateStr);
            } catch (ParseException pe) {
                startDate = new Date();
            }
        }
        setDefault(Constants.START_DATE, sdf.format(startDate));

        String endDateStr = StringUtils.checkNull(getRequest().getParameter(Constants.END_DATE));
        Date endDate;
        if ("".equals(startDateStr)) {
            endDate = calculateEndDate(startDate);
        } else {
            try {
                endDate = sdf.parse(endDateStr);
                if (endDate.before(startDate)) {
                    endDate = calculateEndDate(startDate);
                }
            } catch (ParseException pe) {
                endDate = calculateEndDate(startDate);
            }
        }
        setDefault(Constants.END_DATE, sdf.format(endDate));

        // get data from pipeline service facade
        List<CommonPipelineData> commonPipelineData =
            PipelineServiceFacadeServiceLocator.getServices().getCommonPipelineData(startDate, endDate, true);

        if (commonPipelineData.size() > 0) {
            // process aggregations
            List<ProjectViewClientRow> clients = processPipelineData(commonPipelineData);

            getRequest().setAttribute(Constants.CLIENTS, clients);
        }

        setNextPage(Constants.PROJECT_VIEW_PAGE);
        setIsNextPageInContext(true);
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
