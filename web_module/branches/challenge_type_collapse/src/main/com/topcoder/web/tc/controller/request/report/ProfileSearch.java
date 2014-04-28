package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.tc.controller.request.Base;

import java.util.*;

/**
 * User: lars
 */
public class ProfileSearch extends Base {

    protected void businessProcessing() throws TCWebException {
        if (log.isDebugEnabled()) {
            log.debug("process called....");
        }
        try {
            String task = getRequest().getParameter(Constants.TASK_NAME_KEY);
            if (((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
                String response_addr;
                if (task.equals(Constants.REPORT_PROFILE_SEARCH_KEY)) {
                    response_addr = Constants.REPORT_PROFILE_SEARCH_ADDR;
                    getProfileSearch(getRequest());
                } else {
                    response_addr = Constants.REPORT_PROFILE_SEARCH_RESULTS_ADDR;
                    ArrayList headers = new ArrayList();
                    long time = System.currentTimeMillis();
                    String countQuery = buildQuery(getRequest(), headers, true);
                    String fullQuery = null;
                    boolean countOnly = "on".equals(getRequest().getParameter("count"));
                    if (countOnly) {
                        getRequest().setAttribute("QUERY", countQuery);
                    } else {
                        headers.clear();
                        fullQuery = buildQuery(getRequest(), headers, countOnly);
                        getRequest().setAttribute("QUERY", fullQuery);
                    }
                    time = System.currentTimeMillis() - time;
                    if (log.isDebugEnabled()) {
                        log.debug("queries constructed in " + time);
                    }
                    if (!"on".equals(getRequest().getParameter("queryOnly"))) {
                        time = System.currentTimeMillis();
                        QueryDataAccess qda = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                        QueryRequest countRequest = new QueryRequest();
                        countRequest.addQuery("results", countQuery);
                        Map countResults = qda.getData(countRequest);
                        time = System.currentTimeMillis() - time;
                        if (log.isDebugEnabled()) {
                            log.debug("got count in " + time);
                        }
                        ResultSetContainer count = (ResultSetContainer) countResults.get("results");
                        if (countOnly) {
                            getRequest().setAttribute(Constants.REPORT_PROFILE_SEARCH_RESULTS_KEY, countResults);
                        } else {
/*
                            if (count.getIntItem(0, "total_count") > 1000) {
                                throw new NavigationException("Sorry, your query returns more than 1000 records.  Please include more search criteria.");
                            } else {*/
                                time = System.currentTimeMillis();
                                QueryRequest fullRequest = new QueryRequest();
                                fullRequest.addQuery("results", fullQuery);
                                Map fullResults = qda.getData(fullRequest);
                                time = System.currentTimeMillis() - time;
                                if (log.isDebugEnabled()) {
                                    log.debug("got full results in " + time);
                                }
                                getRequest().setAttribute(Constants.REPORT_PROFILE_SEARCH_RESULTS_KEY, fullResults);
//                            }
                        }
                        getRequest().setAttribute("column_headers", headers);
                    }
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

    private String buildQuery(TCRequest request, List headers, boolean countOnly) {
        boolean isCaseSensitive = "on".equals(request.getParameter("casesensitive"));
        ArrayList skillsHeaders = new ArrayList();
        List[] skills = buildSkillsQuery(request, skillsHeaders);
        boolean skill = skills[0].size() > 0;
        List[] demo = buildDemoQuery(request);
        List tables, constraints;
        (tables = demo[0]).addAll(skills[0]);
        (constraints = demo[1]).addAll(skills[1]);
        String comp = request.getParameter("company");
        String title = request.getParameter("title");
        String sch = request.getParameter("school");
        String daysVisit = request.getParameter("maxdayssincevisit");
        String phone = request.getParameter("phone");
        String maxDaysDes = request.getParameter("maxdayssincedes");
        String maxDaysDev = request.getParameter("maxdayssincedev");
        String maxDaysAlgo = request.getParameter("maxdayssincerating");

        boolean containsDevRating = !"".equals(StringUtils.checkNull(request.getParameter("mindevrating")))
                || !"".equals(StringUtils.checkNull(request.getParameter("maxdevrating")));
        boolean containsDesRating = !"".equals(StringUtils.checkNull(request.getParameter("mindesrating")))
                || !"".equals(StringUtils.checkNull(request.getParameter("maxdesrating")));

        StringBuffer query = new StringBuffer(5000);
        if (countOnly) {
            headers.add("Count");
            headers.add("Rated");
            headers.add("Pro");
            headers.add("North America");
            headers.add("Rated North America");
            headers.add("Pro North America");
            headers.add("Rated Pro North America");
            if (comp != null && comp.length() > 0 && !comp.equals("%") || sch != null && sch.length() > 0 && !sch.equals("%"))
            {
                //query.append("SELECT {+ordered} COUNT(*), 'false'\n");
                query.append("SELECT {+ordered} COUNT(*)as total_count, \n");
                query.append("sum(case when r.rating > 0 then 1 else 0 end) as rated_count, \n");
                query.append("sum(case when c.coder_type_id = 2 then 1 else 0 end) as pro_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') then 1 else 0 end) \n");
                query.append("as northamerica_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') and r.rating > 0 \n");
                query.append("then 1 else 0 end) as rated_northamerica_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') and c.coder_type_id \n");
                query.append("= 2 then 1 else 0 end) as pro_northamerica_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') and r.rating > 0 and \n");
                query.append("c.coder_type_id = 2 then 1 else 0 end) as rated_pro_northamerica_count, '' \n");
            } else {
                //query.append("SELECT COUNT(*), 'false'\n");
                query.append("SELECT COUNT(*)as total_count, \n");
                query.append("sum(case when r.rating > 0 then 1 else 0 end) as rated_count, \n");
                query.append("sum(case when c.coder_type_id = 2 then 1 else 0 end) as pro_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') then 1 else 0 end) \n");
                query.append("as northamerica_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') and r.rating > 0 \n");
                query.append("then 1 else 0 end) as rated_northamerica_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') and c.coder_type_id \n");
                query.append("= 2 then 1 else 0 end) as pro_northamerica_count, \n");
                query.append("sum(case when cry.country_code in ('840','124') and r.rating > 0 and \n");
                query.append("c.coder_type_id = 2 then 1 else 0 end) as rated_pro_northamerica_count, '' \n");
            }
        } else {
            query.append("SELECT");
            if (comp != null && comp.length() > 0 && !comp.equals("%") || sch != null && sch.length() > 0 && !sch.equals("%"))
            {
                query.append(" {+ordered}");
            }
            query.append(" u.handle as Handle\n");
            query.append("  , u.first_name as First_Name\n");
            query.append("  , u.last_name as Last_Name\n");
            query.append("  , a.city as City\n");
            query.append("  , st.state_name as State\n");
            query.append("  , cry.country_name as Country\n");
            headers.addAll(Arrays.asList(new String[]{"Handle", "First Name", "Last Name", "City", "State", "Country"}));
            if (comp != null && comp.length() > 0) {
                query.append("  , comp.company_name as Company\n");
                headers.add("Company");
            }
            if (title != null && title.length() > 0) {
                query.append("  , con.title as Title\n");
                headers.add("Title");
            }
            if (sch != null && sch.length() > 0) {
                query.append("  , sch.name as School\n");
                headers.add("School");
            }

            if (daysVisit != null && daysVisit.length() > 0) {
                query.append("  , date(current) - date(u.last_site_hit_date) as days_since_visit\n");
                headers.add("Days Since Visit");
            }

            query.append("  , r.rating as Algorithm_Rating\n");

            
            if (maxDaysDes != null && maxDaysDes.length() > 0) {
                query.append("  , ur_des.rating as Design_Rating\n");
            } else {
                query.append("  , (select ur1.rating from tcs_catalog:user_rating ur1 where ur1.user_id = c.coder_id AND ur1.phase_id = 112) as Design_Rating\n");
            }

            if (maxDaysDev != null && maxDaysDev.length() > 0) {
                query.append("  , ur_dev.rating as Development_Rating\n");
            } else {
                query.append("  , (select ur2.rating from tcs_catalog:user_rating ur2 where ur2.user_id = c.coder_id AND ur2.phase_id = 113) as Development_Rating\n");
            }
            
            query.append("  , (select '<a href=mailto:' || address  || ' >' || address || '</a>' from email where user_id = c.coder_id and primary_ind=1) as email\n");
            query.append("  , (select '<a href=/tc?module=DownloadResume&uid=' || res2.coder_id || '>Resume</a>' from resume res2 where res2.coder_id = c.coder_id)\n");
            query.append("  , (select max(n.modify_date) from user_note_xref unx, note n where n.note_type_id = 5 and unx.user_id = c.coder_id and unx.note_id = n.note_id)\n");
            query.append("  , (select unique '<a href=/tc?module=PlacementInfoDetail&uid=' || upi.user_id || '>Placement Info</a>' from user_preference upi where upi.user_id = c.coder_id AND upi.preference_id in (2,7))\n");
            query.append("  , '<a href=/tc?module=ViewNotes&uid=' || c.coder_id || '>Notes</a>'\n");
            query.append("  , '<a href=/tc?module=LegacyReport&t=profile&ha=' || u.handle || '>General Info</a>'\n");
            query.append("  , '<a href=/tc?module=MemberProfile&cr=' || c.coder_id || '>Public Profile</a>'\n");
            headers.addAll(Arrays.asList(new String[]{"Algorithm Rating", "Design Rating", "Development Rating", "Email", "", "Notes", "", "", "", ""}));
            for (int i = 0; i < skills[2].size(); i++) {
                query.append("  , ");
                query.append((String) skills[2].get(i));
                query.append('\n');
            }
            query.append("  , case when e.status_id = 3 then 'green' when YEAR(c.contact_date) = 2999 then 'green' when YEAR(c.contact_date) = 2500 then 'red' when c.contact_date > current then 'blue' end\n");
        }
        query.append("  FROM");
        if (comp != null && comp.length() > 0) {
            query.append("    company comp,\n");
        }
        if ((comp != null && comp.length() > 0) || (title != null && title.length() > 0)) {
            query.append("    contact con,\n");
        }
        if (sch != null && sch.length() > 0) {
            query.append("    school sch,\n");
            query.append("    current_school cur_sch,\n");
        }
        query.append("    coder c,\n");
        query.append("    user u,\n");
        query.append("    user_address_xref x,\n");
        query.append("    address a,\n");
        query.append("    rating r,\n");

        if (maxDaysAlgo != null && maxDaysAlgo.length() > 0) {
            query.append("    round_segment rs,\n");
        }

        if (containsDesRating) {
            query.append(" tcs_catalog:user_rating desr,\n");

        }
        if (containsDevRating) {
            query.append(" tcs_catalog:user_rating devr,\n");
        }
        query.append("    email e,\n");


        if ("on".equals(request.getParameter("resume"))) {
            query.append("    resume res,\n");
        }

        if (phone != null && phone.length() > 0) {
            query.append("    phone p,\n");
        }

        if (maxDaysDes != null && maxDaysDes.length() > 0) {
            query.append("  tcs_catalog:project_info pi_rd_des,");
            query.append("  tcs_catalog:user_rating ur_des, ");
            query.append("  tcs_catalog:project p_des, ");
        }

        if (maxDaysDev != null && maxDaysDev.length() > 0) {
            query.append("  tcs_catalog:project_info pi_rd_dev,");
            query.append("  tcs_catalog:user_rating ur_dev, ");
            query.append("  tcs_catalog:project p_dev, ");
        }


        for (int i = 0; i < tables.size(); i++) {
            String tab = (String) tables.get(i);
            query.append("    ");
            query.append(tab);
            query.append(", \n");
        }
        query.append("    country cry,\n");
        query.append("    outer state st\n");
        query.append("  WHERE 1 = 1\n");
        if (containsDesRating) {
            query.append("    AND desr.user_id = c.coder_id\n");
            query.append("    AND desr.phase_id = 112\n");
        }
        if (containsDevRating) {
            query.append("    AND devr.user_id = c.coder_id\n");
            query.append("    AND devr.phase_id = 113\n");
        }

        if (maxDaysAlgo != null && maxDaysAlgo.length() > 0) {
            query.append("    AND r.round_id = rs.round_id\n");
            query.append("    AND rs.segment_id = 2\n");
        }

        query.append("    AND r.coder_id = c.coder_id\n");
        query.append("    AND u.user_id = c.coder_id\n");
        query.append("    AND u.status = 'A'\n");
        query.append("    AND cry.country_code = a.country_code\n");
        query.append("    and x.user_id = u.user_id \n");
        query.append("    and x.address_id = a.address_id \n");
        query.append("    and a.address_type_id = 2 \n");
        query.append("    AND a.state_code = st.state_code\n");
        query.append("    AND e.user_id = u.user_id\n");
        query.append("    AND e.primary_ind = 1\n");
        if (comp != null && comp.length() > 0) {
            query.append("    AND c.coder_id = con.contact_id\n");
            query.append("    AND con.company_id = comp.company_id\n");
            query.append(stringMatcher(comp, "comp.company_name", isCaseSensitive));
        }
        if (title != null && title.length() > 0) {
            query.append("    AND c.coder_id = con.contact_id\n");
            query.append(stringMatcher(title, "con.title", isCaseSensitive));
        }
        if (sch != null && sch.length() > 0) {
            query.append("    AND cur_sch.coder_id = c.coder_id\n");
            query.append("    AND cur_sch.school_id = sch.school_id\n");
            query.append(stringMatcher(sch, "sch.name", isCaseSensitive));
        }

        if ("on".equals(request.getParameter("resume"))) {
            query.append("    AND res.coder_id = c.coder_id\n");
        }
        String[] notify = request.getParameterValues("notifications");
        if (notify != null && notify.length > 0) {
            query.append("    and exists (select 1 from user_notify_xref cn where cn.user_id = u.user_id \n");
            query.append("    AND cn.notify_id in (");
            query.append(notify[0]);
            for (int i = 1; i < notify.length; i++) {
                query.append(',');
                query.append(notify[i]);
            }
            query.append("))\n");
        }

        if (phone != null && phone.length() > 0) {
            query.append(" AND p.user_id = u.user_id");
            query.append(" AND p.primary_ind = 1");
            query.append(stringMatcher(phone, "p.phone_number", false));
        }
        if (daysVisit != null && daysVisit.length() > 0) {
            query.append(" AND u.last_site_hit_date > (current - " + daysVisit + " units day) ");
        }
        for (int i = 0; i < constraints.size(); i++) {
            query.append("    AND ");
            query.append(constraints.get(i));
            query.append('\n');
        }
        query.append(buildCoderConstraints(request, skill));
        
        if (!countOnly) {
	        int sc = Integer.parseInt(request.getParameter("order"));
	        int so = Integer.parseInt(request.getParameter("sort"));
	        query.append("  ORDER BY ");
	        query.append(sc);
	        if (so == 1 && sc < 7 || so == -1 && sc >= 7) query.append(" ASC\n");
	        else
	            query.append(" DESC\n");
        }
        headers.addAll(skillsHeaders);
        return query.toString();
    }

    private List[] buildDemoQuery(TCRequest request) {
        Enumeration e = request.getParameterNames();
        List tables = new ArrayList();
        List constraints = new ArrayList();
        while (e.hasMoreElements()) {
            String param = (String) e.nextElement();
            String[] values = request.getParameterValues(param);
            if (param.startsWith("demo_") && values != null && values.length > 0) {
                StringBuffer query = new StringBuffer(100);
                int demoId = Integer.parseInt(param.substring(5));
                query.append("dr");
                query.append(demoId);
                query.append(".demographic_question_id = ");
                query.append(demoId);
                query.append(" AND ");
                query.append("dr");
                query.append(demoId);
                query.append(".demographic_answer_id ");
                int ans = Integer.parseInt(values[0]);
                if (values.length == 1) {
                    query.append(" = ");
                } else {
                    query.append(" IN (");
                }
                query.append(ans);
                for (int i = 1; i < values.length; i++) {
                    ans = Integer.parseInt(values[i]);
                    query.append(", ");
                    query.append(ans);
                }
                if (values.length > 1) {
                    query.append(")");
                }
                query.append(" AND dr");
                query.append(demoId);
                query.append(".user_id = c.coder_id");
                tables.add("demographic_response dr" + demoId);
                constraints.add(query.toString());
            }
        }
        return new List[]{tables, constraints};
    }

    private List[] buildSkillsQuery(TCRequest request, List headers) {
        Enumeration e = request.getParameterNames();
        Set tables = new HashSet();
        List constraints = new ArrayList();
        List selects = new ArrayList();

        while (e.hasMoreElements()) {
            String param = (String) e.nextElement();
            String[] values = request.getParameterValues(param);
            if (param.startsWith("skillset") && values != null && values.length > 0) {
                for (int i = 0; i < values.length; i++) {
                    int idx = values[i].indexOf("_");
                    int idx2 = values[i].indexOf("_", idx + 1);
                    int skillId = Integer.parseInt(values[i].substring(0, idx));
                    int skillLevel = Integer.parseInt(values[i].substring(idx + 1, idx2));
                    String name = values[i].substring(idx2 + 1);
                    StringBuffer query = new StringBuffer(100);
                    query.append("cs");
                    query.append(skillId);
                    query.append(".skill_id = ");
                    query.append(skillId);
                    query.append(" AND ");
                    query.append("cs");
                    query.append(skillId);
                    query.append(".ranking >= ");
                    query.append(skillLevel);
                    query.append(" AND cs");
                    query.append(skillId);
                    query.append(".coder_id = c.coder_id");
                    tables.add("coder_skill cs" + skillId);
                    constraints.add(query.toString());
                    selects.add("cs" + skillId + ".ranking as skill_name_" + skillId);
                    headers.add(name);
                }
            }
        }
        return new List[]{new ArrayList(tables), constraints, selects};
    }

    private String stringMatcher(String val, String col, boolean isCaseSensitive) {
        String rc, rv;
        if (isCaseSensitive) {
            rc = col;
            rv = "'" + val + "'";
        } else if (col.equals("u.handle")) {
            rc = "u.handle_lower";
            rv = "lower('" + val + "')";
        } else {
            rc = "lower(" + col + ")";
            rv = "lower('" + val + "')";
        }
        if (val.equals("%")) {
            return "";
        }
        if (val.indexOf('%') != -1 || val.indexOf('_') != -1) {
            return "    AND " + rc + " LIKE " + rv + "\n";
        } else {
            return "    AND " + rc + " = " + rv + "\n";
        }
    }

    private String buildCoderConstraints(TCRequest request, boolean skill) {
        String[] columns = {"a.zip", "a.city", "u.first_name", "u.last_name", "e.address", "u.handle"};
        String[] fields = {"zipcode", "city", "firstname", "lastname", "email", "handle"};
        boolean cs = "on".equals(request.getParameter("casesensitive"));
        StringBuffer query = new StringBuffer(200);
        for (int i = 0; i < fields.length; i++) {
            String s = request.getParameter(fields[i]);
            if (s != null && s.length() > 0) {
                query.append(stringMatcher(s, columns[i], cs));
            }
        }
        columns = new String[]{"a.state_code", "a.country_code", "c.comp_country_code"};
        fields = new String[]{"states", "country", "countryoforigin"};
        boolean usa = false;
        for (int i = 0; i < columns.length; i++) {
            String[] vals = request.getParameterValues(fields[i]);
            if (i == 1 && usa) {
                vals = new String[]{"840"};
            }
            if (vals != null && vals.length > 0) {
                if (i == 0) {//states
                    usa = true;
                }
                query.append("    AND ");
                query.append(columns[i]);
                if (vals.length == 1) {
                    query.append(" = ");
                } else {
                    query.append(" IN (");
                }
                query.append('\'');
                query.append(vals[0]);
                query.append('\'');
                for (int j = 1; j < vals.length; j++) {
                    query.append(", \'");
                    query.append(vals[j]);
                    query.append('\'');
                }
                if (vals.length > 1) {
                    query.append(')');
                }
                query.append('\n');
            }
        }
        query.append("    AND c.language_id IN (");
        boolean first = true;
        Enumeration e = request.getParameterNames();
        while (e.hasMoreElements()) {
            String param = (String) e.nextElement();
            if (param.startsWith("lang_")) {
                int id = Integer.parseInt(param.substring(5));
                String val = request.getParameter(param);
                if (val.equals("on")) {
                    if (!first) {
                        query.append(", ");
                    }
                    first = false;
                    query.append(id);
                }
            }
        }
        query.append(")\n");
        if (first) {
            query.delete(query.length() - "    AND c.language_id IN ()\n".length(), query.length());
        }
        String[] bounds = {"maxdayssincerating", "mindays", "maxdays", "minevents", "minrating", "maxrating", "mindesrating", "maxdesrating", "mindevrating", "maxdevrating"};
        String[] value = {"rs.start_time >= ", "c.member_since <= ", "c.member_since >= ", "r.num_ratings >= ", "r.rating >= ", "r.rating <= ", "desr.rating >= ", "desr.rating <= ", "devr.rating >= ", "devr.rating <= "};
        for (int i = 0; i < bounds.length; i++) {
            String b = request.getParameter(bounds[i]);
            if (b == null || b.length() == 0) continue;
            query.append("    AND ");
            query.append(value[i]);
            if (i < 3) {
                query.append(" (current - " + b + " units day)\n");
            } else {
                query.append(b + '\n');
            }
        }
        boolean pro = "on".equals(request.getParameter("pro"));
        boolean stud = "on".equals(request.getParameter("stud"));
        if (!pro || !stud) {
            if (pro) {
                query.append("    AND c.coder_type_id = 2\n");
            } else if (stud) {
                query.append("    AND c.coder_type_id = 1\n");
            }//really should unclick both boxes, so ignore
        }
        String place = request.getParameter("placement");
        if (place.equals("either") || place.equals("none") && skill) {
            query.append("    AND c.coder_id IN (select up1.user_id FROM user_preference up1 WHERE up1.preference_value_id IN (32, 34))\n");
        } else if (place.equals("contract")) {
            query.append("    AND c.coder_id IN (select up1.user_id FROM user_preference up1 WHERE up1.preference_value_id = 32)\n");
        } else if (place.equals("full")) {
            query.append("    AND c.coder_id IN (select up1.user_id FROM user_preference up1 WHERE up1.preference_value_id = 34)\n");
        }
        if ("on".equals(request.getParameter("travel"))) {
            if (place.equals("full")) {
                query.append("    AND c.coder_id IN (select up2.user_id FROM user_preference up2 WHERE up2.preference_value_id = 26)\n");
            } else if (place.equals("contract")) {
                query.append("    AND c.coder_id IN (select up2.user_id FROM user_preference up2 WHERE up2.preference_value_id = 17)\n");
            } else {
                query.append("    AND c.coder_id IN (select up2.user_id FROM user_preference up2 WHERE up2.preference_value_id IN (17,26))\n");
            }
        }
        if ("on".equals(request.getParameter("auth"))) {
            query.append("    AND c.coder_id IN (select up3.user_id FROM user_preference up3 WHERE up3.preference_value_id = 28)\n");
        }


        String maxDaysDes = request.getParameter("maxdayssincedes");
        if (maxDaysDes != null && maxDaysDes.length() > 0) {
            query.append("  and ur_des.user_id = u.user_id\n");
            query.append("  and ur_des.last_rated_project_id = p_des.project_id\n");
            query.append("  and ur_des.phase_id = 112 \n");
            query.append("  and pi_rd_des.project_info_type_id= 22 \n");
            query.append("  and pi_rd_des.project_id = p_des.project_id \n");
            query.append(" AND to_date(pi_rd_des.value, \"%m/%d/%Y %H:%M\") > (current - " + maxDaysDes + " units day) \n");

        }

        String maxDaysDev = request.getParameter("maxdayssincedev");
        if (maxDaysDev != null && maxDaysDev.length() > 0) {
            query.append("  and ur_dev.user_id = u.user_id \n");
            query.append("  and ur_dev.last_rated_project_id = p_dev.project_id \n");
            query.append("  and ur_dev.phase_id = 113 \n");
            query.append("  and pi_rd_dev.project_info_type_id= 22 \n");
            query.append("  and pi_rd_dev.project_id = p_dev.project_id \n");
            query.append(" AND to_date(pi_rd_dev.value, \"%m/%d/%Y %H:%M\") > (current - " + maxDaysDev + " units day) \n");

        }

        return query.toString();
    }

    private String isOn(String s, boolean defaultValue) {
        return (defaultValue || "on".equals(s)) ? "true" : "false";
    }

    private void getProfileSearch(TCRequest request) throws Exception {
        Request r = new Request();
        r.setContentHandle("profile_search");
        DataAccessInt dataAccess = getDataAccess(true);
        Map m = dataAccess.getData(r);
        request.setAttribute(Constants.REPORT_PROFILE_SEARCH_KEY, m);
        ResultSetContainer languages = (ResultSetContainer) m.get("languages");
        ResultSetContainer demographic_questions = (ResultSetContainer) m.get("demographics_questions");
        ResultSetContainer demographic_answers = (ResultSetContainer) m.get("demographics_answers");
        ResultSetContainer skill_types = (ResultSetContainer) m.get("skill_types");
        ResultSetContainer skills = (ResultSetContainer) m.get("skills");
        Enumeration e = request.getParameterNames();
        Map sel = new HashMap();
        Map skillMap = new HashMap();
        Map skillSetMap = new HashMap();
        Map demo = new HashMap();
        String[] textFields = {"handle", "email", "firstname", "lastname", "maxdayssincevisit", "phone", "zipcode", "city",
                "company", "title", "school", "maxdayssincerating", "minevents", "mindays", "maxdays", "minrating", "maxrating",
                "maxdayssincedes", "mindesrating", "maxdesrating", "maxdayssincedev", "mindevrating", "maxdevrating"};
        String[] checkBoxes = {"count", "pro", "stud", "resume", "travel", "auth", "casesensitive"};
        boolean[] checkBoxDefaults = {false, true, true, false, false, false, false};
        boolean revise = "on".equals(request.getParameter("revise"));
        for (int i = 0; !revise && i < languages.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow lang = languages.getRow(i);
            setDefault("lang_" + lang.getIntItem("language_id"), String.valueOf(false));
        }
        for (int i = 0; i < textFields.length; i++) {
            setDefault(textFields[i], request.getParameter(textFields[i]));
        }
        for (int i = 0; i < checkBoxes.length; i++) {
            setDefault(checkBoxes[i], isOn(request.getParameter(checkBoxes[i]), !revise && checkBoxDefaults[i]));
        }
        while (e.hasMoreElements()) {
            String p = e.nextElement().toString();
            String[] v = request.getParameterValues(p);
            if (p.startsWith("skillset")) {//set all previously selected skills
                List l = new ArrayList();
                for (int i = 0; i < v.length; i++) {
                    int idx = v[i].indexOf("_");
                    int idx2 = v[i].indexOf("_", idx + 1);
                    int skillLevel = Integer.parseInt(v[i].substring(idx + 1, idx2));
                    String name = v[i].substring(idx2 + 1);
                    l.add(new ListSelectTag.Option(v[i], name + " >= " + skillLevel));
                }
                skillSetMap.put(p, l);
            } else
            if (p.equals("states") || p.equals("country") || p.equals("countryoforigin") || p.equals("notifications"))
            {//set a few more selections
                Set s = new HashSet();
                s.addAll(Arrays.asList(v));
                sel.put(p, s);
            } else if (p.startsWith("lang_")) {//language checkboxes
                setDefault(p, isOn(request.getParameter(p), !revise));
            }
        }
        //build all the demo tables
        ResultSetContainer.ResultSetRow answer = demographic_answers.getRow(0);
        for (int i = 0, j = 0; i < demographic_questions.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow question = demographic_questions.getRow(i);
            List l = new ArrayList();
            int questionId = question.getIntItem("demographic_question_id");
            if (log.isDebugEnabled()) {
                log.debug("question: " + questionId);
            }
            Set s = new HashSet();
            String[] v = request.getParameterValues("demo_" + questionId);
            if (v != null) {
                s.addAll(Arrays.asList(v));
            }
            while (answer.getIntItem("demographic_question_id") == questionId) {
                String text = answer.getStringItem("demographic_answer_text");
                String answerId = answer.getStringItem("demographic_answer_id");
                if (log.isDebugEnabled()) {
                    log.debug("answer: " + answerId);
                }
                l.add(new ListSelectTag.Option(answerId, text, s.contains(answerId)));
                if (++j == demographic_answers.getRowCount()) {
                    break;
                } else {
                    answer = demographic_answers.getRow(j);
                }
            }
            demo.put(new Integer(questionId), l);
        }

        //build all the skill tables
        ResultSetContainer.ResultSetRow skill = skills.getRow(0);
        for (int i = 0, j = 0; i < skill_types.getRowCount(); i++) {
            ResultSetContainer.ResultSetRow type = skill_types.getRow(i);
            List l = new ArrayList();
            int skillType = type.getIntItem("skill_type_id");
            while (skill.getIntItem("skill_type_id") == skillType) {
                String text = skill.getStringItem("skill_desc");
                l.add(new ListSelectTag.Option(skill.getStringItem("skill_id"), text));
                if (++j == skills.getRowCount()) {
                    break;
                } else {
                    skill = skills.getRow(j);
                }
            }
            skillMap.put(new Integer(type.getIntItem("skill_type_id")), l);
        }

        request.setAttribute("selected", sel);
        request.setAttribute("demoMap", demo);
        request.setAttribute("skillMap", skillMap);
        request.setAttribute("skillSetMap", skillSetMap);
    }

}