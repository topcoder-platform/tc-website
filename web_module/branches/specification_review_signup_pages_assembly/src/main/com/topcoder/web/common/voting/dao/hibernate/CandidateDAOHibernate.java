package com.topcoder.web.common.voting.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.common.voting.Candidate;
import com.topcoder.web.common.voting.dao.CandidateDAO;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 8, 2007
 */
public class CandidateDAOHibernate extends Base implements CandidateDAO {
    public Candidate find(Long id) {
        return (Candidate) super.find(Candidate.class, id);
    }

    public void saveOrUpdate(Candidate candidate) {
        super.saveOrUpdate(candidate);
    }

}
