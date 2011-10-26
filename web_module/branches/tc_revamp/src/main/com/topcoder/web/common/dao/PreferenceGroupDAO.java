package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.PreferenceGroup;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public interface PreferenceGroupDAO {
    PreferenceGroup find(Integer id);
}
