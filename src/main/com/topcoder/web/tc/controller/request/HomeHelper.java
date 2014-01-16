/*
 * Copyright (c) 2001-2014 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.CloudSpokesConstants;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.contest.CloudSpokes;
import com.topcoder.web.tc.model.ActiveContestsSummary;
import com.topcoder.web.tc.model.cloudspokes.CloudSpokesChallenge;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;

/**
 * <p>
 * This Helper class is used to retrieve active contest information.
 * </p>
 *
 * <p>
 * (Copilot Selection Contest Online Review and TC Site Integration Assembly)
 * Version 1.1 changes: Add active contest summary for copilot postings
 * </p>
 *
 * <p>
 * (Content Creation Contest Online Review and TC Site Integration Assembly)
 * Version 1.2 changes: Updated {@link #getOnlineReviewSummary()} method to add active contest summary for
 * content creations.
 * </p>
 * 
 * <p>
 * (Add Reporting Contest Type)
 * Version 1.3 changes: Updated {@link #getOnlineReviewSummary()} method to add active contest summary for
 * reporting.
 * </p>
 *
 * <p>
 * (Release Assembly - TopCoder BugHunt Competition Integration)
 * Version 1.4 changes: Updated {@link #getOnlineReviewSummary()} method to add active contest summary for
 * Bug Hunt.
 * </p>
 *
 * @author pulky, Blues, FireIce, lmmortal, TCSASSEMBLER
 * @version 1.4
 */
public class HomeHelper {

    protected static final Logger log = Logger.getLogger(HomeHelper.class);

    public static Map<String, ActiveContestsSummary> getActiveContests() throws Exception {
        HashMap<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
        ret.putAll(getOnlineReviewSummary());
        ret.put(Home.STUDIO, getStudioSummary());
        ret.put(Home.BUGS, getBugRaceSummary());
        ret.put(Home.MM, getMMSummary());
        ret.put(Home.CLOUDSPOKES, getCloudSpokesSummary());
        return ret;
    }

    public static ActiveContestsSummary getStudioSummary() throws Exception {
        try {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.TCS_OLTP_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("studio_active_contests_summary");

            ResultSetContainer rsc = dai.getData(dataRequest).get("studio_active_contests_summary");
            if (!rsc.isEmpty()) {
                ret.setContestCount(rsc.get(0).getIntItem("total_contests"));
                ret.setName("Studio");
                if (rsc.get(0).getItem("total_prizes").getResultData()!=null) {
                    ret.setPrizeTotal(rsc.get(0).getFloatItem("total_prizes"));
                }
            }
            return ret;
        } catch (Exception e) {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            ret.setContestCount(0);
            return ret;
        }
    }

    public static Map<String, ActiveContestsSummary> getOnlineReviewSummary() throws Exception {
        HashMap<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
        CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setContentHandle("homepage_active_contest_summary");

        Map<String, ResultSetContainer> dataMap = dai.getData(dataRequest);


        ActiveContestsSummary summary;

        ResultSetContainer dr = dataMap.get("dr_active_contests_summary");
        if (!dr.isEmpty()) {
            ResultSetContainer.ResultSetRow row = dr.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            if (log.isDebugEnabled()) {
                log.debug("dr contests " + summary.getContestCount() + " "+ row.getIntItem("total_contests"));
            }
            summary.setName("Digital Run");
            if (row.getItem("dr_points").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("dr_points"));
            }
            ret.put(Home.DR, summary);
        }

        for (ResultSetContainer.ResultSetRow row : dataMap.get("homepage_active_contest_summary")) {
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }

