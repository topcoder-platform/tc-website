package com.topcoder.web.screening.request;

import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;

public class PopulateProfileSetup extends BaseProfileProcessor {
    private ServletRequest request;
    private Request profileProblemSet;
    private Request profileTestSetA;
    private Request profileTestSetB;
    private Request profileCompanyProblem;
    private Request profileLanguage;

    public PopulateProfileSetup() {
        profileProblemSet = new Request();
        profileProblemSet.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_PROBLEM_SET_QUERY_KEY);

        profileTestSetA = new Request();
        profileTestSetA.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_TEST_SET_A_QUERY_KEY);

        profileTestSetB = new Request();
        profileTestSetB.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_TEST_SET_B_QUERY_KEY);

        profileCompanyProblem = new Request();
        profileCompanyProblem.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_COMPANY_PROBLEM_QUERY_KEY);

        profileLanguage = new Request();
        profileLanguage.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_LANGUAGE_QUERY_KEY);
    }

    public void process() throws Exception {
        request = getRequest();
        
        //check to see if they are logged in
        User user = getAuthentication().getUser();

        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(Constants.DATA_SOURCE),
                                        DataSource.class);
        DataAccess dAccess = new DataAccess(ds);

        ProfileInfo info = 
            (ProfileInfo)request.getAttribute(Constants.PROFILE_INFO);
        if(info == null) {
            info = buildProfileInfo(request);
            request.setAttribute(Constants.PROFILE_INFO, info);
        }

        //get Problem Set
        profileProblemSet.setProperty("uid", String.valueOf(user.getId()));
        Map map = dAccess.getData(profileProblemSet);
        if(map != null) {
            info.setProblemSetList((ResultSetContainer)
                map.get(Constants.PROFILE_PROBLEM_SET_QUERY_KEY));
        }

        if(info.getTestSetA() != null) {
            profileTestSetA.setProperty("rid", 
                    info.getTestSetA().toString());
        }
        else {
            ResultSetContainer rsc = info.getProblemSetList();
            if(rsc != null && rsc.size() > 0) {
                ResultSetContainer.ResultSetRow row = 
                 (ResultSetContainer.ResultSetRow)rsc.get(0);
                profileTestSetA.setProperty("rid", 
                        row.getItem("round_id").toString());
            }
        }

        map = dAccess.getData(profileTestSetA);

        if(map != null) {
            info.setTestSetAList((ResultSetContainer)
                map.get(Constants.PROFILE_TEST_SET_A_QUERY_KEY));
        }

        Long [] testSetBArr = info.getTestSetB();
        if(testSetBArr.length > 0) {
            profileTestSetB.setProperty("uid", String.valueOf(user.getId()));
            profileTestSetB.setProperty("pidlist", 
                    buildProblemIdList(testSetBArr));
            map = dAccess.getData(profileTestSetB);
            if(map != null) {
                info.setTestSetBList((ResultSetContainer)
                    map.get(Constants.PROFILE_TEST_SET_B_QUERY_KEY));
            }
        }

        profileCompanyProblem.setProperty("uid", 
                                            String.valueOf(user.getId()));
        map = dAccess.getData(profileCompanyProblem);
        if(map != null) {
            info.setCompanyProblemList((ResultSetContainer)
                map.get(Constants.PROFILE_COMPANY_PROBLEM_QUERY_KEY));
        }

        map = dAccess.getData(profileLanguage);
        if(map != null) {
            info.setLanguageList((ResultSetContainer)
                map.get(Constants.PROFILE_LANGUAGE_QUERY_KEY));
        }

        setNextPage(Constants.PROFILE_SETUP_PAGE);
        setNextPageInContext(true);
    }

    public String buildProblemIdList(Long [] list) {
        StringBuffer buffer = new StringBuffer();
        for(int i = 0; i < list.length; ++i) {
            buffer.append(list[i]);
            
            //comma delimit it
            if(i < list.length - 1) {
                buffer.append(",");
            }
        }

        return buffer.toString();
    }
}
