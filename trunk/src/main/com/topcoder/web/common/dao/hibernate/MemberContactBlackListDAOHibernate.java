package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.MemberContactMessage;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 18, 2006
 */
public class MemberContactBlackListDAOHibernate extends Base implements MemberContactBlackListDAO {

    public MemberContactBlackListDAOHibernate() {
        super();
    }

    public MemberContactBlackListDAOHibernate(Session session) {
        super(session);
    }


    public void saveOrUpdate(MemberContactBlackList m) {
        super.saveOrUpdate(m);
    }

    public MemberContactBlackList find(User user, User blockedUser) {
        return (MemberContactBlackList) find(MemberContactBlackList.class,
                new MemberContactBlackList.Identifier(user, blockedUser));
    }

    public MemberContactBlackList findOrCreate(User user, User blockedUser) {
        MemberContactBlackList m = find (user, blockedUser);

        if (m == null) {
            m = new MemberContactBlackList();
            m.setId(new MemberContactBlackList.Identifier(user, blockedUser));
            m.setBlocked(false);
        }

        return m;
    }

    public List getBlockedUsers(Long userId) {
        Query q = session.createQuery("select m.id.blockedUser from MemberContactBlackList m" +
                  " where m.id.user=" + userId +
                  " and m.blocked=true");

        return q.list();
    }

    public List getPreviouslyBlockedUsers(Long userId) {
        Query q = session.createQuery("select m.id.blockedUser from MemberContactBlackList m" +
                  " where m.id.user=" + userId +
                  " and m.blocked=false");
        return q.list();
    }




}
