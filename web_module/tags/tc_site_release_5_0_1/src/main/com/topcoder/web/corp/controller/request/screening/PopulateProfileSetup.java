package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.ProblemInfo;
import com.topcoder.web.corp.model.ProfileInfo;

import java.util.ArrayList;
import java.util.Map;

public class PopulateProfileSetup extends BaseProfileProcessor {
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

    protected void screeningProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }

        //check to see if they are logged in
        User user = getAuthentication().getUser();

        ProfileInfo info = (ProfileInfo) getRequest().getAttribute(Constants.PROFILE_INFO);
        if (info == null) {
            info = buildProfileInfo(getRequest());
            getRequest().setAttribute(Constants.PROFILE_INFO, info);
        }

        //get Problem Set
        profileProblemSet.setProperty("uid", String.valueOf(user.getId()));
        try {
            Map map = Util.getDataAccess(true).getData(profileProblemSet);
            if (map != null) {
                log.debug("the result map was not null");
                info.setProblemSetList((ResultSetContainer) map.get(Constants.PROFILE_PROBLEM_SET_QUERY_KEY));
            } else {
                log.debug("there are no problems associated with this user's(" + user.getId() + ") company");
            }

            if (info.getTestSetA() == null) {
                ResultSetContainer rsc = info.getProblemSetList();
                if (rsc != null && !rsc.isEmpty()) {
                    ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) rsc.get(0);
                    info.setTestSetA(row.getItem("round_id").toString());
                }
            }
            info.setHasTestSetA(!new Long(Constants.NO_TEST_SET_A).equals(info.getTestSetA()));

            info.setTestSetAList(getTestSetAList(info.getTestSetA().longValue(), user));

            String[] testSetBArr = info.getTestSetB();
            ArrayList list = new ArrayList();
            for (int i = 0; i < testSetBArr.length; ++i) {
                String problem = testSetBArr[i];
                int index = problem.indexOf(',');
                if (index == -1) {
                    //bad data
                    continue;
                }
                long roundId = Long.parseLong(problem.substring(0, index));
                long problemId = Long.parseLong(problem.substring(index + 1));
                list.add(ProblemInfo.createProblemInfo(user, roundId, problemId));
            }
            info.setTestSetBList(list);

            profileCompanyProblem.setProperty("uid", String.valueOf(user.getId()));
            map = Util.getDataAccess(true).getData(profileCompanyProblem);
            if (map != null) {
                info.setCompanyProblemList((ResultSetContainer)
                        map.get(Constants.PROFILE_COMPANY_PROBLEM_QUERY_KEY));
            }

            info.setLanguageList(getLanguageList());

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.PROFILE_SETUP_PAGE);
        setIsNextPageInContext(true);
    }
}
