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
        List[] demo = buildDemoQuery(request);
        List tables, constraints;
        (tables = skills[0]).addAll(demo[0]);
        (constraints = skills[1]).addAll(demo[1]);
        if(tables.size() == 0){
            return null;
        }
        StringBuffer query = new StringBuffer(5000);
        query.append("SELECT ");
        query.append(skills[0].get(0));
        query.append(".coder_id FROM ");
        query.append(tables.get(0));
        query.append('\n');
        for(int i = 1; i<tables.size(); i++){
            query.append("     , ");
            query.append(tables.get(i));
            query.append('\n');
        }
        query.append("  WHERE ");
        query.append(constraints.get(0));
        query.append('\n');
        for(int i = 1; i<constraints.size(); i++){
            query.append("    AND ");
            query.append(constraints.get(i));
            query.append('\n');
        }
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
                query.append(" AND demographic_answer_id ");
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
                    tables.add("coder_skill cs"+skillId);
                    constraints.add(query.toString());
                }
            }
        }
        return new List[]{tables,constraints};
    }
}
