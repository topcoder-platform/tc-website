package com.topcoder.web.reg.controller.request;

import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.model.SchoolType;
import com.topcoder.web.reg.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 */
public class ViewSchoolSearch extends Base  {
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

        getRequest().setAttribute("schoolTypes", getFactory().getSchoolTypeDAO().getSchoolTypes());
        getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
        setNextPage("/school.jsp");
        setIsNextPageInContext(true);
    }
}
