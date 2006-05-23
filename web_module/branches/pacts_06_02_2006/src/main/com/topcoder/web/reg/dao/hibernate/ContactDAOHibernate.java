package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.model.Contact;
import com.topcoder.web.reg.dao.ContactDAO;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class ContactDAOHibernate extends Base implements ContactDAO {

    /**
     * Create a ContactDAO object using the default connection information.
     */
    public ContactDAOHibernate() {
        super();
    }

    public ContactDAOHibernate(Session session) {
        super(session);
    }


    public Contact find(Long id) {
        return (Contact) find(Contact.class, id);

    }

    public void saveOrUpdate(Contact u) {
        session.saveOrUpdate(u);
    }
}

