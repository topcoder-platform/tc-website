package com.topcoder.web.common.voting.dao;

import com.topcoder.web.common.voting.RankBallot;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 29, 2007
 */
public interface RankBallotDAO {
    RankBallot find(Long id);

    List getBallots(Long electionId);

    RankBallot find(Long electionId, Long userId);

    void saveOrUpdate(RankBallot ballot);
}
