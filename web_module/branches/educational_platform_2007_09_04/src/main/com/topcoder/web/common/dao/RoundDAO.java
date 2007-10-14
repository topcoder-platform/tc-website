package com.topcoder.web.common.dao;

import java.util.Date;
import java.util.List;

import com.topcoder.web.common.model.algo.Round;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface RoundDAO {

    Round find(Long id);

    List<Round> getRoundsAfter(Date date);
    
    void saveOrUpdate(Round r);

    void delete(Round r);

    List<Round> findDuplicateName(Long classroomId, String assignmentName, Long roundId);

}
