package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.CandidateRoomResultDAO;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateRoomResult;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;
import org.hibernate.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public class CandidateRoomResultDAOHibernate extends Base implements CandidateRoomResultDAO {
    public void saveOrUpdate(CandidateRoomResult crr) {
        super.saveOrUpdate(crr);
    }

    public CandidateRoomResult find(Integer roomId, Integer candidateId) {
        StringBuffer query = new StringBuffer(100);
        query.append(" from com.topcoder.web.oracle.model.CandidateRoomResult crr");
        query.append(" where crr.id.room.id = ?");
        query.append("  and crr.id.candidate.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roomId);
        q.setInteger(1, candidateId);
        return (CandidateRoomResult)q.uniqueResult();
    }

    public CandidateRoomResult find(Room room, Candidate candidate) {
        return (CandidateRoomResult) super.find(CandidateRoomResult.class, new CandidateRoomResult.Identifier(candidate, room));

    }

    public List<CandidateRoomResult> getResults(Round round) {
        return getResults(round.getId());
    }

    public List<CandidateRoomResult> getResults(Integer roundId) {
        StringBuffer query = new StringBuffer(100);
        query.append(" from com.topcoder.web.oracle.model.CandidateRoomResult crr");
        query.append(" where crr.id.room.round.id = ?");
        Query q = session.createQuery(query.toString());
        q.setInteger(0, roundId);
        List l = q.list();
        ArrayList<CandidateRoomResult> ret = new ArrayList<CandidateRoomResult>(l.size());
        for (Object aL : l) {
            ret.add((CandidateRoomResult) aL);
        }
        return ret;
    }

}
