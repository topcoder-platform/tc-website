package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.EventType;

/**
 * @author dok
 * @version $Revision: 57327 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public interface EventTypeDAO {
    EventType find(Integer id);
}
