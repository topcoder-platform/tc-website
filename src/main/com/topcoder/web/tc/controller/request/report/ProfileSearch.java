package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.controller.request.Base;

import javax.servlet.http.HttpUtils;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

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
        String skills = buildSkillsQuery(request);
        return skills;
    }
    private String buildSkillsQuery(TCRequest request){
        Enumeration e = request.getParameterNames();
        ArrayList skills = new ArrayList();
        while (e.hasMoreElements()) {
            String param = (String) e.nextElement();
            String[] values = request.getParameterValues(param);
            if (param.startsWith("skillset") && values != null && values.length > 0) {
                skills.addAll(values);
            }
        }
        Arrays.sort(skills,new Comparator(){
            public int compare(Object o1, Object o2){
                String s1 = (String)o1;
                String s2 = (String)o2;
                int skill1 = Integer.parseInt(s1.substring(s1.indexOf("_")+1));
                int skill2 = Integer.parseInt(s2.substring(s2.indexOf("_")+1));
                return skill1-skill2;
            });
        StringBuffer query = new StringBuffer(500);
        for(int i = 0; i<skills.size(); i++){
            String s = (String)skills.get(i);
            int idx=s.indexOf('_');
            int skillId = Integer.parseInt(s.substring(0,idx));
            int skillLevel = Integer.parseInt(s.substring(idx+1));
            query.append("SELECT coder_id FROM coder_skill WHERE skill_id = ");
            query.append(skillId);
            query.append(" AND ranking >= ");
            query.append(skillLevel);
            if(i+1!=skills.size()){
                query.append(" AND coder_id IN (");
            }
        }
        for(int i=0; i+1<skills.size(); i++){
            query.append(")");
        }
        return query.toString();
    }
}
