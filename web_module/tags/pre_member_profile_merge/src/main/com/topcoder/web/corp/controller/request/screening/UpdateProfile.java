package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.Transaction;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.ProfileInfo;
import com.topcoder.web.corp.model.TestSessionInfo;
import com.topcoder.web.ejb.sessionprofile.*;

import javax.rmi.PortableRemoteObject;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import java.util.Map;

public class UpdateProfile extends BaseProfileProcessor {
    protected void screeningProcessing() throws TCWebException {
        synchronized (UpdateProfile.class) {
            if (getAuthentication().getUser().isAnonymous()) {
                throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
            }

            //validate the info
            ProfileInfo info = buildProfileInfo(getRequest());
            info.setHasTestSetA(!info.getTestSetA().equals(new Long(Constants.NO_TEST_SET_A)));
            try {
                getRequest().setAttribute(Constants.PROFILE_INFO, info);
                if (!validateProfileInfo()) {
                    setNextPage("testing/" + "?" +
                            Constants.MODULE_KEY + "=" +
                            Constants.POPULATE_PROFILE_PROCESSOR);
                    setIsNextPageInContext(true);
                    return;
                }

                SessionProfileHome spHome = (SessionProfileHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionProfileHome.class.getName()),
                                SessionProfileHome.class);
                SessionProfile profile = spHome.create();
                SessionProfileLanguageHome splHome = (SessionProfileLanguageHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionProfileLanguageHome.class.getName()),
                                SessionProfileLanguageHome.class);
                SessionProfileLanguage language = splHome.create();
                SessionProfileProblemHome sppHome = (SessionProfileProblemHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionProfileProblemHome.class.getName()),
                                SessionProfileProblemHome.class);
                SessionProfileProblem problem = sppHome.create();
                User user = getAuthentication().getUser();

                UserTransaction ut = Transaction.get(getInitialContext());
                ut.begin();

                try {
                    if (info.isNew()) {
                        DataAccessInt access = Util.getDataAccess();
                        Request dataRequest = new Request();
                        dataRequest.setProperty(DataAccessConstants.COMMAND,
                                Constants.CONTACT_INFO_QUERY_KEY);
                        dataRequest.setProperty("uid", String.valueOf(user.getId()));
                        Map map = access.getData(dataRequest);
                        ResultSetContainer rsc = (ResultSetContainer)
                                map.get(Constants.CONTACT_INFO_QUERY_KEY);
                        if (rsc.size() != 1) {
                            throw new ScreeningException(
                                    "Contact result set size wrong(" + rsc.size() + ")");
                        }
                        ResultSetContainer.ResultSetRow row =
                                (ResultSetContainer.ResultSetRow) rsc.get(0);
                        long companyId =
                                Long.parseLong(row.getItem("company_id").toString());
                        //            create a session somehow
                        long spid = profile.createSessionProfile(info.getProfileName(), companyId);
                        if (info.hasTestSetA()) {
                            profile.setSessionRoundId(spid, info.getTestSetA().longValue());
                        }
                        info.setProfileId(new Long(spid));

                    }
                    //everything should be new right now, if it is not, there is a bug
                    /*
                    else {
                        profile.setSessionRoundId(info.getProfileId().longValue(),
                                                  info.getTestSetA().longValue());
                        profile.setSessionProfileDesc(info.getProfileId().longValue(),
                                                      info.getProfileName());

                        //delete all old ones from problem and language
                    }
                    */

                    long sessionProfileId = info.getProfileId().longValue();
                    //now add in the example problem
                    int index = Constants.EXAMPLE_PROBLEM_ID.indexOf(",");
                    long roundId = Long.parseLong(
                            Constants.EXAMPLE_PROBLEM_ID.substring(0, index));
                    long problemId = Long.parseLong(
                            Constants.EXAMPLE_PROBLEM_ID.substring(index + 1));
                    int problemTypeId = Integer.parseInt(Constants.PROBLEM_TYPE_EXAMPLE_ID);
                    problem.createSessionProfileProblem(sessionProfileId,
                            problemId,
                            problemTypeId,
                            1,
                            roundId);
                    //now do the test set b problems
                    problemTypeId = Constants.PROBLEM_TYPE_TEST_SET_B_ID;
                    String[] testSetBArr = info.getTestSetB();
                    for (int i = 0; i < testSetBArr.length; ++i) {
                        index = testSetBArr[i].indexOf(",");
                        if (index == -1) {
                            continue;
                        }
                        roundId = Long.parseLong(testSetBArr[i].substring(0, index));
                        problemId = Long.parseLong(testSetBArr[i].substring(index + 1));
                        problem.createSessionProfileProblem(sessionProfileId,
                                problemId,
                                problemTypeId,
                                i + 1,
                                roundId);
                    }


                    Long[] languages = info.getLanguage();
                    for (int i = 0; i < languages.length; ++i) {
                        language.createProfileLanguage(sessionProfileId,
                                languages[i].intValue());
                    }

                    updateSessionProfile(sessionProfileId);
                } catch (Exception e) {
                    ut.rollback();
                    throw e;
                }
                ut.commit();
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw(new TCWebException(e));
            }

            setNextPage(((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getServletPath() + "?" +
                    Constants.MODULE_KEY + "=" +
                    Constants.POPULATE_SESSION_PROCESSOR);
            setIsNextPageInContext(false);
        }
    }

    /**
     * Updates the sessionInfo object if there is one with the newly created
     * profile id
     *
     * @param profileId  THe id of the created candidate
     */
    private void updateSessionProfile(long profileId) {
        HttpSession session = getRequest().getSession();
        TestSessionInfo info = (TestSessionInfo)
                session.getAttribute(Constants.SESSION_INFO);
        if (info != null) {
            info.setProfileId(String.valueOf(profileId));
        }

    }

}
