package com.topcoder.web.csf.dao;


import com.topcoder.web.csf.model.ContestProperty;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public interface ContestPropertyDAO {
    ContestProperty find(Integer id);

    List getProperties();
}
