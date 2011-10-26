package com.topcoder.web.common.voting.dao;

import com.topcoder.web.common.voting.CondorcetSchulzeElection;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 30, 2007
 */
public interface CondorcetSchulzeElectionDAO {
    CondorcetSchulzeElection find(Long id);

    void saveOrUpdate(CondorcetSchulzeElection b);

}
