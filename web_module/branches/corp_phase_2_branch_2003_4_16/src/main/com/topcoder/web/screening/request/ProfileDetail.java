package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProfileInfo;
import com.topcoder.web.ejb.sessionprofile.SessionProfileHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfile;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguageHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.rmi.PortableRemoteObject;
import javax.naming.InitialContext;
import javax.naming.Context;
import java.util.Iterator;

public class ProfileDetail extends BaseProfileProcessor {
    private static Logger log = Logger.getLogger(ProfileDetail.class);
    public void process() throws Exception {
        ProfileInfo info = buildProfileInfo(getRequest());

        Context context = new InitialContext();
        SessionProfileHome spHome = (SessionProfileHome)
            PortableRemoteObject.narrow(
                    context.lookup(SessionProfileHome.class.getName()),
                                   SessionProfileHome.class);
        SessionProfile profile = spHome.create();

        log.debug("ProfileDetail for profile: " + info.getProfileId());
        info.setTestSetAList(getTestSetAList(profile.getSessionRoundId(info.getProfileId().longValue()),
                getAuthentication().getActiveUser()));
        info.setTestSetBList(getTestSetBList(info.getProfileId().longValue(), getAuthentication().getActiveUser()));

        info.setProfileName(profile.getSessionProfileDesc(info.getProfileId().longValue()));


        SessionProfileLanguageHome splHome = (SessionProfileLanguageHome)
            PortableRemoteObject.narrow(
                    context.lookup(SessionProfileLanguageHome.class.getName()),
                                   SessionProfileLanguageHome.class);
        SessionProfileLanguage language = splHome.create();

        ResultSetContainer languages = language.getLanguages(info.getProfileId().longValue());
        for (Iterator it = languages.iterator(); it.hasNext();) {
            info.addLanguage(((ResultSetContainer.ResultSetRow)it.next()).getItem("language_id").toString());
        }

        info.setLanguageList(getLanguageList());

        getRequest().setAttribute(Constants.PROFILE_INFO, info);
        setNextPage(Constants.PROFILE_DETAIL_PAGE);
        setNextPageInContext(true);
    }


}


