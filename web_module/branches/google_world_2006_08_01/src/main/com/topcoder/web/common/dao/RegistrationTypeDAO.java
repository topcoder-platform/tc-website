package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.RegistrationType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface RegistrationTypeDAO {
    List getRegistrationTypes();

    RegistrationType find(Integer id);


    RegistrationType getCompetitionType();

    RegistrationType getHighSchoolType();

    RegistrationType getCorporateType();

    RegistrationType getMinimalType();

    RegistrationType getSoftwareType();

    RegistrationType getCreativeType();

}
