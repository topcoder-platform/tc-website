package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.CandidateRoomResultDAO;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateRoomResult;
import com.topcoder.web.oracle.model.Room;

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
        CandidateRoomResult.Identifier id = new CandidateRoomResult.Identifier();
        Room r = new Room();
        r.setId(roomId);
        id.setRoom(r);
        Candidate c = new Candidate();
        c.setId(candidateId);
        id.setCandidate(c);
        return (CandidateRoomResult) super.find(CandidateRoomResult.class, id);
    }

    public CandidateRoomResult find(Room room, Candidate candidate) {
        return (CandidateRoomResult) super.find(CandidateRoomResult.class, new CandidateRoomResult.Identifier(candidate, room));

    }

}
