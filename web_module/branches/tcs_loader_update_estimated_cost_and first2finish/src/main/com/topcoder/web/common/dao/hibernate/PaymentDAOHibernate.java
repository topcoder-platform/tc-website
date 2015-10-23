package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.PaymentDAO;

/**
 * @author VolodymyrK
 */
public class PaymentDAOHibernate extends Base implements PaymentDAO {
    public PaymentDAOHibernate() {
        super();
    }
    
    public PaymentDAOHibernate(Session session) {
        super(session);
    }
    
    public Boolean hasPayments(Long userId) {
        Query q = session.createQuery("select p.id from Payment p" +
                  " where p.userId=" + userId);

        return q.list().size() > 0;
    }

}
