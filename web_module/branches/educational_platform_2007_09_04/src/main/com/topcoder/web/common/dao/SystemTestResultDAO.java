package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.algo.Component;
import com.topcoder.web.common.model.algo.Round;
import com.topcoder.web.common.model.algo.SystemTestResult;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface SystemTestResultDAO extends GenericDAO<SystemTestResult, Long> {

    public Object getSystemTestResultsByStudentComponent(Round r, Component cmp, Long studentId);

}
