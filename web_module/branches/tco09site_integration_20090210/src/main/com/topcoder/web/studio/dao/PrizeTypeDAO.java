package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.PrizeType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public interface PrizeTypeDAO {
    PrizeType find(Integer id);

    List<PrizeType> getPrizeTypes();
}