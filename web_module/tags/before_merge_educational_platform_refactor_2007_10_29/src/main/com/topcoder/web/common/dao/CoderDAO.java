package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Coder;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface CoderDAO {
    Coder find(Long id);

    void saveOrUpdate(Coder u);

    Coder getActiveStudentUsingClassroomId(Long studentId, Long classroomId);

    Coder getStudentUsingClassroomId(Long studentId, Long classroomId);

}
