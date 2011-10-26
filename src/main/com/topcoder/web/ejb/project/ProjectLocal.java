package com.topcoder.web.ejb.project;

import com.topcoder.web.common.RowNotFoundException;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision: 63583 $ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public interface ProjectLocal extends EJBLocalObject {
    void updateForLock(long projectId, String dataSource);

    int getProjectTypeId(long projectId, String dataSource) throws RowNotFoundException;

    long getComponentId(long projectId, String dataSource);
}