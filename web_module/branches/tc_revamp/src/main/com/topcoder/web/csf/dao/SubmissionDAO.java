package com.topcoder.web.csf.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.Submission;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface SubmissionDAO {
    void saveOrUpdate(Submission s);

    Submission find(Long id);

    void changeRank(Integer newRank, Submission s);

/*
    public void changeRank(Integer newRank, Long submissionId, Long userId);
*/

    List getSubmissions(User u, Contest c);

    Integer getMaxRank(Contest contest, User submitter);

    List getSubmissions(Long contestId, Long submitterId);
}