            switch (row.getIntItem("project_category_id")) {

                case Constants.DESIGN_PROJECT_TYPE: {
                    ret.put(Home.DESIGN, summary);
                    break;
                }
                case Constants.DEVELOPMENT_PROJECT_TYPE: {
                    ret.put(Home.DEVELOPMENT, summary);
                    break;
                }
                case Constants.ASSEMBLY_PROJECT_TYPE: {
                    ret.put(Home.ASSEMBLY, summary);
                    break;
                }
                case Constants.TEST_SUITES_PROJECT_TYPE: {
                    ret.put(Home.TEST_SUITES, summary);
                    break;
                }
                case Constants.TEST_SCENARIOS_PROJECT_TYPE: {
                    ret.put(Home.TEST_SCENARIOS, summary);
                    break;
                }
                case Constants.FIRST2FINISH_PROJECT_TYPE: {
                    ret.put(Home.FIRST2FINISH, summary);
                    break;
                }
                case Constants.CODE_PROJECT_TYPE: {
                    ret.put(Home.CODE, summary);
                    break;
                }
                case Constants.REPORTING_PROJECT_TYPE: {
                	ret.put(Home.REPORTING, summary);
                }
                case Constants.ARCHITECTURE_PROJECT_TYPE: {
                    ret.put(Home.ARCHITECTURE, summary);
                    break;
                }
                case Constants.CONCEPTUALIZATION_PROJECT_TYPE: {
                    ret.put(Home.CONCEPTUALIZATION, summary);
                    break;
                }
                case Constants.SPECIFICATION_PROJECT_TYPE: {
                    ret.put(Home.SPECIFICATION, summary);
                    break;
                }
                case Constants.UI_PROTOTYPE_PROJECT_TYPE: {
                    ret.put(Home.UI_PROTOTYPE, summary);
                    break;
                }
                case Constants.RIA_BUILD_PROJECT_TYPE: {
                    ret.put(Home.RIA_BUILD, summary);
                    break;
                }
                case Constants.RIA_COMPONENT_PROJECT_TYPE: {
                    ret.put(Home.RIA_COMPONENT, summary);
                    break;
                }
                case Constants.COPILOT_POSTING_PROJECT_TYPE: {
                    ret.put(Home.COPILOT_POSTING, summary);
                    break;
                }
                case Constants.CONTENT_CREATION_PROJECT_TYPE: {
                    ret.put(Home.CONTENT_CREATION, summary);
                    break;
                }
                case Constants.BUG_HUNT_PROJECT_TYPE: {
                    ret.put(Home.BUG_HUNT, summary);
                    break;
                }
            }

        }

        return ret;
    }

    public static ActiveContestsSummary getMMSummary() throws Exception {
        ActiveContestsSummary ret = new ActiveContestsSummary();
        CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setContentHandle("long_contest_active_contests");

        ResultSetContainer rsc = dai.getData(dataRequest).get("long_contest_active_contests");
        //we don't store MM prizes in the db, so we can't query them
        ret.setContestCount(rsc.size());
        ret.setName("Marathon Matches");
        return ret;

    }

    public static ActiveContestsSummary getCloudSpokesSummary() throws Exception {
        ActiveContestsSummary ret = new ActiveContestsSummary();
        NameValuePair[] queries = new NameValuePair[]{new NameValuePair("limit",
                String.valueOf(CloudSpokesConstants.ACTIVE_CONTESTS_MAX_LIMIT))};
        List<CloudSpokesChallenge> activeChallenges =
                CloudSpokes.getDataFromCloudSpokesAPI(new HttpClient(), "cloud spokes summary",
                        CloudSpokesConstants.CLOUD_SPOKES_API_BASE +
                                CloudSpokesConstants.CLOUD_SPOKES_OPEN_CHALLENGES_API,
                        null, queries, CloudSpokesChallenge.class, true);
        ret.setContestCount(activeChallenges.size());
        ret.setName("CloudSpokes");
        Float prize = 0f;
        for(CloudSpokesChallenge c : activeChallenges) {
            prize += (float) c.getPrize();
        }
        ret.setPrizeTotal(prize);

        return ret;
    }

    public static ActiveContestsSummary getBugRaceSummary() throws Exception {
        try {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.JIRA_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("bug_race_active_contests_summary");

            ResultSetContainer rsc = dai.getData(dataRequest).get("bug_race_active_contests_summary");
            if (!rsc.isEmpty()) {
                ret.setContestCount(rsc.get(0).getIntItem("total_contests"));
                ret.setName("Races");
                if (rsc.get(0).getItem("total_prizes").getResultData()!=null) {
                    ret.setPrizeTotal(rsc.get(0).getFloatItem("total_prizes"));
                }
            }
            return ret;
        } catch (Exception e) {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            ret.setContestCount(0);
            return ret;
        }
    }
}
