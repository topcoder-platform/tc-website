package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;
import com.topcoder.web.tc.model.RSSResource;

import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 21, 2008
 */
public class BasicRSS extends Static {

    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setProperties(getRequest().getParameterMap());

        String ds = String.valueOf(Constants.DW_DATASOURCE_ID);
        if (hasParameter(Constants.DATASOURCE_ID)) {
            ds = getRequest().getParameter(Constants.DATASOURCE_ID);
        }

        RSSResource resource = new RSSResource(r.getContentHandle(), ds);
        if (new TCSAuthorization(SecurityHelper.getUserSubject(getUser().getId())).hasPermission(resource)) {
            String title = r.getContentHandle().replace("_", " ");
            if (title.toLowerCase().startsWith("rss")) {
                title = title.substring("rss".length());
            }
            title = title.trim();
            getRequest().setAttribute("title", title);

            //for now we'll assume they're gettin data from the warehouse, perhaps that'll change later
            Map<String, ResultSetContainer> m = new CachedDataAccess(MaxAge.HOUR, getDataSource(ds)).getData(r);
            getRequest().setAttribute("results", m);

            if (hasParameter(Constants.STATIC_PREFIX +1)) {
                super.businessProcessing();
            } else {
                setNextPage("/rss/default.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new PermissionException(getUser(), resource);
        }
    }


    private String getDataSource(String id) throws Exception {
        Request r = new Request();
        r.setContentHandle("datasource_info");
        r.setProperty(Constants.DATASOURCE_ID, id);
        ResultSetContainer rsc = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r).get("datasource_info");
        if (rsc.isEmpty()) {
            throw new NavigationException("Invalid request, unknown datasource");
        } else {
            return rsc.get(0).getStringItem("datasource_name");
        }
    }


}
