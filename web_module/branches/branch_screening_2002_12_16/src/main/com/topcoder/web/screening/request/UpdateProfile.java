package com.topcoder.web.screening.request;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;

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

        if(info.isNew()) {
//            create a session somehow
//            long spid = profile.createSessionProfile(info.getProfileName(),
 //                                                    info.getTestSetA().longValue(),
  //                                                   1, //divisionid?


        }
        else {
            //lookup session profile to update
        }
    }
}
