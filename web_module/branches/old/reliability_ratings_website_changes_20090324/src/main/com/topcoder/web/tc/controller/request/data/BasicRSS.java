package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.CachedDataAccess;
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
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
public class BasicRSS extends Static {

    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setProperties(getRequest().getParameterMap());

        int ds = Constants.DW_DATASOURCE_ID;
        if (hasParameter(Constants.DATASOURCE_ID)) {
            ds = new Integer(getRequest().getParameter(Constants.DATASOURCE_ID));
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
            Map<String, ResultSetContainer> m = new CachedDataAccess(MaxAge.HOUR, BasicData.getDataSource(ds)).getData(r);
            getRequest().setAttribute("results", m);

            if (hasParameter(Constants.STATIC_PREFIX + 1)) {
                super.businessProcessing();
            } else {
                setNextPage("/rss/default.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new PermissionException(getUser(), resource);
        }
    }


}
