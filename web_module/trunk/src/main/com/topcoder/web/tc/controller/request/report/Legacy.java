package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.tag.ListSelectTag;

import javax.servlet.http.HttpUtils;
import java.util.*;

/**
 * User: dok
 * Date: Nov 18, 2004
 * Time: 3:28:26 PM
 */
public class Legacy extends Base {

    protected void businessProcessing() throws TCWebException {
        log.debug("process called....");
        String task = null;
        String response_addr = null;
        Report report = null;

        Integer reportId = null;
        ReportNode reportList = null;
        try {
            task = getRequest().getParameter(Constants.TASK_NAME_KEY);

            if (((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {

                response_addr = getRequest().getParameter(Constants.RESPONSE_ADDR_KEY);

                if (response_addr == null) response_addr = Constants.REPORT_HOME_ADDR;


                if (task == null || task.equals("")) {
                    response_addr = Constants.REPORT_HOME_ADDR;
                    getRequest().setAttribute(Constants.REPORT_LIST_KEY, getReportList());
                    getRequest().setAttribute(Constants.PROCESSED_KEY, new Boolean(true));
                } else if (task.equals(Constants.NEW_REPORT_KEY)) {
                    Request dataRequest = null;
                    dataRequest = new Request(HttpUtils.parseQueryString(getRequest().getQueryString()));
                    if (dataRequest.getContentHandle() == null || dataRequest.getContentHandle().equals("")) {
                        response_addr = Constants.NEW_REPORT_HOME_ADDR;
                    } else {
                        DataAccessInt dai = new DataAccess(
                                dataRequest.getProperty(Constants.DB_KEY, DBMS.OLTP_DATASOURCE_NAME));
                        Map dataMap = null;
                        dataMap = dai.getData(dataRequest);
                        getRequest().setAttribute(Constants.REPORT_RESULT_KEY, dataMap);
                        response_addr = Constants.NEW_RESULT_ADDR;
                    }
                } else if (task.equals(Constants.REPORT_LIST_KEY)) {
                    response_addr = Constants.REPORT_HOME_ADDR;
                    getRequest().setAttribute(Constants.REPORT_LIST_KEY, getReportList());
                    getRequest().setAttribute(Constants.PROCESSED_KEY, new Boolean(true));
                } else if (task.equals(Constants.REPORT_RESULT_KEY)) {
                    // get the list of reports from the request if it's there, then get
                    // the name of the report we want from the request.
                    reportList = (ReportNode) getRequest().getAttribute(Constants.REPORT_LIST_KEY);
                    if (reportList == null) {
                        reportList = getReportList();
                        getRequest().setAttribute(Constants.REPORT_LIST_KEY, reportList);
                    }
                    if (getRequest().getParameter(Constants.REPORT_ID_KEY) == null)
                        throw new Exception("no report id given");
                    else
                        reportId = new Integer(getRequest().getParameter(Constants.REPORT_ID_KEY));

                    // get the report, if the report requires more info, send them to the
                    // parameter page, otherwise show the report
                    report = reportList.findReport(reportId);
                    report.fillParameters(getRequest());
                    if (!report.hasParameters()) {
                        response_addr = getReport(report);
                    } else if (report.hasParameters() && report.hasNullParameter()) {
                        response_addr = Constants.REPORT_PARAM_ADDR;
                    } else {
                        report.fillQueryParameters();
                        getReport(report);
                        response_addr = Constants.REPORT_RESULT_ADDR;
                    }

                    getRequest().setAttribute(Constants.PROCESSED_KEY, new Boolean(true));

                } else if (task.equals(Constants.REPORT_PROFILE_KEY)) {
                    response_addr = Constants.REPORT_PROFILE_ADDR;
                    getProfile(getRequest());
                    getRequest().setAttribute(Constants.PROCESSED_KEY, new Boolean(true));
                } else if (task.equals(Constants.REPORT_PROFILE_LIST_KEY)) {
                    response_addr = Constants.REPORT_PROFILE_LIST_ADDR;
                    getProfileList(getRequest());
                } else if (task.equals(Constants.REPORT_PROFILE_LIST_MENU_KEY)) {
                    response_addr = Constants.REPORT_PROFILE_LIST_ADDR;
                    getProfileListMenu(getRequest());
                } else if (task.equals(Constants.REPORT_PROFILE_DETAIL_KEY)) {
                    response_addr = Constants.REPORT_PROFILE_DETAIL_ADDR;
                    getProfileDetail(getRequest());
                } else if (task.equals(Constants.REPORT_PROFILE_SEARCH_KEY)) {
                    response_addr = Constants.REPORT_PROFILE_SEARCH_ADDR;
                    getProfileSearch(getRequest());
                } else {
                    throw new NavigationException("Invalid task " + task);
                }
                setNextPage(Constants.JSP_ADDR + response_addr);
                setIsNextPageInContext(true);
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }


    private String getReport(Report report) throws Exception {
        log.debug("getReport called...");
        if (report.getId().compareTo(MEMBER_STATS_BY_STATE_ID) == 0) {
            specialProcessing(report);
            return Constants.REPORT_RESULT_ADDR;
        } else if (report.getId().compareTo(MEMBER_STATS_BY_REGION_ID) == 0) {
            specialProcessing(report);
            return Constants.REPORT_RESULT_ADDR;
        } else if (report.getId().compareTo(MEMBER_STATS_BY_COUNTRY_ID) == 0) {
            specialProcessing(report);
            return Constants.REPORT_RESULT_ADDR;
        } else if (report.getId().compareTo(COLLEGE_STATS_BY_SCHOOL_ID) == 0) {
            specialProcessing(report);
            return Constants.REPORT_RESULT_ADDR;
        } else if (report.getId().compareTo(COLLEGE_STATS_BY_REGION_ID) == 0) {
            specialProcessing(report);
            return Constants.REPORT_RESULT_ADDR;
        } else if (report.getId().compareTo(COLLEGE_STATS_BY_SCHOOL_STATE_ID) == 0) {
            specialProcessing(report);
            return Constants.REPORT_RESULT_ADDR;
        } else if (report.getId().compareTo(COLLEGE_STATS_BY_SCHOOL_REGION_ID) == 0) {
            specialProcessing(report);
            return Constants.REPORT_RESULT_ADDR;
        } else {
            report.setResult(report.getQuery().execute());
            return Constants.REPORT_RESULT_ADDR;
        }
    }

    private void getProfile(TCRequest request) throws Exception {
        log.debug("getProfile called...");
        Request mainRequest = new Request();
        mainRequest.setContentHandle("profile_lookup");
        String handle = StringUtils.checkNull(request.getParameter(Constants.REPORT_HANDLE_KEY));
        String firstName = StringUtils.checkNull(request.getParameter(Constants.REPORT_FIRST_NAME_KEY));
        String lastName = StringUtils.checkNull(request.getParameter(Constants.REPORT_LAST_NAME_KEY));
        String email = StringUtils.checkNull(request.getParameter(Constants.REPORT_EMAIL_KEY));

        if (!handle.equals(""))
            mainRequest.setProperty(Constants.REPORT_HANDLE_KEY, handle);
        if (!firstName.equals(""))
            mainRequest.setProperty(Constants.REPORT_FIRST_NAME_KEY, firstName);
        if (!lastName.equals(""))
            mainRequest.setProperty(Constants.REPORT_LAST_NAME_KEY, lastName);
        if (!email.equals(""))
            mainRequest.setProperty(Constants.REPORT_EMAIL_KEY, email);

        DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map mainMap = dai.getData(mainRequest);
        ResultSetContainer profileList = (ResultSetContainer) mainMap.get("main_profile_info");

        log.debug("found " + profileList.size() + " people matching search criteria");
        log.debug("request was: " + mainRequest.toString());
        ArrayList result = new ArrayList(profileList.size());

        Request detailRequest = new Request();
        detailRequest.setContentHandle("profile_lookup_detail");
        for (int i = 0; i < profileList.size() && i < 100; i++) { //let then have 100 records back max.
            detailRequest.setProperty(Constants.REPORT_CODER_ID_KEY, profileList.getItem(i, "user_id").toString());
            result.add(dai.getData(detailRequest));
        }
        request.setAttribute(Constants.REPORT_PROFILE_LIST_KEY, profileList);
        request.setAttribute(Constants.REPORT_PROFILE_DETAIL_KEY, result);
    }


    private Map parseQueryString(TCRequest request) {
        log.debug("parseQueryString called...");
        Enumeration e = null;
        String param = null;
        String value = null;
        Map m = null;

        e = request.getParameterNames();

        m = new HashMap();
        while (e.hasMoreElements()) {
            param = (String) e.nextElement();
            // using getParameter here because we don't care if
            // if there are multiple values for one key..what
            // would we do with them anyway?
            value = request.getParameter(param);
            if (value != null && !value.equals("")) {
                m.put(param, request.getParameter(param));
            }
        }
        return m;
    }

    private void getProfileDetail(TCRequest request) throws Exception {
        log.debug("getProfileDetail called...");
        DataAccessInt dai = null;
        Request dataRequest = null;
        Map resultMap = null;

        dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        dataRequest = new Request(parseQueryString(request));
        dataRequest.setContentHandle(Constants.REPORT_PROFILE_DETAIL_KEY);
        resultMap = dai.getData(dataRequest);
        request.setAttribute(Constants.REPORT_PROFILE_DETAIL_KEY, resultMap);
    }
    private String isOn(String s, boolean def){
        return (def || "on".equals(s))?"true":"false";
    }
    private void getProfileSearch(TCRequest request) throws Exception {
        Request r = new Request();
        r.setContentHandle("profile_search");
        DataAccessInt dataAccess = getDataAccess(true);
        Map m = dataAccess.getData(r);
        request.setAttribute(Constants.REPORT_PROFILE_SEARCH_KEY, m);
        ResultSetContainer demographic_questions = (ResultSetContainer)m.get("demographics_questions");
        ResultSetContainer demographic_answers = (ResultSetContainer)m.get("demographics_answers");
        ResultSetContainer skill_types = (ResultSetContainer)m.get("skill_types");
        ResultSetContainer skills = (ResultSetContainer)m.get("skills");
        Enumeration e = request.getParameterNames();
        Map sel = new HashMap();
        Map skillMap = new HashMap();
        Map skillSetMap = new HashMap();
        Map demo = new HashMap();
        String[] textFields = {"handle","email","firstname","lastname","zipcode","city","company","maxdayssincerating","minevents","mindays","maxdays","minrating","maxrating"};
        String[] checkBoxes = {"count","pro","stud"};
        boolean[] def = {false,true,true};
        boolean revise = "on".equals(request.getParameter("revise"));
        for(int i = 0; i<textFields.length; i++){
            setDefault(textFields[i],request.getParameter(textFields[i]));
        }
        for(int i = 0; i<checkBoxes.length; i++){
            setDefault(checkBoxes[i],isOn(request.getParameter(checkBoxes[i]),!revise&&def[i]));
        }
        while(e.hasMoreElements()){
            String p = e.nextElement().toString();
            String[] v = request.getParameterValues(p);
            if(p.startsWith("skillset")){//set all previously selected skills
                List l = new ArrayList();
                for(int i = 0; i<v.length; i++){
                    int idx = v[i].indexOf("_");
                    int idx2 = v[i].indexOf("_",idx+1);
                    int skillId = Integer.parseInt(v[i].substring(0,idx));
                    int skillLevel = Integer.parseInt(v[i].substring(idx+1,idx2));
                    String name = v[i].substring(idx2+1);
                    l.add(new ListSelectTag.Option(v[i], name +" >= " + skillLevel));
                }
                skillSetMap.put(p,l);
            }else if(p.equals("states") || p.equals("country") || p.equals("countryoforigin")){//set a few more selections
                Set s = new HashSet();
                s.addAll(Arrays.asList(v));
                sel.put(p,s);
            }else if(p.startsWith("lang_")){//language checkboxes
                setDefault(p,isOn(request.getParameter(p),!revise));
            }
        }
        //build all the demo tables
        ResultSetContainer.ResultSetRow answer = demographic_answers.getRow(0);
        for(int i = 0, j = 0; i<demographic_questions.getRowCount(); i++){
            ResultSetContainer.ResultSetRow question = demographic_questions.getRow(i);
            List l = new ArrayList();
            int questionId = question.getIntItem("demographic_question_id");
            Set s = new HashSet();
            String[] v = request.getParameterValues("demo_"+questionId);
            if(v!=null){
                s.addAll(Arrays.asList(v));
            }
            while(answer.getIntItem("demographic_question_id") == questionId){
                String text = answer.getStringItem("demographic_answer_text");
                String answerId = answer.getStringItem("demographic_answer_id");
                l.add(new ListSelectTag.Option(answerId, text, s.contains(answerId)));
                if(++j == demographic_answers.getRowCount()){
                    break;
                }else{
                    answer = demographic_answers.getRow(j);
                }
            }
            demo.put(new Integer(questionId),l);
        }

        //build all the skill tables
        ResultSetContainer.ResultSetRow skill = skills.getRow(0);
        for(int i = 0, j = 0; i<skill_types.getRowCount(); i++){
            ResultSetContainer.ResultSetRow type = skill_types.getRow(i);
            List l = new ArrayList();
            int skillType = type.getIntItem("skill_type_id");
            while(skill.getIntItem("skill_type_id") == skillType){
                String text = skill.getStringItem("skill_desc");
                l.add(new ListSelectTag.Option(skill.getStringItem("skill_id"), text));
                if(++j == skills.getRowCount()){
                    break;
                }else{
                    skill = skills.getRow(j);
                }
            }
            skillMap.put(new Integer(type.getIntItem("skill_type_id")),l);
        }

        request.setAttribute("selected",sel);
        request.setAttribute("demoMap",demo);
        request.setAttribute("skillMap",skillMap);
        request.setAttribute("skillSetMap",skillSetMap);
    }

    private void getProfileList(TCRequest request) throws Exception {
        log.debug("getProfileList called...");
        QueryRequest qr = null;
        DataAccessInt dai = null;
        Map resultMap = null;

        qr = new QueryRequest();
        qr.addQuery("State_List", STATE_QUERY);
        qr.addQuery("Country_List", COUNTRY_QUERY);
        qr.addQuery("Relocate_Answers", RELOCATE_QUERY);
        qr.addQuery("Profile_List", getProfileListQuery(parseQueryString(request), false));
        dai = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
        resultMap = dai.getData(qr);
        request.setAttribute(Constants.REPORT_PROFILE_LIST_KEY, resultMap);

    }

    /**
     * @param request a map containing the information we'll use to create the query
     * @param emptySet true if one just wants to run the query and
     */

    private String getProfileListQuery(Map request, boolean emptySet) throws Exception {
        log.debug("getProfileListQuery called...");
        StringBuffer query = null;
        String minRating = null;
        String maxRating = null;
        String handle = null;
        String stateCodes = null;
        String minNumRatings = null;
        String maxNumRatings = null;
        String minGradYear = null;
        String maxGradYear = null;
        String coderTypes = null;
        String firstName = null;
        String lastName = null;
        String relocate = null;
        boolean hasGradYear = true;

        minRating = (String) request.get(Constants.REPORT_MIN_RATING_KEY);
        maxRating = (String) request.get(Constants.REPORT_MAX_RATING_KEY);
        handle = (String) request.get(Constants.REPORT_HANDLE_KEY);
        stateCodes = (String) request.get(Constants.REPORT_STATE_KEY);
        minNumRatings = (String) request.get(Constants.REPORT_MIN_NUM_RATINGS_KEY);
        maxNumRatings = (String) request.get(Constants.REPORT_MAX_NUM_RATINGS_KEY);
        minGradYear = (String) request.get(Constants.REPORT_MIN_GRAD_YEAR_KEY);
        maxGradYear = (String) request.get(Constants.REPORT_MAX_GRAD_YEAR_KEY);
        coderTypes = (String) request.get(Constants.REPORT_PRO_STUDENT_KEY);
        firstName = (String) request.get(Constants.REPORT_FIRST_NAME_KEY);
        lastName = (String) request.get(Constants.REPORT_LAST_NAME_KEY);
        relocate = (String) request.get(Constants.REPORT_RELOCATE_KEY);

        if (minGradYear == null && maxGradYear != null)
            minGradYear = "0";  //default it
        else if (maxGradYear == null && minGradYear != null)
            maxGradYear = "100000";  //default it
        else if (maxGradYear == null && minGradYear == null) hasGradYear = false;

        query = new StringBuffer();
        query.append(" SELECT u.user_id\n");
        query.append(" ,u.handle\n");
        query.append(" ,u.email\n");
        query.append(" ,c.first_name\n");
        query.append(" ,c.last_name\n");
        query.append(" ,c.address1\n");
        query.append(" ,c.address2\n");
        query.append(" ,c.city\n");
        query.append(" ,c.state_code\n");
        query.append(" ,c.zip\n");
        query.append(" ,c.member_since\n");
        query.append(" ,co.country_name\n");
        query.append(" ,ct.coder_type_desc\n");
        query.append(" ,r.rating\n");
        query.append(" ,r.num_ratings\n");
        if (hasGradYear) {
            query.append(" ,da1.demographic_answer_text as grad_year\n");
        } else {
            query.append(" ,'N/A' as grad_year\n");
        }
        query.append(" ,dr2.demographic_response as company\n");
        query.append(" ,da3.demographic_answer_text as looking_for_job\n");
        query.append(" ,cs.school_name as known_school_name\n");
        query.append(" ,da4.demographic_answer_text as other_school_name\n");
        query.append(" ,da5.demographic_answer_text as degree\n");
        query.append(" ,da6.demographic_answer_text as relocate\n");
        query.append(" ,rs.start_time as last_rated_event\n");
        query.append(" ,LOWER(u.handle)\n");
        query.append(" FROM user u\n");
        query.append(" ,coder c\n");
        query.append(" ,coder_type ct\n");
        query.append(" ,rating r\n");
        query.append(" ,country co \n");
        query.append(" ,round_segment rs\n");
        if (hasGradYear) {
            query.append(" ,demographic_response dr1\n");
            query.append(" ,demographic_answer da1\n");
        }
        query.append(" ,OUTER demographic_response dr2 \n");
        query.append(" ,OUTER (demographic_response dr3, OUTER demographic_answer da3)\n");
        query.append(" ,OUTER (demographic_response dr4, OUTER demographic_answer da4)\n");
        query.append(" ,OUTER (demographic_response dr5, OUTER demographic_answer da5)\n");
        query.append(" ,demographic_response dr6\n");
        query.append(" ,demographic_answer da6\n");
        query.append(" ,OUTER current_school cs \n");
        query.append(" WHERE c.coder_id = u.user_id\n");
        query.append(" AND u.status='A'");
        query.append(" AND ct.coder_type_id = c.coder_type_id\n");
        if (coderTypes != null && !coderTypes.equals("")) {
            query.append(" AND ct.coder_type_id in (" + coderTypes + ")\n");
        }
        query.append(" AND r.coder_id = u.user_id\n");
        query.append(" AND r.round_id = rs.round_id\n");
        query.append(" AND rs.segment_id = 2\n");
        query.append(" AND co.country_code = c.country_code\n");
        if (hasGradYear) {
            query.append(" AND dr1.coder_id = c.coder_id\n");
            query.append(" AND dr1.demographic_question_id = 18\n");
            query.append(" AND dr1.demographic_answer_id = da1.demographic_answer_id\n");
            query.append(" AND dr1.demographic_question_id = da1.demographic_question_id\n");
            query.append(" AND da1.demographic_answer_text::DECIMAL >= " + minGradYear + "\n");
            query.append(" AND da1.demographic_answer_text::DECIMAL <= " + maxGradYear + "\n");
        }
        query.append(" AND dr2.coder_id = c.coder_id\n");
        query.append(" AND dr2.demographic_question_id = 15\n");
        query.append(" AND dr3.coder_id = c.coder_id\n");
        query.append(" AND dr3.demographic_question_id = 3\n");
        query.append(" AND dr3.demographic_answer_id = da3.demographic_answer_id\n");
        query.append(" AND dr3.demographic_question_id = da3.demographic_question_id\n");
        query.append(" AND dr4.coder_id = c.coder_id\n");
        query.append(" AND dr4.demographic_question_id = 20\n");
        query.append(" AND dr4.demographic_answer_id <> 0\n");
        query.append(" AND dr4.demographic_answer_id = da4.demographic_answer_id\n");
        query.append(" AND dr4.demographic_question_id = da4.demographic_question_id\n");
        query.append(" AND dr5.coder_id = c.coder_id\n");
        query.append(" AND dr5.demographic_question_id = 16\n");
        query.append(" AND dr5.demographic_answer_id = da5.demographic_answer_id\n");
        query.append(" AND dr5.demographic_question_id = da5.demographic_question_id\n");
        query.append(" AND dr6.coder_id = c.coder_id\n");
        query.append(" AND dr6.demographic_question_id = 4\n");
        query.append(" AND dr6.demographic_answer_id = da6.demographic_answer_id\n");
        query.append(" AND dr6.demographic_question_id = da6.demographic_question_id\n");
        if (relocate != null && !relocate.equals("")) {
            query.append(" AND da6.demographic_answer_id IN (" + relocate + ")\n");
        }
        query.append(" AND cs.coder_id = c.coder_id\n");
        if (handle != null && !relocate.equals("")) {
            query.append(" AND LOWER(u.handle) like LOWER('" + handle + "')\n");
        }
        if (firstName != null && !firstName.equals("")) {
            query.append(" AND LOWER(c.first_name) like LOWER('" + firstName + "')\n");
        }
        if (lastName != null && !lastName.equals("")) {
            query.append(" AND LOWER(c.last_name) like LOWER('" + lastName + "')\n");
        }
        if (stateCodes != null && !stateCodes.equals("")) {
            query.append(" AND c.state_code in (" + stateCodes + ")\n");
        }
        if (minRating != null && !minRating.equals("")) {
            query.append(" AND r.rating >= " + minRating + "\n");
        }
        if (maxRating != null && !maxRating.equals("")) {
            query.append(" AND r.rating <= " + maxRating + "\n");
        }
        if (minNumRatings != null && !minNumRatings.equals("")) {
            query.append(" AND r.num_ratings >= " + minNumRatings + "\n");
        }
        if (maxNumRatings != null && !maxNumRatings.equals("")) {
            query.append(" AND r.num_ratings <= " + maxNumRatings + "\n");
        }
        if (emptySet) {
            query.append(" AND c.coder_id = -666\n");
        }
        query.append(" ORDER BY 23 ASC");
        log.debug("\n" + query.toString());
        return query.toString();

    }

    private void getProfileListMenu(TCRequest request) throws Exception {
        log.debug("getProfileListMenu called...");
        QueryRequest qr = null;
        DataAccessInt dai = null;
        Map resultMap = null;

        try {

            qr = new QueryRequest();
            qr.addQuery("State_List", STATE_QUERY);
            qr.addQuery("Country_List", COUNTRY_QUERY);
            qr.addQuery("Relocate_Answers", RELOCATE_QUERY);
            qr.addQuery("Profile_List", getProfileListQuery(new HashMap(), true));
            dai = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            resultMap = dai.getData(qr);
            request.setAttribute(Constants.REPORT_PROFILE_LIST_MENU_KEY, resultMap);
        } catch (Exception e) {
            throw e;
        }
    }

    private void specialProcessing(Report report) throws Exception {
        log.debug("specialProcessing called...");
        ArrayList result = report.getQuery().execute();
        log.debug("**** query **** \n\n" + report.getQuery() + "\n\n");
        for (int j = 0; j < result.size(); j++) {
            ResultItem[] origResultItems = (ResultItem[]) result.get(j);
            log.debug(origResultItems.length + " rows returned by query.");
            if (((IntResult) origResultItems[2]).getInt() > 0) {
                float avg_rating = (float) ((IntResult) origResultItems[3]).getInt() / ((IntResult) origResultItems[2]).getInt();
                float avg_events = (float) ((IntResult) origResultItems[5]).getInt() / ((IntResult) origResultItems[2]).getInt();
                origResultItems[3] = new FloatResult(avg_rating);
                origResultItems[5] = new FloatResult(avg_events);
            } else {
                origResultItems[3] = new FloatResult(0);
                origResultItems[5] = new FloatResult(0);
            }
        }
        report.setResult(result);
    }


    private ReportNode getReportList() throws Exception {
        log.debug("getReportList called...");
        ReportNode result = null;
        Report report = null;
        try {

            result = new ReportNode();

            Query memberStatsByCountryQuery = new Query(MEMBER_STATS_BY_COUNTRY, MEMBER_STATS_BY_COUNTRY_TYPES);
            Query memberStatsByStateQuery = new Query(MEMBER_STATS_BY_STATE, MEMBER_STATS_BY_STATE_TYPES);
            Query memberStatsByRegionQuery = new Query(MEMBER_STATS_BY_REGION, MEMBER_STATS_BY_REGION_TYPES);
            Query collegeStatsBySchoolQuery = new Query(COLLEGE_STATS_BY_SCHOOL, COLLEGE_STATS_BY_SCHOOL_TYPES);
            Query collegeStatsBySchoolStateQuery = new Query(COLLEGE_STATS_BY_SCHOOL_STATE, COLLEGE_STATS_BY_SCHOOL_STATE_TYPES);
            Query collegeStatsBySchoolRegionQuery = new Query(COLLEGE_STATS_BY_SCHOOL_REGION, COLLEGE_STATS_BY_SCHOOL_REGION_TYPES);
            Query collegeStatsByRegionQuery = new Query(COLLEGE_STATS_BY_REGION, COLLEGE_STATS_BY_REGION_TYPES);
            Query memberCountsQuery = new Query(MEMBER_COUNTS, MEMBER_COUNTS_TYPES, Query.WAREHOUSE);
            Query memberCountsDailyQuery = new Query(MEMBER_COUNTS_DAILY, MEMBER_COUNTS_DAILY_TYPES);
            Query memberCountsWeeklyQuery = new Query(MEMBER_COUNTS_WEEKLY, MEMBER_COUNTS_WEEKLY_TYPES, Query.WAREHOUSE);
            Query registrationBySchoolQuery = new Query(REGISTRATION_BY_SCHOOL, REGISTRATION_BY_SCHOOL_TYPES);
            Query matchSummaryQuery = new Query(MATCH_SUMMARY, MATCH_SUMMARY_TYPES);
            Query referralQuery = new Query(REFERRAL, REFERRAL_TYPES);
            Query otherReferralQuery = new Query(OTHER_REFERRAL, OTHER_REFERRAL_TYPES);
            Query connectionHistoryQuery = new Query(CONNECTION_HISTORY, CONNECTION_HISTORY_TYPES);
            Query memberRatingDistributionQuery = new Query(MEMBER_RATING_DISTRIBUTION, MEMBER_RATING_DISTRIBUTION_TYPES);
            Query linkHitCountQuery = new Query(LINK_HIT_COUNT, LINK_HIT_COUNT_TYPES);
            Query proRegInfoQuery = new Query(PRO_REG_INFO, PRO_REG_INFO_TYPES);
            Query studentRegInfoQuery = new Query(STUDENT_REG_INFO, STUDENT_REG_INFO_TYPES);
            Query invitationalInfoQuery = new Query(INVITATIONAL_INFO, INVITATIONAL_INFO_TYPES);


            Parameter[] collegeStatsBySchoolStateParameters = new Parameter[]{new Parameter("state_code", "Enter State Code")};
            Parameter[] collegeStatsBySchoolRegionParameters = new Parameter[]{new Parameter("region_name", "Enter Region")};

            ReportNode collegeMemberStats = null;
            ReportNode memberStats = new ReportNode("Member Statistics");
            ReportNode registrationInfo = new ReportNode("Registration Info");
            ReportNode matchSummary = new ReportNode("Match Summary");
            ReportNode referral = new ReportNode("Referral Info");
            ReportNode connection = new ReportNode("Applet Usage");
            ReportNode link = new ReportNode("Web Usage");


            report = new Report();
            report.setId(MEMBER_RATING_DISTRIBUTION_ID);
            report.setTitle(MEMBER_RATING_DISTRIBUTION_TITLE);
            report.setColumnHeadings(MEMBER_RATING_DISTRIBUTION_HEADINGS);
            memberRatingDistributionQuery.setDB(Query.WAREHOUSE);
            report.setQuery(memberRatingDistributionQuery);
            memberStats.addChild(new ReportNode(report));


            report = new Report();
            report.setId(MEMBER_STATS_BY_COUNTRY_ID);
            report.setColumnHeadings(MEMBER_STATS_BY_COUNTRY_HEADINGS);
            report.setTitle(MEMBER_STATS_BY_COUNTRY_TITLE);
            report.setQuery(memberStatsByCountryQuery);
            memberStats.addChild(new ReportNode(report));

            report = new Report();
            report.setId(MEMBER_STATS_BY_STATE_ID);
            report.setColumnHeadings(MEMBER_STATS_BY_STATE_HEADINGS);
            report.setTitle(MEMBER_STATS_BY_STATE_TITLE);
            report.setQuery(memberStatsByStateQuery);
            memberStats.addChild(new ReportNode(report));

            report = new Report();
            report.setId(MEMBER_STATS_BY_REGION_ID);
            report.setColumnHeadings(MEMBER_STATS_BY_REGION_HEADINGS);
            report.setTitle(MEMBER_STATS_BY_REGION_TITLE);
            report.setQuery(memberStatsByRegionQuery);
            memberStats.addChild(new ReportNode(report));

            report = new Report();
            report.setId(COLLEGE_STATS_BY_SCHOOL_ID);
            report.setTitle(COLLEGE_STATS_BY_SCHOOL_TITLE);
            report.setColumnHeadings(COLLEGE_STATS_BY_SCHOOL_HEADINGS);
            report.setQuery(collegeStatsBySchoolQuery);
            collegeMemberStats = new ReportNode(report);
            memberStats.addChild(collegeMemberStats);


            report = new Report();
            report.setId(COLLEGE_STATS_BY_SCHOOL_STATE_ID);
            report.setTitle(COLLEGE_STATS_BY_SCHOOL_STATE_TITLE);
            report.setColumnHeadings(COLLEGE_STATS_BY_SCHOOL_STATE_HEADINGS);
            report.setQuery(collegeStatsBySchoolStateQuery);
            report.setParameters(collegeStatsBySchoolStateParameters);
            //     collegeMemberStats.addChild(new ReportNode(report));

            report = new Report();
            report.setId(COLLEGE_STATS_BY_SCHOOL_REGION_ID);
            report.setTitle(COLLEGE_STATS_BY_SCHOOL_REGION_TITLE);
            report.setColumnHeadings(COLLEGE_STATS_BY_SCHOOL_REGION_HEADINGS);
            report.setQuery(collegeStatsBySchoolRegionQuery);
            report.setParameters(collegeStatsBySchoolRegionParameters);
//      collegeMemberStats.addChild(new ReportNode(report));

            report = new Report();
            report.setId(COLLEGE_STATS_BY_REGION_ID);
            report.setTitle(COLLEGE_STATS_BY_REGION_TITLE);
            report.setColumnHeadings(COLLEGE_STATS_BY_REGION_HEADINGS);
            report.setQuery(collegeStatsByRegionQuery);
            memberStats.addChild(new ReportNode(report));


            report = new Report();
            report.setId(MEMBER_COUNTS_ID);
            report.setTitle(MEMBER_COUNTS_TITLE);
            report.setColumnHeadings(MEMBER_COUNTS_HEADINGS);
            report.setQuery(memberCountsQuery);
            registrationInfo.addChild(new ReportNode(report));

            report = new Report();
            report.setId(MEMBER_COUNTS_DAILY_ID);
            report.setTitle(MEMBER_COUNTS_DAILY_TITLE);
            report.setColumnHeadings(MEMBER_COUNTS_DAILY_HEADINGS);
            report.setQuery(memberCountsDailyQuery);
            registrationInfo.addChild(new ReportNode(report));

            report = new Report();
            report.setId(MEMBER_COUNTS_WEEKLY_ID);
            report.setTitle(MEMBER_COUNTS_WEEKLY_TITLE);
            report.setColumnHeadings(MEMBER_COUNTS_WEEKLY_HEADINGS);
            report.setQuery(memberCountsWeeklyQuery);
            registrationInfo.addChild(new ReportNode(report));

            report = new Report();
            report.setId(REGISTRATION_BY_SCHOOL_ID);
            report.setTitle(REGISTRATION_BY_SCHOOL_TITLE);
            report.setColumnHeadings(REGISTRATION_BY_SCHOOL_HEADINGS);
            report.setQuery(registrationBySchoolQuery);
            registrationInfo.addChild(new ReportNode(report));

            report = new Report();
            report.setId(PRO_REG_INFO_ID);
            report.setTitle(PRO_REG_INFO_TITLE);
            report.setColumnHeadings(PRO_REG_INFO_HEADINGS);
            report.setQuery(proRegInfoQuery);
            registrationInfo.addChild(new ReportNode(report));

            report = new Report();
            report.setId(STUDENT_REG_INFO_ID);
            report.setTitle(STUDENT_REG_INFO_TITLE);
            report.setColumnHeadings(STUDENT_REG_INFO_HEADINGS);
            report.setQuery(studentRegInfoQuery);
            registrationInfo.addChild(new ReportNode(report));

            report = new Report();
            report.setId(INVITATIONAL_INFO_ID);
            report.setTitle(INVITATIONAL_INFO_TITLE);
            report.setColumnHeadings(INVITATIONAL_INFO_HEADINGS);
            report.setQuery(invitationalInfoQuery);
            registrationInfo.addChild(new ReportNode(report));


            report = new Report();
            report.setId(MATCH_SUMMARY_ID);
            report.setTitle(MATCH_SUMMARY_TITLE);
            report.setColumnHeadings(MATCH_SUMMARY_HEADINGS);
            report.setQuery(matchSummaryQuery);
            matchSummary.addChild(new ReportNode(report));

            report = new Report();
            report.setId(REFERRAL_ID);
            report.setTitle(REFERRAL_TITLE);
            report.setColumnHeadings(REFERRAL_HEADINGS);
            report.setQuery(referralQuery);
            referral.addChild(new ReportNode(report));

            report = new Report();
            report.setId(OTHER_REFERRAL_ID);
            report.setTitle(OTHER_REFERRAL_TITLE);
            report.setColumnHeadings(OTHER_REFERRAL_HEADINGS);
            report.setQuery(otherReferralQuery);
            referral.addChild(new ReportNode(report));

            report = new Report();
            report.setId(CONNECTION_HISTORY_ID);
            report.setTitle(CONNECTION_HISTORY_TITLE);
            report.setColumnHeadings(CONNECTION_HISTORY_HEADINGS);
            report.setQuery(connectionHistoryQuery);
            connection.addChild(new ReportNode(report));

            report = new Report();
            report.setId(LINK_HIT_COUNT_ID);
            report.setTitle(LINK_HIT_COUNT_TITLE);
            report.setColumnHeadings(LINK_HIT_COUNT_HEADINGS);
            report.setQuery(linkHitCountQuery);
            link.addChild(new ReportNode(report));

            result.addChild(memberStats);
            result.addChild(registrationInfo);
            result.addChild(matchSummary);
            result.addChild(referral);
            result.addChild(connection);
            result.addChild(link);

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return result;

    }


    private static final Integer MEMBER_STATS_BY_STATE_ID = new Integer(0);
    private static final String MEMBER_STATS_BY_STATE_TITLE = "Member Stats By State";
    private static final int[] MEMBER_STATS_BY_STATE_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] MEMBER_STATS_BY_STATE_HEADINGS = {"State", "Total Count", "Rated Count", "Avg Rating", "Max Rating", "Avg Number of Events"};
    private static final String MEMBER_STATS_BY_STATE =
            " SELECT state_name" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(case WHEN cr.rating > 0 THEN 1 ELSE 0 end) AS rated_count" +
            " ,SUM(case WHEN cr.rating > 0 THEN cr.rating ELSE 0 end) AS sum_rating" +
            " ,MAX(rating) AS max_rating" +
            " ,SUM(case WHEN num_ratings > 0 THEN num_ratings ELSE 0 end) AS num_events" +
            " FROM user u" +
            " ,coder c" +
            " ,rating cr" +
            " ,state s" +
            " ,region_state rs" +
            " ,region r" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND c.state_code = s.state_code" +
            " AND s.state_code = rs.state_code" +
            " AND rs.region_code = r.region_code" +
            " AND rs.user_type_id = 1" +
            " AND u.status = 'A'" +
            " AND email not like '%topcoder.com%'" +
            " AND user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY s.state_name" +
            " ORDER BY s.state_name";

    private static final Integer MEMBER_STATS_BY_REGION_ID = new Integer(1);
    private static final String MEMBER_STATS_BY_REGION_TITLE = "Member Stats By Region";
    private static final int[] MEMBER_STATS_BY_REGION_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] MEMBER_STATS_BY_REGION_HEADINGS = {"Region", "Total Count", "Rated Count", "Avg Rating", "Max Rating", "Avg Number of Events"};
    private static final String MEMBER_STATS_BY_REGION =
            " SELECT region_name" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(case WHEN cr.rating > 0 THEN 1 ELSE 0 end) AS rated_count" +
            " ,SUM(case WHEN cr.rating > 0 THEN cr.rating ELSE 0 end) AS sum_rating" +
            " ,MAX(rating) AS max_rating" +
            " ,SUM(case WHEN num_ratings > 0 THEN num_ratings ELSE 0 end) AS num_events" +
            " FROM user u" +
            " ,coder c" +
            " ,rating cr" +
            " ,state s" +
            " ,region_state rs" +
            " ,region r" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND c.state_code = s.state_code" +
            " AND s.state_code = rs.state_code" +
            " AND rs.region_code = r.region_code" +
            " AND rs.user_type_id = 1" +
            " AND u.status = 'A'" +
            " AND email not like '%topcoder.com%'" +
            " AND user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY region_name" +
            " ORDER BY region_name";


    private static final Integer COLLEGE_STATS_BY_SCHOOL_ID = new Integer(2);
    private static final String COLLEGE_STATS_BY_SCHOOL_TITLE = "College Stats By School";
    private static final int[] COLLEGE_STATS_BY_SCHOOL_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] COLLEGE_STATS_BY_SCHOOL_HEADINGS = {"School", "Total Count", "Rated Count", "Avg Rating", "Max Rating", "Avg Number of Events"};
    private static final String COLLEGE_STATS_BY_SCHOOL =
            " SELECT sc.name" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN 1 ELSE 0 END) AS rated_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN cr.rating ELSE 0 END) as sum_rating" +
            " ,MAX(rating) AS max_rating" +
            " ,SUM(CASE WHEN num_ratings > 0 THEN num_ratings ELSE 0 END) as num_events" +
            " FROM user u" +
            " ,coder c" +
            " ,current_school cs" +
            " ,rating cr" +
            " ,state s" +
            " ,school sc" +
            " ,region_state rs" +
            " ,region r" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND cs.coder_id = c.coder_id" +
            " AND cs.school_id = sc.school_id" +
            " AND sc.state_code = s.state_code" +
            " AND s.state_code = rs.state_code" +
            " AND rs.region_code = r.region_code" +
            " AND rs.user_type_id = 1" +
            " AND u.status = 'A'" +
            " AND email NOT LIKE '%topcoder.com%'" +
            " AND u.user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY sc.name" +
            " ORDER BY sc.name";

    private static final Integer COLLEGE_STATS_BY_SCHOOL_STATE_ID = new Integer(3);
    private static final String COLLEGE_STATS_BY_SCHOOL_STATE_TITLE = "College Stats by School, Choose State";
    private static final int[] COLLEGE_STATS_BY_SCHOOL_STATE_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] COLLEGE_STATS_BY_SCHOOL_STATE_HEADINGS = {"School", "Total Count", "Rated Count", "Avg Rating", "Max Rating", "Avg Number of Events"};
    private static final String COLLEGE_STATS_BY_SCHOOL_STATE =
            " SELECT sc.name" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN 1 ELSE 0 END) AS rated_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN cr.rating ELSE 0 END) as sum_rating" +
            " ,MAX(rating) AS max_rating" +
            " ,SUM(CASE WHEN num_ratings > 0 THEN num_ratings ELSE 0 END) as num_events" +
            " FROM user u" +
            " ,coder c" +
            " ,current_school cs" +
            " ,rating cr" +
            " ,state s" +
            " ,school sc" +
            " ,region_state rs" +
            " ,region r" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND cs.coder_id = c.coder_id" +
            " AND cs.school_id = sc.school_id" +
            " AND sc.state_code = s.state_code" +
            " AND s.state_code = rs.state_code" +
            " AND LOWER(s.state_code) = LOWER('?')" +
            " AND rs.region_code = r.region_code" +
            " AND rs.user_type_id = 1" +
            " AND u.status = 'A'  " +
            " AND email NOT LIKE '%topcoder.com%'" +
            " AND u.user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY sc.name" +
            " ORDER BY sc.name";


    private static final Integer COLLEGE_STATS_BY_SCHOOL_REGION_ID = new Integer(4);
    private static final String COLLEGE_STATS_BY_SCHOOL_REGION_TITLE = "College Stats by School, Choose Region";
    private static final int[] COLLEGE_STATS_BY_SCHOOL_REGION_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] COLLEGE_STATS_BY_SCHOOL_REGION_HEADINGS = {"School", "Total Count", "Rated Count", "Avg Rating", "Max Rating", "Avg Number of Events"};
    private static final String COLLEGE_STATS_BY_SCHOOL_REGION =
            " SELECT sc.name" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN 1 ELSE 0 END) AS rated_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN cr.rating ELSE 0 END) as sum_rating" +
            " ,MAX(rating) AS max_rating" +
            " ,SUM(CASE WHEN num_ratings > 0 THEN num_ratings ELSE 0 END) as num_events" +
            " FROM user u" +
            " ,coder c" +
            " ,current_school cs" +
            " ,rating cr" +
            " ,state s" +
            " ,school sc" +
            " ,region_state rs" +
            " ,region r" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND cs.coder_id = c.coder_id" +
            " AND cs.school_id = sc.school_id" +
            " AND sc.state_code = s.state_code" +
            " AND s.state_code = rs.state_code" +
            " AND LOWER(r.region_name) = LOWER('?')" +
            " AND rs.region_code = r.region_code" +
            " AND rs.user_type_id = 1" +
            " AND u.status = 'A'  " +
            " AND email NOT LIKE '%topcoder.com%'" +
            " AND u.user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY sc.name" +
            " ORDER BY sc.name";


    private static final Integer COLLEGE_STATS_BY_REGION_ID = new Integer(5);
    private static final String COLLEGE_STATS_BY_REGION_TITLE = "College Stats By Region";
    private static final int[] COLLEGE_STATS_BY_REGION_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] COLLEGE_STATS_BY_REGION_HEADINGS = {"Region", "Total Count", "Rated Count", "Avg Rating", "Max Rating", "Avg Number of Events"};
    private static final String COLLEGE_STATS_BY_REGION =
            " SELECT region_name" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN 1 ELSE 0 END) AS rated_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN cr.rating ELSE 0 END) as sum_rating" +
            " ,MAX(rating) AS max_rating" +
            " ,SUM(CASE WHEN num_ratings > 0 THEN num_ratings ELSE 0 END) as num_events" +
            " FROM user u" +
            " ,coder c" +
            " ,current_school cs" +
            " ,rating cr" +
            " ,state s" +
            " ,school sc" +
            " ,region_state rs" +
            " ,region r" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND cs.coder_id = c.coder_id" +
            " AND cs.school_id = sc.school_id" +
            " AND sc.state_code = s.state_code" +
            " AND s.state_code = rs.state_code" +
            " AND rs.region_code = r.region_code" +
            " AND rs.user_type_id = 1" +
            " AND u.status = 'A'  " +
            " AND email NOT LIKE '%topcoder.com%'" +
            " AND u.user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY region_name" +
            " ORDER BY region_name";

    private static final Integer MEMBER_COUNTS_ID = new Integer(6);
    private static final String MEMBER_COUNTS_TITLE = "Member Counts";
    private static final int[] MEMBER_COUNTS_TYPES = {ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] MEMBER_COUNTS_HEADINGS = {"Total Count", "Rated Count", "USA Count"};
    private static final String MEMBER_COUNTS =
            " SELECT COUNT(*) AS total_count" +
            " ,SUM(CASE WHEN cr.rating > 0 THEN 1 ELSE 0 END) AS rated_count" +
            " ,SUM(CASE WHEN c.country_code = 840 THEN 1 ELSE 0 END) AS usa_count" +
            " FROM coder c" +
            " ,rating cr" +
            " WHERE cr.coder_id = c.coder_id" +
            " AND c.status = 'A'";


    private static final Integer MEMBER_COUNTS_DAILY_ID = new Integer(7);
    private static final String MEMBER_COUNTS_DAILY_TITLE = "Member Counts By Day";
    private static final int[] MEMBER_COUNTS_DAILY_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] MEMBER_COUNTS_DAILY_HEADINGS = {"Date", "Day", "Studnt", "Pro", "Total", "Actv", "USA", "AUS", "CAN", "IND", "Ukraine", "Romania", "Poland", "CHINA"};
    private static final String MEMBER_COUNTS_DAILY =
            " SELECT TO_CHAR(member_since, '%iY-%m-%d') AS reg_date" +
            " ,MIN(TO_CHAR(member_since, '%a')) AS day_of_week" +
            " ,SUM(CASE WHEN c.coder_type_id = 1 THEN 1 ELSE 0 END) AS student_count" +
            " ,SUM(CASE WHEN c.coder_type_id = 2 THEN 1 ELSE 0 END) AS pro_count" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(CASE WHEN status='A' THEN 1 ELSE 0 END) AS active_count" +
            " ,SUM(CASE WHEN c.country_code = 840 AND status='A' THEN 1 ELSE 0 END) AS usa_count" +
            " ,SUM(CASE WHEN c.country_code = 036 AND status='A' THEN 1 ELSE 0 END) AS austrailia_count" +
            " ,SUM(CASE WHEN c.country_code = 124 AND status='A' THEN 1 ELSE 0 END) AS canada_count" +
            " ,SUM(CASE WHEN c.country_code = 356 AND status='A' THEN 1 ELSE 0 END) AS india_count" +
            " ,SUM(CASE WHEN c.country_code = 804 AND status='A' THEN 1 ELSE 0 END) AS ukraine_count" +
            " ,SUM(CASE WHEN c.country_code = 642 AND status='A' THEN 1 ELSE 0 END) AS romania_count" +
            " ,SUM(CASE WHEN c.country_code = 616 AND status='A' THEN 1 ELSE 0 END) AS poland_count" +
            " ,SUM(CASE WHEN c.country_code = 156 AND status='A' THEN 1 ELSE 0 END) AS china_count" +
            " FROM user u" +
            " ,coder c" +
            " ,rating cr" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND email NOT LIKE '%topcoder.com%'" +
            " AND member_since > CURRENT-INTERVAL (30) DAY (2) TO DAY" +
            " AND user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY 1" +
            " ORDER BY 1 DESC";

    private static final Integer MEMBER_COUNTS_WEEKLY_ID = new Integer(19);
    private static final String MEMBER_COUNTS_WEEKLY_TITLE = "Member Counts By Week";
    private static final int[] MEMBER_COUNTS_WEEKLY_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.STRING, ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] MEMBER_COUNTS_WEEKLY_HEADINGS = {"Year", "Week", "Start Date", "End Date", "Count", "Active", "International"};
    private static final String MEMBER_COUNTS_WEEKLY =
            " select" +
            "  cal.year," +
            "  cal.week_of_year week_number," +
            " min(cal.date) date_starting," +
            " max(cal.date) date_ending," +
            " count(*) total_reg," +
            " sum(case when c.status = 'A' then 1 else 0 end) active_count," +
            " sum(case when c.country_code in ('840','124') then 0 else 1 end) intl_count" +
            " from" +
            "   coder c," +
            "  calendar cal" +
            " where" +
            "  date(c.member_since) = cal.date and" +
            "  cal.date >= today - 730" +
            " group by 1,2" +
            " order by 1 desc, 2 desc";


    private static final Integer REGISTRATION_BY_SCHOOL_ID = new Integer(8);
    private static final String REGISTRATION_BY_SCHOOL_TITLE = "Registration by School";
    private static final int[] REGISTRATION_BY_SCHOOL_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.INT, ResultItem.INT};
    private static final String[] REGISTRATION_BY_SCHOOL_HEADINGS = {"Registration Date", "School", "Registration Count", "Active Count"};
    private static final String REGISTRATION_BY_SCHOOL =
            " SELECT TO_CHAR(member_since, '%iY-%m-%d') AS reg_date" +
            " ,school_name" +
            " ,COUNT(*) AS reg_count" +
            " ,SUM(case WHEN status = 'A' THEN 1 ELSE 0 END) AS active_count" +
            " FROM user u" +
            " ,coder c" +
            " ,current_school cs" +
            " WHERE u.user_id = c.coder_id" +
            " AND cs.coder_id = c.coder_id" +
            " AND member_since > CURRENT-INTERVAL(10) DAY (2) TO DAY" +
            " AND country_code IN (840,124)" +
            " GROUP BY 1,2 " +
            " ORDER BY 1,2";


    private static final Integer MATCH_SUMMARY_ID = new Integer(9);
    private static final String MATCH_SUMMARY_TITLE = "Single Round Match Summary";
    private static final int[] MATCH_SUMMARY_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.FLOAT};
    private static final String[] MATCH_SUMMARY_HEADINGS = {"Contest Name", "Date", "Start Time", "Students", "Pros", "Total Coders", "New Students", "New Pros", "New Total", "Money"};
    private static final String MATCH_SUMMARY =
            " SELECT MIN(c.name) AS contest_name" +
            " ,MIN(TO_CHAR(seg.start_time, '%iY-%m-%d')) AS contest_date" +
            " ,MIN(TO_CHAR(seg.start_time, '%I:%M PM')) AS start_time" +
            " ,SUM(case WHEN attended = 'Y' AND co.coder_type_id = 1 THEN 1 ELSE 0 END) AS student_coders" +
            " ,SUM(case WHEN attended = 'Y' AND co.coder_type_id = 2 THEN 1 ELSE 0 END) AS pro_coders" +
            " ,SUM(case WHEN attended = 'Y' THEN 1 ELSE 0 END) AS coders" +
            " ,SUM(case WHEN attended = 'Y' AND old_rating = 0 AND co.coder_type_id=1 THEN 1 ELSE 0 END) AS new_student_coders" +
            " ,SUM(case WHEN attended = 'Y' AND old_rating = 0 AND co.coder_type_id=2 THEN 1 ELSE 0 END) AS new_pro_coders" +
            " ,SUM(case WHEN attended = 'Y' AND old_rating = 0 THEN 1 ELSE 0 END) AS new_coders" +
            " ,SUM(rr.paid) AS prizes_paid" +
            " FROM contest c" +
            " JOIN round r ON r.contest_id = c.contest_id" +
            " AND c.name LIKE '%Single%'" +
            " JOIN room_result rr ON rr.round_id = r.round_id" +
            " JOIN round_segment seg ON seg.round_id = r.round_id" +
            " AND seg.segment_id = 1" +
            " JOIN coder co ON rr.coder_id = co.coder_id" +
            " GROUP BY r.round_id" +
            " ORDER BY 2";

    private static final Integer REFERRAL_ID = new Integer(10);
    private static final String REFERRAL_TITLE = "Referrals";
    private static final int[] REFERRAL_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.INT};
    private static final String[] REFERRAL_HEADINGS = {"Date", "Referral Type", "Count"};
    private static final String REFERRAL =
            " SELECT TO_CHAR(c.member_since, '%iY-%m-%d')" +
            " ,r.referral_desc" +
            " ,COUNT(*)" +
            " FROM coder c" +
            " ,referral r" +
            " ,coder_referral cr" +
            " ,user u" +
            " WHERE c.coder_id = cr.coder_id" +
            " AND r.referral_id = cr.referral_id" +
            " AND c.member_since > CURRENT-INTERVAL (30) DAY (2) TO DAY" +
            " and c.coder_Id = u.user_id" +
            " AND u.email NOT LIKE '%topcoder.com%' " +
            " GROUP BY 1, 2" +
            " ORDER BY 1 DESC, 2";

    private static final Integer OTHER_REFERRAL_ID = new Integer(11);
    private static final String OTHER_REFERRAL_TITLE = "Other Referrals";
    private static final int[] OTHER_REFERRAL_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.INT};
    private static final String[] OTHER_REFERRAL_HEADINGS = {"Date", "Referral Type", "More Info", "Count"};
    private static final String OTHER_REFERRAL =
            " SELECT TO_CHAR(c.member_since, '%iY-%m-%d')" +
            " ,r.referral_desc" +
            " ,LOWER(cr.other)" +
            " ,COUNT(*)" +
            " FROM coder c" +
            " ,referral r" +
            " ,coder_referral cr" +
            " WHERE c.coder_id = cr.coder_id" +
            " AND r.referral_id = cr.referral_id" +
            " AND r.referral_id IN (50, 10)" +
            " AND c.member_since > CURRENT-INTERVAL (30) DAY (2) TO DAY" +
            " GROUP BY 1, 2, 3" +
            " ORDER BY 1 DESC, 2";

    private static final Integer CONNECTION_HISTORY_ID = new Integer(12);
    private static final String CONNECTION_HISTORY_TITLE = "By Day";
    private static final int[] CONNECTION_HISTORY_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] CONNECTION_HISTORY_HEADINGS = {"Date", "Total Connections", "Guest Connections", "Unique Visitors", "Avg. Time (min)"};
    private static final String CONNECTION_HISTORY =
            " select " +
            " date_string," +
            " connections," +
            " guests," +
            " unique_coders," +
            " round(total_mins / unique_coders, 2)" +
            " from " +
            " table(multiset" +
            " (" +
            " select " +
            " to_char(start_time, '%iY-%m-%d %a') as date_string, " +
            " count(c.coder_id) as connections," +
            " sum(case when handle like 'guest%' then 1 else 0 end) as guests," +
            " count(distinct c.coder_id) as unique_coders, " +
            " sum(calc_seconds(start_time, end_time))/60 as total_mins" +
            " from " +
            " user u, " +
            " coder c, " +
            " rating cr, " +
            " connection_history ch " +
            " where  " +
            " u.user_id = c.coder_id and " +
            " cr.coder_id = c.coder_id and " +
            " ch.coder_id = c.coder_id and " +
            " email not like '%topcoder.com%' and " +
            " date(ch.start_time) > date(today-30) and  " +
            " date(ch.start_time) > mdy(1,24,2002) and " +
            " calc_seconds(start_time, end_time) between 60 and 22000 and" +
            " lower(handle) not in ('mike', 'chuck', 'grunt', 'td', 'dok', 'tlongo', 'jhughes', 'fenway', 'gt494') and" +
            " user_id not in  " +
            " ( " +
            " select user_id from group_user where group_id = 13 " +
            " ) " +
            " group by  " +
            " 1" +
            " )) x" +
            " order by 1 DESC";

    private static final Integer MEMBER_STATS_BY_COUNTRY_ID = new Integer(13);
    private static final String MEMBER_STATS_BY_COUNTRY_TITLE = "Member Stats By Country";
    private static final int[] MEMBER_STATS_BY_COUNTRY_TYPES = {ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String[] MEMBER_STATS_BY_COUNTRY_HEADINGS = {"Country", "Total Count", "Rated Count", "Avg Rating", "Max Rating", "Avg Number of Events"};
    private static final String MEMBER_STATS_BY_COUNTRY =
            " SELECT co.country_name" +
            " ,COUNT(*) AS total_count" +
            " ,SUM(case WHEN cr.rating > 0 THEN 1 ELSE 0 end) AS rated_count" +
            " ,SUM(case WHEN cr.rating > 0 THEN cr.rating ELSE 0 end) AS sum_rating" +
            " ,MAX(rating) AS max_rating" +
            " ,SUM(case WHEN num_ratings > 0 THEN num_ratings ELSE 0 end) AS num_events" +
            " FROM user u" +
            " ,coder c" +
            " ,rating cr" +
            " ,country co" +
            " WHERE u.user_id = c.coder_id" +
            " AND cr.coder_id = c.coder_id" +
            " AND c.country_code = co.country_code" +
            " AND u.status = 'A'" +
            " AND email not like '%topcoder.com%'" +
            " AND user_id NOT IN (SELECT user_id" +
            " FROM group_user" +
            " WHERE group_id = 13)" +
            " GROUP BY co.country_name" +
            " ORDER BY 2 DESC";


    private static final Integer MEMBER_RATING_DISTRIBUTION_ID = new Integer(14);
    private static final String MEMBER_RATING_DISTRIBUTION_TITLE = "Member Rating Distribution";
    private static final int[] MEMBER_RATING_DISTRIBUTION_TYPES = {ResultItem.INT, ResultItem.FLOAT, ResultItem.INT, ResultItem.FLOAT, ResultItem.INT, ResultItem.FLOAT, ResultItem.INT, ResultItem.FLOAT, ResultItem.INT, ResultItem.FLOAT};
    private static final String[] MEMBER_RATING_DISTRIBUTION_HEADINGS = {"Red #", "Red %", "Yellow #", "Yellow %", "Blue #", "Blue %", "Green #", "Green %", "Gray #", "Gray%"};
    private static final String MEMBER_RATING_DISTRIBUTION =
            " SELECT SUM(CASE WHEN r.rating > 2199 THEN 1 ELSE 0 END) as red_count" +
            " ,SUM(CASE WHEN r.rating > 2199 THEN 1 ELSE 0 END)/SUM(CASE WHEN r.rating > 0 THEN 1 ELSE 0 END)*100 as red_percent" +
            " ,SUM(CASE WHEN r.rating > 1499 AND r.rating < 2200 THEN 1 ELSE 0 END) as yellow_count" +
            " ,SUM(CASE WHEN r.rating > 1499 AND r.rating < 2200 THEN 1 ELSE 0 END)/SUM(CASE WHEN r.rating > 0 THEN 1 ELSE 0 END)*100 as yellow_percent" +
            " ,SUM(CASE WHEN r.rating > 1199 AND r.rating < 1500 THEN 1 ELSE 0 END) as blue_count" +
            " ,SUM(CASE WHEN r.rating > 1199 AND r.rating < 1500 THEN 1 ELSE 0 END)/SUM(CASE WHEN r.rating > 0 THEN 1 ELSE 0 END)*100 as blue_percent" +
            " ,SUM(CASE WHEN r.rating > 899 AND r.rating < 1200 THEN 1 ELSE 0 END) as green_count" +
            " ,SUM(CASE WHEN r.rating > 899 AND r.rating < 1200 THEN 1 ELSE 0 END)/SUM(CASE WHEN r.rating > 0 THEN 1 ELSE 0 END)*100 as green_percent" +
            " ,SUM(CASE WHEN r.rating > 0 AND r.rating < 900 THEN 1 ELSE 0 END) as gray_count" +
            " ,SUM(CASE WHEN r.rating > 0 AND r.rating < 900 THEN 1 ELSE 0 END)/SUM(CASE WHEN r.rating > 0 THEN 1 ELSE 0 END)*100 as gray_percent" +
            " FROM rating r" +
            " ,coder c" +
            " WHERE r.coder_id = c.coder_id" +
            " AND c.status = 'A'";

    private static final Integer LINK_HIT_COUNT_ID = new Integer(15);
    private static final String LINK_HIT_COUNT_TITLE = "Link Hit Count";
    private static final int[] LINK_HIT_COUNT_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.INT};
    private static final String[] LINK_HIT_COUNT_HEADINGS = {"Date", "Link", "Refering Page", "Hit Count"};
    private static final String LINK_HIT_COUNT =
            " SELECT TO_CHAR(timestamp, '%iY-%m-%d')" +
            " ,link" +
            " ,refer" +
            " ,count(*)" +
            " FROM link_hit" +
            " GROUP BY 1, link, refer" +
            " ORDER BY 1 DESC, link ASC, refer ASC";


