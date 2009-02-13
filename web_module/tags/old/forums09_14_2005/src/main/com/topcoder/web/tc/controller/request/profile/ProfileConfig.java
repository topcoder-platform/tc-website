/*
 * DOCConversion.java
 *
 * Created on December 6, 2004, 2:07 PM
 */

package com.topcoder.web.tc.controller.request.profile;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.PlacementConfigInfo;

import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.coderskill.CoderSkill;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;

import com.topcoder.web.tc.model.Skill;

import java.lang.StringBuffer;

import javax.servlet.http.Cookie;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.ArrayList;
import java.util.Map;

import com.topcoder.web.common.*;
import com.topcoder.shared.security.ClassResource;
/**
 *
 * @author rfairfax
 */
public class ProfileConfig extends BaseProcessor {

    protected void businessProcessing() throws TCWebException {
        if (!((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        try {
            //lookup user id
            int uid = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter("uid")));

            if(getRequest().getParameter("process") == null || !getRequest().getParameter("process").equals("true")) {
                PlacementConfigInfo info = new PlacementConfigInfo();

                info.setUserID(uid);

                InitialContext ctx = TCContext.getInitial();
                User userbean = (User)createEJB(ctx, User.class);
                Email emailbean = (Email)createEJB(ctx, Email.class);

                info.setHandle(userbean.getHandle(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));
                info.setName(userbean.getFirstName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME) + " " + userbean.getLastName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));

                info.setPresentedBy(userbean.getFirstName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME) + " " + userbean.getLastName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME));
                info.setPresentedByEmail(emailbean.getAddress(emailbean.getPrimaryEmailId(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME), DBMS.COMMON_OLTP_DATASOURCE_NAME));

                setDefault("presentedBy", info.getPresentedBy());
                setDefault("presentedByEmail", info.getPresentedByEmail());

                //set images list - todo

                //load skills
                CoderSkill skillbean = (CoderSkill)createEJB(ctx, CoderSkill.class);

                Request r = new Request();
                r.setContentHandle("skill_types");

                ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_types");
                for(int i = 0; i < rsc.size(); i++) {
                    ResultSetContainer rscSkills = skillbean.getSkillsByType(info.getUserID(), rsc.getIntItem(i, "skill_type_id"),DBMS.OLTP_DATASOURCE_NAME);
                    for(int j = 0; j < rscSkills.size(); j++) {
                        Skill s = new Skill();
                        s.setID(rscSkills.getIntItem(j, "skill_id"));
                        s.setText(rscSkills.getStringItem(j, "skill_desc"));

                        info.createSkill(rsc.getStringItem(i, "skill_type_desc"), s, rscSkills.getIntItem(j, "ranking"));
                    }
                }

                //load problems list for coder

                r = new Request();
                r.setContentHandle("successful_problems");
                r.setProperty("cr", String.valueOf(uid));

                rsc = (ResultSetContainer)getDWDataAccess().getData(r).get("successful_problems");
                info.setProblems(rsc);

                //get default selected problem
                r = new Request();
                r.setContentHandle("best_problem");
                r.setProperty("cr", String.valueOf(uid));

                rsc = (ResultSetContainer)getDWDataAccess().getData(r).get("best_problem");
                if(rsc.size() != 0) {
                    setDefault("component", rsc.getStringItem(0, "problem_id"));
                }

                getRequest().setAttribute("configInfo", info);
            } else {

            }


            //debugging / probably want to pass these cookies in for processing
/*
            Cookie[] cookies = getRequest().getCookies();
            for(int i = 0; i < cookies.length; i++) {
                System.out.println(cookies[i].getName() + ":" + cookies[i].getValue());
            }
*/

            //load any data

            setNextPage(Constants.PROFILE_CONFIG_PAGE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    protected static DataAccessInt getDWDataAccess() throws Exception {
       DataAccessInt dAccess = null;
       dAccess = new DataAccess(DBMS.DW_DATASOURCE_NAME);
       return dAccess;
    }

    protected static DataAccessInt getDataAccess() throws Exception {
       DataAccessInt dAccess = null;
       dAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
       return dAccess;
    }
}
