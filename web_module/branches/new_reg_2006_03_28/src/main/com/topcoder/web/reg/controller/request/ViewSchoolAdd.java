package com.topcoder.web.reg.controller.request;

import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.model.SchoolType;
import com.topcoder.web.reg.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class ViewSchoolAdd extends Base {

    protected void registrationProcessing() throws Exception {
        User u = getRegUser();

        if (u!=null) {
            if (u.getHomeAddress()!=null) {
                if (u.getHomeAddress().getCountry()!=null) {
                    setDefault(Constants.COUNTRY_CODE, u.getHomeAddress().getCountry().getCode());
                }
                if (u.getHomeAddress().getState()!=null) {
                    setDefault(Constants.STATE_CODE, u.getHomeAddress().getState().getCode());
                }
                if (u.getHomeAddress().getProvince()!=null) {
                    setDefault(Constants.PROVINCE, u.getHomeAddress().getProvince());
                }
                if (u.getHomeAddress().getCity()!=null) {
                    setDefault(Constants.CITY, u.getHomeAddress().getCity());
                }
                if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                    setDefault(Constants.SCHOOL_TYPE, SchoolType.HIGH_SCHOOL.toString());
                }
            }
        }

        getRequest().setAttribute(Constants.FIELDS, RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u));
        getRequest().setAttribute("schoolTypes", getFactory().getSchoolTypeDAO().getSchoolTypes());
        getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
        setNextPage("/schoolEntry.jsp");
        setIsNextPageInContext(true);
    }
}
