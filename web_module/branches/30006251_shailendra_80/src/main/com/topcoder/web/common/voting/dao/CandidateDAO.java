package com.topcoder.web.common.voting.dao;

import com.topcoder.web.common.voting.Candidate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 8, 2007
 */
public interface CandidateDAO {

    Candidate find(Long id);

    void saveOrUpdate(Candidate candidate);
}
