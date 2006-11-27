package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.Submission;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class SubmissionDAOHibernate extends Base implements SubmissionDAO {
    public void saveOrUpdate(Submission s) {
        super.saveOrUpdate(s);
    }

    public Submission find(Long id) {
        return (Submission) super.find(Submission.class, id);
    }

    public void changeRank(Integer newRank, Submission s) {
        StringBuffer buf = new StringBuffer(100);
        buf.append("update Submission s set rank = ");
        if (newRank.compareTo(s.getRank()) < 0) {
            buf.append("rank-1 ");
        } else if (newRank.compareTo(s.getRank()) > 0) {
            buf.append("rank+1 ");
        }
        buf.append("where s.submitter.id = ? and s.contest.id = ? ");
        if (newRank.compareTo(s.getRank()) != 0) {
            Query q = session.createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId().longValue());
            q.setLong(1, s.getContest().getId().longValue());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
        }
    }

    public List getSubmissions(User u, Contest c) {
        Query q = session.createQuery("from Submission s where s.submitter.id = ? and s.contest.id = ? order by s.rank asc");
        q.setLong(0, u.getId().longValue());
        q.setLong(1, c.getId().longValue());
        return q.list();

    }
    /*
    public void changeRank(Integer newRank, Long submissionId, Long userId) {
            Query submissionQuery = session.createQuery("select s.rank, s.contest.id from Submission s where s.id=? and s.submitter.id=?");
        submissionQuery.setLong(0, submissionId.longValue());
        submissionQuery.setLong(1, userId.longValue());

        Object[] result = (Object[])submissionQuery.uniqueResult();
        log.debug("here");
        Integer oldRank = (Integer)result[0];
        Long contestId = (Long)result[1];
        StringBuffer buf = new StringBuffer(100);

            buf.append("update Submission s set rank = ");
            if (newRank.compareTo(oldRank)<0) {
                buf.append("rank-1 ");
            } else if (newRank.compareTo(oldRank)>0) {
                buf.append("rank+1 ");
            }
            buf.append("where s.submitter.id = ? and s.contest.id = ? ");
            if (newRank.compareTo(oldRank)!=0) {
                Query q = session.createQuery(buf.toString());
                q.setLong(0, userId.longValue());
                q.setLong(1, contestId.longValue());
                q.executeUpdate();
                log.debug("after first");

                Query update = session.createQuery("update Submission set rank = ? where submission_id = ?");
                update.setInteger(0, newRank.intValue());
                update.setLong(1, submissionId.longValue());
                update.executeUpdate();
            }
    }*/
}
