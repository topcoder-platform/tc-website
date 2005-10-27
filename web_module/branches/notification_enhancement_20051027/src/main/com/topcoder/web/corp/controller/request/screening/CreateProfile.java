package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.ProfileInfo;

import java.util.Iterator;
import java.util.Map;

public class CreateProfile extends BaseSessionProcessor {
    protected void screeningProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }
        updateSessionInfo();


        //need to start off with all languages set on profile page
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_LANGUAGE_QUERY_KEY);

        try {
            DataAccessInt dAccess = Util.getDataAccess(true);

            Map map = dAccess.getData(dataRequest);
            if (map != null) {
                ProfileInfo info = new ProfileInfo();
                ResultSetContainer rsc = (ResultSetContainer)
                        map.get(Constants.PROFILE_LANGUAGE_QUERY_KEY);
                for (Iterator i = rsc.iterator(); i.hasNext();) {
                    ResultSetContainer.ResultSetRow row =
                            (ResultSetContainer.ResultSetRow) i.next();
                    info.addLanguage(row.getItem("language_id").toString());
                }
                getRequest().setAttribute(Constants.PROFILE_INFO, info);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage("testing/" + "?" +
                Constants.MODULE_KEY + "=" +
                Constants.POPULATE_PROFILE_PROCESSOR);
        setIsNextPageInContext(true);
    }
}
