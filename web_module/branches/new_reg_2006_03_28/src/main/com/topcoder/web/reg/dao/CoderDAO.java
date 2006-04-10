package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.Coder;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CoderDAO extends Base {
    public Coder find(Long id) {
        return (Coder)super.find(Coder.class, id);
    }

    public void saveOrUpdate(Coder u) {
        super.saveOrUpdate(u);
    }
}
