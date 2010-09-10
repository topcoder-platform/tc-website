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
 * <p> This request processor handles the request of view copilot project history. It will use the
 * spring to load an instance of CopilotProjectService to get copilot projects. </p>
 *
 * <p> The retrieved copilot projects will be cached into the request session to increase the performance. </p>
 *
 * <p> Thread-safety: This class is thread-safe, because it's immutable and the internal service to use is also
 * required to be thread-safe. Plus every time a request comes, a new instance of request processor is created,
 * so it's used in a thread-safely way. </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class ViewCopilotProjectHistory extends ShortHibernateProcessor {

    /**
     * The default paging size.
     */
    private static final int DEFAULT_PAGING_SIZE = 10;

    /**
     * The default start page number.
     */
    private static final int DEFAULT_START_PAGE = 1;

    /**
     * The default sorting value.
     */
    private static final int DEFAULT_SORT_VALUE = 0;

    /**
     * Represents the ascending order.
     */
    private static final int ASCENDING_ORDER = 0;

    /**
     * Represents the descending order.
     */
    private static final int DESCENDING_ORDER = 1;

    /**
     * The key to get page size from request.
     */
    private static final String REQUEST_SIZE_KEY = "size";

    /**
     * The key to get sort value from request.
     */
    private static final String REQUEST_SORT_KEY = "sort";

    /**
     * The key to get page number from request.
     */
    private static final String REQUEST_PAGE_KEY = "page";

    /**
     * The key used to set current page as request attribute.
     */
    private static final String CURRENT_PAGE = "currentPage";

    /**
     * The key used to set allowed pages as request attribute.
     */
    private static final String ALLOWED_PAGES = "allowedPages";

    /**
     * The key used to set total copilots number as request attribute.
     */
    private static final String TOTAL_NUMBER = "totalNumber";

    /**
     * The key used to set page size as request attribute.
     */
    private static final String PAGE_SIZE = "pageSize";

    /**
     * The key to get copilot profile ID from the request parameters.
     */
    private static final String PROFILE_ID_REQUEST_KEY = "pid";

    /**
     * The key to store the copilot projects into the session.
     */
    private static final String COPILOT_PROJECTS_SESSION_KEY = "copilotProjects";

    /**
     * The bean name used to get CopilotProjectService via spring.
     */
    private static final String PROJECT_SERVICE_BEAN_NAME = "projectService";

    /**
     * The key to store copilot projects in the request.
     */
    private static final String COPILOT_PROJECTS = "copilotProjects";

    /**
     * The key to store copilot info in the request.
     */
    private static final String COPILOT_INFO = "copilotInfo";

    /**
     * The key to store the profile id in the request.
     */
    private static final String PROFILE_ID = "profileId";

    /**
     * The key to store sorting value in the request.
     */
    private static final String SORTING = "sorting";

    /**
     * Sets the logger.
     */
    private Logger log = Logger.getLogger(ShortHibernateProcessor.class);

    /**
     * The main processing method to handle the view copilot project history request and
     * redirect to the copilot project history jsp page.
     *
     * @throws Exception if any errors happens.
     */
    @Override
    @SuppressWarnings("unchecked")
    protected void dbProcessing() throws Exception {

        log.debug("Enter the request processor ViewCopilotProjectHistory");

        try {
            // Get request
            TCRequest request = this.getRequest();

            // get the servlet context from request
            ServletContext context = request.getSession(true).getServletContext();

            WebApplicationContext applicationContext =
                    WebApplicationContextUtils
                            .getWebApplicationContext(context);

            Long profileId = CopilotRequestProcessorUtil.getLongRequestValue(request, PROFILE_ID_REQUEST_KEY);

            if (profileId == null) {
                throw new TCWebException("The copilot profile id is not specified");
            }

            List<CopilotProjectDTO> projects;

            Object cachedValue = request.getSession().getAttribute(COPILOT_PROJECTS_SESSION_KEY + profileId);

            if (cachedValue == null) {
                CopilotProjectService service = (CopilotProjectService) applicationContext.getBean(
                        PROJECT_SERVICE_BEAN_NAME);

                projects = service.getCopilotProjects(profileId.longValue());

                request.getSession().setAttribute(COPILOT_PROJECTS_SESSION_KEY + profileId, projects);

            } else {

                projects = (List<CopilotProjectDTO>) cachedValue;
            }

            // the total number of the projects
            int totalSize = projects.size();

            // default paging size
            int maxPerPage = DEFAULT_PAGING_SIZE;

            // current page set to default first page
            int currentPage = DEFAULT_START_PAGE;

            // flag to indicate sort or not, default to false
            boolean sort = false;

            // default to zero, means default sort (i.e. no sort)
            int sortingValue = DEFAULT_SORT_VALUE;
            int sortingMethodIndex = DEFAULT_SORT_VALUE;
            int sortOrder = ASCENDING_ORDER;

            // start request processing
            Integer pageSize = CopilotRequestProcessorUtil.getIntRequestValue(request, REQUEST_SIZE_KEY);

            Integer sorting = CopilotRequestProcessorUtil.getIntRequestValue(request, REQUEST_SORT_KEY);

            Integer page = CopilotRequestProcessorUtil.getIntRequestValue(request, REQUEST_PAGE_KEY);


            // set the page size
            if (pageSize != null && pageSize.intValue() > 0) {
                maxPerPage = pageSize.intValue();
            }

            // check the sorting request, it should be in valid range to be able to sort
            if (sorting != null && sorting.intValue() >= 0) {
                sortingValue = sorting.intValue();
                sortingMethodIndex = sortingValue % 10;
                sortOrder = sortingValue / 10;
                sort = true;
            }

            // calculate allowed pages
            int allowedPages = totalSize / maxPerPage;

            if (totalSize % maxPerPage != 0) {
                allowedPages++;
            }

            if (page != null && page.intValue() <= allowedPages && page.intValue() >= DEFAULT_START_PAGE) {
                currentPage = page.intValue();
            }

            List<CopilotProjectDTO> sortedProjects = new ArrayList<CopilotProjectDTO>(projects);

            if (sort) {
                // sort the copilot projects with sorting order specified by sortingMethodIndex
                CopilotProjectsSorter.sort(sortedProjects, sortingMethodIndex, sortOrder == DESCENDING_ORDER);
            }

            // set attributes back into the request, preparing forward to view jsp page
            request.setAttribute(CURRENT_PAGE, currentPage);
            request.setAttribute(ALLOWED_PAGES, allowedPages);
            request.setAttribute(COPILOT_PROJECTS, generateResultList(currentPage, maxPerPage, sortedProjects));
            request.setAttribute(TOTAL_NUMBER, totalSize);
            request.setAttribute(PAGE_SIZE, maxPerPage);
            request.setAttribute(PROFILE_ID, profileId);
            request.setAttribute(COPILOT_INFO, CopilotRequestProcessorUtil.getCopilotInfo(profileId));

            if (sort) {
                request.setAttribute(SORTING, sortingValue);
            } else {
                request.setAttribute(SORTING, DEFAULT_SORT_VALUE);
            }


            // set the jsp page to forward
            setNextPage(Constants.COPILOT_PROJECT_HISTORY);
            setIsNextPageInContext(true);

        } catch(TCWebException wex) {
            // log the exception first
           log.error("Error occurs in ViewCopilotProjectHistory request processor", wex);

           throw wex;
        } catch (Exception ex) {
            // log the exception first
            log.error("Error occurs in ViewCopilotProjectHistory request processor", ex);

            // wrap into TCWebException
            throw new TCWebException("Error occurs in ViewCopilotProjectHistory request processor", ex);

        } finally {
            log.debug("Exit the request processor ViewCopilotProjectHistory");
        }
    }

    /**
     * Utility method to get the copilot projects which shows on a certain page.
     *
     * @param currentPage the page number
     * @param pageSize the size of the page
     * @param sorted the whole list of copilot projects
     *
     * @return a list of copilot projects to displayed on the page.
     */
    private List<CopilotProjectDTO> generateResultList(int currentPage, int pageSize, List<CopilotProjectDTO> sorted) {
        int offSet = (currentPage - 1) * pageSize;
        int to = ((offSet + pageSize) > sorted.size()) ? sorted.size() : offSet + pageSize;

        List<CopilotProjectDTO> result = new ArrayList<CopilotProjectDTO>();

        for (int i = offSet; i < to; ++i) {
            result.add(sorted.get(i));
        }

        return result;
    }


}
