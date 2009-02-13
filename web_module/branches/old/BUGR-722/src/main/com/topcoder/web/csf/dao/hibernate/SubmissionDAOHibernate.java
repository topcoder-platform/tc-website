package com.topcoder.web.csf.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.model.Submission;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.dao.SubmissionDAO;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class SubmissionDAOHibernate extends Base implements SubmissionDAO {
    public void saveOrUpdate(Submission s) {
        super.saveOrUpdate(s);
    }

    public Submission find(Long id) {
        return (Submission) super.find(Submission.class, id);
    }

    public Integer getMaxRank(Contest contest, User submitter) {
        Query q = session.createQuery("select max(s.rank) from Submission s where s.contest.id = ? and s.submitter.id = ?");
        q.setLong(0, contest.getId().longValue());
        q.setLong(1, submitter.getId().longValue());
        return (Integer) q.uniqueResult();
    }

    public void changeRank(Integer newRank, Submission s) {
        if (log.isDebugEnabled()) {
            log.debug("newRank: " + newRank + " oldRank: " + s.getRank());
        }

        StringBuffer buf = new StringBuffer(100);
        buf.append("update Submission s set rank = ");
        if (newRank == null) {
            buf.append("rank-1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank > ?");

            Query q = session.createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId().longValue());
            q.setLong(1, s.getContest().getId().longValue());
            q.setInteger(2, s.getRank().intValue());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        } else if (s.getRank() == null) {
            buf.append("rank+1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank between ? and ?");

            Query q = session.createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId().longValue());
            q.setLong(1, s.getContest().getId().longValue());
            q.setInteger(2, newRank.intValue());
            q.setInteger(3, Integer.MAX_VALUE);
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        } else if (newRank.compareTo(s.getRank()) < 0) {
            //they's bumping it up, making it's rank better
            buf.append("rank+1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank between ? and ?");

            Query q = session.createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId().longValue());
            q.setLong(1, s.getContest().getId().longValue());
            q.setInteger(2, newRank.intValue());
            q.setInteger(3, s.getRank().intValue() - 1);
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        } else if (newRank.compareTo(s.getRank()) > 0) {
            //they're dropping it down, making it's rank worse
            buf.append("rank-1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank between ? and ?");
            Query q = session.createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId().longValue());
            q.setLong(1, s.getContest().getId().longValue());
            q.setInteger(2, s.getRank().intValue() + 1);
            q.setInteger(3, newRank.intValue());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            session.flush();
        }
    }

    public List getSubmissions(User u, Contest c) {
        Query q = session.createQuery("from Submission s " +
                "left join fetch s.review " +
                "left join fetch s.result " +
                "where s.submitter.id = ? " +
                "and s.contest.id = ? " +
                "order by case when s.rank is null then 10000 else s.rank end asc");
        q.setLong(0, u.getId().longValue());
        q.setLong(1, c.getId().longValue());
        return q.list();

    }

    public List getSubmissions(Long contestId, Long submitterId) {
        Query q = session.createQuery("from Submission s " +
                "left join fetch s.review " +
                "left join fetch s.result " +
                "where s.submitter.id = ? " +
                "and s.contest.id = ? " +
                "order by case when s.rank is null then 10000 else s.rank end asc");
        q.setLong(0, submitterId.longValue());
        q.setLong(1, contestId.longValue());
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
