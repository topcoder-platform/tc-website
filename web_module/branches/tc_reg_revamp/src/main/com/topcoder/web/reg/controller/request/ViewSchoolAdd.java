package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.model.SchoolType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;

import java.util.ArrayList;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2006
 */
public class ViewSchoolAdd extends Base {

    protected void registrationProcessing() throws Exception {
        User u = getRegUser();

        if (u != null) {
            if (u.getHomeAddress() != null) {
                if (u.getHomeAddress().getCountry() != null) {
                    setDefault(Constants.COUNTRY_CODE, u.getHomeAddress().getCountry().getCode());
                }
                if (u.getHomeAddress().getState() != null) {
                    setDefault(Constants.STATE_CODE, u.getHomeAddress().getState().getCode());
                }
                if (u.getHomeAddress().getProvince() != null) {
                    setDefault(Constants.PROVINCE, u.getHomeAddress().getProvince());
                }
                if (u.getHomeAddress().getCity() != null) {
                    setDefault(Constants.CITY, u.getHomeAddress().getCity());
                }
                if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                    setDefault(Constants.SCHOOL_TYPE, SchoolType.HIGH_SCHOOL.toString());
                }
            }
        }

        setDefault(Constants.VISIBLE_SCHOOL, String.valueOf("true"));
        getRequest().setAttribute(Constants.FIELDS, RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u));
        getRequest().setAttribute(Constants.REQUIRED_FIELDS,
                RegFieldHelper.getSecondaryRequiredFieldSet(getRequestedTypes(), u));
        if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
            ArrayList a = new ArrayList();
            a.add(getFactory().getSchoolTypeDAO().find(SchoolType.HIGH_SCHOOL));
            getRequest().setAttribute("schoolTypes", a);
        } else {
            getRequest().setAttribute("schoolTypes", getFactory().getSchoolTypeDAO().getSchoolTypes());
        }
        getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
        setNextPage("/schoolEntry.jsp");
        setIsNextPageInContext(true);
    }
}