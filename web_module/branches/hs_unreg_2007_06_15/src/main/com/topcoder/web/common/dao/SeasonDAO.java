package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Season;


/**
 * @author cucu
 */
public interface SeasonDAO {

    Season find(Integer seasonId);

    Season findCurrent(Integer type);
}
