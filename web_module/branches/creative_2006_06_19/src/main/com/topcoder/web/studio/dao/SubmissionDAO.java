package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.Submission;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface SubmissionDAO {
    void saveOrUpdate(Submission s);

    Submission find(Long id);
}
