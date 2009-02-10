package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.SubmissionType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public interface SubmissionTypeDAO {
    SubmissionType find(Integer id);
}
