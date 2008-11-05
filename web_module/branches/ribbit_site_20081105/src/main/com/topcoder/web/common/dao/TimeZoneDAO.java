package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.TimeZone;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface TimeZoneDAO {
    List getTimeZones();

    TimeZone find(Integer id);

    TimeZone find(String s);

    TimeZone find(java.util.TimeZone t);
}
