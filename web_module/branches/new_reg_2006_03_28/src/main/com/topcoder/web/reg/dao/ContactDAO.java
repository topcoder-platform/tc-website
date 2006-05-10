package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Contact;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 10, 2006
 */
public class ContactDAO extends Base {

    /**
     * Create a ContactDAO object using the default connection information.
     */
    public ContactDAO() {
        super();
    }

    public ContactDAO(Session session) {
        super(session);
    }


    public Contact find(Long id) {
        return (Contact)session.load(Contact.class, id);

    }

    public void saveOrUpdate(Contact u) {
            session.saveOrUpdate(u);
    }
}

