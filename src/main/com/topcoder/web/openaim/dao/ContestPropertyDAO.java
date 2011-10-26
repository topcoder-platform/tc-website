package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.model.ContestProperty;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 28, 2006
 */
public interface ContestPropertyDAO {
    ContestProperty find(Integer id);

    List getProperties();
}
