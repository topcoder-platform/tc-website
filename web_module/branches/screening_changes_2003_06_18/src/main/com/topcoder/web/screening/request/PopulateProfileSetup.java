package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.screening.model.ProfileInfo;

import javax.servlet.ServletRequest;
import java.util.ArrayList;
import java.util.Map;

public class PopulateProfileSetup extends BaseProfileProcessor {
    private ServletRequest request;
    private Request profileProblemSet;
    private Request profileCompanyProblem;
    private static Logger log = Logger.getLogger(PopulateProfileSetup.class);

    public PopulateProfileSetup() {
        profileProblemSet = new Request();
        profileProblemSet.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_PROBLEM_SET_QUERY_KEY);

        profileCompanyProblem = new Request();
        profileCompanyProblem.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_COMPANY_PROBLEM_QUERY_KEY);
    }

    public void process() throws Exception {
        requireLogin();
        request = getRequest();
        
        //check to see if they are logged in
        User user = getAuthentication().getUser();

        ProfileInfo info = (ProfileInfo)request.getAttribute(Constants.PROFILE_INFO);
        if(info == null) {
            info = buildProfileInfo(request);
            request.setAttribute(Constants.PROFILE_INFO, info);
        }

        //get Problem Set
        profileProblemSet.setProperty("uid", String.valueOf(user.getId()));
        Map map = getDataAccess(true).getData(profileProblemSet);
        if(map != null) {
            log.debug("the result map was not null");
            info.setProblemSetList((ResultSetContainer) map.get(Constants.PROFILE_PROBLEM_SET_QUERY_KEY));
        } else {
            log.debug("there are no problems associated with this user's(" + user.getId() + ") company");
        }

        if(info.getTestSetA() == null) {
            ResultSetContainer rsc = info.getProblemSetList();
            if(rsc != null && !rsc.isEmpty()) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow)rsc.get(0);
                info.setTestSetA(row.getItem("round_id").toString());
            }
        }

        info.setTestSetAList(getTestSetAList(info.getTestSetA().longValue(), user));

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

        profileCompanyProblem.setProperty("uid", String.valueOf(user.getId()));
        map = getDataAccess(true).getData(profileCompanyProblem);
        if(map != null) {
            info.setCompanyProblemList((ResultSetContainer)
                map.get(Constants.PROFILE_COMPANY_PROBLEM_QUERY_KEY));
        }

        info.setLanguageList(getLanguageList());

        setNextPage(Constants.PROFILE_SETUP_PAGE);
        setNextPageInContext(true);
    }
}
