package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.TCESConstants;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2006
 */
public class SearchTask extends BaseTask {
    private static Logger log = Logger.getLogger(SearchTask.class);

    protected void businessProcessing() throws TCWebException {
        log.debug("process called....");
        try {
            long time = System.currentTimeMillis();
            String query = buildQuery(getRequest(), Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
            time = System.currentTimeMillis() - time;
            log.debug("query constructed in " + time);
            getRequest().setAttribute("QUERY", query);
            if (!"on".equals(getRequest().getParameter("queryOnly"))) {
                time = System.currentTimeMillis();
                QueryDataAccess qda = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                QueryRequest qr = new QueryRequest();
                qr.addQuery("results", query);
                Map m = qda.getData(qr);
                time = System.currentTimeMillis() - time;
                log.debug("data got in " + time);


                getRequest().setAttribute("resultMap", m);
            }
            setNextPage(TCESConstants.SEARCH_RESULTS_PAGE);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    private String buildQuery(TCRequest request, long campaignId) {
        boolean isCaseSensitive = "on".equals(request.getParameter("casesensitive"));
        ArrayList skillsHeaders = new ArrayList();
        List[] skills = buildSkillsQuery(request, skillsHeaders);
        boolean skill = skills[0].size() > 0;
        List[] demo = buildDemoQuery(request);
        List tables, constraints;
        (tables = demo[0]).addAll(skills[0]);
        (constraints = demo[1]).addAll(skills[1]);
        String sch = request.getParameter("school");
        boolean containsDevRating = !"".equals(StringUtils.checkNull(request.getParameter("mindevrating")))
                || !"".equals(StringUtils.checkNull(request.getParameter("maxdevrating")));
        boolean containsDesRating = !"".equals(StringUtils.checkNull(request.getParameter("mindesrating")))
                || !"".equals(StringUtils.checkNull(request.getParameter("maxdesrating")));

        //type, max hit date
        StringBuffer query = new StringBuffer(5000);
        if ("on".equals(request.getParameter("count"))) {
            if (sch != null && sch.length() > 0 && !sch.equals("%")) {
                query.append("SELECT {+ordered} COUNT(*)as total_count, \n");
            } else {
                query.append("SELECT COUNT(*)as total_count, \n");
            }
        } else {
            /*
            handle, rating, des rating, dev rating, state, country, type, school, recent hit date, resume
            */
            query.append("SELECT");
            if (!"".equals(StringUtils.checkNull(sch)) && !sch.equals("%")) {
                query.append(" {+ordered}");
            }
            query.append("   u.handle\n");
            query.append(" , r.rating as alg_rating\n");
            query.append(" , desr.rating as des_rating\n");
            query.append(" , devr as dev_rating\n");
            query.append(" , c.state_code\n");
            query.append(" , cry.country_name\n");
            query.append(" , ct.coder_type_desc\n");
            query.append(" , sch.name as school_name\n");
            query.append(" , u.user_id\n");
            query.append(" , (select max(timestamp) from job_hit jh, campaign_job_xref cjx where cjx.job_id = jh.job_id and jh.user_id = u.user_id and cjx.campaign_id = cam.campaign_id) as most_recent_hit\n");
            query.append(" , case when exists (select 1 from resume where coder_id = c.coder_id) then 'Yes' else 'No' end as has_resume\n");
        }
        query.append("  FROM");
        query.append("    outer(current_school cur_sch, school sch),\n");
        query.append("    coder c,\n");
        query.append("    user u,\n");
        query.append("    rating r,\n");
        query.append("    outer tcs_catalog:user_rating desr,\n");
        query.append("    outer tcs_catalog:user_rating devr,\n");
        query.append("    email e,\n");
        query.append("    coder_type ct\n");

        if ("on".equals(request.getParameter("resume"))) {
            query.append("    resume res,\n");
        }

        for (int i = 0; i < tables.size(); i++) {
            String tab = (String) tables.get(i);
            query.append("    ");
            query.append(tab);
            query.append(", \n");
        }
        query.append("    country cry,\n");
        query.append("  WHERE 1 = 1\n");
        if (containsDesRating) {
            query.append("    AND desr.user_id = c.coder_id\n");
            query.append("    AND desr.phase_id = 112\n");
        }
        if (containsDevRating) {
            query.append("    AND devr.user_id = c.coder_id\n");
            query.append("    AND devr.phase_id = 113\n");
        }
        query.append("    AND c.coder_type_id = ct.coder_type_id\n");
        query.append("    AND r.coder_id = c.coder_id\n");
        query.append("    AND u.user_id = c.coder_id\n");
        query.append("    AND u.status = 'A'\n");
        query.append("    AND cry.country_code = c.country_code\n");
        query.append("    AND e.user_id = u.user_id\n");
        query.append("    AND e.primary_ind = 1\n");
        query.append("    AND exists (select 1\n");
        query.append(                 " from job_hit jh\n");
        query.append(                    " , campaign_job_xref cjx\n");
        query.append(                " where jh.job_id = cjx.job_id\n");
        query.append(                  " and jh.user_id = u.user_id\n");
        query.append(                  " and cjx.campaign_id = ").append(campaignId).append(")\n");
        if (sch != null && sch.length() > 0) {
            query.append("    AND cur_sch.coder_id = c.coder_id\n");
            query.append("    AND cur_sch.school_id = sch.school_id\n");
            query.append(stringMatcher(sch, "sch.name", isCaseSensitive));
        }

        if ("on".equals(request.getParameter("resume"))) {
            query.append("    AND res.coder_id = c.coder_id\n");
        }

        for (int i = 0; i < constraints.size(); i++) {
            query.append("    AND ");
            query.append(constraints.get(i));
            query.append('\n');
        }
        query.append(buildCoderConstraints(request, skill));
        int sc = Integer.parseInt(request.getParameter("order"));
        int so = Integer.parseInt(request.getParameter("sort"));
        query.append("  ORDER BY ");
        query.append(sc);
        if (so == 1 && sc < 7 || so == -1 && sc >= 7) query.append(" ASC\n");
        else
            query.append(" DESC\n");
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
                query.append(".coder_id = c.coder_id");
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
        String[] columns = {"c.zip", "c.city", "c.first_name", "c.last_name", "u.email", "u.handle"};
        String[] fields = {"zipcode", "city", "firstname", "lastname", "email", "handle"};
        boolean cs = "on".equals(request.getParameter("casesensitive"));
        StringBuffer query = new StringBuffer(200);
        for (int i = 0; i < fields.length; i++) {
            String s = request.getParameter(fields[i]);
            if (s != null && s.length() > 0) {
                query.append(stringMatcher(s, columns[i], cs));
            }
        }
        columns = new String[]{"c.state_code", "c.country_code", "c.comp_country_code"};
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
        String[] value = {"current-r.last_rated_event <= \'", "current-c.member_since >= \'", "current-c.member_since <= \'", "r.num_ratings >= ", "r.rating >= ", "r.rating <= ", "desr.rating >= ", "desr.rating <= ", "devr.rating >= ", "devr.rating <= "};
        for (int i = 0; i < bounds.length; i++) {
            String b = request.getParameter(bounds[i]);
            if (b == null || b.length() == 0) continue;
            query.append("    AND ");
            query.append(value[i]);
            query.append(b);
            if (i < 3) {
                query.append(" 00:00:00.0'\n");
            } else {
                query.append('\n');
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

        return query.toString();
    }


}
