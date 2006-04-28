package com.topcoder.web.reg.dao;


import com.topcoder.web.reg.model.CoderType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 28, 2006
 */
public class CoderTypeDAO extends Base {
    public List getCoderTypes() {
        return findAll(CoderType.class, "status", "A");
    }

    public CoderType find(Integer id) {
        return (CoderType)find(CoderType.class, id);
    }
}
