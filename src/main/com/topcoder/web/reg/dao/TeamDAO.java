package com.topcoder.web.reg.dao;

import com.topcoder.web.reg.model.School;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public interface TeamDAO {
    List getHighSchoolTeamsForSchool(School s);
}
