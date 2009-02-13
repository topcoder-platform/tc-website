package com.topcoder.web.reg.controller.request;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 */
public class ViewSchoolSearch extends Base  {
    protected void registrationProcessing() throws Exception {

/*        User u = getRegUser();

        if (u!=null) {
            log.debug("user not null: " + u.getHandle() + " " + u.getLastName() + " " + u.getAddresses().size());
            if (u.getHomeAddress()!=null) {
                log.debug("address not null");
                if (u.getHomeAddress().getCountry()!=null) {
                    log.debug("country not null");
                    setDefault(Constants.COUNTRY_CODE, u.getHomeAddress().getCountry().getCode());
                }
                if (u.getHomeAddress().getState()!=null) {
                    log.debug("state not null");
                    setDefault(Constants.STATE_CODE, u.getHomeAddress().getState().getCode());
                }
                if (u.getHomeAddress().getProvince()!=null) {
                    log.debug("province not null");
                    setDefault(Constants.PROVINCE, u.getHomeAddress().getProvince());
                }
                if (u.getHomeAddress().getCity()!=null) {
                    log.debug("city not null");
                    setDefault(Constants.CITY, u.getHomeAddress().getCity());
                }
                if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                    setDefault(Constants.SCHOOL_TYPE, SchoolType.HIGH_SCHOOL.toString());
                }
            }
        }

        getRequest().setAttribute("schoolTypes", getFactory().getSchoolTypeDAO().getSchoolTypes());
        getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());*/
        setNextPage("/school.jsp");
        setIsNextPageInContext(true);
    }
}
