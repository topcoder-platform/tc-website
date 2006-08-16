package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.PreferenceValueDAO;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.*;
import com.topcoder.web.tc.Constants;

import java.util.HashSet;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public class SubmitAlgoRegistration extends ViewAlgoRegistration {
    public static final String AOL_SURVEY = "aolsur";

    protected void regProcessing() throws Exception {

        String termsAgree = getRequest().getParameter(Constants.TERMS_AGREE);
        String aolSurvey = getRequest().getParameter(Constants.TERMS_AGREE);

        PreferenceGroup group = (PreferenceGroup) getRequest().getAttribute("group");
        HashSet values = new HashSet();

        String key;
        PreferenceValueDAO pvDao = DAOUtil.getFactory().getPreferenceValueDAO();
        for (Iterator it = group.getPreferences().iterator(); it.hasNext();) {
            key = Constants.PREFERENCE_PREFIX + ((Preference) it.next()).getId();
            setDefault(key, getRequest().getParameter(key));
            try {
                values.add(pvDao.find(new Integer(StringUtils.checkNull(getRequest().getParameter(key)))).getValue());
            } catch (NumberFormatException e) {
                addError(key, "Please choose a valid section.");
            }
        }

        if (hasErrors()) {
            setDefault(Constants.TERMS_AGREE, String.valueOf("on".equals(termsAgree)));
        } else {
            if ("on".equals(termsAgree)) {
                if (values.size() != group.getPreferences().size()) {
                    addError(Constants.PREFERENCE_PREFIX, "Please indicate each of your preferences, you must choose each section once.");
                } else {
                    String valueId;
                    Preference curr;
                    PreferenceValue currValue;
                    UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
                    User user = userDAO.find(new Long(getUser().getId()));
                    for (Iterator it = group.getPreferences().iterator(); it.hasNext();) {
                        curr = (Preference) it.next();
                        valueId = StringUtils.checkNull(getRequest().getParameter(Constants.PREFERENCE_PREFIX + curr.getId()));
                        boolean found = false;
                        for (Iterator it1 = curr.getValues().iterator(); it1.hasNext() & !found;) {
                            currValue = (PreferenceValue) it1.next();
                            found = currValue.getId().equals(new Integer(valueId));
                            if (found) {
                                UserPreference up = new UserPreference();
                                up.setPreferenceValue(currValue);
                                up.getId().setPreference(curr);
                                up.getId().setUser(user);
                                user.addUserPreference(up);
                            }
                        }
                        if (!found) {
                            addError(Constants.PREFERENCE_PREFIX + curr.getId(), "Please choose a valid section.");
                        }
                    }
                    user.addTerms(DAOUtil.getFactory().getTermsOfUse().find(new Integer(getTermsId())));
                    userDAO.saveOrUpdate(user);
                    getRequest().setAttribute(AOL_SURVEY, Boolean.valueOf("on".equals(aolSurvey)));
                }
            } else {
                addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
            }
        }

    }

    protected void setNextPage() throws Exception {
        if (hasErrors()) {
            setNextPage("/tournaments/tccc06/reg.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/tccc06/regsuccess.jsp");
            setIsNextPageInContext(true);
        }
    }


}
