package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

import javax.servlet.ServletRequest;
import java.util.Iterator;
import java.util.Map;

public class EditExistingProfile extends BaseProfileProcessor {
    private Request profileLookup;

    public EditExistingProfile() {
        profileLookup = new Request();
        profileLookup.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_LOOKUP_COMMAND);
    }

    public void process() throws Exception {
        requireLogin();
        ServletRequest request = getRequest();

        String profileId = request.getParameter(Constants.PROFILE_ID);
        //if not null we are grabbing an existing one
        if(profileId == null) {
            throw new Exception("Profile Id not set");
        }
        ProfileInfo info = new ProfileInfo();

        DataAccessInt dAccess = getDataAccess();;

        info.setIsNew(false);
        info.setProfileId(new Long(profileId));
        profileLookup.setProperty("spid", profileId);
        profileLookup.setProperty("uid", 
                String.valueOf(getAuthentication().getUser().getId()));
        Map map = dAccess.getData(profileLookup);
        if(map != null) {
            ResultSetContainer rsc = (ResultSetContainer)
                map.get(Constants.PROFILE_INFO_QUERY_KEY);
            if(rsc.size() != 1)
                throw new Exception("Profile Id: " + profileId + 
                        " returned " + rsc.size() + " rows!");
            ResultSetContainer.ResultSetRow row =
                (ResultSetContainer.ResultSetRow)rsc.get(0);
            info.setProfileName(row.getItem("profile_name").toString());
            info.setTestSetA(row.getItem("test_set_a").toString());

            rsc = (ResultSetContainer)
                map.get(Constants.PROFILE_PROBLEMS_QUERY_KEY);
            for(Iterator i = rsc.iterator(); i.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)i.next();
                info.addTestSetB(row.getItem("problem_id").toString());
            }

            rsc = (ResultSetContainer)
                map.get(Constants.PROFILE_LANGUAGES_QUERY_KEY);
            for(Iterator i = rsc.iterator(); i.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)i.next();
                info.addLanguage(row.getItem("language_id").toString());
            }
        }

        request.setAttribute(Constants.PROFILE_INFO, info);
        setNextPage(Constants.CONTROLLER_URL + "?" +
                    Constants.REQUEST_PROCESSOR + "=" +
                    Constants.POPULATE_PROFILE_PROCESSOR);
        setNextPageInContext(true);
    }
}
