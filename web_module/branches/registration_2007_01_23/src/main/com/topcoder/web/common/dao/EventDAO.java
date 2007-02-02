package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Event;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface EventDAO {

    Event find(Long id);

    void saveOrUpdate(Event e);

    void delete(Event e);

}
