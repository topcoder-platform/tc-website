package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.http.HttpUtils;
import java.util.*;

/**
 * User: lars
 */
public class ProfileSearch extends Base {

    protected void businessProcessing() throws TCWebException {
        log.debug("process called....");
        try {
            if (((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
                String response_addr = Constants.REPORT_PROFILE_SEARCH_RESULTS_ADDR;
                ArrayList headers = new ArrayList();
                String query = buildQuery(getRequest(), headers);
                QueryDataAccess qda = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                QueryRequest qr = new QueryRequest();
                qr.addQuery("results",query);
                Map m = qda.getData(qr);

                getRequest().setAttribute("QUERY",query);
                getRequest().setAttribute("column_headers",headers);
                getRequest().setAttribute(Constants.REPORT_PROFILE_SEARCH_RESULTS_KEY,m);
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
    
    private String buildQuery(TCRequest request, List headers){
        headers.addAll(Arrays.asList(new String[]{"Handle", "First Name", "Last Name", "City", "State", "Country", "Algorithm Rating", "Design Rating", "Development Rating","More Info"}));
        List[] skills = buildSkillsQuery(request, headers);
        boolean skill = skills[0].size() > 0;
        List[] demo = buildDemoQuery(request);
        List tables, constraints;
        (tables = demo[0]).addAll(skills[0]);
        (constraints = demo[1]).addAll(skills[1]);
        
        StringBuffer query = new StringBuffer(5000);
        if("on".equals(request.getParameter("count"))){
            query.append("SELECT COUNT(*)\n");
        }else{
            query.append("SELECT u.handle as Handle\n");
            query.append("  , c.first_name as First_Name\n");
            query.append("  , c.last_name as Last_Name\n");
            query.append("  , c.city as City\n");
            query.append("  , st.state_name as State\n");
            query.append("  , cry.country_name as Country\n");
            query.append("  , r.rating as Algorithm_Rating\n");
            query.append("  , (select ur1.rating from tcs_catalog:user_rating ur1 where ur1.user_id = c.coder_id AND ur1.phase_id = 112) as Design_Rating\n");
            query.append("  , (select ur2.rating from tcs_catalog:user_rating ur2 where ur2.user_id = c.coder_id AND ur2.phase_id = 113) as Development_Rating\n");
            query.append("  , (select '<a href=\"\"/tc?module=DownloadResume&uid=' || res2.coder_id || '\"\">Resume</a><br/>' from resume res2 where res2.coder_id = c.coder_id)\n");
            query.append("  , (select unique '<a href=\"\"/tc?module=ViewNotes&uid=' || unx.user_id || '\"\">Notes</a><br/>' from user_note_xref unx where unx.user_id = c.coder_id)\n");
            query.append("  , (select unique '<a href=\"\"/tc?module=PlacementInfoDetail&uid=' || upi.user_id || '\"\">Placement Info</a><br/>' from user_preference upi where upi.user_id = c.coder_id AND upi.preference_id in (2,7))\n");
            query.append("  , '<a href=\"\"/tc?module=LegacyReport&t=profile&ha=' || u.handle || '\"\">General Info</a><br/>'\n");
            query.append("  , '<a href=\"\"/stat?c=member_profile&cr=' || c.coder_id || '\"\">Public Profile</a><br/>'\n");
            for(int i = 0; i<skills[2].size(); i++){
                query.append("  , ");
                query.append((String)skills[2].get(i));
                query.append('\n');
            }
        }
        query.append("  FROM coder c,\n");
        query.append("    rating r,\n");
        query.append("    user u,\n");

        String comp = request.getParameter("company");
        if(comp != null && comp.length() > 0){
            query.append("    demographic_response drc,\n");
        }

        if("on".equals(request.getParameter("resume"))){
            query.append("    resume res,\n");
        }

        for(int i = 0; i<tables.size(); i++){
            String tab = (String)tables.get(i);
            query.append("    ");
            query.append(tab);
            query.append(", \n");
        }
        query.append("    country cry,\n");
        query.append("    state st\n");
        query.append("  WHERE 1 = 1\n");
        query.append("    AND r.coder_id = c.coder_id\n");
        query.append("    AND u.user_id = c.coder_id\n");
        query.append("    AND cry.country_code = c.country_code\n");
        query.append("    AND st.state_code = c.state_code\n");
        if(comp != null && comp.length() > 0){
            query.append("    AND src.coder_id = c.coder_id\n");
            query.append("    AND drc.demographic_question_id = 15\n");
            query.append("    AND demographic_response");
            query.append(stringMatcher(comp));
            query.append('\n');
        }

        if("on".equals(request.getParameter("resume"))){
            query.append("    AND res.coder_id = c.coder_id\n");
        }

        for(int i = 0; i<constraints.size(); i++){
            query.append("    AND ");
            query.append(constraints.get(i));
            query.append('\n');
        }
        query.append(buildCoderConstraints(request, skill));
        int sc = Integer.parseInt(request.getParameter("order"));
        int so = Integer.parseInt(request.getParameter("sort"));
        query.append("  ORDER BY ");
        query.append(sc);
        if(so == 1 && sc < 7 || so == -1 && sc >= 7)query.append(" ASC\n");
        else query.append(" DESC\n");
        return query.toString();
    }
    private List[] buildDemoQuery(TCRequest request){
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
                if(values.length == 1){
                    query.append(" = ");
                }else{
                    query.append(" IN (");
                }
                query.append(ans);
                for(int i = 1; i<values.length; i++){
                    ans = Integer.parseInt(values[i]);
                    query.append(", ");
                    query.append(ans);
                }
                if(values.length > 1){
                    query.append(")");
                }
                query.append(" AND dr");
                query.append(demoId);
                query.append(".coder_id = c.coder_id");
                tables.add("demographic_response dr"+demoId);
                constraints.add(query.toString());
            }
        }
        return new List[]{tables,constraints};
    }
    private List[] buildSkillsQuery(TCRequest request, List headers){
        Enumeration e = request.getParameterNames();
        ArrayList skills = new ArrayList();
        List tables = new ArrayList();
        List constraints = new ArrayList();
        List selects = new ArrayList();
        Map names = new HashMap();

        String skillNames = request.getParameter("skill_names");
        StringTokenizer st = new StringTokenizer(skillNames,"\r\n");
        while(st.hasMoreTokens()){
            Integer id = new Integer(st.nextToken());
            names.put(id,st.nextToken());
        }

        while (e.hasMoreElements()) {
            String param = (String) e.nextElement();
            String[] values = request.getParameterValues(param);
            if (param.startsWith("skillset") && values != null && values.length > 0) {
                for(int i = 0; i<values.length; i++){
                    int idx = values[i].indexOf("_");
                    int skillId = Integer.parseInt(values[i].substring(0,idx));
                    int skillLevel = Integer.parseInt(values[i].substring(idx+1));
                    String name = (String)request.getParameter("skill_name_"+skillId);
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
                    tables.add("coder_skill cs"+skillId);
                    constraints.add(query.toString());
                    selects.add("cs"+skillId+".ranking as skill_name_"+skillId);
                    headers.add(names.get(new Integer(skillId)));
                }
            }
        }
        return new List[]{tables,constraints, selects};
    }
    private String stringMatcher(String s){
        if(s.indexOf('%') != -1 || s.indexOf('_') != -1){
            return " LIKE lower('"+s+"')";
        } else {
            return " = lower('"+s+"')";
        }
    }
    private String buildCoderConstraints(TCRequest request, boolean skill){
        String[] columns = {"c.zip","c.city","c.first_name","c.last_name","u.email","u.handle"};
        String[] fields = {"zipcode","city","firstname","lastname","email","handle"};
        StringBuffer query = new StringBuffer(200);
        for(int i = 0; i<fields.length; i++){
            String s = request.getParameter(fields[i]);
            if(s!=null && s.length() > 0){
                query.append("    AND ");
                query.append(columns[i]);
                query.append(stringMatcher(s));
                query.append('\n');
            }
        }
        columns = new String[]{"c.state_code","c.country_code","c.comp_country_code"};
        fields = new String[]{"states","country","countryoforigin"};
        for(int i = 0; i<columns.length; i++){
            String[] vals = request.getParameterValues(fields[i]);
            if(vals!=null && vals.length>0){
                query.append("    AND ");
                query.append(columns[i]);
                if(vals.length == 1){
                    query.append(" = ");
                }else{
                    query.append(" IN (");
                }
                query.append('\'');
                query.append(vals[0]);
                query.append('\'');
                for(int j = 1; j<vals.length; j++){
                    query.append(", \'");
                    query.append(vals[j]);
                    query.append('\'');
                }
                if(vals.length > 1){
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
            if(param.startsWith("lang_")){
                int id = Integer.parseInt(param.substring(5));
                String val = request.getParameter(param);
                if(val.equals("on")){
                    if(!first){
                        query.append(", ");
                    }else{
                        first = false;
                    }
                    query.append(id);
                }
            }
        }
        query.append(")\n");
        String[] bounds = {"maxdayssincerating","mindays","maxdays","minevents","minrating","maxrating"};
        String[] value = {"current-r.last_rated_event <= \'","current-c.member_since >= \'","current-c.member_since <= \'","r.num_ratings >= ","r.rating >= ","r.rating <= "};
        for(int i = 0; i<bounds.length; i++){
            String b = request.getParameter(bounds[i]);
            try{
                int x = Integer.parseInt(b);
                query.append("    AND ");
                query.append(value[i]);
                query.append(x);
                if(i < 4){
                    query.append(" 00:00:00.0'\n");
                }else{
                    query.append('\n');
                }
            }catch(Exception exp){
                //what to do here? For now just ignore this field.
            }
        }
        boolean pro = "on".equals(request.getParameter("pro"));
        boolean stud = "on".equals(request.getParameter("stud"));
        if(!pro||!stud){
            if(pro){
                query.append("    AND c.coder_type_id = 2\n");
            }else if(stud){
                query.append("    AND c.coder_type_id = 1\n");
            }//really should unclick both boxes, so ignore
        }
        String place = request.getParameter("placement");
        if(place.equals("either") || place.equals("none") && skill){
            query.append("    AND c.coder_id IN (select up1.user_id FROM user_preference up1 WHERE up1.preference_value_id IN (32, 34))\n");
        }else if(place.equals("contract")){
            query.append("    AND c.coder_id IN (select up1.user_id FROM user_preference up1 WHERE up1.preference_value_id = 32)\n");
        }else if(place.equals("full")){
            query.append("    AND c.coder_id IN (select up1.user_id FROM user_preference up1 WHERE up1.preference_value_id = 34)\n");
        }
        if("on".equals(request.getParameter("travel"))){
            if(place.equals("full")){
                query.append("    AND c.coder_id IN (select up2.user_id FROM user_preference up2 WHERE up2.preference_value_id = 26)\n");
            }else if(place.equals("contract")){
                query.append("    AND c.coder_id IN (select up2.user_id FROM user_preference up2 WHERE up2.preference_value_id = 17)\n");
            }else{
                query.append("    AND c.coder_id IN (select up2.user_id FROM user_preference up2 WHERE up2.preference_value_id IN (17,26))\n");
            }
        }
        if("on".equals(request.getParameter("auth"))){
            query.append("    AND c.coder_id IN (select up3.user_id FROM user_preference up3 WHERE up3.preference_value_id = 28)\n");
        }

        return query.toString();
    }
}
