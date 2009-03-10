package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.comp.Contest;

/**
 * @author cucu
 *
 */
public interface CompContestDAO {

    Contest find(Long id);
      
    List<Contest> getCurrent();
    
    List<Contest> getCurrent(Integer phaseId);
            
    void saveOrUpdate(Contest c);
}
