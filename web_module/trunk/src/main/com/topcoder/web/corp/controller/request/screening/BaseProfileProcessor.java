package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.ProblemInfo;
import com.topcoder.web.corp.model.ProfileInfo;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblem;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblemHome;

import javax.rmi.PortableRemoteObject;
import javax.naming.InitialContext;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public abstract class BaseProfileProcessor extends BaseScreeningProcessor {
    private static final int TEST_SET_B_PROBLEM_TYPE = 4;

    protected ProfileInfo buildProfileInfo(TCRequest request) {
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

        String testSetA = StringUtils.checkNull(request.getParameter(Constants.TEST_SET_A));
        if (!testSetA.equals("")) {
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


        Map map = Util.getDataAccess().getData(profileTestSetA);

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
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            SessionProfileProblemHome sppHome = (SessionProfileProblemHome)
                    PortableRemoteObject.narrow(
                            ctx.lookup(SessionProfileProblemHome.class.getName()),
                            SessionProfileProblemHome.class);
            SessionProfileProblem problem = sppHome.create();

            ResultSetContainer rsc = problem.getProblems(profileId);
            Integer problemTypeB = new Integer(TEST_SET_B_PROBLEM_TYPE);
            for (Iterator i = rsc.iterator(); i.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) i.next();
                if (row.getItem("problem_type_id").getResultData().equals(problemTypeB)) {
                    long tempRoundId = Long.parseLong(row.getItem("session_round_id").toString());
                    long tempProblemId = Long.parseLong(row.getItem("problem_id").toString());
                    ret.add(ProblemInfo.createProblemInfo(user, tempRoundId, tempProblemId));
                }
            }
            return ret;
        } finally {
            TCContext.close(ctx);
        }
    }

    protected ResultSetContainer getLanguageList() throws Exception {
        Request profileLanguage = new Request();
        profileLanguage.setProperty(DataAccessConstants.COMMAND,
                Constants.PROFILE_LANGUAGE_QUERY_KEY);
        Map map = Util.getDataAccess(true).getData(profileLanguage);
        ResultSetContainer ret = null;
        if (map != null) {
            ret = (ResultSetContainer) map.get(Constants.PROFILE_LANGUAGE_QUERY_KEY);
        }
        return ret;
    }


    protected boolean validateProfileInfo() throws Exception {
        boolean success = true;
        ProfileInfo info = (ProfileInfo)
                getRequest().getAttribute(Constants.PROFILE_INFO);

        if (info != null) {
            if (info.getProfileName() == null ||
                    info.getProfileName().trim().equals("")) {
                success = false;
                log.debug("Profile Name must be set");
                addError(Constants.PROFILE_NAME,
                        "Profile Name must be set");
            }

            if (info.getLanguage().length == 0) {
                success = false;
                log.debug("At least one language must be selected");
                addError(Constants.LANGUAGE,
                        "At least one language must be selected");
            }

            if (!info.hasTestSetA()) {
                if (info.getTestSetB() == null || info.getTestSetB().length == 0) {
                    success = false;
                    log.debug("If you do not select a Test Set A, you must select at least one problem for Test Set B.");
                    addError(Constants.TEST_SET_B,
                            "If you do not select a Test Set A, you must select at least one problem for Test Set B.");
                }

            }
            if (success) {
                Request dRequest = new Request();
                dRequest.setProperty(DataAccessConstants.COMMAND,
                        Constants.PROFILE_CHECK_NAME_QUERY_KEY);
                dRequest.setProperty("tpname", info.getProfileName());
                dRequest.setProperty("uid",
                        String.valueOf(getAuthentication().getUser().getId()));
                DataAccessInt dataAccess = Util.getDataAccess();
                Map map = dataAccess.getData(dRequest);

                ResultSetContainer rsc = (ResultSetContainer)
                        map.get(Constants.PROFILE_CHECK_NAME_QUERY_KEY);
                if (rsc.size() > 0) {
                    success = false;
                    log.debug("This profile name is already in use for your company");
                    addError(Constants.PROFILE_NAME,
                            "This profile name is already in use for your company");
                }
            }

        }

        return success;
    }
}
