package com.topcoder.web.screening.request;

import java.util.Iterator;
import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public class CreateProfile extends BaseSessionProcessor {
    public void process() throws Exception {
        requireLogin();
        updateSessionInfo();

        ServletRequest request = getRequest();

        //need to start off with all languages set on profile page
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_LANGUAGE_QUERY_KEY);

        DataAccessInt dAccess = getDataAccess(true);

        Map map = dAccess.getData(dataRequest);
        if(map != null) {
            ProfileInfo info = new ProfileInfo();
            ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.PROFILE_LANGUAGE_QUERY_KEY);
            for(Iterator i = rsc.iterator(); i.hasNext();) {
                ResultSetContainer.ResultSetRow row = 
                    (ResultSetContainer.ResultSetRow)i.next();
                info.addLanguage(row.getItem("language_id").toString());
            }
            request.setAttribute(Constants.PROFILE_INFO, info);
        }

        setNextPage(Constants.CONTROLLER_URL + "?" +
                    Constants.REQUEST_PROCESSOR + "=" +
                    Constants.POPULATE_PROFILE_PROCESSOR);
        setNextPageInContext(true);
    }
}
