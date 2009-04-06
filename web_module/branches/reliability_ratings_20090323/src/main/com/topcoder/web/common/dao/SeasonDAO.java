package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.Season;


/**
 * @author cucu
 */
public interface SeasonDAO {

    Season find(Integer seasonId);

    Season findCurrent(Integer type);

    List<Season> findCurrentAndUpcoming(Integer type);
}
