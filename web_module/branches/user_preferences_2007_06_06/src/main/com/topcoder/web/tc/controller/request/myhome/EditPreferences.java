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
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.tc.Constants;

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
        
//        HashSet values = new HashSet();
//
//        String key;
//        PreferenceValueDAO pvDao = DAOUtil.getFactory().getPreferenceValueDAO();
//        for (Iterator it = group.getPreferences().iterator(); it.hasNext();) {
//            key = Constants.PREFERENCE_PREFIX + ((Preference) it.next()).getId();
//            setDefault(key, getRequest().getParameter(key));
//            try {
//                values.add(pvDao.find(new Integer(StringUtils.checkNull(getRequest().getParameter(key)))).getValue());
//            } catch (NumberFormatException e) {
//                addError(key, "Please choose a valid section.");
//            }
//        }
//
//        if (hasErrors()) {
//        } else {
//            if (values.size() != group.getPreferences().size()) {
//                addError(Constants.PREFERENCE_PREFIX, "Please indicate each of your preferences, you must choose each section once.");
//            } else {
//                String valueId;
//                Preference curr;
//                PreferenceValue currValue;
//                UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
//                User user = userDAO.find(new Long(getUser().getId()));
//                for (Iterator it = group.getPreferences().iterator(); it.hasNext();) {
//                    curr = (Preference) it.next();
//                    valueId = StringUtils.checkNull(getRequest().getParameter(Constants.PREFERENCE_PREFIX + curr.getId()));
//                    boolean found = false;
//                    for (Iterator it1 = curr.getValues().iterator(); it1.hasNext() & !found;) {
//                        currValue = (PreferenceValue) it1.next();
//                        found = currValue.getId().equals(new Integer(valueId));
//                        if (found) {
//                            UserPreference up = new UserPreference();
//                            up.setPreferenceValue(currValue);
//                            up.getId().setPreference(curr);
//                            up.getId().setUser(user);
//                            user.addUserPreference(up);
//                        }
//                    }
//                    if (!found) {
//                        addError(Constants.PREFERENCE_PREFIX + curr.getId(), "Please choose a valid section.");
//                    }
//                }
//                userDAO.saveOrUpdate(user);
//            }
//        }

        
        // check fields for the specified category.
        Set fields = RegFieldHelper.getMainFieldSet(u.getRegistrationTypes(), u);
        fields.addAll(RegFieldHelper.getSecondaryFieldSet(u.getRegistrationTypes(), u));

        for (String f: (Set<String>) fields) {
            log.debug("fields: " + f);
        }
        
        List<Preference> preferenceList = new ArrayList<Preference>();
        for (Iterator it = group.getPreferences().iterator(); it.hasNext();) {
            Preference p = (Preference) it.next();
            
            log.debug("checking preference: " + p.getName() + " Id: " + p.getId());
            
            if (fields.contains("pref_" + p.getId())) {
                log.debug("In fields");
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

        getRequest().setAttribute("preferenceList", preferenceList);

        setNextPage("/my_home/privacy.jsp");
        setIsNextPageInContext(true);
    }
}