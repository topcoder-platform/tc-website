package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblemHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblem;

import javax.servlet.ServletRequest;
import javax.rmi.PortableRemoteObject;
import java.util.*;

public abstract class BaseProfileProcessor extends BaseProcessor {
    protected ProfileInfo buildProfileInfo(ServletRequest request) {
        ProfileInfo info = new ProfileInfo();

        String id = request.getParameter(Constants.PROFILE_ID);
        if (id != null) {
            info.setProfileId(new Long(id));
            info.setIsNew(false);
        }

        String name = request.getParameter(Constants.PROFILE_NAME);
        if (name != null) {
            info.setProfileName(name);
        }

        String testSetA = request.getParameter(Constants.TEST_SET_A);
        if (testSetA != null) {
            info.setTestSetA(testSetA);
        }

        //these methods should return if it is null
        info.addTestSetB(request.getParameterValues(Constants.TEST_SET_B));
        info.addLanguage(request.getParameterValues(Constants.LANGUAGE));

        return info;
    }

    protected List getTestSetAList(long roundId, User user) throws Exception {
        Request profileTestSetA = new Request();
        profileTestSetA.setProperty(DataAccessConstants.COMMAND, Constants.PROFILE_TEST_SET_A_QUERY_KEY);
        profileTestSetA.setProperty("rid", String.valueOf(roundId));
        profileTestSetA.setProperty("uid", String.valueOf(user.getId()));
        List ret = new ArrayList();


        Map map = getDataAccess().getData(profileTestSetA);

        if (map != null) {
            ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.PROFILE_TEST_SET_A_QUERY_KEY);
            if (rsc.size() > 0) {
                for (Iterator i = rsc.iterator(); i.hasNext();) {
                    ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) i.next();
                    long tempRoundId = Long.parseLong(row.getItem("round_id").toString());
                    long tempProblemId = Long.parseLong(row.getItem("problem_id").toString());
                    ret.add(ProblemInfo.createProblemInfo(user, tempRoundId, tempProblemId));
                }
            }
        }
        return ret;
    }

    protected List getTestSetBList(long profileId, User user) throws Exception {

        List ret = new ArrayList();

        SessionProfileProblemHome sppHome = (SessionProfileProblemHome)
                PortableRemoteObject.narrow(
                        TCContext.getInitial().lookup(SessionProfileProblemHome.class.getName()),
                        SessionProfileProblemHome.class);
        SessionProfileProblem problem = sppHome.create();

        ResultSetContainer rsc = problem.getProblems(profileId);
        for (Iterator i = rsc.iterator(); i.hasNext();) {
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) i.next();
            long tempRoundId = Long.parseLong(row.getItem("session_round_id").toString());
            long tempProblemId = Long.parseLong(row.getItem("problem_id").toString());
            ret.add(ProblemInfo.createProblemInfo(user, tempRoundId, tempProblemId));
        }
        return ret;
    }

    protected boolean validateProfileInfo() throws Exception {
        boolean success = true;
        ServletRequest request = getRequest();
        ProfileInfo info = (ProfileInfo)
                request.getAttribute(Constants.PROFILE_INFO);
        HashMap errorMap = new HashMap(5);

        if (info != null) {
            if (info.getProfileName() == null ||
                    info.getProfileName().trim().equals("")) {
                success = false;
                errorMap.put(Constants.PROFILE_NAME,
                        "Profile Name must be set");
            }

            if (info.getLanguage().length == 0) {
                success = false;
                errorMap.put(Constants.LANGUAGE,
                        "At least one language must be selected");
            }

            if (success) {
                Request dRequest = new Request();
                dRequest.setProperty(DataAccessConstants.COMMAND,
                        Constants.PROFILE_CHECK_NAME_QUERY_KEY);
                dRequest.setProperty("tpname", info.getProfileName());
                dRequest.setProperty("uid",
                        String.valueOf(getAuthentication().getUser().getId()));
                DataAccessInt dataAccess = getDataAccess();
                Map map = dataAccess.getData(dRequest);

                ResultSetContainer rsc = (ResultSetContainer)
                        map.get(Constants.PROFILE_CHECK_NAME_QUERY_KEY);
                if (rsc.size() > 0) {
                    success = false;
                    errorMap.put(Constants.PROFILE_NAME,
                            "This profile name is already in use for your company");
                }
            }

        }

        if (!success) {
            request.setAttribute(Constants.ERRORS, errorMap);
        }

        return success;
    }
}
