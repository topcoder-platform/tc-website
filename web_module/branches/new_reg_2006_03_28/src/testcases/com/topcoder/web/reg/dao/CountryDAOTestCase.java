package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.model.Country;
import junit.framework.TestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CountryDAOTestCase extends TestCase {

    public void testGetCountries() {
        List countries = new CountryDAO(HibernateUtils.getLocalSession()).getCountries();
        assertTrue("could not find any countries in the db", countries != null && !countries.isEmpty());
    }

    public void testFind() {
        Country c = new CountryDAO(HibernateUtils.getLocalSession()).find("840");
        assertTrue("could not find the United States", c != null && c.getName().equals("United States"));
    }
}
