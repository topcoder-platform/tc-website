/*
 * Copyright (c) 2010 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.copilot;

import com.topcoder.direct.services.copilot.CopilotProfileService;
import com.topcoder.direct.services.copilot.dto.ContestTypeStat;
import com.topcoder.direct.services.copilot.dto.CopilotProfileDTO;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p> This request processor handles the request of view copilot profile. It will use the spring to load an instance of
 * CopilotProfileService to get copilot profile. </p>
 *
 * <p> The retrieved copilot profile will be cached into the request session to increase the performance. </p>
 *
 * <p> Thread-safety: This class is thread-safe, because it's immutable and the internal service to use is also
 * required to be thread-safe. Plus every time a request comes, a new instance of request processor is created,
 * so it's used in a thread-safely way. </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class ViewCopilotProfile extends ShortHibernateProcessor {
    /**
     * The key to get copilot profile id from request parameters.
     */
    private static final String PROFILE_ID_PARAM_KEY = "pid";

    /**
     * The key to put retrieved copilot profile into the session.
     */
    private static final String PROFILE_SESSION_KEY = "copilotProfile";

    /**
     * The bean name used to get CopilotProfileService via spring.
     */
    private static final String PROFILE_SERVICE_BEAN_NAME = "profileService";

    /**
     * The json properties name used to generate json data for pie chart.
     */
    private static final String[] PIE_CHART_PROPERTIES = new String[]{"name", "value"};

    /**
     * The json properties name used to generate json data for bar chart.
     */
    private static final String[] BAR_CHART_PROPERTIES = new String[]{"name", "plannedContests", "realContests", "reposts", "failures"};

    /**
     * The key used to store pie chart data in request.
     */
    private static final String PIE_CHART_RESULT_KEY = "pieChartData";

    /**
     * The key used to store bar chart data in request.
     */
    private static final String BAR_CHART_RESULT_KEY = "barChartData";

    /**
     * The key used to store copilot info in request.
     */
    private static final String COPILOT_INFO_RESULT_KEY = "copilotInfo";

     /**
     * The key used to store copilot profile in request.
     */
    private static final String PROFILE_RESULT_KEY = "copilotProfile";

    /**
     * The main processing method to handle the view copilot profile request and redirect to the copilot profile page.
     *
     * @throws Exception if any errors happens.
     */
    @Override
    @SuppressWarnings("unchecked")
    protected void dbProcessing() throws Exception {

        log.debug("Enter the request processor ViewCopilotProfile");

        try {
            // Get request
            TCRequest request = this.getRequest();

            // get the servlet context from request
            ServletContext context = request.getSession(true).getServletContext();

            WebApplicationContext applicationContext =
                    WebApplicationContextUtils
                            .getWebApplicationContext(context);

            Long profileId = CopilotRequestProcessorUtil.getLongRequestValue(request, PROFILE_ID_PARAM_KEY);

            if (profileId == null) {
                throw new TCWebException("The copilot profile user id is not specified");
            }

            CopilotProfileDTO profileDTO;

            Object cachedValue = request.getSession().getAttribute(PROFILE_SESSION_KEY + profileId);

            if (cachedValue == null) {
                CopilotProfileService service = (CopilotProfileService) applicationContext.getBean(
                        PROFILE_SERVICE_BEAN_NAME);

                // note that the profile service get profile by copilot topcoder User id
                profileDTO = service.getCopilotProfileDTO(profileId.longValue());

                if (profileDTO == null) {
                    throw new TCWebException("No such copilot exists in copilot pool");
                }

                request.getSession().setAttribute(PROFILE_SESSION_KEY + profileId, profileDTO);

            } else {

                profileDTO = (CopilotProfileDTO) cachedValue;
            }

            // build pie chart data
            String[] pieChartProperties = PIE_CHART_PROPERTIES;
            Map<String, ContestTypeStat> contestStats = profileDTO.getContestTypeStats();
            List<List<String>> pieValues = new ArrayList<List<String>>();

            for (String type : contestStats.keySet()) {
                List<String> row = new ArrayList<String>();
                row.add("\"" + type + "\"");
                row.add(String.valueOf(contestStats.get(type).getRealContests()));
                pieValues.add(row);
            }

            // build bar chart data
            String[] barChartProperties = BAR_CHART_PROPERTIES;

            List<List<String>> barValues = new ArrayList<List<String>>();
            for (String type : contestStats.keySet()) {
                ContestTypeStat stat = contestStats.get(type);
                List<String> row = new ArrayList<String>();
                row.add("\"" + type + "\"");
                row.add(String.valueOf(stat.getPlannedContests()));
                row.add(String.valueOf(stat.getRealContests()));
                row.add(String.valueOf(stat.getRepostedContests()));
                row.add(String.valueOf(stat.getFailedContests()));
                barValues.add(row);
            }

            request.setAttribute(PIE_CHART_RESULT_KEY,
                    CopilotRequestProcessorUtil.encodeJsonData(pieChartProperties, pieValues));
            request.setAttribute(BAR_CHART_RESULT_KEY,
                    CopilotRequestProcessorUtil.encodeJsonData(barChartProperties, barValues));
            request.setAttribute(COPILOT_INFO_RESULT_KEY,
                    CopilotRequestProcessorUtil.getCopilotInfo(profileDTO.getCopilotProfile().getUserId()));
            request.setAttribute(PROFILE_RESULT_KEY, profileDTO);

            // set the jsp page to forward
            setNextPage(Constants.COPILOT_PROFILE);
            setIsNextPageInContext(true);

        } catch(TCWebException wex) {
            // log the exception first
           log.error("Error occurs in ViewCopilotProfile request processor", wex);

           throw wex;
        } catch (Exception ex) {
            // log the exception first
            log.error("Error occurs in ViewCopilotProfile request processor", ex);

            // wrap into TCWebException
            throw new TCWebException("Error occurs in ViewCopilotProfile request processor", ex);

        } finally {
            log.debug("Exit the request processor ViewCopilotProfile");
        }
    }


}
