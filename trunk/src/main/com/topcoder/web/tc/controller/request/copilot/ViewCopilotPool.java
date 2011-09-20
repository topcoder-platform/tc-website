/*
 * Copyright (c) 2010 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.copilot;

import com.topcoder.direct.services.copilot.CopilotProfileService;
import com.topcoder.direct.services.copilot.dto.CopilotPoolMember;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.tc.Constants;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * <p> This request processor handles the request of view copilot pool. It will use the spring to load an instance of
 * CopilotProfileService to get copilot pool members. </p> <p/> <p> The retrieved copilots will be cached into the
 * request session to increase the performance. </p> <p/> <p> Thread-safety: This class is thread-safe, because it's
 * immutable and the internal service to use is also required to be thread-safe. Plus every time a request comes, a new
 * instance of request processor is created, so it's used in a thread-safely way. </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class ViewCopilotPool extends ShortHibernateProcessor {

    /**
     * The key used when caching pool members results per session.
     */
    private static final String POOL_MEMBER_SESSION_KEY = "copilotPoolMembers";

    /**
     * The key used when caching pool images path per session.
     */
    private static final String IMAGES_PATH_SESSION_KEY = "copilotPoolImages";

    /**
     * The default paging size.
     */
    private static final int DEFAULT_PAGING_SIZE = 10;

    /**
     * The default start page number.
     */
    private static final int DEFAULT_START_PAGE = 1;

    /**
     * The grid view type.
     */
    private static final int GRID_VIEW = 0;

    /**
     * The list view type.
     */
    private static final int LIST_VIEW = 1;

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
     * The key to get view type from request.
     */
    private static final String REQUEST_VIEW_KEY = "view";

    /**
     * The key used to set current page as request attribute.
     */
    private static final String CURRENT_PAGE = "currentPage";

    /**
     * The key used to set allowed pages as request attribute.
     */
    private static final String ALLOWED_PAGES = "allowedPages";

    /**
     * The key used to set copilots as request attribute.
     */
    private static final String POOL_MEMBERS = "poolMembersData";

    /**
     * The key used to set total copilots number as request attribute.
     */
    private static final String TOTAL_NUMBER = "totalNumber";

    /**
     * The key used to set page size as request attribute.
     */
    private static final String PAGE_SIZE = "pageSize";

    /**
     * The key used to set copilot image paths as request attribute.
     */
    private static final String IMAGES = "images";


    /**
     * Sets the logger.
     */
    private Logger log = Logger.getLogger(ShortHibernateProcessor.class);

    /**
     * The main processing method to handle the view copilot pool request and redirect to the copilot pool jsp page.
     *
     * @throws Exception if any errors happens.
     */
    @Override
    @SuppressWarnings("unchecked")
    protected void dbProcessing() throws Exception {

        log.debug("Enter the request processor ViewCopilotPool");

        try {
            // Get request
            TCRequest request = this.getRequest();

            // get the servlet context from request
            ServletContext context = request.getSession(true).getServletContext();

            // Load the WebApplicationContext which is used to create service via spring
            WebApplicationContext applicationContext =
                    WebApplicationContextUtils
                            .getWebApplicationContext(context);

            // local variable used to store retrieved copilots
            List<CopilotPoolMember> copilots;

            // Local variable used to store mapping between user id and user image path
            Map<Long, String> copilotsImages;

            // Try getting the members from session to see if it's already cached
            Object cachedCopilots = request.getSession().getAttribute(POOL_MEMBER_SESSION_KEY);

            Object cachedImages = request.getSession().getAttribute(IMAGES_PATH_SESSION_KEY);

            if (cachedCopilots == null) {
                // not cached, get CopilotProfileService implementation from application context
                CopilotProfileService service = (CopilotProfileService) applicationContext.getBean("profileService");
                copilots = service.getCopilotPoolMembers();

                // cache into session
                request.getSession().setAttribute(POOL_MEMBER_SESSION_KEY, copilots);

            } else {
                // cached in the session, directly use the cached
                copilots = (List<CopilotPoolMember>) cachedCopilots;
            }

            if (cachedImages == null) {
                // get the map from the persistence
                copilotsImages = getCopilotsImageMap();
                // cache into session
                request.getSession().setAttribute(IMAGES_PATH_SESSION_KEY, copilotsImages);
            } else {
                copilotsImages = (Map<Long, String>) cachedImages;
            }

            // the total number of the copilots
            int totalSize = copilots.size();

            // default paging size
            int maxPerPage = DEFAULT_PAGING_SIZE;

            // current page set to default first page
            int currentPage = DEFAULT_START_PAGE;

            // 0 for grid view, 1 for list view - grid view is the default
            int viewType = GRID_VIEW;

            // flag to indicate sort or not, default to false
            boolean sort = false;

            // valid range should be [1, 7] or [1 - 17]
            // if (sortOrder / 10) == 1, means descending sort, otherwise ascending
            // the value of (sortOrder % 10) represents sortRequestIndex that will be
            // used to invoke CopilotPoolMemberSorter
            int sortingValue = DEFAULT_SORT_VALUE; // default to zero, means default sort (i.e. no sort)
            int sortingMethodIndex = DEFAULT_SORT_VALUE;
            int sortOrder = ASCENDING_ORDER;

            // start request processing
            Integer pageSize = this.getIntRequestValue(request, REQUEST_SIZE_KEY);

            Integer sorting = this.getIntRequestValue(request, REQUEST_SORT_KEY);

            Integer page = this.getIntRequestValue(request, REQUEST_PAGE_KEY);

            Integer viewTypeInt = this.getIntRequestValue(request, REQUEST_VIEW_KEY);


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

            // if view type is 1, switch to list view
            if (viewTypeInt != null && viewTypeInt.intValue() == LIST_VIEW) {
                viewType = LIST_VIEW;
            }

            // calculate allowed pages
            int allowedPages = totalSize / maxPerPage;

            if (totalSize % maxPerPage != 0) {
                allowedPages++;
            }

            if (page != null && page.intValue() <= allowedPages && page.intValue() >= DEFAULT_START_PAGE) {
                currentPage = page.intValue();
            }
            
            // ************************************
            // start: set statistics with query result
            
            Map<String, Map<Long, Integer>> stats = getCopilotsStatistics();
            Map<Long, Integer> currentContests = stats.get("currentContests");
            Map<Long, Integer> currentProjects = stats.get("currentProjects");
            Map<Long, Integer> totalProjects = stats.get("totalProjects");
            Map<Long, Integer> totalContests = stats.get("totalContests");
            Map<Long, Integer> failedContests = stats.get("failedContests");
            Map<Long, Integer> repostedContests = stats.get("repostedContests");
            
            for (CopilotPoolMember cpm : copilots) {

                cpm.setCurrentContests(currentContests.get(cpm.getCopilotProfile().getUserId()));
                cpm.setCurrentProjects(currentProjects.get(cpm.getCopilotProfile().getUserId()));
                cpm.setTotalProjects(totalProjects.get(cpm.getCopilotProfile().getUserId()));
                cpm.setTotalContests(totalContests.get(cpm.getCopilotProfile().getUserId()));
                cpm.setTotalRepostedContests(repostedContests.get(cpm.getCopilotProfile().getUserId()));
                cpm.setTotalFailedContests(failedContests.get(cpm.getCopilotProfile().getUserId()));
            }
            
            //***************************************
            
            List<CopilotPoolMember> sortedCopoilots = new ArrayList<CopilotPoolMember>(copilots);

            if (sort) {
                // sort the members with sorting order specified by sortingMethodIndex
                CopilotPoolMemberSorter.sort(sortedCopoilots, sortingMethodIndex, sortOrder == DESCENDING_ORDER);
            }

            List<CopilotPoolMember> result = generateResultList(currentPage, maxPerPage, sortedCopoilots);
        

            // set attributes back into the request, preparing forward to view jsp page
            request.setAttribute(CURRENT_PAGE, currentPage);
            request.setAttribute(ALLOWED_PAGES, allowedPages);
            request.setAttribute(POOL_MEMBERS, result);
            request.setAttribute(TOTAL_NUMBER, totalSize);
            request.setAttribute(PAGE_SIZE, maxPerPage);
            request.setAttribute(IMAGES, copilotsImages);

            if (sort) {
                request.setAttribute("sorting", sortingValue);
            } else {
                request.setAttribute("sorting", DEFAULT_SORT_VALUE);
            }

            request.setAttribute("viewType", viewType);

            // set the jsp page to forward
            setNextPage(Constants.COPILOT_POOL);
            setIsNextPageInContext(true);

        } catch (Exception ex) {
            // log the exception first
            log.error("Error occurs in ViewCopilotPool request processor", ex);
            // throw the exception
            throw ex;
        } finally {
            log.debug("Exit the request processor ViewCopilotPool");
        }
    }

    /**
     * Utility method to get the copilots which shows on a certain page.
     *
     * @param currentPage the page number
     * @param pageSize the size of the page
     * @param sorted the whole list of copilots
     *
     * @return a list of copilots to displayed on the page.
     */
    private List<CopilotPoolMember> generateResultList(int currentPage, int pageSize, List<CopilotPoolMember> sorted) {

        // Gets the start offset
        int offSet = (currentPage - 1) * pageSize;

        // Gets the end
        int to = ((offSet + pageSize) > sorted.size()) ? sorted.size() : (offSet + pageSize);

        // create a new list to store the result
        List<CopilotPoolMember> result = new ArrayList<CopilotPoolMember>();

        for (int i = offSet; i < to; ++i) {
            // add the copilots in the required page into the list
            result.add(sorted.get(i));
        }

        return result;
    }

    /**
     * Gets a integer value from the request by specifying request name
     *
     * @param request the request
     * @param requestName the name of request parameter
     *
     * @return the integer value or null if the request does not contain the specified request parameter.
     */
    private Integer getIntRequestValue(HttpServletRequest request, String requestName) {
        String value = request.getParameter(requestName);

        if (value == null) return null;

        int result = Integer.parseInt(value);

        return result;
    }

    /**
     * Gets the header images of the copilot pool from the persistence. The retrieved image paths will be returned in a
     * map, the key is the user id of the copilot, the value of the image path on the server for this copilot.
     *
     * @return the copilot image map.
     *
     * @throws Exception if any error occurs.
     */
    private Map<Long, String> getCopilotsImageMap() throws Exception {
        Request r = new Request();
        // command - copilot_pool_members
        r.setContentHandle("copilot_pool_members");

        // query  copilot_pooL_images
        ResultSetContainer result = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("copilot_pool_images");

        Iterator<ResultSetContainer.ResultSetRow> iterator = result.iterator();
        Map<Long, String> images = new HashMap<Long, String>();

        // Build the result map
        while (iterator.hasNext()) {
            ResultSetContainer.ResultSetRow row = iterator.next();

            images.put(row.getLongItem("user_id"), row.getStringItem("image_path"));
        }

        return images;
    }

    /**
     * Gets the copilot statistics for the copilot pool page. It runs a query to get the following statistics
     * - current projects
     * - current contests
     * - total projects
     * - total contests
     * - failed contests
     * - failed projects
     *
     * @return the map stores copilot statistics.
     * @throws Exception if any error occurs.
     */
    private Map<String, Map<Long, Integer>> getCopilotsStatistics() throws Exception {
        Request r = new Request();
        // command - copilot_statistics
        r.setContentHandle("copilot_pool_members");

        ResultSetContainer statisticResults = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("copilot_pool_statistics");

        Iterator<ResultSetContainer.ResultSetRow> itr = statisticResults.iterator();
        
        Map<String, Map<Long, Integer>> statsMap = new HashMap<String, Map<Long, Integer>>();
        Map<Long, Integer> projectsStats = new HashMap<Long, Integer>();
        Map<Long, Integer> contestsStats = new HashMap<Long, Integer>();
        Map<Long, Integer> totalProjectsStats = new HashMap<Long, Integer>();
        Map<Long, Integer> totalContestsStats = new HashMap<Long, Integer>();
        Map<Long, Integer> failedContestsStats = new HashMap<Long, Integer>();
        Map<Long, Integer> repostedContestsStats = new HashMap<Long, Integer>();

        while (itr.hasNext()) {
            ResultSetContainer.ResultSetRow row = itr.next();

            projectsStats.put(row.getLongItem("user_id"), row.getIntItem("current_projects_number"));
            contestsStats.put(row.getLongItem("user_id"), row.getIntItem("current_contests_number"));
            totalProjectsStats.put(row.getLongItem("user_id"), row.getIntItem("total_projects_number"));
            totalContestsStats.put(row.getLongItem("user_id"), row.getIntItem("total_contests_number"));
            failedContestsStats.put(row.getLongItem("user_id"), row.getIntItem("failed_contests_number"));
            repostedContestsStats.put(row.getLongItem("user_id"), row.getIntItem("reposted_contests_number"));
        }
        
        statsMap.put("currentProjects", projectsStats);
        statsMap.put("currentContests", contestsStats);
        statsMap.put("totalProjects", totalProjectsStats);
        statsMap.put("totalContests", totalContestsStats);
        statsMap.put("failedContests", failedContestsStats);
        statsMap.put("repostedContests", repostedContestsStats);

        return statsMap;
    }
}

