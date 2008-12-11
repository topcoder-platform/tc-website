package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Preference;

/**
 * @author cucu
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public interface PreferenceDAO {

    Preference find(Integer id);

    Preference find(String name);


}
