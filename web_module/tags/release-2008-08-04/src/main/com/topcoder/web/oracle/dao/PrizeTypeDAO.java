package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.PrizeType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 21, 2007
 */
public interface PrizeTypeDAO {
    PrizeType find(Integer id);

    List<PrizeType> getPrizeTypes();


}
