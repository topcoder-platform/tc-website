package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.educ.Professor;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface ProfessorDAO extends GenericDAO<Professor, Long> {

    public Boolean hasActiveProfessors(Long studentId);

    public Boolean isProfessor(Long professorId);

}
