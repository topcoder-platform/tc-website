package com.topcoder.web.screening.request;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletRequest;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.screening.model.ProfileInfo;

public class PopulateProfileSetup extends BaseProfileProcessor {
    private ServletRequest request;
    private Request profileProblemSet;
    private Request profileTestSetA;
    private Request profileCompanyProblem;
    private Request profileLanguage;

    public PopulateProfileSetup() {
        profileProblemSet = new Request();
        profileProblemSet.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_PROBLEM_SET_QUERY_KEY);

        profileTestSetA = new Request();
        profileTestSetA.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_TEST_SET_A_QUERY_KEY);

        profileCompanyProblem = new Request();
        profileCompanyProblem.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_COMPANY_PROBLEM_QUERY_KEY);

        profileLanguage = new Request();
        profileLanguage.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_LANGUAGE_QUERY_KEY);
    }

    public void process() throws Exception {
        requireLogin();
        request = getRequest();
        
        //check to see if they are logged in
        User user = getAuthentication().getUser();

        DataAccessInt dAccess = getDataAccess();

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

        if(info.getTestSetA() == null) {
            ResultSetContainer rsc = info.getProblemSetList();
            if(rsc != null && rsc.size() > 0) {
                ResultSetContainer.ResultSetRow row = 
                 (ResultSetContainer.ResultSetRow)rsc.get(0);
                info.setTestSetA(row.getItem("round_id").toString());
            }
        }
        profileTestSetA.setProperty("rid", info.getTestSetA().toString());
        profileTestSetA.setProperty("uid", String.valueOf(user.getId()));

        map = dAccess.getData(profileTestSetA);

        if(map != null) {
            ResultSetContainer rsc = (ResultSetContainer) 
                map.get(Constants.PROFILE_TEST_SET_A_QUERY_KEY);
            ArrayList list = new ArrayList();
            if(rsc.size() > 0) {
                for(Iterator i = rsc.iterator(); i.hasNext();) {
                    ResultSetContainer.ResultSetRow row = 
                        (ResultSetContainer.ResultSetRow)i.next();
                    long roundId = Long.parseLong(
                            row.getItem("round_id").toString());
                    long problemId = Long.parseLong(
                            row.getItem("problem_id").toString()); 
                    list.add(
                      ProblemInfo.createProblemInfo(user, roundId, problemId));
                }
            }
            info.setTestSetAList(list);
        }

        String[] testSetBArr = info.getTestSetB();
        ArrayList list = new ArrayList();
        for(int i = 0; i < testSetBArr.length; ++i){
            String problem = testSetBArr[i];
            int index = problem.indexOf(',');
            if(index == -1) {
                //bad data
                continue;
            }
            long roundId = Long.parseLong(problem.substring(0,index));
            long problemId = Long.parseLong(problem.substring(index+1));
            list.add(ProblemInfo.createProblemInfo(user, roundId, problemId));
        }
        info.setTestSetBList(list);

        profileCompanyProblem.setProperty("uid", 
                                            String.valueOf(user.getId()));
        map = getDataAccess(true).getData(profileCompanyProblem);
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
}
