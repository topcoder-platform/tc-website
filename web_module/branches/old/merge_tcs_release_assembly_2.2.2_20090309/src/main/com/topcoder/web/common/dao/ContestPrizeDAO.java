package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.comp.ContestPrize;

/**
 * @author cucu
 */
public interface ContestPrizeDAO {

    List<ContestPrize> getPrizesForEvent(Long eventId);
    
    ContestPrize find(Long id);
        
}
