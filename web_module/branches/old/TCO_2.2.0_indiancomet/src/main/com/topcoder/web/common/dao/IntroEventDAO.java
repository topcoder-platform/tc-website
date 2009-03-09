package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.IntroEvent;

import java.util.List;

/**
 * @author cucu
 */
public interface IntroEventDAO {

    IntroEvent find(Long id);

    List<IntroEvent> getList(int start, int maxRows);

    List<IntroEvent> getList();

    void saveOrUpdate(IntroEvent e);
}
