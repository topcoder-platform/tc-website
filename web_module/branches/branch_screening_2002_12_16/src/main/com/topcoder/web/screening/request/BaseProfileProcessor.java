package com.topcoder.web.screening.request;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public abstract class BaseProfileProcessor extends BaseProcessor {
    protected ProfileInfo buildProfileInfo(ServletRequest request) {
        ProfileInfo info = new ProfileInfo();

        String id = request.getParameter(Constants.PROFILE_ID);
        if(id != null) {
            info.setProfileId(new Long(id));
            info.setIsNew(false);
        }

        String name = request.getParameter(Constants.PROFILE_NAME);
        if(name != null) {
            info.setProfileName(name);
        }

        String testSetA = request.getParameter(Constants.TEST_SET_A);
        if(testSetA != null) {
            info.setTestSetA(testSetA);
        }

        //these methods should return if it is null
        info.addTestSetB(request.getParameterValues(Constants.TEST_SET_B));
        info.addLanguage(request.getParameterValues(Constants.LANGUAGE));

        return info;
    }

    protected boolean validateProfileInfo() throws Exception {
        boolean success = true;
        ServletRequest request = getRequest();
        ProfileInfo info = (ProfileInfo)
            request.getAttribute(Constants.PROFILE_INFO);
        HashMap errorMap = new HashMap(5);

        if(info != null) {
            if(info.getProfileName() == null || 
               info.getProfileName().trim().equals("")) {
                success = false;
                errorMap.put(Constants.PROFILE_NAME, 
                        "Profile Name must be set");
            }

            /*
            if(info.getTestSetB().length == 0) {
                success = false;
                errorMap.put(Constants.TEST_SET_B, 
                        "Test Set B must have at least one problem");
            }
            */

            if(info.getLanguage().length == 0) {
                success = false;
                errorMap.put(Constants.LANGUAGE, 
                        "At least one language must be selected");
            }

            if(success) {
                Request dRequest = new Request();
                dRequest.setProperty(DataAccessConstants.COMMAND, 
                        Constants.PROFILE_CHECK_NAME_QUERY_KEY);
                dRequest.setProperty("tpname", info.getProfileName());
                dRequest.setProperty("uid", 
                   String.valueOf(getAuthentication().getUser().getId()));
                DataAccess dataAccess = getDataAccess();
                Map map = dataAccess.getData(dRequest);

                ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.PROFILE_CHECK_NAME_QUERY_KEY);
                if(rsc.size() > 0) {
                    success = false;
                    errorMap.put(Constants.PROFILE_NAME, 
                        "This profile name is already in use for your company");
                }
            }

        }

        if(!success) {
            request.setAttribute(Constants.ERRORS, errorMap);
        }

        return success;
    }
}
