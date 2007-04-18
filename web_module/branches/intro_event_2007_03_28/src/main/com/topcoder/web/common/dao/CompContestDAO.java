package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.comp.Contest;

/**
 * @author cucu
 *
 */
public interface CompContestDAO {

    Contest find(Long id);
   
    void saveOrUpdate(Contest c);
}
