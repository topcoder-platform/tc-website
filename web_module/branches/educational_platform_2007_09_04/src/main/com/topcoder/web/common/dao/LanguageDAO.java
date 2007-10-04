package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.algo.Language;


/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface LanguageDAO extends GenericDAO<Language, Integer> {

    public List<Language> findAssignmentLanguages();

}
