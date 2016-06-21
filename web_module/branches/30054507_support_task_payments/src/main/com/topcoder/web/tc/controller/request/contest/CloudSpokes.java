/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;


import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.CloudSpokesConstants;
import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.web.tc.model.cloudspokes.CloudSpokesChallenge;
import com.topcoder.web.tc.model.cloudspokes.Review;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>This controller is to handle all the requests for displaying the CloudSpokes contest data. It
 * handles 4 page types 1) Active Contests 2) Contest Status 3) Past Contests 4) Review Opportunities</p>
 *
 * <p>Thread-safety:This class is not thread-safe, but it's used in a thread safe way</p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
 */
public class CloudSpokes extends Base {
    /**
     * The request parameter name for the page type.
     */
    private static final String PAGE_TYPE_PARAM = "page";

    /**
     * The active contests page type.
     */
    private static final String ACTIVE_CONTESTS_PAGE = "activecontests";

    /**
     * The REST API URL to get the active contests data.
     */
    private static final String ACTIVE_CONTESTS_API =
            CloudSpokesConstants.CLOUD_SPOKES_API_BASE + CloudSpokesConstants.CLOUD_SPOKES_OPEN_CHALLENGES_API;


    /**
     * The contest status page type.
     */
    private static final String CONTEST_STATUS_PAGE = "conteststatus";

    /**
     * The REST API to get contest status data.
     */
    private static final String CONTEST_STATUS_API = CloudSpokesConstants.CLOUD_SPOKES_API_BASE +
            CloudSpokesConstants.CLOUD_SPOKES_IN_PROGRESS_CHALLENGES_API;

    /**
     * The past contests page type.
     */
    private static final String PAST_CONTESTS_PAGE = "pastcontests";

    /**
     * The REST API to get past contests.
     */
    private static final String PAST_CONTESTS_API = CloudSpokesConstants.CLOUD_SPOKES_API_BASE +
            CloudSpokesConstants.CLOUD_SPOKES_PAST_CHALLENGES_API;

    /**
     * The default page size for past contests page.
     */
    private static final int DEFAULT_PAGE_SIZE = 50;

    /**
     * The default page start office for past contests page.
     */
    private static final int DEFAULT_PAGE_START = 0;

    /**
     * The max page size limit.
     */
    private static final int MAX_PAGE_SIZE_ALLOWED = 60;

    /**
     * The review page type.
     */
    private static final String REVIEW_PAGE = "review";

    /**
     * The REST API to get the review data.
     */
    private static final String REVIEW_OPPORTUNITIES_API = CloudSpokesConstants.CLOUD_SPOKES_API_BASE +
            CloudSpokesConstants.CLOUD_SPOKES_REVIEW_OPPORTUNITIES_API;

    /**
     * The REST API to get challenge detail.
     */
    private static final String CHALLENGE_DETAIL_API = CloudSpokesConstants.CLOUD_SPOKES_API_BASE +
            CloudSpokesConstants.CLOUD_SPOKES_CHALLENGE_DETAILS_API;

    /**
     * The HTTPClient instance used to send and receive request to CloudSpokes web API
     */
    private final HttpClient httpClient = new HttpClient();

    /**
     * The main execution logic to handle the requests to CloudSpokes related pages.
     *
     * @throws TCWebException if there is any error.
     */
    @Override
    protected void developmentProcessing() throws TCWebException {
        String cloudSpokesPageType = getRequest().getParameter(PAGE_TYPE_PARAM);

        if (cloudSpokesPageType == null) {
            throw new TCWebException("Parameter:" + PAGE_TYPE_PARAM + " expected.");
        }

        cloudSpokesPageType = cloudSpokesPageType.toLowerCase();

        if (cloudSpokesPageType.equals(ACTIVE_CONTESTS_PAGE)) {
            handleActiveContestsPageRequest();
        } else if (cloudSpokesPageType.equals(CONTEST_STATUS_PAGE)) {
            handleContestStatusPageRequest();
        } else if (cloudSpokesPageType.equals(PAST_CONTESTS_PAGE)) {
            handlePastContestsPageRequest();
        } else if (cloudSpokesPageType.equals(REVIEW_PAGE)) {
            handleReviewPageRequest();
        } else {
            throw new TCWebException("Invalid value for parameter:" + PAGE_TYPE_PARAM);
        }
    }

