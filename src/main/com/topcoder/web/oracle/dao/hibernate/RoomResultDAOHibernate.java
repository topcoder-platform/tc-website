package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.dao.RoomResultDAO;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.RoomResult;
import com.topcoder.web.oracle.model.Round;
import org.hibernate.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 28, 2007
 */
public class RoomResultDAOHibernate extends Base implements RoomResultDAO {
    public void saveOrUpdate(RoomResult crr) {
        super.saveOrUpdate(crr);
    }

    public RoomResult find(Room room, User user) {
        return null;
    }

    public RoomResult find(Integer roomId, Long userId) {
        RoomResult.Identifier id = new RoomResult.Identifier();
        Room r = new Room();
        r.setId(roomId);
        id.setRoom(r);
        User u = new User();
        u.setId(userId);
        id.setUser(u);
        return (RoomResult) super.find(RoomResult.class, id);
    }


    public List<RoomResult> getResults(Round round) {
        return getResults(round.getId());
    }

    public List<RoomResult> getResults(Integer roundId) {
        StringBuffer query = new StringBuffer(100);
        query.append(" from com.topcoder.web.oracle.model.RoomResult crr");
        query.append(" where crr.id.room.round.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roundId);
        List l = q.list();
        ArrayList<RoomResult> ret = new ArrayList<RoomResult>(l.size());
        for (Object aL : l) {
            ret.add((RoomResult) aL);
        }
        return ret;
    }

    public List<RoomResult> getResults(User u, Round round) {
        return getResults(u.getId(), round.getId());
    }

    public List<RoomResult> getResults(Long userId, Integer roundId) {
        StringBuffer query = new StringBuffer(100);
        query.append(" from com.topcoder.web.oracle.model.RoomResult crr");
        query.append(" where crr.id.room.round.id = ?");
        query.append("   and crr.id.user.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roundId);
        q.setLong(2, userId);
        List l = q.list();
        ArrayList<RoomResult> ret = new ArrayList<RoomResult>(l.size());
        for (Object aL : l) {
            ret.add((RoomResult) aL);
        }
        return ret;
    }

}
