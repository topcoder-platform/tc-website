package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.CountryDAO;
import com.topcoder.web.common.model.Country;
import org.hibernate.Query;
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
        StringBuffer query = new StringBuffer(100);
        query.append("from Country n ");
        query.append(" order by country_name");
        Query q = session.createQuery(query.toString());

        return q.list();

    }

    public Country find(String code) {
        return (Country) find(Country.class, code);
    }

    public Country getUS() {
        return find(Country.US_CODE);
    }


}
