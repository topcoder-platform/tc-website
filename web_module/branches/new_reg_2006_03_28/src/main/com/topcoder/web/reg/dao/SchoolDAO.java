package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.School;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 12, 2006
 */
public class SchoolDAO extends Base {

    public School find(Long id) {
        return (School)find(School.class, id);
    }
}
