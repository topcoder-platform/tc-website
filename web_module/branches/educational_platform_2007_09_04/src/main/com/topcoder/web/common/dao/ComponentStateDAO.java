package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.ComponentState;
import com.topcoder.web.common.model.algo.Round;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface ComponentStateDAO extends GenericDAO<ComponentState, Long> {

    public List<Object> getResultsSummary(Long roundId, Long componentId);

    public List<ComponentState> getStudentResults(List<Round> lr, Long studentId);

    public ComponentState getStudentResultsByComponent(Round r, Component cmp, Long studentId);

    public Integer countUsingRoundAndStatuses(Long roundId, List<Integer> statusIds);

}
