package com.topcoder.web.openaim.dao;


import com.topcoder.web.openaim.model.Contest;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface ContestDAO {

    List getContests();

    Contest find(Long id);

    void saveOrUpdate(Contest c);

}
