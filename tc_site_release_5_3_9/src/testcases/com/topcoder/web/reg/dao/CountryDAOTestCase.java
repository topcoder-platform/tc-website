package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.Country;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CountryDAOTestCase extends TCHibernateTestCase {

    public void testGetCountries() {
        List countries = Util.getFactory().getCountryDAO().getCountries();
        assertTrue("could not find any countries in the db", countries != null && !countries.isEmpty());
    }

    public void testFind() {
        Country c = Util.getFactory().getCountryDAO().find("840");
        assertTrue("could not find the United States", c != null && c.getName().equals("United States"));
    }
}
