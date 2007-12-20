package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;
import org.hibernate.Query;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public class CandidateDAOHibernate extends Base implements CandidateDAO {
    public Candidate find(Integer id) {
        return (Candidate) super.find(Candidate.class, id);
    }

    public void saveOrUpdate(Candidate c) {
        super.saveOrUpdate(c);
    }

    public List<Candidate> getCandidates(Room r, User u) {
        return getCandidates(r.getId(), u.getId());
    }

    public List<Candidate> getCandidates(Integer roomId, Long userId) {
        StringBuffer query = new StringBuffer(100);
        query.append(" select  c");
        query.append(" from com.topcoder.web.oracle.model.RoomResult rr");
        query.append("    , com.topcoder.web.oracle.model.CandidateRoomResult crr");
        query.append("    , com.topcoder.web.oracle.model.Candidate c left join fetch c.info");
        query.append(" where rr.id.room.id = ?");
        query.append(" and rr.id.user.id = ?");
        query.append(" and crr.id.room.id = rr.id.room.id");
        query.append(" and crr.id.candidate.id = c.id");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roomId);
        q.setLong(1, userId);
        //we only want a list of distinct candidates.  but we also want it to
        //fetch all the candidate info in one shot.  so, using a set here
        //is what i came up with to do the unique part
        HashSet res = new HashSet(q.list());
        ArrayList<Candidate> ret = new ArrayList<Candidate>(res.size());
        for (Object aL : res) {
            ret.add((Candidate) aL);
        }
        return ret;
    }

    public List<Candidate> getCandidates(Round r) {
        StringBuffer query = new StringBuffer(100);
        query.append(" select c");
        query.append(" from com.topcoder.web.oracle.model.CandidateRoomResult crr");
        query.append("    , com.topcoder.web.oracle.model.Candidate c left join fetch c.info");
        query.append(" where crr.id.room.round.id = ?");
        query.append(" and crr.id.candidate.id = c.id");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, r.getId());
        //we only want a list of distinct candidates.  but we also want it to
        //fetch all the candidate info in one shot.  so, using a set here
        //is what i came up with to do the unique part
        HashSet res = new HashSet(q.list());
        ArrayList<Candidate> ret = new ArrayList<Candidate>(res.size());
        for (Object aL : res) {
            ret.add((Candidate) aL);
        }
        return ret;
    }

    public List<Candidate> getCandidates(Room r) {
        StringBuffer query = new StringBuffer(100);
        query.append(" select c");
        query.append(" from com.topcoder.web.oracle.model.CandidateRoomResult crr");
        query.append("    , com.topcoder.web.oracle.model.Candidate c left join fetch c.info");
        query.append(" where crr.id.room.id = ?");
        query.append(" and crr.id.candidate.id = c.id");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, r.getId());
        //we only want a list of distinct candidates.  but we also want it to
        //fetch all the candidate info in one shot.  so, using a set here
        //is what i came up with to do the unique part
        HashSet res = new HashSet(q.list());
        ArrayList<Candidate> ret = new ArrayList<Candidate>(res.size());
        for (Object aL : res) {
            ret.add((Candidate) aL);
        }
        return ret;
    }
}
