package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.Round;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface RoundDAO {

    Round find(Integer id);

    void saveOrUpdate(Round r);


}
