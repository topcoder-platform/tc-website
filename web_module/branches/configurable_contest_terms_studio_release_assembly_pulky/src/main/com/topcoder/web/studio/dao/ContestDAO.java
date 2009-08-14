package com.topcoder.web.studio.dao;


import java.util.List;
import java.util.Set;

import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.studio.model.Contest;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface ContestDAO {

    List getContests();

    Contest find(Long id);

    Set<TermsOfUse> findNecessaryTerms(Long contestId, Integer[] submitterRoleIds);

    void saveOrUpdate(Contest c);

}
