/*
 * Copyright (c) 2010 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.copilot;

import com.topcoder.direct.services.copilot.CopilotProjectService;
import com.topcoder.direct.services.copilot.dto.CopilotProjectDTO;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;

/**
 * <p> This request processor handles the request of view copilot project details. It will use the
 * spring to load an instance of CopilotProjectService to get copilot projects. </p>
 *
 * <p> The retrieved copilot project details will be cached into the request session to increase the performance. </p>
 *
 * <p> Thread-safety: This class is thread-safe, because it's immutable and the internal service to use is also
 * required to be thread-safe. Plus every time a request comes, a new instance of request processor is created,
 * so it's used in a thread-safely way. </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class ViewCopilotProject extends ShortHibernateProcessor {
    /**
     * The key to get copilot project id from the request parameters.
     */
    private static final String COPILOT_PROJECT_REQUEST_KEY = "cp";

    /**
     * The key to get/store copilot project from session.
     */
    private static final String COPILOT_PROJECT_SESSION_KEY = "copilotProject";

    /**
     * The bean name to get CopilotProjectService via spring.
     */
    private static final String PROJECT_SERVICE_BEAN_NAME = "projectService";

    /**
     * The key to set json for bar chart 1 into request.
     */
    private static final String BAR_CHART1 = "barChart1";

     /**
     * The key to set json for bar chart 2 into request.
     */
    private static final String BAR_CHART2 = "barChart2";

     /**
     * The key to set json for bar chart 3 into request.
     */
    private static final String BAR_CHART3 = "barChart3";

    /**
     * The key to set copilot info into request.
     */
    private static final String COPILOT_INFO = "copilotInfo";

    /**
     * The key to set copilot project into request.
     */
    private static final String COPILOT_PROJECT = "copilotProject";

    /**
     * Sets the logger.
     */
    private Logger log = Logger.getLogger(ShortHibernateProcessor.class);

    /**
     * The json properties for the bar chart 1.
     */
    private static final String[] BAR_CHART1_PROPERTIES = new String[]{"name", "planned", "real"};

    /**
     * The json properties for the bar chart 2.
     */
    private static final String[] BAR_CHART2_PROPERTIES = new String[]{"name", "planned", "real"};

    /**
     * The json properties for the bar chart 3.
     */
    private static final String[] BAR_CHART3_PROPERTIES = new String[]{"name", "plannedContests",
            "realContests", "reposts", "failure"};


    /**
     * The main processing method to handle the view copilot project details request and
     * redirect to the copilot project details jsp page.
     *
     * @throws Exception if any errors happens.
     */
    @Override
    @SuppressWarnings("unchecked")
    protected void dbProcessing() throws Exception {

        log.debug("Enter the request processor ViewCopilotProject");

        try {
            // Get request
            TCRequest request = this.getRequest();

            // get the servlet context from request
            ServletContext context = request.getSession(true).getServletContext();

            WebApplicationContext applicationContext =
                    WebApplicationContextUtils
                            .getWebApplicationContext(context);

            Long projectId = CopilotRequestProcessorUtil.getLongRequestValue(request, COPILOT_PROJECT_REQUEST_KEY);

            if (projectId == null) {
                throw new TCWebException("The copilot project id is not specified");
            }

            CopilotProjectDTO projectDTO;

            Object cachedValue = request.getSession().getAttribute(COPILOT_PROJECT_SESSION_KEY + projectId);

            if (cachedValue == null) {
                CopilotProjectService service = (CopilotProjectService) applicationContext.getBean(
                        PROJECT_SERVICE_BEAN_NAME);

                projectDTO = service.getCopilotProjectDTO(projectId.longValue());

                if (projectDTO == null) {
                    throw new TCWebException("No such copilot project exists");
                }

                request.getSession().setAttribute(COPILOT_PROJECT_SESSION_KEY + projectId, projectDTO);

            } else {

                projectDTO = (CopilotProjectDTO) cachedValue;
            }

            request.setAttribute(BAR_CHART1, generateFirstBarChartJSON(projectDTO));
            request.setAttribute(BAR_CHART2, generateSecondBarChartJSON(projectDTO));
            request.setAttribute(BAR_CHART3, generateThirdBarChartJSON(projectDTO));
            request.setAttribute(COPILOT_PROJECT, projectDTO);
            request.setAttribute(COPILOT_INFO,
                    CopilotRequestProcessorUtil.getCopilotProfileInfo(projectDTO.getCopilotProject().getCopilotProfileId()));

            // set the jsp page to forward
            setNextPage(Constants.COPILOT_PROJECT);
            setIsNextPageInContext(true);

        } catch(TCWebException wex) {
            // log the exception first
           log.error("Error occurs in ViewCopilotProject request processor", wex);

           throw wex;
        } catch (Exception ex) {
            // log the exception first
            log.error("Error occurs in ViewCopilotProject request processor", ex);

            // wrap into TCWebException
            throw new TCWebException("Error occurs in ViewCopilotProject request processor", ex);

        } finally {
            log.debug("Exit the request processor ViewCopilotProject");
        }
    }


    /**
     * Utility method to generate the JSON data for the first bar chart in copilot project page.
     *
     * @param projectDTO the CopilotProjectDTO instance.
     * @return the generated JSON string.
     */
    private static String generateFirstBarChartJSON(CopilotProjectDTO projectDTO) {
        String[] barChart = BAR_CHART1_PROPERTIES;
        List<List<String>> chartValues = new ArrayList<List<String>>();
        List<String> row1 = new ArrayList<String>();
        row1.add("\"Contests\"");
        row1.add(String.valueOf(projectDTO.getTotalPlannedContests()));
        row1.add(String.valueOf(projectDTO.getTotalRealContests()));
        List<String> row2 = new ArrayList<String>();
        row2.add("\"Bug Races\"");
        row2.add(String.valueOf(projectDTO.getPlannedBugRaces()));
        row2.add(String.valueOf(projectDTO.getTotalRealBugRaces()));
        chartValues.add(row1);
        chartValues.add(row2);

        return CopilotRequestProcessorUtil.encodeJsonData(barChart, chartValues);
    }

    /**
     * Utility method to generate the JSON data for the second bar chart in copilot project page.
     *
     * @param projectDTO the CopilotProjectDTO instance.
     * @return the generated JSON string.
     */
    private static String generateSecondBarChartJSON(CopilotProjectDTO projectDTO) {
        String[] barChart = BAR_CHART2_PROPERTIES;

        List<List<String>> chartValues = new ArrayList<List<String>>();
        List<String> row1 = new ArrayList<String>();
        row1.add("\"\"");
        row1.add(String.valueOf(projectDTO.getPlannedDuration()));
        row1.add(String.valueOf(projectDTO.getRealDuration()));
        chartValues.add(row1);

        return CopilotRequestProcessorUtil.encodeJsonData(barChart, chartValues);
    }

    /**
     * Utility method to generate the JSON data for the second bar chart in copilot project page.
     *
     * @param projectDTO the CopilotProjectDTO instance.
     * @return the generated JSON string.
     */
    private static String generateThirdBarChartJSON(CopilotProjectDTO projectDTO) {
        String[] barChart = BAR_CHART3_PROPERTIES;

        List<List<String>> chartValues = new ArrayList<List<String>>();
        List<String> row1 = new ArrayList<String>();
        row1.add("\"Project\"");
        row1.add(String.valueOf(projectDTO.getTotalPlannedContests()));
        row1.add(String.valueOf(projectDTO.getTotalRealContests()));
        row1.add(String.valueOf(projectDTO.getTotalRepostedContests()));
        row1.add(String.valueOf(projectDTO.getTotalFailedContests()));
        chartValues.add(row1);

        return CopilotRequestProcessorUtil.encodeJsonData(barChart, chartValues);
    }
}
