package com.topcoder.web.aolicq.dao;

import com.topcoder.web.aolicq.model.PrizeType;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public interface PrizeTypeDAO {
    PrizeType find(Integer id);

    List<PrizeType> getPrizeTypes();
}