package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.RoomDAO;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public class RoomDAOHibernate extends Base implements RoomDAO {

    public Room findSmallestRoom(Integer roundId) {

        StringBuffer query = new StringBuffer(100);
        query.append(" select r.results.size, r");
        query.append(" from com.topcoder.web.oracle.model.Room r");
        query.append(" where r.round.id = ?");
        query.append(" order by 1 asc");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roundId);
        List res = q.list();
        if (res.isEmpty()) {
            return null;
        } else {
            return (Room) ((Object[]) res.get(0))[1];
        }
    }

    public Room findSmallestRoom(Round round) {
        return findSmallestRoom(round.getId());
    }

    public void saveOrUpdate(Room r) {
        super.saveOrUpdate(r);
    }

    public Room find(Integer id) {
        return (Room) super.find(Room.class, id);
    }


}
