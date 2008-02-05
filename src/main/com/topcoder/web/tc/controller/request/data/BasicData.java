package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ResultSetContainerConverter;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.model.DataResource;

import javax.servlet.http.HttpUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 13, 2005
 */
public class BasicData extends Base {

    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));

        DataResource resource = new DataResource(r.getContentHandle());
        if (new TCSAuthorization(SecurityHelper.getUserSubject(getUser().getId())).hasPermission(resource)) {
            //for now we'll assume they're gettin data from the warehouse, perhaps that'll change later
            Map m = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r);
            ResultSetContainer rsc;
            String key;
            Iterator it = m.keySet().iterator();
            //we're just giving them one thing at a time so the command should only have
            //one query associated with it.

            boolean isJSON = String.valueOf(true).equalsIgnoreCase(getRequest().getParameter("json"));
            if (isJSON) {
                getResponse().setContentType("application/json");
            } else {
                getResponse().setContentType("text/xml");
            }

            if (it.hasNext()) {
                key = (String)it.next();
                rsc = (ResultSetContainer)m.get(key);
                if (key.equals("dd_round_results")) {
                    ResultSetContainerConverter.writeXMLhidingPayments(rsc, r.getContentHandle(), "paid", "coder_id", getHideUsersList() ,getResponse().getOutputStream());
                } else if (key.equals("dd_design_rating_history") ||
                        key.equals("dd_development_rating_history")) {
                    ResultSetContainerConverter.writeXMLhidingPayments(rsc, r.getContentHandle(), "payment", "coder_id", getHideUsersList() ,getResponse().getOutputStream());
                } else {
                    if (isJSON) {
                        ResultSetContainerConverter.writeJSON(rsc, r.getContentHandle(), getResponse().getOutputStream());
                    } else {
                        ResultSetContainerConverter.writeXML(rsc, r.getContentHandle(), getResponse().getOutputStream());
                    }
                }
            }

            getResponse().flushBuffer();
        } else {
            throw new PermissionException(getUser(), resource);
        }
    }

    private List<Long> getHideUsersList() {
        if (!DAOUtil.useQueryToolFactory) {
            HibernateUtils.getSession().beginTransaction();
        }
        List<UserPreference> upList = DAOUtil.getQueryToolFactory().getUserPreferenceDAO().find(Preference.SHOW_EARNINGS_PREFERENCE_ID);
        List<Long> hideList = new ArrayList<Long>();
        for (UserPreference up : upList) {
            if ("hide".equals(up.getValue())) {
                log.debug("adding: " + up.getId().getUser().getId());
                hideList.add(up.getId().getUser().getId());
            }
        }
        return hideList;
    }

}
