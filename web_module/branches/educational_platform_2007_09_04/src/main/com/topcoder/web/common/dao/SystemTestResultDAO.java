package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.algo.SystemTestResult;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface SystemTestResultDAO extends GenericDAO<SystemTestResult, Long> {

    public List<Object> getSystemTestResultsSummary(Long roundId);

    public List<Object> getSystemTestResultsByComponent(Long roundId, Long componentId);

}
