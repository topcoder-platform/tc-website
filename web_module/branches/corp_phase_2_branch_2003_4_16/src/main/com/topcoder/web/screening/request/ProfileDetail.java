package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;
import com.topcoder.web.ejb.sessionprofile.SessionProfileHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfile;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.rmi.PortableRemoteObject;

public class ProfileDetail extends BaseProfileProcessor {
    private static Logger log = Logger.getLogger(ProfileDetail.class);
    public void process() throws Exception {
        ProfileInfo info = buildProfileInfo(getRequest());

        SessionProfileHome spHome = (SessionProfileHome)
            PortableRemoteObject.narrow(
                    TCContext.getInitial().lookup(SessionProfileHome.class.getName()),
                                   SessionProfileHome.class);
        SessionProfile profile = spHome.create();

        log.debug("ProfileDetail for profile: " + info.getProfileId());
        info.setTestSetAList(getTestSetAList(profile.getSessionRoundId(info.getProfileId().longValue()),
                getAuthentication().getActiveUser()));
        info.setTestSetBList(getTestSetBList(info.getProfileId().longValue(), getAuthentication().getActiveUser()));

        info.setProfileName(profile.getSessionProfileDesc(info.getProfileId().longValue()));

        getRequest().setAttribute(Constants.PROFILE_INFO, info);
        setNextPage(Constants.PROFILE_DETAIL_PAGE);
        setNextPageInContext(true);
    }
}


