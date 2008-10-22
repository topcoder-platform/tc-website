package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.RegionType;
import com.topcoder.web.reg.TCHibernateTestCase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 25, 2006
 */
public class CountryDAOTestCase extends TCHibernateTestCase {

    private final Integer HIGH_SCHOOL_REGION_TYPE = new Integer(1);
    
    public void testGetCountries() {
        List countries = DAOUtil.getFactory().getCountryDAO().getCountries();
        assertTrue("could not find any countries in the db", countries != null && !countries.isEmpty());
    }

    public void testFind() {
        Country c = DAOUtil.getFactory().getCountryDAO().find("840");
        assertTrue("could not find the United States", c != null && c.getName().equals("United States"));
    }

    public void testRegion() {
        Country c = DAOUtil.getFactory().getCountryDAO().find("840");
        RegionType rt = new RegionType();
        rt.setId(HIGH_SCHOOL_REGION_TYPE);
        assertTrue("could not find the United States", c.getRegionByType(rt) != null && 
                c.getRegionByType(rt).getName().equals("Alpha"));
    }
}
