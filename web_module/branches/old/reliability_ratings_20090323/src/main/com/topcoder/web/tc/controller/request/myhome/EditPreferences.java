package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.PreferenceGroup;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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

        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
        log.debug("group param: " + getRequest().getParameter("group"));
        PreferenceGroup group = DAOUtil.getFactory().getPreferenceGroupDAO().find(new Integer(Integer.parseInt(getRequest().getParameter("group"))));
        log.debug("PreferenceGroup: " + group.getDescription());
        List<Preference> preferenceList = new ArrayList<Preference>();

        // add high school preference
        // for users with either competition or studio
        // this cannot be changed by high school users
        if ((u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getCompetitionType()) ||
                u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getStudioType()) &&
                        u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getOpenAIMType())) &&
                !u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getHighSchoolType())
                && u.getCoder().getCurrentSchool() != null) {
            log.debug("ask for showing high school");
            askHighSchool = true;
            getRequest().setAttribute("isHighSchool", Boolean.TRUE);
            setDefault("show_school", u.getCoder().getCurrentSchool().getViewable() ? "show" : "hide");
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

        setDefault("group", getRequest().getParameter("group"));
        getRequest().setAttribute("preferenceList", preferenceList);

        if ("POST".equals(getRequest().getMethod())) {
            for (Preference p : preferenceList) {
                String pref = StringUtils.checkNull(getRequest().getParameter("pref_" + p.getId()));
                log.debug("getting param: pref_" + p.getId() + ": " + pref);
                if (pref == "") {
                    addError("err_" + p.getId(), "You must choose one of the options below");
                }
                if (u.getUserPreference(p.getId()) != null) {
                    u.getUserPreference(p.getId()).setValue(pref);
                } else {
                    UserPreference up = new UserPreference();
                    up.setNew(true);
                    up.setId(new UserPreference.Identifier(u, p));
                    up.setValue(pref);
                    u.addUserPreference(up);
                }
            }
            if (askHighSchool) {
                String showSchool = StringUtils.checkNull(getRequest().getParameter("show_school"));
                log.debug("getting param: show_school: " + showSchool);
                if (showSchool == "") {
                    addError("err_show_school", "You must choose one of the options below");
                }
                u.getCoder().getCurrentSchool().setViewable("show".equals(showSchool));
            }
            if (!hasErrors()) {
                DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
                if (DAOUtil.useQueryToolFactory) {
                    HashSet<String> s = new HashSet<String>();
                    s.add("user_preference");
                    s.add("user_preference_all");
                    CacheClearer.removelike(s);
                }
                getRequest().setAttribute("regUser", u);

                setNextPage("/my_home/index.jsp");
//                setNextPage("/tc?" + Constants.MODULE_KEY + "=MyHome");
            } else {
                setNextPage("/my_home/privacy.jsp");
            }
        } else {
            setNextPage("/my_home/privacy.jsp");
        }
        setIsNextPageInContext(true);
    }
}
