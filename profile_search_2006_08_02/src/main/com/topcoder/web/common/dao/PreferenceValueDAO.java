package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.PreferenceValue;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public interface PreferenceValueDAO  {

    PreferenceValue find(Long id);
    
    List findForPreference(Long preferenceId);

}
