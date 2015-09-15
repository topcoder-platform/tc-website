/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;
import com.topcoder.web.tc.model.RealtimeRSSResource;

import java.util.Map;

/**
 * <p>
 * This is wrapper for BasicRSS that with non-cashed logic.
 * </p>
 * <p>
 * It simply replicate all BasicRSS logic with replacing call to CachedDataAccess with call to non-cached DataAccess.
 * Also it uses new resource RealtimeRSSResource for security purpose.
 * </p>
 * @author sokol
 * @version 1.0
 */
public class RealtimeRSS extends Static {

    /**
     * <p>
     * Processes request to RSS data feed without caching.
     * </p>
     * @throws Exception if any error occurs while processing request
     */
    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setProperties(getRequest().getParameterMap());
        int ds = Constants.DW_DATASOURCE_ID;
        if (hasParameter(Constants.DATASOURCE_ID)) {
            ds = new Integer(getRequest().getParameter(Constants.DATASOURCE_ID));
        }
        // Use new non-cached resource
        RealtimeRSSResource resource = new RealtimeRSSResource(r.getContentHandle(), ds);
        if (new TCSAuthorization(SecurityHelper.getUserSubject(getUser().getId())).hasPermission(resource)) {
            String title = r.getContentHandle().replace("_", " ");
            if (title.toLowerCase().startsWith("rss")) {
                title = title.substring("rss".length());
            }
            title = title.trim();
            getRequest().setAttribute("title", title);
            // Use non-cached data access
            Map<String, ResultSetContainer> m = new DataAccess(RealtimeData.getDataSource(ds)).getData(r);
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
