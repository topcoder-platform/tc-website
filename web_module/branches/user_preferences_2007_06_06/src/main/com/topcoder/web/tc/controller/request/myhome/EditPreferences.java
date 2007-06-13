package com.topcoder.web.tc.controller.request.myhome;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
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
        boolean askHighSchool = false;
        
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User u  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        log.debug("group param: " + getRequest().getParameter("group"));
        PreferenceGroup group = DAOUtil.getFactory().getPreferenceGroupDAO().find(new Integer(Integer.parseInt(getRequest().getParameter("group"))));
        log.debug("PreferenceGroup: " + group.getDescription());
        List<Preference> preferenceList = new ArrayList<Preference>();

        // add high school preference
        // for users with either competition or studio
        // this cannot be changed by high school users
        if ((u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getCompetitionType()) ||
                u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getStudioType())) &&
                !u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
            log.debug("ask for showing high school");
            askHighSchool = true;
            getRequest().setAttribute("isHighSchool", Boolean.TRUE);
            setDefault("show_school", u.getCoder().getCurrentSchool() == null ? Boolean.FALSE : u.getCoder().getCurrentSchool().getViewable());
        } else {
            getRequest().setAttribute("isHighSchool", Boolean.FALSE.toString());
        }

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

        setDefault("group",  getRequest().getParameter("group"));
        getRequest().setAttribute("preferenceList", preferenceList);

        if ("POST".equals(getRequest().getMethod())) {
            for (Preference p : preferenceList) {
                String pref = StringUtils.checkNull(getRequest().getParameter("pref_" + p.getId()));
                log.debug("getting param: pref_" + p.getId() + ": " + pref);
                if (pref == "") {
                    addError("err_" + p.getId(), "Please select the following option");
                }
                u.getUserPreference(p.getId()).setValue(pref);
            }
            if (askHighSchool) {
                String showSchool = StringUtils.checkNull(getRequest().getParameter("show_school"));
                log.debug("getting param: show_school: " + showSchool);
                if (showSchool == "") {
                    addError("err_show_school", "Please select the following option");
                }
                u.getCoder().getCurrentSchool().setViewable("show".equals(showSchool));           
            }
            if (hasErrors()) {
                setNextPage("/my_home/privacy.jsp");                
            } else {
                DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
                setNextPage("/my_home/index.jsp");
            }
        } else {
            setNextPage("/my_home/privacy.jsp");
        }
        setIsNextPageInContext(true);
    }
}
