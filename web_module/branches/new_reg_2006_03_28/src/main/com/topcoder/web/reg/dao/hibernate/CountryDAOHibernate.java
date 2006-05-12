package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.model.Country;
import com.topcoder.web.reg.dao.CountryDAO;
import org.hibernate.Session;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CountryDAOHibernate extends Base implements CountryDAO {

    public CountryDAOHibernate() {
        super();
    }

    public CountryDAOHibernate(Session session) {
        super(session);
    }

    public List getCountries() {
        return findAll(Country.class);
    }

    public Country find(String code) {
        return (Country) find(Country.class, code);
    }

    public Country getUS() {
        return find(Country.US_CODE);
    }


}
