package com.topcoder.web.winformula.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.GenericBase;
import com.topcoder.web.common.model.User;
import com.topcoder.web.winformula.dao.SubmissionDAO;
import com.topcoder.web.winformula.model.Contest;
import com.topcoder.web.winformula.model.Submission;
import org.hibernate.Query;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class SubmissionDAOHibernate extends GenericBase<Submission, Long> implements SubmissionDAO {
    public Integer getMaxRank(Contest contest, User submitter) {
        Query q = getSession().createQuery("select max(s.rank) from Submission s where s.contest.id = ? and s.submitter.id = ?");
        q.setLong(0, contest.getId());
        q.setLong(1, submitter.getId());
        return (Integer) q.uniqueResult();
    }

    public void changeRank(Integer newRank, Submission s) {
        if (log.isDebugEnabled()) {
            log.debug("newRank: " + newRank + " oldRank: " + s.getRank());
        }

        StringBuffer buf = new StringBuffer(100);
        buf.append("update com.topcoder.web.winformula.model.Submission s set rank = ");
        if (newRank == null && s.getRank() == null) {
            //do nothing, we're good
        } else if (newRank == null) {
            buf.append("rank-1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank > ?");

            Query q = getSession().createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId());
            q.setLong(1, s.getContest().getId());
            q.setInteger(2, s.getRank());
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            getSession().flush();
        } else if (s.getRank() == null) {
            buf.append("rank+1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank between ? and ?");

            Query q = getSession().createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId());
            q.setLong(1, s.getContest().getId());
            q.setInteger(2, newRank);
            q.setInteger(3, Integer.MAX_VALUE);
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            getSession().flush();
        } else if (newRank.compareTo(s.getRank()) < 0) {
            //they's bumping it up, making it's rank better
            buf.append("rank+1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank between ? and ?");

            Query q = getSession().createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId());
            q.setLong(1, s.getContest().getId());
            q.setInteger(2, newRank);
            q.setInteger(3, s.getRank() - 1);
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            getSession().flush();
        } else if (newRank.compareTo(s.getRank()) > 0) {
            //they're dropping it down, making it's rank worse
            buf.append("rank-1 ");
            buf.append("where s.submitter.id = ? and s.contest.id = ? and rank between ? and ?");
            Query q = getSession().createQuery(buf.toString());
            q.setLong(0, s.getSubmitter().getId());
            q.setLong(1, s.getContest().getId());
            q.setInteger(2, s.getRank() + 1);
            q.setInteger(3, newRank);
            q.executeUpdate();

            s.setRank(newRank);
            saveOrUpdate(s);
            getSession().flush();
        }
    }

    @SuppressWarnings("unchecked")
    public List<Submission> getSubmissions(User u, Contest c, Integer submissionTypeId) {
        Query q = getSession().createQuery("from com.topcoder.web.winformula.model.Submission s " +
                "left join fetch s.review " +
                "left join fetch s.result " +
                "where s.submitter.id = ? " +
                "and s.contest.id = ? " +
                "and s.type.id = ? " +
                "order by case when s.rank is null then 10000 else s.rank end asc");
        q.setLong(0, u.getId());
        q.setLong(1, c.getId());
        q.setInteger(2, submissionTypeId);
        return q.list();

    }

    @SuppressWarnings("unchecked")
    public List<Submission> getSubmissions(User u, Contest c, Integer submissionTypeId, Integer submissionStatusId) {
        Query q = getSession().createQuery("from com.topcoder.web.winformula.model.Submission s " +
                "left join fetch s.review " +
                "left join fetch s.result " +
                "where s.submitter.id = ? " +
                "and s.contest.id = ? " +
                "and s.type.id = ? " +
                "and s.status.id = ? " +
                "order by case when s.rank is null then 10000 else s.rank end asc");
        q.setLong(0, u.getId());
        q.setLong(1, c.getId());
        q.setInteger(2, submissionTypeId);
        q.setInteger(3, submissionStatusId);
        return q.list();
    }

    @SuppressWarnings("unchecked")
    public List<Submission> getSubmissions(Long contestId, Long submitterId, Integer submissionTypeId) {
        Query q = getSession().createQuery("from com.topcoder.web.winformula.model.Submission s " +
                "left join fetch s.review " +
                "left join fetch s.result " +
                "where s.submitter.id = ? " +
                "and s.contest.id = ? " +
                "and s.type.id = ? " +
                "order by case when s.rank is null then 10000 else s.rank end asc");
        q.setLong(0, submitterId);
        q.setLong(1, contestId);
        q.setInteger(2, submissionTypeId);
        return q.list();

    }

}
