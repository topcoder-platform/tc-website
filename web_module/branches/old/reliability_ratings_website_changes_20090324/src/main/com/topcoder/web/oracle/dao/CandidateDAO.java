package com.topcoder.web.oracle.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.model.Round;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public interface CandidateDAO {
    Candidate find(Integer id);

    void saveOrUpdate(Candidate c);

    List<Candidate> getCandidates(Room r, User u);

    List<Candidate> getCandidates(Integer roomId, Long userId);

    List<Candidate> getCandidates(Round r);

    List<Candidate> getCandidates(Room r);
}
