package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.PreferenceValue;

import java.util.List;

/**
 * @author cucu
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public interface PreferenceValueDAO {

    PreferenceValue find(Integer id);

    List findForPreference(Integer preferenceId);

}
