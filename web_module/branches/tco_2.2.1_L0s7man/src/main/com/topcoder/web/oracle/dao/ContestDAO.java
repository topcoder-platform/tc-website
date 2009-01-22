package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.Contest;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface ContestDAO {

    List<Contest> getContests();

    Contest find(Integer id);

    void saveOrUpdate(Contest c);

}
