package com.topcoder.web.screening.request;

import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.Transaction;

import com.topcoder.web.ejb.sessionprofile.SessionProfile;
import com.topcoder.web.ejb.sessionprofile.SessionProfileHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguage;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguageHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblem;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblemHome;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;

import com.topcoder.web.screening.model.ProfileInfo;
import com.topcoder.web.screening.model.SessionInfo;

public class UpdateProfile extends BaseProfileProcessor {
    public void process() throws Exception {
        synchronized(UpdateProfile.class) {
        requireLogin();
        
        //validate the info
        if(!validateProfileInfo()) {
            setNextPage(Constants.PROFILE_SETUP_PAGE);
            setNextPageInContext(true);
            return;
        }

        ServletRequest request = getRequest();
        ProfileInfo info = buildProfileInfo(request);
        InitialContext context = new InitialContext();
        SessionProfileHome spHome = (SessionProfileHome)
            PortableRemoteObject.narrow(
                    context.lookup(SessionProfileHome.class.getName()), 
                                   SessionProfileHome.class);
        SessionProfile profile = spHome.create();
        SessionProfileLanguageHome splHome = (SessionProfileLanguageHome)
            PortableRemoteObject.narrow(
                    context.lookup(SessionProfileLanguageHome.class.getName()), 
                                   SessionProfileLanguageHome.class);
        SessionProfileLanguage language = splHome.create();
        SessionProfileProblemHome sppHome = (SessionProfileProblemHome)
            PortableRemoteObject.narrow(
                    context.lookup(SessionProfileProblemHome.class.getName()), 
                                   SessionProfileProblemHome.class);
        SessionProfileProblem problem = sppHome.create();
        User user = getAuthentication().getUser();

        UserTransaction ut = Transaction.get(context);
        ut.begin();

        try {
            if(info.isNew()) {
                DataAccess access = getDataAccess();
                Request dataRequest = new Request();
                dataRequest.setProperty(DataAccessConstants.COMMAND,
                                    Constants.CONTACT_INFO_QUERY_KEY);
                dataRequest.setProperty("uid", String.valueOf(user.getId()));
                Map map = access.getData(dataRequest);
                ResultSetContainer rsc = (ResultSetContainer)
                        map.get(Constants.CONTACT_INFO_QUERY_KEY);
                if(rsc.size() == 0 || rsc.size() > 1) {
                    throw new ScreeningException(
                            "Contact result set size wrong(" + rsc.size() + ")");
                }
                ResultSetContainer.ResultSetRow row = 
                    (ResultSetContainer.ResultSetRow)rsc.get(0);
                long companyId = 
                    Long.parseLong(row.getItem("company_id").toString());
    //            create a session somehow
                long spid = profile.createSessionProfile(info.getProfileName(),
                                                         info.getTestSetA().longValue(),
                                                         companyId);
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
                    Constants.EXAMPLE_PROBLEM_ID.substring(index+1));
            int problemTypeId = Integer.parseInt(Constants.PROBLEM_TYPE_EXAMPLE_ID);
            problem.createSessionProfileProblem(sessionProfileId, 
                                                problemId,
                                                problemTypeId,
                                                1,
                                                roundId);
            //now do the test set b problems
            problemTypeId = 
                Integer.parseInt(Constants.PROBLEM_TYPE_TEST_SET_B_ID);
            String [] testSetBArr = info.getTestSetB();
            for(int i = 0; i < testSetBArr.length; ++i) {
                index = testSetBArr[i].indexOf(",");
                if(index == -1) {
                    continue;
                }
                roundId = Long.parseLong(testSetBArr[i].substring(0, index));
                problemId = Long.parseLong(testSetBArr[i].substring(index+1));
                problem.createSessionProfileProblem(sessionProfileId, 
                                                    problemId,
                                                    problemTypeId,
                                                    i+1,
                                                    roundId);
            }

            

            Long [] languages = info.getLanguage();
            for(int i = 0; i < languages.length; ++i) {
                language.createProfileLanguage(sessionProfileId, 
                                               languages[i].intValue());
            }

            updateSessionProfile(sessionProfileId);
        }
        catch(Exception e) {
            ut.rollback();
            throw e;
        }
        ut.commit();

        setNextPage(Constants.CONTROLLER_URL + "?" +
                    Constants.REQUEST_PROCESSOR + "=" +
                    Constants.POPULATE_SESSION_PROCESSOR);
        setNextPageInContext(false);
        }
    }

    /** 
     * Updates the sessionInfo object if there is one with the newly created
     * profile id
     *
     * @param profileId  THe id of the created candidate
     */
    private void updateSessionProfile(long profileId) {
        HttpServletRequest request = (HttpServletRequest)getRequest();
        HttpSession session = request.getSession();
        SessionInfo info = (SessionInfo)
            session.getAttribute(Constants.SESSION_INFO);
        if(info != null) {
            info.setProfileId(String.valueOf(profileId));
        }

    }

}