/*
    private static final int[] PROFILE_LIST_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING};
    private static final String PROFILE_LIST =
            " SELECT u.handle, c.first_name, c.last_name, u.email" +
            " FROM user u" +
            " ,coder c" +
            " WHERE LOWER(u.handle) like LOWER('?')" +
            " AND LOWER(c.first_name) like LOWER('?')" +
            " AND LOWER(c.last_name) like LOWER('?')" +
            " AND LOWER(u.email) like LOWER('?')" +
            " AND u.user_id = c.coder_id" +
            " ORDER BY u.handle ASC";

*/

    private static final Integer PRO_REG_INFO_ID = new Integer(16);
    private static final String PRO_REG_INFO_TITLE = "Professional Registration Information";
    private static final int[] PRO_REG_INFO_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING};
    private static final String[] PRO_REG_INFO_HEADINGS = {"Status", "Company", "Title", "First", "Last", "Email", "Handle", "City", "State", "Country", "Date Registered", "Referral Info"};
    private static final String PRO_REG_INFO =
            " SELECT status " +
            "  ,(SELECT dr.demographic_response " +
            " FROM demographic_response dr " +
            " WHERE dr.coder_id = u.user_id " +
            " AND dr.demographic_question_id = 15) as company " +
            " ,(SELECT dr.demographic_response " +
            " FROM demographic_response dr " +
            " WHERE dr.coder_id = u.user_id " +
            " AND dr.demographic_question_id = 8) as title " +
            " ,first_name " +
            " ,last_name " +
            " ,email " +
            " ,handle " +
            " ,city " +
            " ,state_code " +
            " ,country_name " +
            " ,DATE(member_since) as date_registered " +
            " , case when cr.referral_id = 10 or cr.referral_id = 50 then" +
            " cr.other" +
            " else" +
            " (SELECT r.referral_desc" +
            " FROM referral r" +
            " WHERE c.coder_id = cr.coder_id" +
            " AND r.referral_id = cr.referral_id)" +
            " end" +
            " FROM user u " +
            " ,coder c " +
            " ,country co " +
            " ,coder_referral cr" +
            " WHERE u.user_id = c.coder_id " +
            " and c.coder_id = cr.coder_id" +
            " AND c.coder_type_id = 2 " +
            " AND DATE(member_since) >= today-14 " +
            " AND handle NOT LIKE 'guest%' " +
            " AND co.country_code = c.country_code " +
            " AND LOWER(u.email) NOT LIKE '%topcoder.com' " +
            " AND u.user_id NOT IN (SELECT g.user_id " +
            " FROM group_user g " +
            " WHERE g.group_id = 13) " +
            " ORDER BY 11 DESC";


    private static final Integer STUDENT_REG_INFO_ID = new Integer(17);
    private static final String STUDENT_REG_INFO_TITLE = "Student Registration Information";
    private static final int[] STUDENT_REG_INFO_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING};
    private static final String[] STUDENT_REG_INFO_HEADINGS = {"Status", "Handle", "First", "Last", "Email", "Date Registered", "City", "State", "Country", "Referral Info"};
    private static final String STUDENT_REG_INFO =
            " SELECT status " +
            "     ,handle" +
            " ,first_name" +
            " ,last_name" +
            " ,email" +
            " ,date(member_since) as date_registered" +
            " ,city" +
            " ,state_code" +
            " ,country_name" +
            " , case when cr.referral_id = 10 or cr.referral_id = 50 then" +
            " cr.other" +
            " else" +
            " (SELECT r.referral_desc" +
            " FROM referral r" +
            " WHERE c.coder_id = cr.coder_id" +
            " AND r.referral_id = cr.referral_id)" +
            " end" +
            " FROM user u" +
            " ,coder c" +
            " ,country co" +
            " ,coder_referral cr" +
            " WHERE u.user_id = c.coder_id" +
            " and cr.coder_id = c.coder_id" +
            " AND c.coder_type_id = 1" +
            " AND date(member_since) >= today-14" +
            " AND handle not like 'guest%'" +
            " AND co.country_code = c.country_code" +
            " AND lower(u.email) not like '%topcoder.com'" +
            " AND u.user_id NOT IN (" +
            " SELECT g.user_id" +
            " FROM group_user g" +
            " WHERE g.group_id = 13)" +
            " ORDER BY 6 DESC";

    private static final Integer INVITATIONAL_INFO_ID = new Integer(18);
    private static final String INVITATIONAL_INFO_TITLE = "Invitational Registration Information";
    private static final int[] INVITATIONAL_INFO_TYPES = {ResultItem.INT, ResultItem.INT};
    private static final String[] INVITATIONAL_INFO_HEADINGS = {"total_registered", "top_1024_registered"};
    private static final String INVITATIONAL_INFO =
            " select" +
            " x.all" +
            " ,y.top_1024" +
            " from" +
            " table(multiset(" +
            " select" +
            "   count(*) as all" +
            " from " +
            "   user u," +
            "   rating r," +
            "   coder c," +
            "   invite_list l" +
            " where " +
            "   l.round_id = 4320 and" +
            "   l.coder_id = u.user_id and" +
            "   u.user_id = c.coder_id and" +
            "   r.coder_id = c.coder_id" +
            " )) x," +
            " table(multiset(" +
            " select" +
            "   count(*) as top_1024 " +
            " from " +
            "   user u," +
            "   rating r," +
            "   coder c," +
            "   invite_list l" +
            " where " +
            "   l.round_id = 4320 and" +
            "   l.coder_id = u.user_id and" +
            "   u.user_id = c.coder_id and" +
            "   r.coder_id = c.coder_id and" +
            "   r.rating >= 923 and" +
            "   u.status = 'A' and" +
            "   r.num_ratings > 2 and" +
            "   date(last_rated_event) >= mdy(4,1,2002) and" +
            "   lower(email) not like '%topcoder.com' and" +
            "   handle not like 'guest%' and" +
            "   country_code in ('036','124','372','356','826','840','156','554') and" +
            "   u.user_id not in (select user_id from group_user where group_id = 13)" +
            " )) y";


    private static final String STATE_QUERY =
            "SELECT state_code" +
            " FROM state";

    private static final String COUNTRY_QUERY =
            "SELECT country_code" +
            " ,country_name" +
            " FROM country";

    private static final String RELOCATE_QUERY =
            "SELECT demographic_answer_id as answer_id" +
            " ,demographic_answer_text as answer_text" +
            " FROM demographic_answer" +
            " WHERE demographic_question_id = 4";

}





