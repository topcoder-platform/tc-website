package com.topcoder.web.screening.request;

import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;

import com.topcoder.web.ejb.sessionprofile.SessionProfile;
import com.topcoder.web.ejb.sessionprofile.SessionProfileHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguage;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguageHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblem;
import com.topcoder.web.ejb.sessionprofile.SessionProfileProblemHome;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;

import com.topcoder.web.screening.model.ProfileInfo;

public class UpdateProfile extends BaseProfileProcessor {
    public void process() throws Exception {
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
        else {
            profile.setSessionRoundId(info.getProfileId().longValue(), 
                                      info.getTestSetA().longValue());
            profile.setSessionProfileDesc(info.getProfileId().longValue(), 
                                          info.getProfileName());
            
            //delete all old ones from problem and language
        }

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
                                            0,
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
                                                i,
                                                roundId);
        }

        

        Long [] languages = info.getLanguage();
        for(int i = 0; i < languages.length; ++i) {
            language.createProfileLanguage(sessionProfileId, 
                                           languages[i].intValue());
        }

        setNextPage(Constants.CONTROLLER_URL + "?" +
                    Constants.REQUEST_PROCESSOR + "=" +
                    Constants.POPULATE_SESSION_PROCESSOR);
        setNextPageInContext(false);
    }
}
