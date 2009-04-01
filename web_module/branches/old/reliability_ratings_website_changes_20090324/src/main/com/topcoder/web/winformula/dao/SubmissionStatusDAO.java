package com.topcoder.web.winformula.dao;

import com.topcoder.web.winformula.model.SubmissionStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2007
 */
public interface SubmissionStatusDAO {
    SubmissionStatus find(Integer id);

    List getSubmissionStatuses();
}
