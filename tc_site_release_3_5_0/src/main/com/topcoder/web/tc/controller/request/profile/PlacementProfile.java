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
import com.topcoder.web.tc.model.PlacementProfileSearchResult;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.DBMS;

import java.lang.StringBuffer;

import java.util.ArrayList;
import java.util.Map;

import com.topcoder.web.common.*;
import com.topcoder.shared.security.ClassResource;
/**
 *
 * @author rfairfax
 */
public class PlacementProfile extends BaseProcessor {


    protected void businessProcessing() throws TCWebException {
        if (!((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        try {
            //look for search values
            String handle = "";
            String firstname = "";
            String lastname = "";

            handle = StringUtils.checkNull(getRequest().getParameter("handle"));
            firstname = StringUtils.checkNull(getRequest().getParameter("firstname"));
            lastname = StringUtils.checkNull(getRequest().getParameter("lastname"));

            setDefault("handle", handle);
            setDefault("firstname", firstname);
            setDefault("lastname", lastname);

            if(!handle.equals("") || !firstname.equals("") || !lastname.equals("")) {
                //search
                StringBuffer sb = new StringBuffer();
                sb.append("SELECT u.user_id, u.handle, c.first_name, c.last_name ");
                sb.append("FROM user u, coder c, common_oltp:user_preference p ");
                sb.append("WHERE c.coder_id = u.user_id ");
                sb.append("and p.user_id = u.user_id ");
                sb.append("and p.preference_id in (2,7) ");
                if(!handle.equals("")) {
                    sb.append("and u.handle_lower like '" + handle.toLowerCase() + "' ");
                }
                if(!firstname.equals("")) {
                    sb.append("and lower(c.first_name) like '" + firstname.toLowerCase() + "' ");
                }
                if(!lastname.equals("")) {
                    sb.append("and lower(c.last_name) like '" + lastname.toLowerCase() + "' ");
                }
                sb.append("GROUP BY 1,2,3,4 ");

                QueryRequest r = new QueryRequest();
                r.addQuery("search", sb.toString());

                Map m = getDataAccess().getData(r);
                ResultSetContainer rsc = (ResultSetContainer)m.get("search");

                ArrayList results = new ArrayList();

                log.debug("SIZE: " + rsc.size());

                for(int i = 0; i < rsc.size(); i++) {
                    results.add(new PlacementProfileSearchResult(rsc.getIntItem(i, "user_id"), rsc.getStringItem(i, "handle"),
                                                rsc.getStringItem(i, "first_name"), rsc.getStringItem(i, "last_name")));
                }

                getRequest().setAttribute("results", results);

            }

            //TODO: load recent profiles list

            setNextPage(Constants.PROFILE_MAIN_PAGE);
            setIsNextPageInContext(true);
        } catch (TCWebException tce) {
            throw tce;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    protected static DataAccessInt getDataAccess() throws Exception {
       DataAccessInt dAccess = null;
       dAccess = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
       return dAccess;
    }
}
