/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ResultSetContainerConverter;
import com.topcoder.web.common.SecurityHelper;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.UserPreference;

import com.topcoder.web.common.security.RealtimeDataResource;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import java.util.*;

/**
 * <p>
 * Retrieves the rating distribution history for all tracks.
 * </p>
 * <p>
 * This is wrapper for BasicData that with non-cashed logic. It simply replicate all BasicData logic with replacing
 * call to CachedDataAccess with call to non-cached DataAccess.
 * </p>
 * @author sokol
 * @version 1.0
 */
public class RealtimeData extends Base {

    /**
     * Process retrieving the rating history for all tracks.
     * @since Member Profile Enhancement assembly
     */
    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setProperties(getRequest().getParameterMap());
        // Set datasource name to th default value
        int ds = Constants.DW_DATASOURCE_ID;
        // If the datasource name is provided in request,
        // The name is set to request parameter value.
        if (hasParameter(Constants.DATASOURCE_ID)) {
            ds = new Integer(getRequest().getParameter(Constants.DATASOURCE_ID));
        }
        // Use new data resource BUGR-5379
        RealtimeDataResource resource = new RealtimeDataResource(r.getContentHandle(), ds);
        if (new TCSAuthorization(SecurityHelper.getUserSubject(getUser().getId())).hasPermission(resource)) {
            // Use non-cached data access BUGR-5379
            Map<String, ResultSetContainer> m = new DataAccess(getDataSource(ds)).getData(r);
            ResultSetContainer rsc;
            String key;
            Iterator it = m.keySet().iterator();
            // we're just giving them one thing at a time so the command should only have
            // one query associated with it.
            String type = getRequest().getParameter(Constants.DATA_RETURN_TYPE);
            if (String.valueOf(true).equalsIgnoreCase(getRequest().getParameter("json"))) {
                // this is to provide some backward compatibility. we don't really want people to use it anymore
                type = "json";
            }
            if ("json".equalsIgnoreCase(type)) {
                getResponse().setContentType("application/json");
            } else {
                getResponse().setContentType("text/xml");
            }
            if (it.hasNext()) {
                key = (String) it.next();
                rsc = m.get(key);
                if (key.equals("dd_round_results")) {
                    if ("json".equalsIgnoreCase(type)) {
                        ResultSetContainerConverter.writeJSONhidingPayments(rsc, r.getContentHandle(), "paid",
                                "coder_id", getHideUsersList(rsc), getResponse().getOutputStream());
                    } else {
                        ResultSetContainerConverter.writeXMLhidingPayments(rsc, r.getContentHandle(), "paid",
                                "coder_id", getHideUsersList(rsc), getResponse().getOutputStream());
                    }
                } else if (key.equals("dd_design_rating_history") || key.equals("dd_development_rating_history")
                        || key.equals("dd_track_rating_history")) {
                    if ("json".equalsIgnoreCase(type)) {
                        ResultSetContainerConverter.writeJSONhidingPayments(rsc, r.getContentHandle(), "payment",
                                "coder_id", getHideUsersList(rsc), getResponse().getOutputStream());
                    } else {
                        ResultSetContainerConverter.writeXMLhidingPayments(rsc, r.getContentHandle(), "payment",
                                "coder_id", getHideUsersList(rsc), getResponse().getOutputStream());
                    }
                } else {
                    if ("json".equalsIgnoreCase(type)) {
                        ResultSetContainerConverter.writeJSON(rsc, r.getContentHandle(), getResponse()
                                .getOutputStream());
                    } else {
                        ResultSetContainerConverter.writeXML(rsc, r.getContentHandle(), getResponse()
                                .getOutputStream());
                    }
                }
            }
            getResponse().flushBuffer();
        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

    /**
     * Retrieves list of users whose payment should be hidden.
     * @param rsc the result set container
     * @return list of users whose payment should be hidden
     */
    private List<Long> getHideUsersList(ResultSetContainer rsc) {
        Set<Long> userIdSet = new HashSet<Long>();
        for (ResultSetContainer.ResultSetRow row : rsc) {
            userIdSet.add(row.getLongItem("coder_id"));
        }
        List<Long> userIdList = new ArrayList<Long>(userIdSet);
        if (!DAOUtil.useQueryToolFactory) {
            HibernateUtils.getSession().beginTransaction();
        }
        List<UserPreference> upList =
                DAOUtil.getQueryToolFactory().getUserPreferenceDAO()
                        .find(userIdList, Preference.SHOW_EARNINGS_PREFERENCE_ID);
        List<Long> hideList = new ArrayList<Long>();
        for (UserPreference up : upList) {
            if ("hide".equals(up.getValue())) {
                log.debug("adding: " + up.getId().getUser().getId());
                hideList.add(up.getId().getUser().getId());
            }
        }
        return hideList;
    }

    /**
     * Retrieves data source name for given id.
     * @param id the data source id
     * @return data source name for given id
     * @throws Exception if any error occurs while retrieving data source
     */
    public static String getDataSource(int id) throws Exception {
        Request r = new Request();
        r.setContentHandle("datasource_info");
        r.setProperty(Constants.DATASOURCE_ID, String.valueOf(id));
        ResultSetContainer rsc = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("datasource_info");
        if (rsc.isEmpty()) {
            throw new NavigationException("Invalid request, unknown datasource");
        } else {
            return rsc.get(0).getStringItem("datasource_name");
        }
    }
}