    /**
     * Handles the request for active contests page.
     *
     * @throws TCWebException if there is any error.
     */
    private void handleActiveContestsPageRequest() throws TCWebException {

        NameValuePair[] queries = new NameValuePair[]{new NameValuePair("limit",
                String.valueOf(CloudSpokesConstants.ACTIVE_CONTESTS_MAX_LIMIT))};

        List<CloudSpokesChallenge> activeChallenges =
                getDataFromCloudSpokesAPI(httpClient, ACTIVE_CONTESTS_PAGE, ACTIVE_CONTESTS_API,
                        null, queries, CloudSpokesChallenge.class, true);

        getRequest().setAttribute("challenges", activeChallenges);
        setNextPage("/contest/cloudspokes/activeContests.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * Handles the request for contest status page.
     *
     * @throws TCWebException if there is any error.
     */
    private void handleContestStatusPageRequest() throws TCWebException {
        List<CloudSpokesChallenge> challengesInReview =
                getDataFromCloudSpokesAPI(httpClient, CONTEST_STATUS_PAGE, CONTEST_STATUS_API, null, null,
                        CloudSpokesChallenge.class, true);

        getRequest().setAttribute("challenges", challengesInReview);
        setNextPage("/contest/cloudspokes/contestStatus.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * Handles the request for past contests page.
     *
     * @throws TCWebException if there is any error.
     */
    private void handlePastContestsPageRequest() throws TCWebException {
        int limit = getPaginationSettingFromRequest(DataAccessConstants.NUMBER_RECORDS, DEFAULT_PAGE_SIZE, 1,
                MAX_PAGE_SIZE_ALLOWED);
        int offset = getPaginationSettingFromRequest(DataAccessConstants.START_RANK, DEFAULT_PAGE_START, 0, 0);

        NameValuePair[] queries = new NameValuePair[]{new NameValuePair("limit",
                String.valueOf(limit)), new NameValuePair("offset", String.valueOf(offset))};

        List<CloudSpokesChallenge> pastChallenges =
                getDataFromCloudSpokesAPI(httpClient, PAST_CONTESTS_PAGE, PAST_CONTESTS_API, null, queries,
                        CloudSpokesChallenge.class, true);

        getRequest().setAttribute("challenges", pastChallenges);
        setDefault(DataAccessConstants.NUMBER_RECORDS, limit);
        setDefault(DataAccessConstants.START_RANK, offset);
        setNextPage("/contest/cloudspokes/pastContests.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * Handles the request for review opportunities page.
     *
     * @throws TCWebException if there is any error.
     */
    private void handleReviewPageRequest() throws TCWebException {
        List<Review> reviews = getDataFromCloudSpokesAPI(httpClient, REVIEW_PAGE, REVIEW_OPPORTUNITIES_API,
                CloudSpokesConstants.CLOUD_SPOKES_API_KEY, null, Review.class, true);

        for (Review r : reviews) {
            List<Review> values =
                    getDataFromCloudSpokesAPI(httpClient, REVIEW_PAGE, CHALLENGE_DETAIL_API + "/" + r.getChallengeId(), null, null,
                            Review.class, false);
            if (values != null && values.size() > 0) {
                r.setSubmissionNumber(values.get(0).getSubmissionNumber());
            }
        }

        getRequest().setAttribute("reviews", reviews);
        setNextPage("/contest/cloudspokes/reviewOpportunities.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * Helper method to build a get request for HttpClient to use.
     *
     * @param apiURL  the url
     * @param apiKey  the API key
     * @param queries the queries to append to the get request
     * @return the <code>GetMethod</code> instance.
     * @throws Exception if there is any error.
     */
    private static GetMethod buildGetRequest(String apiURL, String apiKey, NameValuePair[] queries) throws Exception {
        URI uri = new URI(apiURL);
        GetMethod getMethod = new GetMethod(uri.toString());
        getMethod.addRequestHeader("accept", "application/json");
        if (apiKey != null) {
            getMethod.setRequestHeader("Authorization", "Token token=" + apiKey);
        }
        if (queries != null && queries.length > 0) {
            getMethod.setQueryString(queries);
        }
        return getMethod;
    }

    /**
     * Helper method to get the data from the specified Rest API and jackson to build the DTO from the json response.
     *
     * @param httpClient the http client instance
     * @param pageType  the page type.
     * @param apiURL    the API URL.
     * @param apiKey    the API key
     * @param queries   the queries to append to the get request
     * @param typeClass the class type of the DTO
     * @param multiple  whether the response contains list result or a single result.
     * @param <T>       the type information.
     * @return the List of the DTO
     * @throws TCWebException if there is any error
     */
    public static <T> List<T> getDataFromCloudSpokesAPI(HttpClient httpClient,
            String pageType, String apiURL, String apiKey, NameValuePair[] queries, Class<T> typeClass, boolean multiple) throws TCWebException {

        int status;
        String responseMessage;

        try {
            GetMethod getMethod = buildGetRequest(apiURL, apiKey, queries);
            status = httpClient.executeMethod(getMethod);
            responseMessage = getMethod.getResponseBodyAsString();
        } catch (Throwable t) {
            throw new TCWebException("Fail to get data for CloudSpokes page " + pageType + " from CloudSpokes API", t);
        }

        if (status != HttpStatus.SC_OK) {
            throw new TCWebException("Fail to get data for CloudSpokes page " + pageType + " from CloudSpokes API." +
                    " Got an invalid return code [" + status + "] from the server");
        }

        try {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonNode = mapper.readValue(responseMessage, JsonNode.class);
            JsonNode response = jsonNode.path("response");
            if (multiple) {
                return mapper.readValue(response.toString(),
                        mapper.getTypeFactory().constructCollectionType(List.class, typeClass));
            } else {
                T value = mapper.readValue(response.toString(), typeClass);
                List<T> values = new ArrayList<T>();
                values.add(value);
                return values;
            }

        } catch (Throwable t) {
            throw new TCWebException("Error when processing the CloudSpokes API response for page " + pageType, t);
        }
    }

    /**
     * Helper method to get the pagination setting from the request.
     *
     * @param paramName    the parameter name.
     * @param defaultValue the default value to use if there is no value.
     * @param minLimit     the min limit
     * @param maxLimit     the max limit
     * @return the parameter value.
     * @throws TCWebException if there is any error.
     */
    private int getPaginationSettingFromRequest(String paramName,
                                                int defaultValue, int minLimit, int maxLimit) throws TCWebException {
        String value = getRequest().getParameter(paramName);

        int valueInt = defaultValue;

        // validate
        if (value != null && value.trim().length() > 0) {
            try {
                valueInt = Integer.parseInt(value);

                if (valueInt < minLimit) {
                    valueInt = defaultValue;
                }

                if (maxLimit > 0 && valueInt > maxLimit) {
                    valueInt = maxLimit;
                }

            } catch (Throwable t) {
                throw new TCWebException("The parameter " + paramName + " is invalid");
            }
        }

        return valueInt;
    }
}
