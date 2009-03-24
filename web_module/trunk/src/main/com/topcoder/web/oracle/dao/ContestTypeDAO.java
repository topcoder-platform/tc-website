package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.ContestType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public interface ContestTypeDAO {
    ContestType find(Integer id);

    List<ContestType> getContestTypes();

}
