package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Country;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CountryDAO extends Base {
    public List getCountries() {
        return findAll(Country.class);
    }

    public Country find(String code) {
        return (Country)find(Country.class, code);
    }

}
