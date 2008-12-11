package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.model.SubmissionStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 16, 2007
 */
public interface SubmissionStatusDAO {
    SubmissionStatus find(Integer id);

    List getSubmissionStatuses();
}
