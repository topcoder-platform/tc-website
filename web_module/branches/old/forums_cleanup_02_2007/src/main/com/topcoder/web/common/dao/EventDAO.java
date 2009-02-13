package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.Event;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface EventDAO {

    Event find(Long id);

    Event find(String shortDescription);

    List getEvents();
        
    void saveOrUpdate(Event e);
}
