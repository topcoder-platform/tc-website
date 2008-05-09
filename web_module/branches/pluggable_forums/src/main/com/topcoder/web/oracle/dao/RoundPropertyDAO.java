package com.topcoder.web.oracle.dao;


import com.topcoder.web.oracle.model.RoundProperty;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public interface RoundPropertyDAO {
    RoundProperty find(Integer id);

    List getProperties();
}
