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
                String query = buildQuery(getRequest());
                log.debug(query.length()+" chars");
                log.debug(query);
                getRequest().setAttribute("QUERY",query);
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
    
    private String buildQuery(TCRequest request){
        List[] skills = buildSkillsQuery(request);
        boolean skill = skills[0].size() > 0;
        List[] demo = buildDemoQuery(request);
        List tables, constraints;
        (tables = skills[0]).addAll(demo[0]);
        (constraints = skills[1]).addAll(demo[1]);
        if(tables.size() == 0){
            return null;
        }
        StringBuffer query = new StringBuffer(5000);
        query.append("SELECT u.handle FROM coder c,\n");
        query.append("  c.first_name,\n");
        query.append("  c.last_name,\n");
        query.append("  c.city,\n");
        query.append("  st.state_name,\n");
        query.append("  cry.country_name,\n");
        query.append("  r.rating,\n");
        query.append("  ur1.rating,\n");
        query.append("  ur2.rating\n");
        query.append("  JOIN rating r ON r.coder_id = c.coder_id\n");
        query.append("  JOIN user u ON u.coder_id = c.coder_id\n");
        query.append("  JOIN country cry ON cry.country_code = c.country_code\n");
        query.append("  JOIN state st ON st.state_code = c.state_code\n");
        String comp = request.getParameter("company");
        if(comp != null && comp.length() > 0){
            query.append("  JOIN demographic_response drc ON src.coder_id = c.coder_id");
            query.append(" AND drc.demographic_question_id = 15 AND demographic_response");
            query.append(stringMatcher(comp));
            query.append('\n');
        }
        if(!request.getParameter("placement").equals("none") || skill){
            query.append("  JOIN user_preference up1 ON up1.user_id = c.coder_id\n");
        }
        if("on".equals(request.getParameter("travel"))){
            query.append("  JOIN user_preference up2 ON up2.user_id = c.coder_id\n");
        }
        if("on".equals(request.getParameter("auth"))){
            query.append("  JOIN user_preference up3 ON up3.user_id = c.coder_id\n");
        }
        if("on".equals(request.getParameter("resume"))){
            query.append("  JOIN resume res ON res.coder_id = c.coder_id\n");
        }
        for(int i = 0; i<tables.size(); i++){
            query.append("  JOIN ");
            query.append(tables.get(i));
            query.append(" ON ");
            query.append(tables.get(i));
            query.append(".coder_id = c.coder_id\n");
        }
        query.append("  LEFT JOIN tcs_catalog:user_rating ur1 ON ur1.user_id = c.coder_id AND ur1.phase_id = 112\n");
        query.append("  LEFT JOIN tcs_catalog:user_rating ur2 ON ur2.user_id = c.coder_id AND ur2.phase_id = 113\n");
        query.append("  WHERE ");
        query.append(constraints.get(0));
        query.append('\n');
        for(int i = 1; i<constraints.size(); i++){
            query.append("    AND ");
            query.append(constraints.get(i));
            query.append('\n');
        }
        query.append(buildCoderConstraints(request, skill));
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
    private List[] buildSkillsQuery(TCRequest request){
        Enumeration e = request.getParameterNames();
        ArrayList skills = new ArrayList();
        List tables = new ArrayList();
        List constraints = new ArrayList();
        while (e.hasMoreElements()) {
            String param = (String) e.nextElement();
            String[] values = request.getParameterValues(param);
            if (param.startsWith("skillset") && values != null && values.length > 0) {
                for(int i = 0; i<values.length; i++){
                    int idx = values[i].indexOf("_");
                    int skillId = Integer.parseInt(values[i].substring(0,idx));
                    int skillLevel = Integer.parseInt(values[i].substring(idx+1));
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
                }
            }
        }
        return new List[]{tables,constraints};
    }
    private String stringMatcher(String s){
        if(s.indexOf('%') != -1 || s.indexOf('_') != -1){
            return " LIKE lower('"+s+"')";
        } else {
            return " = lower('"+s+"')";
        }
    }
    String buildCoderConstraints(TCRequest request, boolean skill){
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
                    query.append(" 00:00:00.0'\'\n");
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
            query.append("    AND up1.preference_value_id IN (32, 34)\n");
        }else if(place.equals("contract")){
            query.append("    AND up1.preference_value_id = 32\n");
        }else if(place.equals("full")){
            query.append("    AND up1.preference_value_id = 34\n");
        }
        boolean travel = "on".equals(request.getParameter("travel"));
        if(travel){
            if(place.equals("full")){
                query.append("    AND up2.preference_value_id = 26\n");
            }else if(place.equals("contract")){
                query.append("    AND up2.preference_value_id = 17\n");
            }else{
                query.append("    AND up2.preference_value_id IN (17,26)\n");
            }
        }
        if("on".equals(request.getParameter("auth"))){
            query.append("    AND up3.preference_value_id = 28\n");
        }

        return query.toString();
    }
}
