package com.topcoder.web.ejb.project;

import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision: 63583 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 17, 2006
 */
public interface ProjectWagerLocal extends EJBLocalObject {
    void createProjectWager(long projectId, long userId, int wagerAmount, String dataSource);

    void updateProjectWager(long projectId, long userId, int wagerAmount, String dataSource);

    boolean exists(long projectId, long userId, String dataSource);

    int getWager(long projectId, long userId, String dataSource) throws RowNotFoundException;
}
