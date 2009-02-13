package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.common.dao.hibernate.Base;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.model.Candidate;

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
}
