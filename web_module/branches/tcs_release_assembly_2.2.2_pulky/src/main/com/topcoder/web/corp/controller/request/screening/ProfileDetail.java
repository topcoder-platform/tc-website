package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.ProfileInfo;
import com.topcoder.web.ejb.sessionprofile.SessionProfile;
import com.topcoder.web.ejb.sessionprofile.SessionProfileHome;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguage;
import com.topcoder.web.ejb.sessionprofile.SessionProfileLanguageHome;

import javax.rmi.PortableRemoteObject;
import java.util.Iterator;
import java.util.Map;

public class ProfileDetail extends BaseProfileProcessor {
    private static Logger log = Logger.getLogger(ProfileDetail.class);

    protected void screeningProcessing() throws TCWebException {
        ProfileInfo info = buildProfileInfo(getRequest());

        try {
            SessionProfileHome spHome = (SessionProfileHome)
                    PortableRemoteObject.narrow(
                            getInitialContext().lookup(SessionProfileHome.class.getName()),
                            SessionProfileHome.class);
            SessionProfile profile = spHome.create();

            log.debug("ProfileDetail for profile: " + info.getProfileId());
            long sessionRoundId = profile.getSessionRoundId(info.getProfileId().longValue());
            info.setTestSetAList(getTestSetAList(sessionRoundId, getUser()));
            info.setTestSetBList(getTestSetBList(info.getProfileId().longValue(), getUser()));
            info.setHasTestSetA(sessionRoundId != Constants.NO_TEST_SET_A);

            info.setProfileName(profile.getSessionProfileDesc(info.getProfileId().longValue()));


            SessionProfileLanguageHome splHome = (SessionProfileLanguageHome)
                    PortableRemoteObject.narrow(
                            getInitialContext().lookup(SessionProfileLanguageHome.class.getName()),
                            SessionProfileLanguageHome.class);
            SessionProfileLanguage language = splHome.create();

            ResultSetContainer languages = language.getLanguages(info.getProfileId().longValue());
            for (Iterator it = languages.iterator(); it.hasNext();) {
                info.addLanguage(((ResultSetContainer.ResultSetRow) it.next()).getItem("language_id").toString());
            }

            info.setLanguageList(getLanguageList());

            info.setSessionList(getSessionList(info.getProfileId().longValue(), getUser().getId()));

            getRequest().setAttribute(Constants.PROFILE_INFO, info);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.PROFILE_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }


    private ResultSetContainer getSessionList(long profileId, long userId) throws Exception {
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, Constants.PROFILE_SESSION_LIST_QUERY_KEY);
        dataRequest.setProperty("spid", String.valueOf(profileId));
        dataRequest.setProperty("uid", String.valueOf(userId));

        Map map = Util.getDataAccess().getData(dataRequest);

        ResultSetContainer ret = null;
        if (map != null) {
            ret = (ResultSetContainer) map.get(Constants.PROFILE_SESSION_LIST_QUERY_KEY);
        }
        return ret;
    }


}


