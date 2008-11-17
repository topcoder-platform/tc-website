package com.topcoder.web.common.dao;

import java.util.Date;
import java.util.List;

import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.SchoolType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface SchoolDAO extends GenericDAO<School, Long> {

    School find(Long id);

    List searchByName(String name, int maxResults);

    List searchByNameAndType(String name, SchoolType type, int maxResults);

    List search(SchoolType type, String name, Date creationAfter, String countryCode, boolean orderByCountry);

    List<School> findSchoolsUsingProfessorId(Long professorId);

}
