package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.MemberContactMessageDAO;
import com.topcoder.web.common.model.MemberContactMessage;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 18, 2006
 */
public class MemberContactMessageDAOHibernate extends Base implements MemberContactMessageDAO {

    public MemberContactMessageDAOHibernate() {
        super();
    }

    public MemberContactMessageDAOHibernate(Session session) {
        super(session);
    }

    public MemberContactMessage find(Long id) {
        return (MemberContactMessage) find(MemberContactMessage.class, id);
    }

    public void saveOrUpdate(MemberContactMessage m) {
        super.saveOrUpdate(m);
    }

    public List getAllSendersToUser(Long userId) {
        Query q = session.createQuery("select distinct mcm.sender from MemberContactMessage mcm" +
                        " where mcm.recipient=" + userId);
        return q.list();
    }



}
