package com.topcoder.web.common.voting.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.voting.RankBallot;
import com.topcoder.web.common.voting.dao.RankBallotDAO;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 29, 2007
 */
public class RankBallotDAOHibernate extends Base implements RankBallotDAO {
    public RankBallot find(Long id) {
        return (RankBallot) super.find(RankBallot.class, id);
    }

    public List getBallots(Long electionId) {
        StringBuffer query = new StringBuffer(100);
        query.append("from RankBallot rb WHERE rb.election.id= ?");
        Query q = session.createQuery(query.toString());
        q.setLong(0, electionId.longValue());
        return q.list();
    }

    public RankBallot find(Long electionId, Long userId) {
        StringBuffer query = new StringBuffer(100);
        query.append("from RankBallot rb WHERE rb.election.id= ? AND rb.user.id = ?");
        Query q = session.createQuery(query.toString());
        q.setLong(0, electionId.longValue());
        q.setLong(1, userId.longValue());
        return (RankBallot) q.uniqueResult();
    }

    public void saveOrUpdate(RankBallot ballot) {
        super.saveOrUpdate(ballot);
    }

}
