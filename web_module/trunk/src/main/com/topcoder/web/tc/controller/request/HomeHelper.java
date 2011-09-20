/*
 * Copyright (c) 2001-2010 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.ActiveContestsSummary;

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
 * @author pulky, Blues, FireIce
 * @version 1.2
 */
public class HomeHelper {

    protected static final Logger log = Logger.getLogger(HomeHelper.class);

    public static Map<String, ActiveContestsSummary> getActiveContests() throws Exception {
        HashMap<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
        ret.putAll(getOnlineReviewSummary());
        ret.put(Home.STUDIO, getStudioSummary());
        ret.put(Home.BUGS, getBugRaceSummary());
        ret.put(Home.MM, getMMSummary());

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

        //this is a special case because we need to query based on the contest indicator flag because
        //some architecture projects in OR are contests and some are not
        ResultSetContainer arch = dataMap.get("architecture_active_contests_summary");
        if (!arch.isEmpty()) {
            ResultSetContainer.ResultSetRow row = arch.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.ARCHITECTURE, summary);
        }

        ResultSetContainer concept = dataMap.get("conceptualization_active_contests_summary");
        if (!concept.isEmpty()) {
            ResultSetContainer.ResultSetRow row = concept.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.CONCEPTUALIZATION, summary);
        }

        ResultSetContainer spec = dataMap.get("specification_active_contests_summary");
        if (!spec.isEmpty()) {
            ResultSetContainer.ResultSetRow row = spec.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.SPECIFICATION, summary);
        }

        ResultSetContainer uiprototype = dataMap.get("ui_prototype_active_contests_summary");
        if (!uiprototype.isEmpty()) {
            ResultSetContainer.ResultSetRow row = uiprototype.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.UI_PROTOTYPE, summary);
        }

        ResultSetContainer riabuild = dataMap.get("ria_build_active_contests_summary");
        if (!riabuild.isEmpty()) {
            ResultSetContainer.ResultSetRow row = riabuild.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.RIA_BUILD, summary);
        }

        ResultSetContainer riacomponent = dataMap.get("ria_component_active_contests_summary");
        if (!riacomponent.isEmpty()) {
            ResultSetContainer.ResultSetRow row = riacomponent.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.RIA_COMPONENT, summary);
        }

        ResultSetContainer copilotposting = dataMap.get("copilot_posting_active_contests_summary");
        if (!copilotposting.isEmpty()) {
            ResultSetContainer.ResultSetRow row = copilotposting.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.COPILOT_POSTING, summary);
        }

        ResultSetContainer contentcreation = dataMap.get("content_creation_active_contests_summary");
        if (!contentcreation.isEmpty()) {
            ResultSetContainer.ResultSetRow row = contentcreation.get(0);
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            if (row.getItem("total_prizes").getResultData()!=null) {
                summary.setPrizeTotal(row.getFloatItem("total_prizes"));
            }
            ret.put(Home.CONTENT_CREATION, summary);
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

    public static ActiveContestsSummary getBugRaceSummary() throws Exception {
        try {
            ActiveContestsSummary ret = new ActiveContestsSummary();
            CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.JIRA_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("bug_race_active_contests_summary");

            ResultSetContainer rsc = dai.getData(dataRequest).get("bug_race_active_contests_summary");
            if (!rsc.isEmpty()) {
                ret.setContestCount(rsc.get(0).getIntItem("total_contests"));
                ret.setName("Bug Races");
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
