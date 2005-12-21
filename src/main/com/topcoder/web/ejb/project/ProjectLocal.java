package com.topcoder.web.ejb.project;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public interface ProjectLocal extends EJBLocalObject {
    void updateForLock(long projectId, String dataSource);
}
