package com.topcoder.web.tc.controller.request.myhome;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.PreferenceGroup;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;

/**
 * @author pulky
 * @version $Revision$Date: 
 *          Create Date: Jun 08, 2007
 */
public class EditPreferences extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User u  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        
        log.debug("group param: " + getRequest().getParameter("group"));

        PreferenceGroup group = DAOUtil.getFactory().getPreferenceGroupDAO().find(new Integer(Integer.parseInt(getRequest().getParameter("group"))));
        
        log.debug("PreferenceGroup: " + group.getDescription());

        List<Preference> preferenceList = new ArrayList<Preference>();

        for (Iterator it = group.getPreferences().iterator(); it.hasNext();) {
            Preference p = (Preference) it.next();

            log.debug("Checking preference: " + p.getName());
            boolean add = false;
            for (RegistrationType rt : (Set<RegistrationType>) u.getRegistrationTypes()) {
                if (rt.getPreferences().contains(p)) {
                    log.debug("Registration: " + rt.getName() + " contains preference: " + p.getName());
                    add = true;
                }
            }

            if (add) {
                for (UserPreference up : (Set<UserPreference>) u.getUserPreferences()) {
                    if (up.getId().getPreference().equals(p)) {
                        log.debug("In user's preferences");
                        String key = "pref_" + p.getId();
                        log.debug("Value: " + up.getValue());
                        setDefault(key, up.getValue());                        
                    }
                }
                preferenceList.add(p);
            }
        }
        
        if (u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
            // add high school preference
            getRequest().setAttribute("isHighSchool", Boolean.TRUE);
            setDefault("show_school", u.getCoder().getCurrentSchool().getViewable());                        
        } else {
            getRequest().setAttribute("isHighSchool", Boolean.FALSE.toString());
        }
        
        getRequest().setAttribute("preferenceList", preferenceList);

        setNextPage("/my_home/privacy.jsp");
        setIsNextPageInContext(true);
    }
}