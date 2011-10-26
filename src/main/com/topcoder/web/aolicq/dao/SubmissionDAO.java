package com.topcoder.web.aolicq.dao;

import com.topcoder.web.common.dao.GenericDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.aolicq.model.Contest;
import com.topcoder.web.aolicq.model.Submission;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface SubmissionDAO extends GenericDAO<Submission, Long> {

    void changeRank(Integer newRank, Submission s);

    List<Submission> getSubmissions(User u, Contest c, Integer submissionTypeId);

    List<Submission> getSubmissions(User u, Contest c, Integer submissionTypeId, Integer submissionStatusId);

    Integer getMaxRank(Contest contest, User submitter);

    List<Submission> getSubmissions(Long contestId, Long submitterId, Integer submissionType);
}
