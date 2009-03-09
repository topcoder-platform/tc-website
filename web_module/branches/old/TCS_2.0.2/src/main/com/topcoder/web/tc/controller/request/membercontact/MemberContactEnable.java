package com.topcoder.web.tc.controller.request.membercontact;

import java.util.HashSet;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.tc.Constants;

/**
 * Processor for Enabling Member Contact
 * This processor is used both for display the page for enabling MC as well as for enabling it.
 * If there is an ENABLE parameter, it enables in the DB, if not it just shows the page.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 14, 2006
 */
public class MemberContactEnable extends ShortHibernateProcessor {

    public static String ENABLE = "enable";

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        boolean enable = getRequest().getParameter(ENABLE) != null;

        // if asked to enable MC, do the db work!
        if (enable) {
            Long userId = new Long(getUser().getId());
            UserPreference up = DAOUtil.getFactory().getUserPreferenceDAO()
                    .find(userId, Preference.MEMBER_CONTACT_PREFERENCE_ID);

            // it could (but shouldn't) happen that the user doesn't have a UserPreference for MC.
            if (up == null) {
                up = new UserPreference();
                Preference p = DAOUtil.getFactory().getPreferenceDAO().find(Preference.MEMBER_CONTACT_PREFERENCE_ID);
                User user  = DAOUtil.getFactory().getUserDAO().find(userId);
                up.setId(new UserPreference.Identifier(user, p));
            }

            up.setValue("yes");

            HashSet<String> s = new HashSet<String>();
            s.add("user_preference");
            s.add("user_preference_all");
            CacheClearer.removelike(s); 

            setNextPage(Constants.MEMBER_CONTACT_ENABLE_SUCCEEDED);
            setIsNextPageInContext(true);
        } else {
            // Just display the page to confirm enabling MC
            setNextPage(Constants.MEMBER_CONTACT_ENABLE);
            setIsNextPageInContext(true);
        }
    }


}
