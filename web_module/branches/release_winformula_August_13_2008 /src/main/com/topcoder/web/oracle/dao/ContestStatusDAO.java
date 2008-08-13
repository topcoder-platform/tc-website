package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.ContestStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public interface ContestStatusDAO {
    ContestStatus find(Integer id);

    List<ContestStatus> getContestStatuses();

}
